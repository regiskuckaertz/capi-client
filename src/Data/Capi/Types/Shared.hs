module Data.Capi.Types.Shared where

import Data.Aeson
import Data.Int(Int64)

type ContentAtomID = String
type DateTime = Int64
type OpaqueJson = String

capiOptions :: Options
capiOptions = defaultOptions { fieldLabelModifier = tail, omitNothingFields = True }