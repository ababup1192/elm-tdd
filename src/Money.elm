module Money exposing (Money, Currency(..), times, dollar, franc, currency)


type alias Amount =
    Int


type Currency
    = USD
    | CHF


type Money
    = Money Amount Currency


dollar : Amount -> Money
dollar amount =
    Money amount USD


franc : Amount -> Money
franc amount =
    Money amount CHF


times : Int -> Money -> Money
times multiplier (Money amount currency) =
    Money (multiplier * amount) currency


amount : Money -> Amount
amount (Money amount _) =
    amount


currency : Money -> Currency
currency (Money _ currency) =
    currency
