module Expression exposing (Expression(..), ($+), ($*), currency, amount)

import Money.Model exposing (Money(..), Currency(..))


type Expression
    = Single Money
    | Sum Expression Expression


($+) : Expression -> Expression -> Expression
($+) exp1 exp2 =
    Sum exp1 exp2


($*) : Expression -> Int -> Expression
($*) exp multiplier =
    case exp of
        Single (Money amnt crncy) ->
            Single <| Money (amnt * multiplier) crncy

        Sum exp1 exp2 ->
            let
                mlp_ e =
                    e $* multiplier
            in
                Sum (mlp_ exp1) (mlp_ exp2)


currency : Expression -> Currency
currency expression =
    case expression of
        Single (Money _ currency) ->
            currency

        Sum _ exp2 ->
            currency exp2


amount : Expression -> Int
amount expression =
    case expression of
        Single (Money amnt _) ->
            amnt

        Sum exp1 exp2 ->
            (amount exp1) + (amount exp2)
