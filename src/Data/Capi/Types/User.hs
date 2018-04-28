module Data.Capi.Types.User where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Shared
import Data.Text

data User =
  User { _email :: Text
        , _firstName :: Maybe Text
        , _lastName :: Maybe Text
        } deriving (Show, Eq, Ord, Generic)

instance ToJSON User where
  toEncoding = genericToEncoding capiOptions

instance FromJSON User where
  parseJSON = withObject "User" $ \v ->
    User <$> v .: "email"
          <*> v .:? "firstName"
          <*> v .:? "lastName"