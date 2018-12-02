module MainContainer exposing (mainContainer)

import Css exposing (boxSizing, column, contentBox, displayFlex, flexDirection, minHeight, pct)
import Css.Foreign exposing (body, everything, global, html)
import Data.Model exposing (Model)
import Data.Msg exposing (Msg(ViewResume))
import Html
import Html.Styled exposing (Html, div, toUnstyled)
import Html.Styled.Attributes exposing (class, css, href, id, src, style)
import Pages.Home.Home exposing (homepage)
import Pages.Resume.Resume exposing (resume)


globalStyles : Html Msg
globalStyles =
    global
        [ html [ minHeight (pct 100) ]
        , body [ minHeight (pct 100) ]
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
                [ minHeight (pct 100)
                , displayFlex
                , flexDirection column
                ]
            ]
            [ globalStyles, page ]
        )
