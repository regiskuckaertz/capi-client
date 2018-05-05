module Data.Capi.Types.ChangeRecord where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.User
import Data.Capi.Types.Shared

data ChangeRecord =
  ChangeRecord { _date :: DateTime
                , _user :: Maybe User
                } deriving (Show, Eq, Ord, Generic)

instance ToJSON ChangeRecord where
  toEncoding = genericToEncoding capiOptions

instance FromJSON ChangeRecord where
  parseJSON = withObject "ChangeRecord" $ \v ->
    ChangeRecord <$> v .: "date"
                 <*> v .:? "user"