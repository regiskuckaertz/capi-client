module Data.Capi.Types.AtomType where

import Data.Aeson

data AtomType = Quiz
              | Media
              | Explainer
              | Cta
              | Interactive
              | Review
              | Recipe
              | Storyquestions
              | Qanda
              | Guide
              | Profile
              | Timeline
              | Commonsdivision
  deriving (Show, Eq, Ord)

instance ToJSON AtomType where
  toJSON Quiz = String "quiz"
  toJSON Media = String "media"
  toJSON Explainer = String "explainer"
  toJSON Cta = String "cta"
  toJSON Interactive = String "interactive"
  toJSON Review = String "review"
  toJSON Recipe = String "recipe"
  toJSON Storyquestions = String "storyquestions"
  toJSON Qanda = String "qanda"
  toJSON Guide = String "guide"
  toJSON Profile = String "profile"
  toJSON Timeline = String "timeline"
  toJSON Commonsdivision = String "commonsdivision"

instance FromJSON AtomType where
  parseJSON = withText "AtomType" $ \t -> case t of
    "quiz" -> pure Quiz
    "media" -> pure Media
    "explainer" -> pure Explainer
    "cta" -> pure Cta
    "interactive" -> pure Interactive
    "review" -> pure Review
    "recipe" -> pure Recipe
    "storyquestions" -> pure Storyquestions
    "qanda" -> pure Qanda
    "guide" -> pure Guide
    "profile" -> pure Profile
    "timeline" -> pure Timeline
    "commonsdivision" -> pure Commonsdivision
    _ -> fail $ "Invalid AtomType (" ++ show t ++ ")"