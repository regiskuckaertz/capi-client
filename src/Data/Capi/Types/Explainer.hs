module Data.Capi.Types.Explainer
  ( DisplayType
  , flat
  , expandable
  , carousel
  , ExplainerAtom(..)
  ) where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Shared
import Data.Text

newtype DisplayType = DT Int deriving (Show, Eq, Ord)

instance FromJSON DisplayType where
  parseJSON = withText "DisplayType" $ \t -> case unpack t of
    "flat" -> pure flat
    "expandable" -> pure expandable
    _ -> pure carousel

instance ToJSON DisplayType where
  toJSON dt | dt == flat = String (pack "flat")
            | dt == expandable = String (pack "expandable")
            | otherwise = String (pack "carousel")

flat :: DisplayType
flat = DT 0

expandable :: DisplayType
expandable = DT 1

carousel :: DisplayType
carousel = DT 2

data ExplainerAtom =
  ExplainerAtom { _title :: Text
                , _body :: Text
                , _displayType :: DisplayType
                , _tags :: Maybe [Text]
                }
  deriving (Show, Eq, Ord, Generic)

instance FromJSON ExplainerAtom where
  parseJSON = withObject "ExplainerAtom" $ \v ->
    ExplainerAtom <$> v .: "title"
                  <*> v .: "body"
                  <*> v .: "displayType"
                  <*> v .:? "tags"

instance ToJSON ExplainerAtom where
  toEncoding = genericToEncoding capiOptions
