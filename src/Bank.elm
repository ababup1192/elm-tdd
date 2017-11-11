module Bank exposing (bank, rate, Bank, addRate, (~>))

import Money.Model exposing (Currency)
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
