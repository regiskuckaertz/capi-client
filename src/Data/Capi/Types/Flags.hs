module Data.Capi.Types.Flags where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Shared

data Flags =
  Flags { _legallySensitive :: Maybe Bool
        , _blockAds :: Maybe Bool
        , _sensitive :: Maybe Bool
        } deriving (Show, Eq, Ord, Generic)

instance FromJSON Flags where
  parseJSON = withObject "Flags" $ \v ->
    Flags <$> v .: "legallySensitive"
          <*> v .: "blockAds"
          <*> v .: "sensitive"

instance ToJSON Flags where
  toEncoding = genericToEncoding capiOptions