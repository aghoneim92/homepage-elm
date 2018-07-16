module Home exposing (homepage)

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
        , cursor
        , display
        , displayFlex
        , flex
        , flexDirection
        , flexEnd
        , flexGrow
        , height
        , hover
        , int
        , justifyContent
        , left
        , marginBottom
        , marginLeft
        , marginTop
        , minWidth
        , none
        , overflow
        , padding
        , padding2
        , pct
        , pointer
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
        , textDecoration
        , top
        , transform
        , translate
        , translate2
        , underline
        , url
        , visible
        , width
        , zIndex
        )
import Css.Colors exposing (black, gray)
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
import Html.Styled.Attributes
    exposing
        ( class
        , css
        , href
        , id
        , src
        , style
        , target
        , title
        )
import Html.Styled.Events exposing (onClick)
import Msg exposing (Msg(ViewResume))
import Photo exposing (photoOffset)
import Theme exposing (ghoneimRed)


homepageOffset : Int
homepageOffset =
    photoOffset - 200


btnLink : List Style
btnLink =
    [ padding (px 10)
    , border3 (px 1) solid gray
    , property "user-select" "none"
    , cursor pointer
    , color black
    , hover [ borderColor ghoneimRed, color ghoneimRed ]
    , textDecoration none
    ]


homepage : Html Msg
homepage =
    main_
        [ css
            [ backgroundColor (rgb 255 255 255)
            , flex (int 1)
            , displayFlex
            , flexDirection column
            , alignItems center
            , textAlign center
            , marginTop (px (toFloat homepageOffset))
            ]
        ]
        [ h1
            [ css [ textAlign center, marginBottom (px 0) ] ]
            [ text "Ahmed Ghoneim"
            ]
        , h3
            [ css [ marginTop (px 5) ] ]
            [ text "Software Engineer" ]
        , section
            []
            [ div
                [ css
                    [ displayFlex
                    , alignItems center
                    , justifyContent spaceBetween
                    , minWidth (px 250)
                    , padding (px 10)
                    , marginBottom (px 50)
                    ]
                ]
                [ a
                    [ css btnLink
                    , onClick ViewResume
                    , title "View Resume in Browser"
                    ]
                    [ text "View Resume" ]
                , a [ css btnLink, title "" ] [ text "Download PDF" ]
                ]
            , div
                []
                [ a
                    [ css btnLink
                    , href "https://github.com/aghoneim92/homepage"
                    , target "_blank"
                    ]
                    [ text "View Source on Github" ]
                ]
            ]
        , footer
            [ css
                [ marginTop auto
                , padding2 (px 10) (px 0)
                , backgroundColor ghoneimRed
                , color (rgb 255 255 255)
                , width (pct 100)
                , displayFlex
                , alignItems center
                , justifyContent center
                ]
            ]
            [ img
                [ src "img/github.svg"
                , css [ width (px 32), height (px 32) ]
                ]
                []
            , a
                [ class "github-button"
                , href "https://github.com/aghoneim92"
                , target "_blank"
                , title "Github Profile"
                , css
                    [ marginLeft (px 10)
                    , color (rgb 255 255 255)
                    , textDecoration none
                    ]
                ]
                [ text "@aghoneim92" ]
            ]
        ]
