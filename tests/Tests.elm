module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


-- Test target modules

import Money exposing (..)


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
        ]
