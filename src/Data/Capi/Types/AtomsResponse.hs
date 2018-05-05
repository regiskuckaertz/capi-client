module Data.Capi.Types.AtomsResponse where

import Data.Aeson
import Data.Capi.Types.Atom
import Data.Capi.Types.ResponseMetadata
import Data.HashMap.Strict

data Response a = 
  Response { metadata :: ResponseMetadata
            , results :: [a]
            } deriving (Show, Eq, Ord)

instance (FromJSON a) => FromJSON (Response a) where
  parseJSON v = 
    Response <$> parseJSON v
              <*> withObject "Response results" (\v -> v .: "results" >>= parseJSONList) v

instance (ToJSON a) => ToJSON (Response a) where
  toJSON r = let (Object o) = toJSON $ metadata r in Object $ insert "results" (toJSON $ results r) o