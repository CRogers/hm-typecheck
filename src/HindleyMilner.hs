module HindleyMilner where

import Tree

typeOf :: Expr -> Maybe Type
typeOf e = case e of
    Const (Boolean _) -> Just BoolTy
    Const (Num _) -> Just NumTy
    If c a b -> do
        ta <- typeOf a
        tb <- typeOf b
        if ta == tb then Just ta else Nothing