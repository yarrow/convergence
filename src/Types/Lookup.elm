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


emptyPivot : Pivot
emptyPivot =
    Pivot { offeringsOf = Dict.empty, personsOf = Dict.empty }


insertOne : String -> String -> MultiDict -> MultiDict
insertOne key value dict =
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
        { pivot
            | offeringsOf = pivot.offeringsOf |> insertOne person offering
        }


offeringsOf : PersonId -> Pivot -> List OfferingId
offeringsOf (PersonId person) (Pivot pivot) =
    pivot.offeringsOf |> othersOf person OfferingId


facilitatorsOf : OfferingId -> Pivot -> List PersonId
facilitatorsOf offeringId pivot =
    []
