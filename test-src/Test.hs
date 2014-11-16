module Test where

import Test.Hspec
import Tree
import Typecheck

test :: IO ()
test = hspec $ do
  describe "Typecheck:" $ do
    it "true should have type BoolTy" $ do
      typeOf (Const $ Boolean True) `shouldBe` BoolTy

    it "false should have type BoolTy" $ do
      typeOf (Const $ Boolean False) `shouldBe` BoolTy

    it "3 should have type IntTy" $ do
      typeOf (Const $ Num 3) `shouldBe` NumTy