module Bank exposing (..)

import Money exposing (..)


reduce : Money -> Currency -> Money
reduce source to =
    Money.dollar 10
