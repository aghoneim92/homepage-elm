module MainContainer exposing (mainContainer)

import Css
    exposing
        ( BackgroundImage
        , Color
        , Style
        , absolute
        , alignItems
        , alignSelf
        , auto
        , backgroundColor
        , backgroundImage
        , border
        , border3
        , borderColor
        , bottom
        , center
        , color
        , column
        , display
        , displayFlex
        , flex
        , flexDirection
        , flexEnd
        , flexGrow
        , height
        , int
        , justifyContent
        , left
        , marginBottom
        , marginLeft
        , marginTop
        , minWidth
        , overflow
        , padding
        , pct
        , position
        , property
        , px
        , relative
        , rgb
        , rgba
        , right
        , solid
        , space
        , spaceBetween
        , sticky
        , textAlign
        , top
        , transform
        , translate
        , translate2
        , url
        , visible
        , width
        )
import Home exposing (homepage)
import Html.Styled
    exposing
        ( Html
        , a
        , aside
        , br
        , canvas
        , div
        , footer
        , h1
        , h2
        , h3
        , header
        , img
        , li
        , main_
        , nav
        , section
        , span
        , styled
        , table
        , tbody
        , td
        , text
        , toUnstyled
        , tr
        , ul
        )
import Html.Styled.Attributes exposing (class, css, href, id, src, style)
import Html.Styled.Events exposing (onClick)
import List exposing (concat)
import Model exposing (Model)
import Msg exposing (Msg(ViewResume))
import Photo exposing (photo, photoOffset)
import Resume exposing (resume)
import Svg.Styled exposing (node)
import Theme exposing (ghoneimRed)
import Transit exposing (Transition)
import TransitStyle exposing (fade)


welcomeContainer : Html Msg
welcomeContainer =
    div
        [ css
            [ backgroundColor ghoneimRed
            , displayFlex
            , justifyContent center
            , width (pct 100)
            , height (pct 100)
            ]
        ]
        [ photo ]


headerHeight : Int
headerHeight =
    200


mainContainer : Model -> Html Msg
mainContainer model =
    let
        { showPdf, transition } =
            model

        overlay =
            if showPdf then
                [ resume model ]
            else
                []
    in
    div
        [ css [ height (pct 100), displayFlex, flexDirection column ] ]
        (concat
            [ overlay
            , [ header
                    [ css
                        [ backgroundColor ghoneimRed
                        , height (px (toFloat headerHeight))
                        , displayFlex
                        , justifyContent center
                        , overflow visible
                        ]
                    ]
                    [ photo ]
              , nav [] []
              , homepage
              ]
            ]
        )
