module Data.Capi.Types.Interactive where

import Data.Aeson
import Data.Capi.Types.ItemResponse
import Data.Capi.Types.Shared
import Data.Text

data InteractiveAtom =
  InteractiveAtom { _iType :: Text
                  , _iTitle :: Text
                  , _iCss :: Text
                  , _iHtml :: Text
                  , _iMainJS :: Maybe Text
                  , _iDocData :: Maybe Text
                  }
  deriving (Show, Eq, Ord)

instance FromJSON InteractiveAtom where
  parseJSON = withObject "InteractiveAtom" $ \v ->
    InteractiveAtom <$> v .: "type"
                    <*> v .: "title"
                    <*> v .: "css"
                    <*> v .: "html"
                    <*> v .:? "mainJS"
                    <*> v .:? "docData"

instance ToJSON InteractiveAtom where
  toJSON (InteractiveAtom typ title css html mainJS docData) =
    object ["type" .= typ
            , "title" .= title
            , "css" .= css
            , "html" .= html
            , "mainJS" .= mainJS
            , "docData" .= docData
            ]


instance InItemResponse InteractiveAtom where
  extract = (.: "interactive")