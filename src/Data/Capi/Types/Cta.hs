module Data.Capi.Types.Cta where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.ItemResponse
import Data.Capi.Types.Shared
import Data.Text

data CTAAtom =
  CTAAtom { _url :: Text
          , _backgroundImage :: Text
          , _btnText :: Text
          , _label :: Maybe Text
          , _trackingCode :: Maybe Text
          } deriving (Show, Eq, Ord, Generic)

instance ToJSON CTAAtom where
  toEncoding = genericToEncoding capiOptions

instance FromJSON CTAAtom where
  parseJSON = withObject "CTAAtom" $ \v ->
    CTAAtom <$> v .: "url"
            <*> v .: "backgroundImage"
            <*> v .: "btnText"
            <*> v .:? "label"
            <*> v .:? "trackingCode"

instance InItemResponse CTAAtom where
  extract = (.: "cta")