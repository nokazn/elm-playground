module Main exposing (main)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- Model


type alias Model =
    String


init : () -> (Model -> Cmd Msg)
init _ =
    ( "", Cmd.none )



-- Update


type Msg
    = SayHello String
    | SayBye


update : Msg -> Model -> Model
update msg model =
    case msg of
        SayHello greeted ->
            "こんにちは" ++ greeted

        SayBye ->
            "さようなら"



-- View


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick (SayHello "世界") ] [ text "Hello" ]
        , button [ onClick SayBye ] [ text "bye" ]
        , span [] [ text model.message ]
        ]
