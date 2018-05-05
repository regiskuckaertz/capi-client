module Data.Capi.Types.User where

import Test.QuickCheck

instance Arbitrary User where
  arbitrary = User <$> arbitrary <*> arbitrary <*> arbitrary

prop_User u =
  decode (encode u) == Just u where types = u :: User
          