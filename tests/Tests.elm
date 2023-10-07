module Tests exposing (..)

import Array exposing (empty)
import Expect
import Pivot exposing (OfferingId(..), PersonId(..))
import Test exposing (..)


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
    describe "The Pivot module"
        [ describe "Functions on Pivots"
            (let
                single =
                    Pivot.insertPair Pivot.empty who what
             in
             [ test "offeringsOf non-facilitator == []" <|
                \_ -> Expect.equal (single |> Pivot.offeringsOf (PersonId "no!body")) []
             , test "facilitators of non-existent offering == []" <|
                \_ -> Expect.equal (single |> Pivot.personsOf (OfferingId "no!ne")) []
             , test "offeringsOf who == [what]" <|
                \_ ->
                    Expect.equal (single |> Pivot.offeringsOf who) [ what ]
             , test "personsOf what == [who]" <|
                \_ ->
                    Expect.equal (single |> Pivot.personsOf what) [ who ]
             ]
            )
        ]
