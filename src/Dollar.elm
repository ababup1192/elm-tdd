module Dollar exposing (..)


type alias Amount =
    Int


type Dollar
    = Dollar Amount


times : Int -> Dollar -> Dollar
times multiplier (Dollar amount) =
    Dollar <| multiplier * amount


amount : Dollar -> Int
amount (Dollar amount) =
    amount
