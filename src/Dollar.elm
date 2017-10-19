module Dollar exposing (Dollar(..), times)


type alias Amount =
    Int


type Dollar
    = Dollar Amount


times : Int -> Dollar -> Dollar
times multiplier (Dollar amount) =
    Dollar <| multiplier * amount


amount : Dollar -> Amount
amount (Dollar amount) =
    amount
