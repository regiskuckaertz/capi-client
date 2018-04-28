module Data.Capi.Types.ContentChangeDetails where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Shared
import Data.Capi.Types.ChangeRecord
import Data.Int(Int64)

data ContentChangeDetails =
  ContentChangeDetails { _lastModified :: Maybe ChangeRecord
                        , _created :: Maybe ChangeRecord
                        , _published :: Maybe ChangeRecord
                        , _takenDown :: Maybe ChangeRecord
                        , _scheduledLaunch :: Maybe ChangeRecord
                        , _embargo :: Maybe ChangeRecord
                        , _expiry :: Maybe ChangeRecord
                        , _revision :: Int64
                        } deriving (Show, Eq, Ord, Generic)
                      
instance ToJSON ContentChangeDetails where
  toEncoding = genericToEncoding capiOptions

-- | TODO write decoder
-- instance FromJSON ContentChangeDetails 