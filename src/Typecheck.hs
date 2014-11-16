module Typecheck where

import Tree

typeOf :: Expr -> Type
typeOf e = case e of
	Const (Boolean _) -> BoolTy
	Const (Num _) -> NumTy
	If c a b -> typeOf a