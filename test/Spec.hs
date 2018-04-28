import Data.Aeson
import Data.Capi.Types
import Data.Text
import Test.QuickCheck

instance Arbitrary User where
  arbitrary = User <$> (pack <$> arbitrary) 
                    <*> (Just . pack <$> arbitrary) 
                    <*> (Just . pack <$> arbitrary)

prop_ContentChangeDetails u =
  decode (encode u) == Just u where types = u :: User

main = putStrLn "Hi"