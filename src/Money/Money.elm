module Money.Money exposing (expression, times, plus, reduce, dollar, franc, currency)

import Money.Model exposing (Money(..), Amount, Currency(..))
import Sum exposing (Sum(..), reduce, expression)
import Expression exposing (Expression)


dollar : Amount -> Money
dollar amount =
    Money amount USD


franc : Amount -> Money
franc amount =
    Money amount CHF


expression : Money -> Expression
expression money =
    (\_ -> money)


times : Int -> Money -> Money
times multiplier (Money amount currency) =
    Money (multiplier * amount) currency


plus : Money -> Money -> Sum
plus money1 money2 =
    Sum money1 money2


reduce : Money -> Currency -> Expression
reduce money to =
    expression money


amount : Money -> Amount
amount (Money amount _) =
    amount


currency : Money -> Currency
currency (Money _ currency) =
    currency
