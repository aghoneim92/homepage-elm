module Pages.Home.Home exposing (homepage)

import Css exposing (Color, Style, alignItems, auto, backgroundColor, border3, borderColor, bottom, center, color, column, cursor, displayFlex, em, flex, flexDirection, height, hover, int, justifyContent, marginBottom, marginLeft, marginTop, maxWidth, minWidth, none, overflow, padding, padding2, pct, pointer, property, px, relative, rgb, solid, spaceBetween, textAlign, textDecoration, transform, translateY, visible, width)
import Css.Colors exposing (black, gray, white)
import Data.Msg exposing (Msg(ViewResume))
import Html.Styled
    exposing
        ( Html
        , a
        , div
        , footer
        , h1
        , h3
        , header
        , img
        , main_
        , nav
        , section
        , text
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
import Pages.Home.Photo exposing (photo, photoOffset)
import Theme exposing (ghoneimRed)


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


headerHeight : Float
headerHeight =
    7.0


homepage : Html Msg
homepage =
    main_
        [ css
            [ backgroundColor white
            , flex (int 1)
            , displayFlex
            , flexDirection column
            , alignItems center
            , textAlign center
            ]
        ]
        [ header
            [ css
                [ backgroundColor ghoneimRed
                , height (em headerHeight)
                , displayFlex
                , justifyContent center
                , overflow visible
                , width (pct 100)
                ]
            ]
            []
        , nav [] []
        , div
            [ css
                [ displayFlex
                , width (pct 100)
                , flex (int 1)
                , flexDirection column
                , alignItems center
                , transform (translateY (em -4))
                ]
            ]
            [ photo
            , div
                [ css
                    [ flexDirection column
                    , flex (int 1)
                    , marginTop (em 1.0)
                    ]
                ]
                [ h1
                    [ css
                        [ textAlign center
                        , marginBottom (px 0)
                        ]
                    ]
                    [ text "Ahmed Ghoneim"
                    ]
                , h3
                    [ css [ marginTop (px 5) ] ]
                    [ text "Software Engineer" ]
                , section
                    [ css [ flex (int 1) ] ]
                    [ section
                        [ css
                            [ displayFlex
                            , alignItems center
                            , justifyContent spaceBetween
                            , maxWidth (em (250.0 / 15.0))
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
                    , section
                        []
                        [ a
                            [ css btnLink
                            , href "https://github.com/aghoneim92/homepage"
                            , target "_blank"
                            ]
                            [ text "View Source on Github" ]
                        ]
                    ]
                ]
            ]
        , footer
            [ css
                [ marginTop auto
                , padding2 (px 10) (px 0)
                , backgroundColor ghoneimRed
                , color (rgb 255 255 255)
                , width (pct 100)
                , height (em 3.0)
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
