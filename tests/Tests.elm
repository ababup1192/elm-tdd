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
            ]
        , describe "Franc"
            [ "Multiplication1"
                => (franc 5 |> times 2)
                === franc 10
            , "Multiplication2"
                => (franc 5 |> times 3)
                === franc 15
            ]
        ]
