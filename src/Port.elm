port module Port exposing (keyPressed)


port keyPressed : (String -> msg) -> Sub msg
