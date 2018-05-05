module Data.Capi.Types.Section where

import Data.Aeson
import Data.Int(Int64)
import Data.Text
import Data.Capi.Types.Shared

data Section =
  Section { _secId :: Int64
          , _secName :: Maybe Text
          , _secPathPrefix :: Maybe Text
          , _secSlug :: Maybe Text
          } deriving (Show, Eq, Ord)

instance FromJSON Section where
  parseJSON = withObject "Section" $ \v ->
    Section <$> v .: "id"
            <*> v .:? "name"
            <*> v .:? "pathPrefix"
            <*> v .:? "slug"

instance ToJSON Section where
  toJSON (Section id name path slug) =
    object ["id" .= id, "name" .= name, "pathPrefix" .= path, "slug" .= slug]