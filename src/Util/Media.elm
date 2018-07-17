module Util.Media exposing (large, medium, small)

import Css exposing (px)
import Css.Media exposing (MediaQuery, all, maxWidth, minWidth)


small : MediaQuery
small =
    all [ maxWidth (px 500) ]


medium : MediaQuery
medium =
    all [ maxWidth (px 1000) ]


large : MediaQuery
large =
    all [ minWidth (px 1000) ]
