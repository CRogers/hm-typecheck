module HindleyMilner where

import Tree
import Control.Monad

switch :: (a -> Bool) -> a -> Maybe a
switch predicate a = if predicate a then Just a else Nothing

typeOf :: Expr -> Maybe Type
typeOf e = case e of
    Const (Boolean _) -> Just BoolTy
    Const (Num _) -> Just NumTy
    Abs _ e -> do
        te <- typeOf e
        return $ BoolTy :-> te
    App f e -> do
        tf <- typeOf f
        te <- typeOf e
        case tf of
            _ :-> _ -> switch (== BoolTy) te
            _ -> Nothing
    If c a b -> do
        tc <- typeOf c
        guard $ tc == BoolTy
        ta <- typeOf a
        tb <- typeOf b
        switch (== tb) ta