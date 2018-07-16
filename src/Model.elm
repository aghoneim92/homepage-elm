module Model exposing (Model)

import Date exposing (Date)
import Transit exposing (WithTransition)


type alias Model =
    WithTransition { showPdf : Bool, seePreviousJobs : Bool, now : Maybe Date }
