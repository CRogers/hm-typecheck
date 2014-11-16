module Tree where

data Constant
    = Boolean Bool
    | Num Integer
    deriving (Show, Eq)

infixr 5 :->
data Type
    = BoolTy
    | NumTy
    | (:->) Type Type
    deriving (Show, Eq)

data Expr
    = Var String
    | Const Constant
    | App Expr Expr
    | Abs String Expr
    | If Expr Expr Expr
    deriving (Show, Eq)