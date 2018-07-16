module Resume exposing (resume)

import Css exposing (Style, absolute, alignItems, auto, backgroundColor, block, border3, borderBottom, borderBottom3, borderRadius, center, column, display, displayFlex, flex, flex2, flex3, flexDirection, flexGrow, flexStart, float, fontWeight, height, int, justifyContent, left, margin, margin2, marginBottom, marginLeft, marginRight, marginTop, maxWidth, minHeight, minWidth, none, normal, num, padding, padding2, paddingBottom, paddingTop, pct, position, px, rgb, rgba, right, row, rowReverse, solid, spaceBetween, textAlign, top, transparent, underline, vh, width, zIndex)
import Css.Colors exposing (gray)
import Css.Foreign exposing (global, media)
import Css.Media as Media exposing (all, only, print, withMedia)
import Data exposing (Job, jobs)
import Date
    exposing
        ( Date
        , Month(Apr, Aug, Dec, Feb, Jan, Jul, Jun, Mar, May, Nov, Oct, Sep)
        , year
        )
import Html.Styled
    exposing
        ( Html
        , a
        , address
        , aside
        , br
        , canvas
        , div
        , em
        , figcaption
        , figure
        , footer
        , h1
        , h2
        , h3
        , h4
        , header
        , li
        , main_
        , section
        , table
        , tbody
        , td
        , text
        , time
        , tr
        , ul
        , wbr
        )
import Html.Styled.Attributes exposing (css, datetime, href, id, style, title)
import List exposing (concat, filter, head, indexedMap, map)
import Model exposing (Model)
import Msg exposing (Msg)
import Theme exposing (ghoneimRed)
import Transit exposing (Transition)
import TransitStyle exposing (fade)


resume : Model -> Html Msg
resume model =
    div
        [ css
            [ position absolute
            , backgroundColor (rgb 255 255 255)
            , zIndex (int 1)
            , top (px 0)
            , left (px 0)
            , right (px 0)
            , padding (px 20)
            , paddingTop (px 0)
            , minHeight (pct 100)
            , displayFlex
            , flexDirection column
            , alignItems center
            , justifyContent flexStart
            ]
        , style (fade model.transition)
        ]
        [ header
            []
            [ h1
                []
                [ text "Resume"
                ]
            , em
                [ css
                    [ display none
                    , Media.withMedia [ only print [] ] [ display block ]
                    ]
                ]
                [ text "View web version at "
                , a
                    [ href "https://ghoneim.de" ]
                    [ text "ghoneim.de" ]
                ]
            ]
        , main_
            [ css
                [ maxWidth (pct 100)
                , withMedia mediumPlus [ minWidth (px 500) ]
                , withMedia large [ maxWidth (px 800) ]
                ]
            ]
            [ basicInfo, workHistory model, professionalExperience, contact ]
        ]


listItem : List (Html Msg) -> Html Msg
listItem =
    li [ css [ marginBottom (px 20) ] ]


cell : List (Html Msg) -> Html Msg
cell =
    td [ css [ padding (px 10) ] ]


sectionTitle =
    h2
        [ css [ borderBottom3 (px 3.5) solid ghoneimRed ] ]


resumeSectionStyle =
    css
        [ displayFlex
        , flexDirection column
        ]


resumeSection =
    section [ resumeSectionStyle ]


basicInfo : Html Msg
basicInfo =
    resumeSection
        [ sectionTitle
            [ text "Basic Info" ]
        , table []
            [ tbody []
                [ tr []
                    [ cell [ text "Name" ]
                    , cell [ text "Ahmed Ghoneim" ]
                    ]
                , tr []
                    [ cell [ text "Born" ]
                    , cell
                        [ time
                            [ datetime "1992-09-30" ]
                            [ text "30 September, 1992" ]
                        , text " in Alexandria, Egypt"
                        ]
                    ]
                , tr []
                    [ cell
                        [ text "Occupation" ]
                    , cell
                        [ text "Software Developer (fulltime) at "
                        , a [ href "https://friday.de" ] [ text "FRIDAY" ]
                        ]
                    ]
                , tr []
                    [ cell [ text "Country of Residence" ]
                    , cell [ text "Germany" ]
                    ]
                , tr []
                    [ cell [ text "Degree" ]
                    , cell
                        [ text "BSc Computer Engineering, "
                        , wbr [] []
                        , text "Alexandria University"
                        ]
                    ]
                ]
            ]
        ]


