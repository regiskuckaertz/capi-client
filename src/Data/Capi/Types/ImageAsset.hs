module Data.Capi.Types.ImageAsset where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Shared
import Data.Text

data ImageAssetDimensions =
  ImageAssetDimensions { _height :: Int
                        , _width :: Int
                        } deriving (Show, Eq, Ord, Generic)

-- | TODO decoder
-- instance FromJSON ImageAssetDimensions

instance ToJSON ImageAssetDimensions where
  toEncoding = genericToEncoding capiOptions

data ImageAsset = 
  ImageAsset { _mimeType :: Maybe Text
              , _file :: Text
              , _dimensions :: Maybe ImageAssetDimensions
              , _size :: Maybe Int
              , _aspectRatio :: Maybe Text
              , _credit :: Maybe Text
              , _copyright :: Maybe Text
              , _source :: Maybe Text
              , _photographer :: Maybe Text
              , _suppliersReference :: Maybe Text
              } deriving (Show, Eq, Ord, Generic)

-- | TODO write decoder
-- instance FromJSON ImageAsset where

instance ToJSON ImageAsset where
  toEncoding = genericToEncoding capiOptions
              
data Image =
  Image { _assets :: [ImageAsset]
        , _master :: Maybe ImageAsset
        , _mediaId :: Text
        , _imageSource :: Maybe Text
        } deriving (Show, Eq, Ord)

-- | TODO
-- | - write JSON decoder
-- | - write JSON encoder
