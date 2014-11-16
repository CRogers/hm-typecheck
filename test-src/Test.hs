module Test where

import Test.Hspec
import Tree
import Typecheck

test :: IO ()
test = hspec $ do
  describe "Typecheck:" $ do
    let shouldHaveType e t = typeOf e `shouldBe` t

    let true = Const $ Boolean True
    let false = Const $ Boolean False
    let three = Const $ Num 3
    let four = Const $ Num 4

    it "true should have type BoolTy" $ do
      true `shouldHaveType` BoolTy

    it "false should have type BoolTy" $ do
      false `shouldHaveType` BoolTy

    it "3 should have type IntTy" $ do
      three `shouldHaveType` NumTy

    it "an if statement where the then and else branch are both BoolTys should be of type BoolTy" $ do
      If true true false `shouldHaveType` BoolTy

    it "an if statement where the then and else branch are both NumTys should be of type NumTy" $ do
      If true three four `shouldHaveType` NumTy

    {-it "an if statement where the then and else branch are different should fail" $ do
      typeOf (If true three four) `shouldBe` None-}