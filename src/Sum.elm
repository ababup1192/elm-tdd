module Sum exposing (..)

import Money.Model exposing (Money(..), Currency)
import Expression exposing (..)


type Sum
    = Sum Money Money


reduce : Sum -> Expression
reduce (Sum (Money augend _) (Money addend _)) to =
    let
        amount =
            augend + addend
    in
        Money amount to


expression : Sum -> Expression
expression sum =
    reduce sum
