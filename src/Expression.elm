module Expression exposing (..)

import Money.Model exposing (Money)


type Expression
    = Single Money
    | Sum Expression Expression
