module Tests exposing (..)

import Expect
import Test exposing (..)
import Types.Lookup exposing (..)


suite : Test
suite =
    describe "xId round trips"
        [ test "idOfPerson(personID x) == x" <|
            \_ -> Expect.equal (idOfPerson (PersonId 42)) 42
        , test "idOfOffering(personID x) == x" <|
            \_ -> Expect.equal (idOfOffering (OfferingId 42)) 42
        ]