professionalExperience : Html Msg
professionalExperience =
    resumeSection
        [ sectionTitle [ text "Professional Experience" ]
        , ul
            [ css [ marginTop (px 0) ] ]
            [ listItem
                [ text "Backend: Spring Framework, PHP" ]
            , listItem
                [ text "Frontend: Javascript, Typescript, React, jQuery" ]
            , listItem
                [ text "Mobile: iOS, Android, React Native" ]
            ]
        ]


dateToString y m d =
    y ++ "-" ++ m ++ "-" ++ d


large =
    [ all [ Media.minWidth (px 1000) ] ]


mediumPlus =
    [ all [ Media.minWidth (px 500) ] ]


monthNumbers =
    [ ( Jan, 0 )
    , ( Feb, 1 )
    , ( Mar, 2 )
    , ( Apr, 3 )
    , ( May, 4 )
    , ( Jun, 5 )
    , ( Jul, 6 )
    , ( Aug, 7 )
    , ( Sep, 8 )
    , ( Oct, 9 )
    , ( Nov, 10 )
    , ( Dec, 11 )
    ]


monthNumber : Date -> Int
monthNumber date =
    let
        month =
            Date.month date

        result =
            filter (\( m, number ) -> month == m) monthNumbers |> head
    in
    case result of
        Just ( _, number ) ->
            number

        Nothing ->
            0


(@) : List a -> List a -> List a
(@) x y =
    concat [ x, y ]


yearDifference : Maybe Date -> String -> String -> Float
yearDifference now from to =
    let
        n =
            case now of
                Just date ->
                    Just date

                Nothing ->
                    Result.toMaybe (Date.fromString "31 December 2018")

        fromDate =
            Date.fromString ("01 " ++ from)

        toDate =
            case ( n, to ) of
                ( Just date, "Present" ) ->
                    Just date

                ( _, t ) ->
                    Result.toMaybe (Date.fromString ("01" ++ t))

        ( fromMonth, fromYear ) =
            case fromDate of
                Ok date ->
                    ( monthNumber date, year date )

                Err err ->
                    ( 1, 2018 )

        ( toMonth, toYear ) =
            case toDate of
                Just date ->
                    ( monthNumber date, year date )

                Nothing ->
                    ( 1, 2019 )

        yearDifference : Float
        yearDifference =
            toFloat (toYear - fromYear)

        monthDifference : Float
        monthDifference =
            toFloat (toMonth - fromMonth) / 12.0

        actualDifference : Float
        actualDifference =
            yearDifference + monthDifference

        scaledDifference =
            if actualDifference < 1.0 then
                actualDifference * 2.0
            else if actualDifference >= 2.0 then
                actualDifference / 2
            else
                actualDifference
    in
    scaledDifference


technologiesSection technologies =
    section
        []
        [ h4
            []
            [ text "Technologies" ]
        , ul
            []
            (map
                (\t -> listItem [ text t ])
                technologies
            )
        ]


completeDiff : Float
completeDiff =
    5


job : Maybe Date -> Job -> Html Msg
job now { company, position, from, to, technologies } =
    let
        yearDiff =
            yearDifference now from to
    in
    section
        [ css
            [ width (px 250)
            , flex3 (num 1) (num 1) (pct ((yearDiff * 100) / completeDiff))
            , displayFlex
            , flexDirection column
            , justifyContent center
            ]
        ]
        [ section
            [ css
                [ padding2 (px 0) (px 20)
                , border3 (px 1) solid gray
                , borderRadius (px 5)
                , margin (px 10)
                , withMedia mediumPlus [ marginLeft (px 10) ]
                ]
            ]
            [ h3 [ css [ marginBottom (px 1) ] ] [ text company ]
            , h4
                [ css [ marginTop (px 5), fontWeight normal ] ]
                [ em [] [ text position ] ]
            , technologiesSection technologies
            ]
        ]


isEven n =
    (n % 2) == 0


isOdd n =
    (n % 2) == 1


fst : ( a, b ) -> a
fst ( a, b ) =
    a


snd : ( a, b ) -> b
snd ( a, b ) =
    b


verticalLine : Html Msg
verticalLine =
    div
        [ css
            [ border3 (px 1) solid ghoneimRed
            , height (pct 100)
            ]
        ]
        []


jobTimes : Maybe Date -> Job -> Html Msg
jobTimes now { from, to } =
    section
        [ css
            [ width (px 100)
            , marginLeft (px 10)
            , padding2 (px 10) (px 0)
            , displayFlex
            , flex3
                (num 1)
                (num 1)
                (pct (yearDifference now from to * 100 / completeDiff))
            , flexDirection column
            , justifyContent spaceBetween
            ]
        ]
        [ figcaption []
            [ if to == "Present" then
                text to
              else
                time
                    [ datetime to ]
                    [ text to ]
            ]
        , figcaption []
            [ time
                [ datetime from ]
                [ text from ]
            ]
        ]


