module Data.Msg exposing (Msg(..))

import Date exposing (Date)
import Navigation exposing (Location)


type Msg
    = ViewResume
    | KeyPressed String
    | SetNow Date
    | LocationChange Location
    | None
