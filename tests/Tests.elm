module Tests exposing (..)

import Expect
import Test exposing (..)
import Types.Lookup exposing (..)


suite : Test
suite =
    describe "xId round trips"
        [ test "idOfPerson(personID x) == x" <|
            \_ ->
                let
                    who =
                        "pond@weed.com"
                in
                Expect.equal (idOfPerson (PersonId who)) who
        , test "idOfOffering(personID x) == x" <|
            \_ ->
                let
                    what =
                        "Herbal Explorations"
                in
                Expect.equal (idOfOffering (OfferingId what)) what
        ]
