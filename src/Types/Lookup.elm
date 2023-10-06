module Types.Lookup exposing (..)

import Dict exposing (Dict)
import Set exposing (Set)


type PersonId
    = PersonId String


personId : String -> PersonId
personId id =
    PersonId id


idOfPerson : PersonId -> String
idOfPerson (PersonId id) =
    id


type OfferingId
    = OfferingId String


offeringId : String -> OfferingId
offeringId id =
    OfferingId id


idOfOffering : OfferingId -> String
idOfOffering (OfferingId id) =
    id


type Pivot
    = Pivot
        { offeringsOf : Dict String (Set String)
        , personsOf : Dict String (Set String)
        }


empty : Pivot
empty =
    Pivot { offeringsOf = Dict.empty, personsOf = Dict.empty }
