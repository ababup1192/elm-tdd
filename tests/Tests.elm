module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


-- Test target modules

import Dollar exposing (..)
import Franc exposing (..)


all : Test
all =
    describe "Money Test"
        [ describe "Dollar"
            [ "Multiplication1"
                => (Dollar 5 |> Dollar.times 2)
                === Dollar 10
            , "Multiplication2"
                => (Dollar 5 |> Dollar.times 3)
                === Dollar 15
            ]
        , describe "Franc"
            [ "Multiplication1"
                => (Franc 5 |> Franc.times 2)
                === Franc 10
            , "Multiplication2"
                => (Franc 5 |> Franc.times 3)
                === Franc 15
            ]
        ]
