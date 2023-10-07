module Tests exposing (..)

import Array exposing (empty)
import Expect
import Test exposing (..)
import Types.Lookup exposing (..)


suite : Test
suite =
    let
        whoString =
            "pond@weed.com"

        who =
            PersonId whoString

        whatString =
            "Herbal Explorations"

        what =
            OfferingId whatString
    in
    describe "The Lookup module"
        [ describe "Functions on Pivots"
            (let
                single =
                    insertPair emptyPivot who what
             in
             [ test "offeringsOf non-facilitator == []" <|
                \_ -> Expect.equal (single |> offeringsOf (PersonId "no!body")) []
             , test "facilitators of non-existent offering == []" <|
                \_ -> Expect.equal (single |> personsOf (OfferingId "no!ne")) []
             , test "offeringsOf who == [what]" <|
                \_ ->
                    Expect.equal (single |> offeringsOf who) [ what ]
             , test "personsOf what == [who]" <|
                \_ ->
                    Expect.equal (single |> personsOf what) [ who ]
             ]
            )
        ]
