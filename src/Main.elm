module Main exposing (main)

import Data.Model exposing (Model, model)
import Data.Msg exposing (Msg(..))
import Date
import Html.Styled exposing (Attribute, div, h1, img)
import MainContainer exposing (mainContainer)
import Navigation exposing (Location, newUrl, program)
import Ports exposing (keyPressed)
import Task exposing (perform)
import Transit exposing (WithTransition, empty)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ViewResume ->
            ( model, newUrl "/resume" )

        KeyPressed key ->
            if key == "Escape" then
                ( model, newUrl "/" )
            else
                ( model, Cmd.none )

        SetNow date ->
            ( { model | now = Just date }, Cmd.none )

        LocationChange { pathname } ->
            ( { model | location = pathname }, Cmd.none )

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    keyPressed KeyPressed


init : Location -> ( Model, Cmd Msg )
init { pathname } =
    ( { model | location = pathname }, perform SetNow Date.now )


main : Program Never Model Msg
main =
    program
        LocationChange
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = mainContainer
        }
