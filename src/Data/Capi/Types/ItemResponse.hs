module Data.Capi.Types.ItemResponse where

import Data.Aeson
import Data.Aeson.Types
import Data.Capi.Types.ResponseMetadata
import Data.Functor.Const
import Data.Text

data ItemResponse a =
  ItemResponse ResponseMetadata a deriving (Eq, Show, Ord)

class InItemResponse a where
  extract :: Object -> Parser a

instance (InItemResponse a, FromJSON a) => FromJSON (ItemResponse a) where
  parseJSON v =
    ItemResponse <$> parseJSON v
                  <*> withObject "Response item" extract v