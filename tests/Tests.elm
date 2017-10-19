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
                => (Dollar 5 |> times 2)
                === Dollar 10
            , "Multiplication2"
                => (Dollar 5 |> times 3)
                === Dollar 15
            ]
        , describe "Franc"
            [ "Multiplication1"
                => (Franc 5 |> times 2)
                === Franc 10
            , "Multiplication2"
                => (Franc 5 |> times 3)
                === Franc 15
            ]
        ]
