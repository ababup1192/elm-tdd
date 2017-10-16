module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


-- Test target modules

import Dollar exposing (..)


all : Test
all =
    describe "Money Test"
        [ "Multiplication"
            => let
                amount =
                    Dollar 5 |> Dollar.times 2 |> Dollar.amount
               in
                amount
                    === 10
        ]
