module Bank exposing (reduce)

import Money.Money exposing (amount)
import Money.Model exposing (Money(..), Currency)
import Expression exposing (Expression(..))


reduce : Expression -> Currency -> Money
reduce source to =
    case source of
        Single (Money amount _) ->
            Money amount to

        Sum exp1 exp2 ->
            Money (sum_ exp1 exp2 to) to


sum_ : Expression -> Expression -> Currency -> Int
sum_ exp1 exp2 to =
    let
        getAmount =
            (\expression -> amount <| reduce expression to)
    in
        (getAmount exp1) + (getAmount exp2)
