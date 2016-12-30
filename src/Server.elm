module Server exposing (..)

import Http
import Json.Decode as Decode exposing (Decoder, field, succeed)
import Json.Encode as Encode

import Config exposing (..)
import Commands exposing (..)
import Model exposing (..)
import Messages exposing (..)

-- HTTP: GET #######################################

getPatient : Cmd Msg
getPatient =
    patientUrl
        |> Http.getString
        |> Http.send LoadPatient

-- DECODERS #######################################

decodePatient : Decoder Patient
decodePatient = 
    Decode.map3 Patient
        (field "id" Decode.string)
        (field "nameFamily" Decode.string)
        (field "nameGiven" Decode.string)