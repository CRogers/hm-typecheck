module Typecheck where

import Tree

typeOf :: Expr -> Type
typeOf _ = BoolTy