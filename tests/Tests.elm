module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


-- Test target modules

import Dollar exposing (..)


all : Test
all =
    describe "Money Test"
        [ "equivalence"
            => Dollar 5
            === Dollar 5
        , "Multiplication"
            => (Dollar 5 |> Dollar.times 3)
            === Dollar 15
        ]
