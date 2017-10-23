module Bank exposing (..)

import Money.Model exposing (Money, Currency)
import Expression exposing (Expression)


reduce : Expression -> Currency -> Money
reduce source to =
    source to
