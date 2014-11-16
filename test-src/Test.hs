module Test where

import Test.Hspec
import Tree
import Typecheck

test :: IO ()
test = hspec $ do
  describe "Typecheck:" $ do
    let true = Const $ Boolean True
    let false = Const $ Boolean False
    let three = Const $ Num 3
    let four = Const $ Num 4

    it "true should have type BoolTy" $ do
      typeOf true `shouldBe` BoolTy

    it "false should have type BoolTy" $ do
      typeOf false `shouldBe` BoolTy

    it "3 should have type IntTy" $ do
      typeOf three `shouldBe` NumTy

    it "an if statement where the then and else branch are both BoolTys should be of type BoolTy" $ do
      typeOf (If true true false) `shouldBe` BoolTy

    it "an if statement where the then and else branch are both NumTys should be of type NumTy" $ do
      typeOf (If true three four) `shouldBe` NumTy