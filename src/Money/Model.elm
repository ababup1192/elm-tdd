module Money.Model exposing (Money(..), Amount, Currency(..))


type alias Amount =
    Int


type Currency
    = USD
    | CHF


type Money
    = Money Amount Currency
