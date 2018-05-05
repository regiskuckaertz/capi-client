module Data.Capi.Types.Shared where

import Control.Arrow ((&&&))
import Data.Aeson
import Data.Char (toLower)
import Data.Int(Int64)

type ContentAtomID = String
type DateTime = Int64
type OpaqueJson = String

capiOptions :: Options
capiOptions = defaultOptions { fieldLabelModifier = tail, omitNothingFields = True }

capi3Options :: Options
capi3Options = capiOptions { fieldLabelModifier = uncurry (:) . (toLower . head &&& tail) . drop 2 }