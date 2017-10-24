module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


-- Test target modules

import Money.Money as Money exposing (..)
import Money.Model exposing (..)
import Bank exposing (..)
import Expression exposing (..)


all : Test
all =
    describe "Money Test"
        [ describe "Dollar"
            [ "Multiplication1"
                => (dollar 5 |> times 2)
                === dollar 10
            , "Multiplication2"
                => (dollar 5 |> times 3)
                === dollar 15
            , "Currency"
                => (currency <| dollar 5)
                === USD
            ]
        , describe "Franc"
            [ "Multiplication1"
                => (franc 5 |> times 2)
                === franc 10
            , "Multiplication2"
                => (franc 5 |> times 3)
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
                        dollar 5

                    sum =
                        plus five five

                    reduced =
                        Bank.reduce sum USD
                   in
                    dollar 10
                        === reduced
            ]
        , describe "Plus Returns Sum"
            [ "addition1"
                => let
                    five =
                        dollar 5

                    result =
                        plus five five
                   in
                    result
                        === Sum (Money.expression five) (Money.expression five)
            ]
        , describe "Reduce Sum"
            [ "addition1"
                => let
                    sum =
                        Sum (Money.expression <| dollar 3) (Money.expression <| dollar 4)

                    result =
                        Bank.reduce sum USD
                   in
                    dollar 7
                        === result
            ]
        , describe "Reduce Money"
            [ "reduce1"
                => let
                    money =
                        Money.expression <| dollar 1
                   in
                    dollar 1
                        === Bank.reduce money USD
            ]
        ]
