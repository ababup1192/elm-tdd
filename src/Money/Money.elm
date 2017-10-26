module Money.Money exposing (expression, times, ($+), dollar, franc, currency, amount)

import Money.Model exposing (Money(..), Amount, Currency(..))
import Expression exposing (Expression(..), sum)


expression : Money -> Expression
expression =
    Single


dollar : Amount -> Money
dollar amount =
    Money amount USD


franc : Amount -> Money
franc amount =
    Money amount CHF


times : Int -> Money -> Money
times multiplier (Money amount currency) =
    Money (multiplier * amount) currency


($+) : Money -> Money -> Expression
($+) money1 money2 =
    Expression.sum money1 money2


amount : Money -> Amount
amount (Money amount _) =
    amount


currency : Money -> Currency
currency (Money _ currency) =
    currency
