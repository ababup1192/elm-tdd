module Money exposing (Money, times, dollar, franc)


type alias Amount =
    Int


type Money
    = Dollar Amount
    | Franc Amount


dollar : Amount -> Money
dollar amount =
    Dollar amount


franc : Amount -> Money
franc amount =
    Franc amount


times : Int -> Money -> Money
times multiplier money =
    case money of
        Dollar amount ->
            Dollar <| multiplier * amount

        Franc amount ->
            Franc <| multiplier * amount


amount : Money -> Amount
amount money =
    case money of
        Dollar amount ->
            amount

        Franc amount ->
            amount
