module Bank exposing (reduce, Bank(..), addRate)

import Money.Money exposing (amount)
import Money.Model exposing (Money(..), Currency(..))
import Expression exposing (Expression(..))


type Bank
    = Bank


addRate : Currency -> Currency -> Float -> Bank -> Bank
addRate from to rate bank =
    bank


reduce : Expression -> Currency -> Bank -> Money
reduce source to bank =
    case source of
        Single (Money amount currency) ->
            let
                rate =
                    if ( currency, to ) == ( CHF, USD ) then
                        2
                    else
                        1
            in
                Money (amount // rate) to

        Sum exp1 exp2 ->
            Money (sum_ exp1 exp2 to bank) to


sum_ : Expression -> Expression -> Currency -> Bank -> Int
sum_ exp1 exp2 to bank =
    let
        getAmount =
            (\expression -> amount <| reduce expression to bank)
    in
        (getAmount exp1) + (getAmount exp2)
