module Pivot exposing
    ( OfferingId(..)
    , PersonId(..)
    , Pivot
    , empty
    , insertPair
    , offeringsOf
    , personsOf
    )

import Dict exposing (Dict)
import Set exposing (Set)


type PersonId
    = PersonId String


type OfferingId
    = OfferingId String


type alias MultiDict =
    Dict String (Set String)


type Pivot
    = Pivot
        { offeringsOf : MultiDict
        , personsOf : MultiDict
        }


othersOf : String -> (String -> a) -> MultiDict -> List a
othersOf key wrapValue others =
    others
        |> Dict.get key
        |> Maybe.withDefault Set.empty
        |> Set.toList
        |> List.map wrapValue


empty : Pivot
empty =
    Pivot { offeringsOf = Dict.empty, personsOf = Dict.empty }


insertFor : String -> String -> MultiDict -> MultiDict
insertFor key value dict =
    Dict.update key
        (\maybeSet ->
            maybeSet
                |> Maybe.withDefault Set.empty
                |> Set.insert value
                |> Just
        )
        dict


insertPair : Pivot -> PersonId -> OfferingId -> Pivot
insertPair (Pivot pivot) (PersonId person) (OfferingId offering) =
    Pivot
        { offeringsOf = pivot.offeringsOf |> insertFor person offering
        , personsOf = pivot.personsOf |> insertFor offering person
        }


offeringsOf : PersonId -> Pivot -> List OfferingId
offeringsOf (PersonId person) (Pivot pivot) =
    pivot.offeringsOf |> othersOf person OfferingId


personsOf : OfferingId -> Pivot -> List PersonId
personsOf (OfferingId offering) (Pivot pivot) =
    pivot.personsOf |> othersOf offering PersonId
