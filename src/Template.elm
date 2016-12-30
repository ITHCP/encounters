module Template exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

viewHeader : String -> Html msg
viewHeader title =
    header []
        [ h1 [] [ text title ] ]

viewFooter : Html msg
viewFooter =
    footer []
        [ a [ href "http://healthexchange.io" ]
            [ text "Encounters App" ]
        ]
