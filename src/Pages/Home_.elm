module Pages.Home_ exposing (Model, Msg(..), page)

import Bridge
import Effect exposing (..)
import Html exposing (Html, div, h1, img, node, p, text)
import Html.Attributes as Attr
import Html.Events exposing (onClick)
import Lamdera
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view shared
        }



-- INIT


type alias Model =
    {}


init : () -> ( Model, Effect Msg )
init _ =
    ( {}
    , Effect.none
    )



-- UPDATE


type Msg
    = SmashedLikeButton


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        SmashedLikeButton ->
            ( model
            , Effect.sendCmd <| Lamdera.sendToBackend Bridge.SmashedLikeButton
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Shared.Model -> Model -> View Msg
view shared model =
    { title = "Elm Land ❤️ Lamdera"
    , body =
        [ node "style" [] [ text """
            @import url('https://fonts.googleapis.com/css2?family=Lora:wght@600&family=Nunito+Sans&display=swap');

            html {
                height: 100%;
                color: white;
                background: linear-gradient(dodgerblue, #339);
            }
            body {
                display: flex;
                flex-direction: column;
                margin: 0;
                justify-content: center;
                align-items: center;
                height: 90vh;
                font-family: 'Lora';
            }
            h1 {
                margin: 0;
                font-weight: 600 !important;
            }
            """ ]
        , div [ Attr.style "display" "flex", Attr.style "gap" "1rem" ]
            [ img
                [ Attr.alt "Lando, the Elm Land Rainbow"
                , Attr.src "https://elm.land/images/logo-480.png"
                , Attr.style "width" "128px"
                , Attr.style "margin-right" "2.5rem"
                ]
                []
            , img
                [ Attr.alt "Laurie, the Lamdera Lambda Llamba"
                , Attr.src "https://lamdera.com/images/llama/floaty.png"
                , Attr.style "width" "81.4px"
                , Attr.style "margin-right" "1.5rem"
                , Attr.style "height" "108.4px"
                ]
                []
            ]
        , h1 [] [ text "Elm Land ❤️ Lamdera" ]
        , p
            [ Attr.style "font-family" "Nunito Sans"
            , Attr.style "opacity" "0.75"
            ]
            [ text "It's working, Mario!!" ]
        , p
            [ Attr.style "font-family" "Nunito Sans"
            , Attr.style "cursor" "pointer"
            , Attr.style "background-color" "#ffffff40"
            , Attr.style "padding" "5px"
            , Attr.style "border-radius" "5px"
            , Attr.style "user-select" "none"
            , onClick SmashedLikeButton
            ]
            [ text <| "👍 " ++ String.fromInt shared.smashedLikes ]
        ]
    }
