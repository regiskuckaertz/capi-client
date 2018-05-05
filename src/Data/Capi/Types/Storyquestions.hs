module Data.Capi.Types.Storyquestions where

import GHC.Generics
import Data.Aeson
import Data.Capi.Types.NotificationProviders
import Data.Capi.Types.Shared
import Data.Text

data RelatedStoryLinkType = Tag | Story deriving (Show, Eq, Ord)

instance ToJSON RelatedStoryLinkType where
  toJSON Tag = String "tag"
  toJSON Story = String "story"

instance FromJSON RelatedStoryLinkType where
  parseJSON (String "tag") = pure Tag
  parseJSON (String "story") = pure Story

data AnswerType = Content | Atom deriving (Show, Eq, Ord)

instance ToJSON AnswerType where
  toJSON Content = String "content"
  toJSON Atom = String "atom"

instance FromJSON AnswerType where
  parseJSON (String "content") = pure Content
  parseJSON (String "atom") = pure Atom

data Answer = Answer Text AnswerType deriving (Show, Eq, Ord)

instance ToJSON Answer where
  toJSON (Answer answerId answerType) = 
    object ["answerId" .= answerId, "answerType" .= answerType]

instance FromJSON Answer where
  parseJSON = withObject "Answer" $ \v ->
    Answer <$> v .: "answerId"
            <*> v .: "answerType"

data Question = Question Text Text (Maybe [Answer]) deriving (Show, Eq, Ord)

instance ToJSON Question where
  toJSON (Question questionId questionText answers) = 
    object [ "questionId" .= questionId
            , "questionText" .= questionText
            , "answers" .= answers
            ]

instance FromJSON Question where
  parseJSON = withObject "Question" $ \v ->
    Question <$> v .: "questionId"
              <*> v .: "questionText"
              <*> v .:? "answers"

data QuestionSet = QuestionSet Text Text [Question] deriving (Show, Eq, Ord)

instance ToJSON QuestionSet where
  toJSON (QuestionSet qsId qsTitle questions) = 
    object [ "questionSetId" .= qsId
            , "questionSetTitle" .= qsTitle
            , "questions" .= questions
            ]

instance FromJSON QuestionSet where
  parseJSON = withObject "QuestionSet" $ \v ->
    QuestionSet <$> v .: "questionSetId"
                <*> v .: "questionSetTitle"
                <*> v .: "questions"

data StoryQuestionsAtom =
  StoryQuestionsAtom { _sqRelatedStoryId :: Text
                      , _sqRelatedStoryLinkType :: RelatedStoryLinkType 
                      , _sqTitle :: Text
                      , _sqEditorialQuestions :: Maybe [QuestionSet]
                      , _sqUserQuestions :: Maybe [QuestionSet]
                      , _sqNotifications :: Maybe NotificationProviders 
                      , _sqCloseDate :: Maybe DateTime 
                      } deriving (Show, Eq, Ord, Generic)

instance ToJSON StoryQuestionsAtom where
  toEncoding = genericToEncoding capi3Options

instance FromJSON StoryQuestionsAtom where
  parseJSON = withObject "StoryQuestionsAtom" $ \v ->
    StoryQuestionsAtom <$> v .: "relatedStoryId"
                        <*> v .: "relatedStoryLinkType"
                        <*> v .: "title"
                        <*> v .:? "editorialQuestions"
                        <*> v .:? "userQuestions"
                        <*> v .:? "notifications"
                        <*> v .:? "closeDate"