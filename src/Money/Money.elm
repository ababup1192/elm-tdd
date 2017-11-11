module Money.Money exposing (dollar, franc, currency, amount)

import Money.Model exposing (Money(..), Amount, Currency(..))


dollar : Amount -> Money
dollar amount =
    Money amount USD


franc : Amount -> Money
franc amount =
    Money amount CHF


currency : Money -> Currency
currency (Money _ c) =
    c


amount : Money -> Amount
amount (Money a _) =
    a
