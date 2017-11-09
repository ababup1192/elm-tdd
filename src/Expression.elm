module Expression exposing (Expression(..), times, ($+), currency, amount, map)

import Money.Model exposing (Money(..), Currency(..))


type Expression
    = Single Money
    | Sum Expression Expression


($+) : Expression -> Expression -> Expression
($+) exp1 exp2 =
    Sum exp1 exp2


times : Int -> Expression -> Expression
times multiplier expression =
    map (\(Money amnt currency) -> Money (amnt * multiplier) currency) expression


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
            let
                getAmount =
                    (\exp -> amount <| map f exp)

                c =
                    currency exp1
            in
                Single <| Money (getAmount exp1 + getAmount exp2) c


fold : (Money -> a -> a) -> a -> Expression -> a
fold f init exp =
    case exp of
        Single money ->
            f money init

        Sum exp1 exp2 ->
            fold f (fold f init exp1) exp2
