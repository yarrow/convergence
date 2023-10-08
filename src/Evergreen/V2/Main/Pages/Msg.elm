module Evergreen.V2.Main.Pages.Msg exposing (..)

import Evergreen.V2.Pages.Home_
import Evergreen.V2.Pages.NotFound_


type Msg
    = Home_ Evergreen.V2.Pages.Home_.Msg
    | NotFound_ Evergreen.V2.Pages.NotFound_.Msg
