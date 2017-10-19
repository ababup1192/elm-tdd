module Franc exposing (Franc(..), times)


type alias Amount =
    Int


type Franc
    = Franc Amount


times : Int -> Franc -> Franc
times multiplier (Franc amount) =
    Franc <| multiplier * amount


amount : Franc -> Amount
amount (Franc amount) =
    amount
