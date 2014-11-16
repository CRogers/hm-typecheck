module Tree where

data Constant
    = Boolean Bool
    | Num Integer
    deriving (Show, Eq)

data Type
    = BoolTy
    | NumTy
    | FuncTy
    deriving (Show, Eq)

data Expr
    = Var String
    | Const Constant
    | App Expr Expr
    | Abs String Expr
    | If Expr Expr Expr
    deriving (Show, Eq)