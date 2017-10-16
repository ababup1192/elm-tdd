module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


-- Test target modules

import Dollar exposing (..)


all : Test
all =
    describe "Money Test"
        [ "Multiplication1"
            => let
                ten =
                    Dollar 5 |> Dollar.times 2
               in
                ten
                    === Dollar 10
        , "Multiplication2"
            => let
                fifteen =
                    Dollar 5 |> Dollar.times 3
               in
                fifteen
                    === Dollar 15
        ]
