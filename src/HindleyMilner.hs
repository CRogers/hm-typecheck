module HindleyMilner where

import Tree
import Control.Monad

typeOf :: Expr -> Maybe Type
typeOf e = case e of
    Const (Boolean _) -> Just BoolTy
    Const (Num _) -> Just NumTy
    Abs _ e -> do
        te <- typeOf e
        return $ BoolTy :-> te
    App f e -> do
        tf <- typeOf f
        case tf of
            _ :-> _ -> return BoolTy
            _ -> Nothing
    If c a b -> do
        tc <- typeOf c
        guard $ tc == BoolTy
        ta <- typeOf a
        tb <- typeOf b
        if ta == tb then Just ta else Nothing