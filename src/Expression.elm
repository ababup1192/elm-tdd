module Expression exposing (Expression, ($*), ($+), add, mul, unit, reduce)

import Money.Model exposing (Money(..), Currency)
import Money.Money exposing (amount, franc)
import Bank exposing (Bank, rate, (~>))


type Expression
    = Unit Money
    | Add Expression Expression
    | Multiple Expression Int


unit : Money -> Expression
unit =
    Unit


add : Expression -> Expression -> Expression
add =
    Add


($+) : Expression -> Expression -> Expression
($+) =
    add


mul : Expression -> Int -> Expression
mul =
    Multiple


($*) : Expression -> Int -> Expression
($*) =
    mul


infixl 6 $+


infixl 7 $*


reduce : Bank -> Currency -> Expression -> Money
reduce bank to exp =
    case exp of
        Unit (Money amount currency) ->
            let
                r =
                    rate (currency ~> to) bank
            in
                Money (amount // r) to

        Add exp1 exp2 ->
            let
                res1 =
                    reduce bank to exp1

                res2 =
                    reduce bank to exp2
            in
                Money (amount res1 + amount res2) to

        Multiple exp_ multiplier ->
            let
                res =
                    reduce bank to exp_
            in
                Money (amount res * multiplier) to
