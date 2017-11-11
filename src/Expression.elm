module Expression exposing (Expression(..), ($*), ($+), currency, amount, map)

import Money.Model exposing (Money(..), Currency(..))


type Expression
    = Single Money
    | Sum Expression Expression


($+) : Expression -> Expression -> Expression
($+) exp1 exp2 =
    Sum exp1 exp2


($*) : Expression -> Int -> Expression
($*) exp multiplier =
    map (\(Money amnt c) -> Money (amnt * multiplier) c) exp


currency : Expression -> Currency
currency exp =
    fold (\(Money _ c) _ -> c) USD exp


amount : Expression -> Int
amount exp =
    fold (\(Money amnt _) sum -> sum + amnt) 0 exp


map : (Money -> Money) -> Expression -> Expression
map f exp =
    case exp of
        Single money ->
            Single <| f money

        Sum exp1 exp2 ->
            Sum (map f exp1) (map f exp2)


fold : (Money -> a -> a) -> a -> Expression -> a
fold f init exp =
    case exp of
        Single money ->
            f money init

        Sum exp1 exp2 ->
            fold f (fold f init exp1) exp2
