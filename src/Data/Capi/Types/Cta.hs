module Data.Capi.Types.Cta where

import GHC.Generics
import Data.Aeson
import Data.Text

data CTAAtom =
  CTAAtom { _url :: String
          , _backgroundImage :: Text
          , _btnText :: Text
          , _label :: Maybe Text
          , _trackingCode :: Maybe Text
          }
  deriving (Show, Eq, Ord, Generic)

instance ToJSON CTAAtom
instance FromJSON CTAAtom