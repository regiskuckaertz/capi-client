module Data.Capi.Types.Guide where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.ImageAsset
import Data.Capi.Types.ItemResponse
import Data.Capi.Types.Shared
import Data.Text

data Entity = Entity deriving (Show, Eq, Ord)

instance FromJSON Entity where
  parseJSON = fail "This is never called"

instance ToJSON Entity where
  toJSON _ = Null

data GuideItem =
  GuideItem { _giTitle :: Maybe Text
            , _giBody :: Text
            , _giEntities :: Maybe [Entity]
            }
  deriving (Show, Eq, Ord)

instance FromJSON GuideItem where
  parseJSON = withObject "GuideItem" $ \v ->
    GuideItem <$> v .: "title"
              <*> v .: "body"
              <*> pure Nothing

instance ToJSON GuideItem where
  toJSON (GuideItem title body _) =
    object ["title" .= title, "body" .= body]

data GuideAtom =
  GuideAtom { _guTypeLabel :: Maybe Text
            , _guGuideImage :: Maybe Image
            , _guItems :: [GuideItem]
            }
  deriving (Show, Eq, Ord, Generic)

instance FromJSON GuideAtom where
  parseJSON = withObject "GuideAtom" $ \v ->
    GuideAtom <$> v .: "typeLabel"
              <*> v .: "guideImage"
              <*> v .: "guItems"

instance ToJSON GuideAtom where
  toEncoding = genericToEncoding capi3Options

instance InItemResponse GuideAtom where
  extract = (.: "guide")