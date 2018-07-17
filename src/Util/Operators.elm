module Util.Operators exposing ((@))

import List exposing (concat)


(@) : List a -> List a -> List a
(@) x y =
    concat [ x, y ]
