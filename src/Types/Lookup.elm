module Types.Lookup exposing
    ( OfferingId(..)
    , PersonId(..)
    , Pivot
    , emptyPivot
    , facilitatorsOf
    , insertPair
    , offeringsOf
    )

import Dict exposing (Dict)
import Set exposing (Set)


type PersonId
    = PersonId String


type OfferingId
    = OfferingId String


type alias OthersOf =
    Dict String (Set String)


type Pivot
    = Pivot
        { offeringsOf : OthersOf
        , personsOf : OthersOf
        }


emptyPivot : Pivot
emptyPivot =
    Pivot { offeringsOf = Dict.empty, personsOf = Dict.empty }


insertPair : Pivot -> PersonId -> OfferingId -> Pivot
insertPair (Pivot pivot) (PersonId person) (OfferingId offering) =
    Pivot
        { pivot
            | offeringsOf =
                Dict.update person
                    (\maybeSet ->
                        maybeSet
                            |> Maybe.withDefault Set.empty
                            |> Set.insert offering
                            |> Just
                    )
                    pivot.offeringsOf
        }


othersOf : String -> (String -> a) -> OthersOf -> List a
othersOf key wrap others =
    others
        |> Dict.get key
        |> Maybe.withDefault Set.empty
        |> Set.toList
        |> List.map wrap


offeringsOf : PersonId -> Pivot -> List OfferingId
offeringsOf (PersonId person) (Pivot pivot) =
    pivot.offeringsOf
        |> Dict.get person
        |> Maybe.withDefault Set.empty
        |> Set.toList
        |> List.map OfferingId


facilitatorsOf : OfferingId -> Pivot -> List PersonId
facilitatorsOf offeringId pivot =
    []
