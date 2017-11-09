module Money.Money exposing (times, ($+), dollar, franc, currency)

import Money.Model exposing (Money(..), Amount, Currency(..))
import Expression exposing (Expression(..))


dollar : Amount -> Expression
dollar amount =
    Single <| Money amount USD


franc : Amount -> Expression
franc amount =
    Single <| Money amount CHF


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
