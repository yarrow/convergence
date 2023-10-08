module Evergreen.V2.Types exposing (..)

import Evergreen.V2.Bridge
import Evergreen.V2.Main
import Evergreen.V2.Pivot
import Lamdera


type alias FrontendModel =
    Evergreen.V2.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    , pivot : Evergreen.V2.Pivot.Pivot
    }


type alias FrontendMsg =
    Evergreen.V2.Main.Msg


type alias ToBackend =
    Evergreen.V2.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
