module Bank exposing (bank, rate, Bank, addRate, (~>), reduce)

import Money.Model exposing (Currency, Money(..))
import Money.Money as Money
import EveryDict exposing (EveryDict)
import Expression exposing (Expression(..))


type alias Bank =
    EveryDict ( Currency, Currency ) Int


bank : Bank
bank =
    EveryDict.empty


(~>) : a -> b -> ( a, b )
(~>) a b =
    ( a, b )


addRate : ( Currency, Currency ) -> Int -> Bank -> Bank
addRate fromTo rate =
    EveryDict.insert fromTo rate


rate : ( Currency, Currency ) -> Bank -> Int
rate (( from, to ) as fromto) bank =
    if from == to then
        1
    else
        case EveryDict.get fromto bank of
            Just r ->
                r

            Nothing ->
                Debug.crash <| (toString from) ++ " ~> " ++ (toString to) ++ " is not found."


reduce : Bank -> Currency -> Expression -> Money
reduce bank to exp =
    case exp of
        Single (Money amnt source) ->
            let
                r =
                    rate (source ~> to) bank
            in
                Money (amnt // r) to

        Sum exp1 exp2 ->
            let
                amnt_ e =
                    Money.amount <| reduce bank to e

                a1 =
                    amnt_ exp1

                a2 =
                    amnt_ exp2
            in
                Money (a1 + a2) to
