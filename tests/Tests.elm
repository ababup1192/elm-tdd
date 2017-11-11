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
                => ((single <| dollar 5) $* 2)
                === (single <| dollar 10)
            , "Multiplication2"
                => ((single <| dollar 5) $* 3)
                === (single <| dollar 15)
            , "Currency"
                => (currency <| dollar 5)
                === USD
            ]
        , describe "Franc"
            [ "Multiplication1"
                => ((single <| franc 5) $* 2)
                === (single <| franc 10)
            , "Multiplication2"
                => ((single <| franc 5) $* 3)
                === (single <| franc 15)
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
                        single <| dollar 5

                    sum =
                        five $+ five

                    reduced =
                        Bank.reduce bank USD sum
                   in
                    dollar 10
                        === reduced
            ]
        , describe "Reduce Sum"
            [ "addition1"
                => let
                    sum =
                        (single <| dollar 3) $+ (single <| dollar 4)

                    bank =
                        Bank.bank |> Bank.addRate (CHF ~> USD) 2

                    result =
                        Bank.reduce bank USD sum
                   in
                    dollar 7
                        === result
            ]
        , describe "Reduce Money"
            [ "reduce1"
                => let
                    single_ =
                        single <| dollar 1

                    bank =
                        Bank.bank |> Bank.addRate (CHF ~> USD) 2
                   in
                    Bank.reduce bank USD single_ === dollar 1
            ]
        , describe "Reduce Bank with Different Currency"
            [ "CHF ~> USD 2"
                => let
                    twoCHF =
                        single <| franc 2

                    bank =
                        Bank.bank |> Bank.addRate (CHF ~> USD) 2

                    result =
                        Bank.reduce bank USD twoCHF
                   in
                    result === dollar 1
            ]
        , describe "Identity rate"
            [ "USD ~> USD 1"
                => let
                    bank =
                        Bank.bank |> Bank.addRate (CHF ~> USD) 2
                   in
                    Bank.rate (USD ~> USD) bank
                        === 1
            ]
        , describe "Mixed Addition"
            [ "CHF ~> USD 2"
                => let
                    fiveBucks =
                        single <| dollar 5

                    tenFrancs =
                        single <| franc 10

                    bank =
                        Bank.bank |> Bank.addRate (CHF ~> USD) 2

                    result =
                        (fiveBucks $+ tenFrancs)
                            |> Bank.reduce bank USD
                   in
                    dollar 10 === result
            ]
        , describe "Sum Plus Money"
            [ "($5 + 10 CHF) + $5"
                => let
                    fiveBucks =
                        single <| dollar 5

                    tenFrancs =
                        single <| franc 10

                    bank =
                        Bank.bank |> Bank.addRate (CHF ~> USD) 2

                    result =
                        ((fiveBucks $+ tenFrancs) $+ fiveBucks)
                            |> Bank.reduce bank USD
                   in
                    dollar 15 === result
            ]
        , describe "Sum Times"
            [ "($5 + 10 CHF) * 2"
                => let
                    fiveBucks =
                        single <| dollar 5

                    tenFrancs =
                        single <| franc 10

                    bank =
                        Bank.bank |> Bank.addRate (CHF ~> USD) 2

                    result =
                        ((fiveBucks $+ tenFrancs) $* 2)
                            |> Bank.reduce bank USD
                   in
                    dollar 20 === result
            ]
        ]
