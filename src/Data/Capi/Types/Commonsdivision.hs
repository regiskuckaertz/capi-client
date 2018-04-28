module Data.Capi.Types.Commonsdivision where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Shared(DateTime)
import Data.Text

data MP = MP { _name :: String, _party :: String }
  deriving (Show, Eq, Ord, Generic)

instance FromJSON MP
instance ToJSON MP

data Votes = Votes { _ayes :: [MP], _noes :: [MP] }
  deriving (Show, Eq, Ord, Generic)

instance FromJSON Votes
instance ToJSON Votes

data CommonsDivision = 
  CommonsDivision { _parliamentId :: Text
                  , _description :: Maybe Text
                  , _date :: DateTime
                  , _votes :: Votes
                  }
  deriving (Show, Eq, Ord)

instance ToJSON CommonsDivision where
  toJSON cd = _

instance FromJSON CommonsDivision where
  parseJSON = _