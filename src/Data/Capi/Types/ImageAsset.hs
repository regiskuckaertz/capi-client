module Data.Capi.Types.ImageAsset where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.Shared
import Data.Text

data ImageAssetDimensions =
  ImageAssetDimensions { _height :: Int
                        , _width :: Int
                        } deriving (Show, Eq, Ord, Generic)

instance FromJSON ImageAssetDimensions where
  parseJSON = withObject "ImageAssetDimensions" $ \v ->
    ImageAssetDimensions <$> v .: "height"
                          <*> v .: "width"

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

instance FromJSON ImageAsset where
  parseJSON = withObject "ImageAsset" $ \v ->
    ImageAsset <$> v .:? "mimeType"
                <*> v.: "file"
                <*> v.:? "dimensions"
                <*> v.:? "size"
                <*> v.:? "aspectRatio"
                <*> v.:? "credit"
                <*> v.:? "copyright"
                <*> v.:? "source"
                <*> v.:? "photographer"
                <*> v.:? "suppliersReference"

instance ToJSON ImageAsset where
  toEncoding = genericToEncoding capiOptions
              
data Image =
  Image { _assets :: [ImageAsset]
        , _master :: Maybe ImageAsset
        , _mediaId :: Text
        , _imageSource :: Maybe Text
        } deriving (Show, Eq, Ord, Generic)

instance ToJSON Image where
  toEncoding = genericToEncoding capiOptions
              
instance FromJSON Image where
  parseJSON = withObject "Image" $ \v ->
    Image <$> v .: "assets"
          <*> v .:? "master"
          <*> v .: "mediaId"
          <*> v .:? "imageSource"