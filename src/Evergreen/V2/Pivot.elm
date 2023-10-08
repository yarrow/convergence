module Evergreen.V2.Pivot exposing (..)

import Dict
import Set


type alias MultiDict =
    Dict.Dict String (Set.Set String)


type Pivot
    = Pivot
        { offeringsOf : MultiDict
        , personsOf : MultiDict
        }
