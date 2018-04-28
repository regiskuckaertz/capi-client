module Data.Capi.Types.Commonsdivision where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Shared
import Data.Text

data MP = MP { _mpName :: String, _mpParty :: String }
  deriving (Show, Eq, Ord, Generic)

instance FromJSON MP
instance ToJSON MP where
  toEncoding = genericToEncoding capiOptions

data Votes = Votes { _vAyes :: [MP], _vNoes :: [MP] }
  deriving (Show, Eq, Ord, Generic)

instance FromJSON Votes
instance ToJSON Votes where
  toEncoding = genericToEncoding capiOptions

data CommonsDivision = 
  CommonsDivision { _cdParliamentId :: Text
                  , _cdDescription :: Maybe Text
                  , _cdDate :: DateTime
                  , _cdVotes :: Votes
                  }
  deriving (Show, Eq, Ord)

-- | TODO
-- | - write JSON encoder
-- | - write JSON decoder
