module Expression exposing (..)

import Money.Model exposing (Money)


type Expression
    = Single Money
    | Sum Expression Expression


sum : Money -> Money -> Expression
sum money1 money2 =
    Sum (Single money1) (Single money2)
