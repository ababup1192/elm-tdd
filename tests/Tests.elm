module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)


-- Test target modules

import Hello as Hello


all : Test
all =
    describe "Hello Test"
        [ "Hello"
            => Hello.hello
            === "hello"
        ]
