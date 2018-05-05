module Data.Capi.Types.Atom where

import Data.Aeson
import Data.Capi.Types.AtomData
import Data.Capi.Types.AtomType
import Data.Capi.Types.ContentChangeDetails
import Data.Capi.Types.Flags
import Data.Capi.Types.Shared
import Data.Text

data Atom =
  Atom { _atomId :: ContentAtomID
        , _atomType :: AtomType
        , _atomLabels :: [Text]
        , _atomDefaultHtml :: Text
        , _atomData :: AtomData
        , _atomContentChangeDetails :: ContentChangeDetails
        , _atomFlags :: Maybe Flags
        , _atomTitle :: Maybe Text
        , _atomCommissioningDesks :: Maybe [Text]
        } deriving (Show, Eq, Ord)

instance FromJSON Atom where
  parseJSON = withObject "Atom" $ \v ->
    Atom <$> v .: "id"
          <*> v .: "atomType"
          <*> v .: "labels"
          <*> v .: "defaultHtml"
          <*> v .: "data"
          <*> v .: "contentChangeDetails"
          <*> v .:? "flags"
          <*> v .:? "title"
          <*> v .:? "commissioningDesks"

instance ToJSON Atom where
  toJSON a = object [ "id" .= _atomId a
                    , "atomType" .= _atomType a
                    , "labels" .= _atomLabels a
                    , "defaultHtml" .= _atomDefaultHtml a
                    , "data" .= _atomData a
                    , "contentChangeDetails" .= _atomContentChangeDetails a
                    , "flags" .= _atomFlags a
                    , "title" .= _atomTitle a
                    , "commissioningDesks" .= _atomCommissioningDesks a
                    ]