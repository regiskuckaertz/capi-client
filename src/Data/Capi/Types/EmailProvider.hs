module Data.Capi.Types.EmailProvider where

import Data.Aeson
import Data.Capi.Types.Shared
import Data.Text

data EmailProvider =
  EmailProvider { _epName :: Text
                , _epListId :: Text
                } deriving (Show, Eq, Ord)

instance FromJSON EmailProvider where
  parseJSON = withObject "EmailProvider" $ \v ->
    EmailProvider <$> v .: "name"
                  <*> v .: "listId"

instance ToJSON EmailProvider where
  toJSON (EmailProvider name listId) = 
    object [ "name" .= name, "listId" .= listId]