module Data.Capi.Types.NotificationProviders where

import Data.Aeson
import Data.Capi.Types.EmailProvider
import Data.Capi.Types.Shared

newtype NotificationProviders = NotificationProviders { _npEmail :: Maybe EmailProvider }
  deriving (Show, Eq, Ord)

instance FromJSON NotificationProviders where
  parseJSON = withObject "NotificationProviders" $ \v ->
    NotificationProviders <$> v .: "email"

instance ToJSON NotificationProviders where
  toJSON np = object ["email" .= _npEmail np]