spacerDiv : Maybe Date -> Job -> Html msg
spacerDiv now { from, to } =
    div
        [ css
            [ flex3 (num 1) (num 1) (pct (yearDifference now from to * 100 / completeDiff))
            ]
        ]
        []


timeSpacerDiv : Maybe Date -> Job -> Html msg
timeSpacerDiv now { from, to } =
    div
        [ css
            [ flex3 (num 1) (num 1) (pct (yearDifference now from to * 100 / completeDiff))
            ]
        ]
        []


type alias Component model msg =
    model -> Html msg


type alias ComponentPredicate model =
    ( Int, model ) -> Bool


type alias IndexPair a =
    ( Int, a )


branch :
    Component a msg
    -> Component a msg
    -> ComponentPredicate a
    -> IndexPair a
    -> Html msg
branch compA compB predicate ( index, model ) =
    if predicate ( index, model ) then
        compA model
    else
        compB model


firstIsEven : IndexPair a -> Bool
firstIsEven =
    fst >> isEven


firstIsOdd : IndexPair a -> Bool
firstIsOdd =
    fst >> isOdd


createJobWithSpacer :
    Component Job Msg
    -> Component Job Msg
    -> ComponentPredicate Job
    -> IndexPair Job
    -> Html Msg
createJobWithSpacer createJob createSpacer =
    branch createJob createSpacer


evenJobTimes : Maybe Date -> IndexPair Job -> Html Msg
evenJobTimes now ( index, job ) =
    if isEven index then
        jobTimes now job
    else
        timeSpacerDiv now job


oddJobTimes : Maybe Date -> IndexPair Job -> Html Msg
oddJobTimes now ( index, job ) =
    if isOdd index then
        jobTimes now job
    else
        timeSpacerDiv now job


jobsSection : List (Html Msg) -> Html Msg
jobsSection =
    section [ css [ displayFlex, flexDirection column, height (pct 100) ] ]


workHistory : Model -> Html Msg
workHistory { seePreviousJobs, now } =
    let
        createJob =
            job now

        createSpacer =
            spacerDiv now

        jobsWithIndex =
            indexedMap (\index job -> ( index, job )) jobs

        evenTimes =
            map (evenJobTimes now) jobsWithIndex

        oddTimes =
            map (oddJobTimes now) jobsWithIndex

        jobsWithSpacer =
            createJobWithSpacer createJob createSpacer

        evenJobs =
            map (jobsWithSpacer firstIsEven) jobsWithIndex

        oddJobs =
            map (jobsWithSpacer firstIsOdd) jobsWithIndex
    in
    resumeSection
        [ sectionTitle [ text "Work History" ]
        , figure
            [ css
                [ displayFlex
                , flexDirection row
                , margin (px 0)
                , height (vh 220)
                , withMedia
                    [ all [ Media.maxWidth (px 500) ] ]
                    [ marginLeft (px 10) ]
                ]
            ]
            [ div [ css [ paddingTop (px 20) ] ] [ jobsSection evenJobs ]
            , aside
                [ css
                    [ displayFlex
                    , flexDirection column
                    , justifyContent spaceBetween
                    , paddingTop (px 20)
                    ]
                ]
                evenTimes
            , verticalLine
            , aside
                [ css
                    [ displayFlex
                    , flexDirection column
                    , justifyContent spaceBetween
                    , paddingTop (px 20)
                    ]
                ]
                oddTimes
            , div [ css [ paddingTop (px 20) ] ] [ jobsSection oddJobs ]
            ]
        ]


contact : Html Msg
contact =
    footer
        []
        [ h3 [ css [ borderBottom3 (px 1) solid ghoneimRed ] ] [ text "Contact" ]
        , table
            [ css [ minWidth (px 300) ] ]
            [ tbody
                []
                [ tr []
                    [ td [] [ text "Email" ]
                    , td
                        []
                        [ a
                            [ href "mailto:ahmed@ghoneim.de" ]
                            [ text "ahmed@ghoneim.de" ]
                        ]
                    ]
                , tr
                    []
                    [ td [] [ text "Tel." ]
                    , td
                        []
                        [ a
                            [ href "tel:+491728495273" ]
                            [ text "+49 172 849 5273" ]
                        ]
                    ]
                , tr
                    []
                    [ td [] [ text "Address" ]
                    , td
                        []
                        [ address
                            []
                            [ text "Fischerinsel 13"
                            , br [] []
                            , text "10179 Berlin"
                            , br [] []
                            , text "Germany"
                            ]
                        ]
                    ]
                ]
            ]
        ]
