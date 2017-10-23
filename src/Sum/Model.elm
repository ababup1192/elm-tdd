module Sum.Model exposing (Sum(..))

import Money.Model exposing (Money)


type Sum
    = Sum Money Money
