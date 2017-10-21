module Money exposing (Money, times, dollar, franc, currency)


type alias Amount =
    Int


type alias Currency =
    String


type Money
    = Dollar Amount Currency
    | Franc Amount Currency


dollar : Amount -> Money
dollar amount =
    Dollar amount "USD"


franc : Amount -> Money
franc amount =
    Franc amount "CHF"


times : Int -> Money -> Money
times multiplier money =
    case money of
        Dollar amount _ ->
            dollar <| multiplier * amount

        Franc amount _ ->
            franc <| multiplier * amount


amount : Money -> Amount
amount money =
    case money of
        Dollar amount _ ->
            amount

        Franc amount _ ->
            amount


currency : Money -> Currency
currency money =
    case money of
        Dollar _ currency ->
            currency

        Franc _ currency ->
            currency
