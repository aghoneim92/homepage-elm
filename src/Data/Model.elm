module Data.Model exposing (Model, model)

import Date exposing (Date)


type alias Model =
    { location : String
    , now : Maybe Date
    }


model : Model
model =
    { location = "/"
    , now = Nothing
    }
