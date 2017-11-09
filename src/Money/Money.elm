module Money.Money exposing (dollar, franc)

import Money.Model exposing (Money(..), Amount, Currency(..))
import Expression exposing (Expression(..))


dollar : Amount -> Expression
dollar amount =
    Single <| Money amount USD


franc : Amount -> Expression
franc amount =
    Single <| Money amount CHF
