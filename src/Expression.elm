module Expression exposing (Expression)

import Money.Model exposing (Currency, Money)


type alias Expression =
    Currency -> Money
