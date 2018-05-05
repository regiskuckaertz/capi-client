module Data.Capi.Types.ResponseMetadata where

import GHC.Generics
import Data.Aeson

data ResponseMetadata =
  ResponseMetadata { status :: String 
                    , userTier :: String
                    , total :: Int
                    , startIndex :: Int
                    , pageSize :: Int
                    , currentPage :: Int
                    , pages :: Int
                    } deriving (Show, Eq, Ord, Generic)

instance FromJSON ResponseMetadata

instance ToJSON ResponseMetadata where
  toEncoding = genericToEncoding defaultOptions