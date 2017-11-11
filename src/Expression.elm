module Expression exposing (Expression(..), single, ($+), ($*))

import Money.Model exposing (Money(..), Currency)


type Expression
    = Single Money
    | Sum Expression Expression


single : Money -> Expression
single =
    Single


($+) : Expression -> Expression -> Expression
($+) =
    Sum


($*) : Expression -> Int -> Expression
($*) exp multiplier =
    map (\(Money amnt c) -> Money (amnt * multiplier) c) exp


map : (Money -> Money) -> Expression -> Expression
map f exp =
    case exp of
        Single money ->
            Single <| f money

        Sum exp1 exp2 ->
            Sum (map f exp1) (map f exp2)


infixl 6 $+


infixl 7 $*
