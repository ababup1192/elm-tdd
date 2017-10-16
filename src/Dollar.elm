module Dollar exposing (..)


type alias Amount =
    Int


type Dollar
    = Dollar Amount


times : Int -> Dollar -> Dollar
times multiplier (Dollar amount) =
    Dollar 0


amount : Dollar -> Int
amount dollar =
    case dollar of
        Dollar amount ->
            amount
