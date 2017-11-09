module Bank exposing (bank, rate, reduce, Bank, addRate, (~>))

import Money.Model exposing (Money(..), Currency(..))
import Expression exposing (Expression(..))
import EveryDict exposing (EveryDict)


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


reduce : Expression -> Currency -> Bank -> Expression
reduce source to bank =
    case source of
        Single (Money amnt currency) ->
            let
                r =
                    rate (currency ~> to) bank
            in
                Single <| Money (amnt // r) to

        Sum exp1 exp2 ->
            Single <| Money (sum_ exp1 exp2 to bank) to


amount : Expression -> Int
amount expression =
    case expression of
        Single (Money amnt _) ->
            amnt

        Sum exp1 exp2 ->
            (amount exp1) + (amount exp2)


sum_ : Expression -> Expression -> Currency -> Bank -> Int
sum_ exp1 exp2 to bank =
    let
        getAmount =
            (\expression -> amount <| reduce expression to bank)
    in
        (getAmount exp1) + (getAmount exp2)
