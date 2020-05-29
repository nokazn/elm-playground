module Main exposing (main)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = { message = "" }
        , update = update
        , view = view
        }



-- Model


type alias Model =
    { message : String
    }



-- Update


type Msg
    = SayHello String
    | SayBye


update : Msg -> Model -> Model
update msg model =
    case msg of
        SayHello greeted ->
            { model | message = "こんにちは" ++ greeted }

        SayBye ->
            { model | message = "さようなら" }



-- View


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick (SayHello "世界") ] [ text "Hello" ]
        , button [ onClick SayBye ] [ text "bye" ]
        , span [] [ text model.message ]
        ]
