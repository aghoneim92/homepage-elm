module Pages.Home.Photo exposing (photo, photoOffset)

import Css exposing (em, height, marginTop, px)
import Css.Media as Media exposing (all)
import Data.Msg exposing (Msg)
import Html.Styled exposing (Html, div, img)
import Html.Styled.Attributes exposing (css, src)
import Util.Media exposing (medium, small)


photoHeight : Float
photoHeight =
    300.0 / 15.0



--
--photoHeightMobile : Float
--photoHeightMobile =
--    500.0 / (15.0 * 2.5)


photoMarginTop : Float
photoMarginTop =
    3.0


photoOffset : Float
photoOffset =
    photoHeight + photoMarginTop



--photoOffsetMobile : Float
--photoOffsetMobile =
--    photoHeightMobile + photoMarginTop


photo : Html Msg
photo =
    img
        [ src "img/graduation.jpg"
        , css
            [ height (em photoHeight)

            --            , Media.withMedia
            --                [ small, medium ]
            --                [ height (em photoHeight) ]
            ]
        ]
        []
