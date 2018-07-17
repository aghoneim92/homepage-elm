module Data.Msg exposing (Msg(..))

import Date exposing (Date)
import Transit


type Msg
    = ViewResume
    | TransitMsg (Transit.Msg Msg)
    | KeyPressed String
    | SetNow Date
    | None
