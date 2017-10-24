module Bank exposing (..)

import Money.Model exposing (Money(..), Currency)
import Expression exposing (Expression(..))


reduce : Expression -> Currency -> Money
reduce source to =
    case source of
        Single money ->
            money

        Sum exp1 exp2 ->
            let
                (Money added _) =
                    reduce exp1 to

                (Money adunt _) =
                    reduce exp2 to
            in
                Money (added + adunt) to
