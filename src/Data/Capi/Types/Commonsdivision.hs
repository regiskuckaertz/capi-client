module Data.Capi.Types.Commonsdivision where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.ItemResponse
import Data.Capi.Types.Shared
import Data.Text

data MP = MP { _mpName :: Text, _mpParty :: Text }
  deriving (Show, Eq, Ord, Generic)

instance FromJSON MP where
  parseJSON = withObject "MP" $ \v ->
    MP <$> v .: "name" <*> v .: "party"

instance ToJSON MP where
  toEncoding = genericToEncoding capi3Options

data Votes = Votes { _vtAyes :: [MP], _vtNoes :: [MP] }
  deriving (Show, Eq, Ord, Generic)

instance FromJSON Votes where
  parseJSON = withObject "Votes" $ \v ->
    Votes <$> v .: "ayes" <*> v .: "noes"

instance ToJSON Votes where
  toEncoding = genericToEncoding capi3Options

data CommonsDivisionAtom = 
  CommonsDivisionAtom { _cdParliamentId :: Text
                      , _cdDescription :: Maybe Text
                      , _cdDate :: DateTime
                      , _cdVotes :: Votes
                      }
  deriving (Show, Eq, Ord, Generic)

instance FromJSON CommonsDivisionAtom where
  parseJSON = withObject "CommonsDivisionAtom" $ \v ->
    CommonsDivisionAtom <$> v .: "parliamentId"
                        <*> v .: "description"
                        <*> v .: "date"
                        <*> v .: "votes"

instance ToJSON CommonsDivisionAtom where
  toEncoding = genericToEncoding capi3Options

instance InItemResponse CommonsDivisionAtom where
  extract = (.: "commonsdivision")