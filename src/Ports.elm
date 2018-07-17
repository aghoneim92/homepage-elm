port module Ports exposing (keyPressed)


port keyPressed : (String -> msg) -> Sub msg
