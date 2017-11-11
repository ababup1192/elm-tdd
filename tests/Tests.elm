module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


-- Test target modules

import Money.Money as Money exposing (..)
import Money.Model exposing (..)
import Bank exposing (..)
import Expression exposing (..)


bank =
    Bank.bank |> Bank.addRate (CHF ~> USD) 2


all : Test
all =
    describe "Money Test"
        [ describe "Dollar"
            [ "Multiplication1"
                => reduce bank USD ((unit <| dollar 5) $* 2)
                === dollar 10
            , "Multiplication2"
                => reduce bank USD ((unit <| dollar 5) $* 3)
                === dollar 15
            , "Currency"
                => (currency <| dollar 5)
                === USD
            ]
        , describe "Franc"
            [ "Multiplication1"
                => reduce bank CHF ((unit <| franc 5) $* 2)
                === franc 10
            , "Multiplication2"
                => reduce bank CHF ((unit <| franc 5) $* 3)
                === franc 15
            , "Currency"
                => (currency <| franc 5)
                === CHF
            ]
        , describe "Equality"
            [ "Equality1"
                => dollar 10
                === dollar 10
            , "Equality2"
                => franc 10
                === franc 10
            , "Equality3"
                => dollar 1
                /== franc 1
            , "Equality4"
                => dollar 1
                /== dollar 2
            , "Equality5"
                => franc 1
                /== franc 2
            ]
        , describe "Simple Addition"
            [ "addition1"
                => let
                    five =
                        unit <| dollar 5

                    sum =
                        five $+ five

                    reduced =
                        Expression.reduce bank USD sum
                   in
                    dollar 10
                        === reduced
            ]
        , describe "Reduce Sum"
            [ "addition1"
                => let
                    sum =
                        (unit <| dollar 3) $+ (unit <| dollar 4)

                    result =
                        Expression.reduce bank USD sum
                   in
                    dollar 7
                        === result
            ]
        , describe "Reduce Money"
            [ "reduce1"
                => let
                    unit_ =
                        unit <| dollar 1
                   in
                    Expression.reduce bank USD unit_ === dollar 1
            ]
        , describe "Reduce Expression with Different Currency"
            [ "CHF ~> USD 2"
                => let
                    twoCHF =
                        unit <| franc 2

                    result =
                        Expression.reduce bank USD twoCHF
                   in
                    result === dollar 1
            ]
        , describe "Identity rate"
            [ "USD ~> USD 1"
                => Bank.rate (USD ~> USD) bank
                === 1
            ]
        , describe "Mixed Addition"
            [ "CHF ~> USD 2"
                => let
                    fiveBucks =
                        unit <| dollar 5

                    tenFrancs =
                        unit <| franc 10

                    result =
                        (fiveBucks $+ tenFrancs)
                            |> Expression.reduce bank USD
                   in
                    dollar 10 === result
            ]
        , describe "Sum Plus Money"
            [ "($5 + 10 CHF) + $5"
                => let
                    fiveBucks =
                        unit <| dollar 5

                    tenFrancs =
                        unit <| franc 10

                    result =
                        ((fiveBucks $+ tenFrancs) $+ fiveBucks)
                            |> Expression.reduce bank USD
                   in
                    dollar 15 === result
            ]
        , describe "Sum Times"
            [ "($5 + 10 CHF) * 2"
                => let
                    fiveBucks =
                        unit <| dollar 5

                    tenFrancs =
                        unit <| franc 10

                    result =
                        ((fiveBucks $+ tenFrancs) $* 2)
                            |> Expression.reduce bank USD
                   in
                    dollar 20 === result
            ]
        ]
