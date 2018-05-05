module Data.Capi.Types.AtomsResponse where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Atom

data AtomsResponse = 
    AtomsResponse { status :: String 
                  , userTier :: String
                  , total :: Int
                  , startIndex :: Int
                  , pageSize :: Int
                  , currentPage :: Int
                  , pages :: Int
                  , results :: [Atom]
                  } deriving (Show, Eq, Ord, Generic)

instance FromJSON AtomsResponse

instance ToJSON AtomsResponse where
  toEncoding = genericToEncoding defaultOptions