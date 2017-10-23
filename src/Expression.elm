module Expression exposing (..)

import Money.Model exposing (Currency, Amount, Money)
import Sum.Model exposing (Sum)


type Expression
    = Expression (Currency -> Money)
    | ExpressionMoney Money
    | ExpressionSum Sum
