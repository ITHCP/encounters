module Encounters exposing (..)
import Html exposing (..)

import Server exposing (..)
import Model exposing (..)
import Messages exposing (..)
import Updates exposing (..)
import View exposing (..)

-- MAIN #######################################

main : Program Never Model Msg
main =
    Html.program
        { init = ( initialModel, getPatient )
        , view = view
        , update = update
        , subscriptions = ( \_ -> Sub.none )
        }
