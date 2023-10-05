module Types.Lookup exposing (..)

import Dict exposing (Dict)
import Set exposing (Set)


type PersonId
    = PersonId Int


personId : Int -> PersonId
personId id =
    PersonId id


idOfPerson : PersonId -> Int
idOfPerson (PersonId id) =
    id


type OfferingId
    = OfferingId Int


offeringId : Int -> OfferingId
offeringId id =
    OfferingId id


idOfOffering : OfferingId -> Int
idOfOffering (OfferingId id) =
    id


type Pivot
    = Pivot
        { offeringsOf : Dict Int (Set Int)
        , personsOf : Dict Int (Set Int)
        }


empty : Pivot
empty =
    Pivot { offeringsOf = Dict.empty, personsOf = Dict.empty }
