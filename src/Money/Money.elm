module Money.Money exposing (expression, times, plus, reduce, dollar, franc, currency)

import Money.Model exposing (Money(..), Amount, Currency(..))
import Sum.Model exposing (Sum(..))
import Expression exposing (Expression(..))


expression : Money -> Expression
expression =
    ExpressionMoney


dollar : Amount -> Money
dollar amount =
    Money amount USD


franc : Amount -> Money
franc amount =
    Money amount CHF


times : Int -> Money -> Money
times multiplier (Money amount currency) =
    Money (multiplier * amount) currency


plus : Money -> Money -> Expression
plus money1 money2 =
    ExpressionSum <| Sum money1 money2


reduce : Expression -> Currency -> Expression
reduce money to =
    money


amount : Money -> Amount
amount (Money amount _) =
    amount


currency : Money -> Currency
currency (Money _ currency) =
    currency
