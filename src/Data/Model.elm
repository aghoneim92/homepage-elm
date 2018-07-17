module Data.Model exposing (Model, model)

import Date exposing (Date)
import Transit exposing (WithTransition, empty)


type alias Model =
    WithTransition { showPdf : Bool, seePreviousJobs : Bool, now : Maybe Date }


model : Model
model =
    { showPdf = False
    , seePreviousJobs = False
    , transition = empty
    , now = Nothing
    }
