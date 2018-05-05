module Data.Capi.Types.AtomType where

import Data.Aeson

data AtomType = TyQuiz
              | TyMedia
              | TyExplainer
              | TyCta
              | TyInteractive
              | TyReview
              | TyRecipe
              | TyStoryquestions
              | TyQanda
              | TyGuide
              | TyProfile
              | TyTimeline
              | TyCommonsdivision
  deriving (Show, Eq, Ord)

instance ToJSON AtomType where
  toJSON TyQuiz = String "quiz"
  toJSON TyMedia = String "media"
  toJSON TyExplainer = String "explainer"
  toJSON TyCta = String "cta"
  toJSON TyInteractive = String "interactive"
  toJSON TyReview = String "review"
  toJSON TyRecipe = String "recipe"
  toJSON TyStoryquestions = String "storyquestions"
  toJSON TyQanda = String "qanda"
  toJSON TyGuide = String "guide"
  toJSON TyProfile = String "profile"
  toJSON TyTimeline = String "timeline"
  toJSON TyCommonsdivision = String "commonsdivision"

instance FromJSON AtomType where
  parseJSON = withText "AtomType" $ \t -> case t of
    "quiz" -> pure TyQuiz
    "media" -> pure TyMedia
    "explainer" -> pure TyExplainer
    "cta" -> pure TyCta
    "interactive" -> pure TyInteractive
    "review" -> pure TyReview
    "recipe" -> pure TyRecipe
    "storyquestions" -> pure TyStoryquestions
    "qanda" -> pure TyQanda
    "guide" -> pure TyGuide
    "profile" -> pure TyProfile
    "timeline" -> pure TyTimeline
    "commonsdivision" -> pure TyCommonsdivision
    _ -> fail $ "Invalid AtomType (" ++ show t ++ ")"