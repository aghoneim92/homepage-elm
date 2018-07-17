module Main exposing (main)

import Data.Model exposing (Model, model)
import Data.Msg exposing (Msg(KeyPressed, None, SetNow, TransitMsg, ViewResume))
import Date
import Html.Styled exposing (Attribute, div, h1, img, program)
import MainContainer exposing (mainContainer)
import Ports exposing (keyPressed)
import Task exposing (perform)
import Transit exposing (WithTransition, empty)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ViewResume ->
            ( { model | showPdf = True }, Cmd.none )

        TransitMsg a ->
            Transit.tick TransitMsg a model

        KeyPressed key ->
            if key == "Escape" then
                ( { model | showPdf = False }, Cmd.none )
            else
                ( model, Cmd.none )

        SetNow date ->
            ( { model | now = Just date }, Cmd.none )

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Transit.subscriptions TransitMsg model, keyPressed KeyPressed ]


main : Program Never Model Msg
main =
    program
        { init = ( model, perform SetNow Date.now )
        , update = update
        , subscriptions = subscriptions
        , view = mainContainer
        }
