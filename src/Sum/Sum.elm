module Sum.Sum exposing (..)

import Money.Model exposing (Money(..), Currency)
import Expression exposing (Expression(..))
import Sum.Model exposing (Sum(..))


reduce : Sum -> Currency -> Money
reduce (Sum (Money augend _) (Money addend _)) to =
    let
        amount =
            augend + addend
    in
        Money amount to


expression : Sum -> Expression
expression =
    ExpressionSum
