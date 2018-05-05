module Data.Capi.Types.User where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Shared
import Data.Text
import Data.Text.Arbitrary
import Test.QuickCheck

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

instance Arbitrary User where
  arbitrary = User <$> arbitrary <*> arbitrary <*> arbitrary

prop_User u =
  decode (encode u) == Just u where types = u :: User
          