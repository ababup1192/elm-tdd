module Bank exposing (..)

import Money.Model exposing (Money, Currency)
import Expression exposing (Expression(..))
import Sum.Sum as Sum


reduce : Expression -> Currency -> Money
reduce source to =
    case source of
        Expression expression ->
            expression to

        ExpressionMoney money ->
            money

        ExpressionSum sum ->
            Sum.reduce sum to
