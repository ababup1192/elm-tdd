module Expression exposing (Expression(..), times, ($+), currency, amount)

import Money.Model exposing (Money(..), Currency(..))


type Expression
    = Single Money
    | Sum Expression Expression


times : Int -> Expression -> Expression
times multiplier expression =
    case expression of
        Single (Money amount currency) ->
            Single <| Money (multiplier * amount) currency

        Sum exp1 exp2 ->
            (times multiplier exp1) $+ (times multiplier exp2)


($+) : Expression -> Expression -> Expression
($+) exp1 exp2 =
    Sum exp1 exp2


currency : Expression -> Currency
currency expression =
    case expression of
        Single (Money _ currency) ->
            currency

        Sum exp1 _ ->
            currency exp1


amount : Expression -> Int
amount expression =
    case expression of
        Single (Money amnt _) ->
            amnt

        Sum exp1 exp2 ->
            (amount exp1) + (amount exp2)
