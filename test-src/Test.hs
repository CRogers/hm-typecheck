module Test where

import Test.Hspec
import Tree
import Typecheck

test :: IO ()
test = hspec $ do
	describe "Typecheck" $ do
		it "true should have type Bool" $ do
			typeOf (Const $ Boolean True) `shouldBe` BoolTy