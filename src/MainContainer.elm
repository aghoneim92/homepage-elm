module MainContainer exposing (mainContainer)

import Css exposing (boxSizing, column, contentBox, displayFlex, flexDirection, height, pct)
import Css.Foreign exposing (body, everything, global, html)
import Data.Model exposing (Model)
import Data.Msg exposing (Msg(ViewResume))
import Html
import Html.Styled exposing (Html, div, toUnstyled)
import Html.Styled.Attributes exposing (class, css, href, id, src, style)
import Html.Styled.Events exposing (onClick)
import List exposing (concat)
import Pages.Home.Home exposing (homepage)
import Pages.Resume.Resume exposing (resume)
import Svg.Styled exposing (node)
import Theme exposing (ghoneimRed)
import Transit exposing (Transition)
import TransitStyle exposing (fade)
import Util.Operators exposing ((@))


globalStyles : Html Msg
globalStyles =
    global
        [ html [ height (pct 100) ]
        , body [ height (pct 100) ]
        , everything [ boxSizing contentBox ]
        ]


mainContainer : Model -> Html.Html Msg
mainContainer { location, now } =
    let
        page =
            case location of
                "/resume" ->
                    resume now

                _ ->
                    homepage
    in
    toUnstyled
        (div
            [ css
                [ height (pct 100)
                , displayFlex
                , flexDirection column
                ]
            ]
            [ globalStyles, page ]
        )
