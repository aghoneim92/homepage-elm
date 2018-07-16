module Photo exposing (photo, photoOffset)

import Css exposing (height, marginTop, px)
import Html.Styled exposing (Html, div, img)
import Html.Styled.Attributes exposing (css, src)
import Msg exposing (Msg)


photoHeight : Int
photoHeight =
    300


photoMarginTop : Int
photoMarginTop =
    70


photoOffset : Int
photoOffset =
    photoHeight + photoMarginTop


photo : Html Msg
photo =
    div
        []
        [ img
            [ src "img/graduation.jpg"
            , css
                [ height (px (toFloat photoHeight))
                , marginTop (px (toFloat photoMarginTop))
                ]
            ]
            []
        ]
