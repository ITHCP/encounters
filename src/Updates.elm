module Updates exposing (..)

import Http

import Model exposing (..)
import Messages exposing (..)
import Server exposing (..)      

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
--        NewEncounter ->
--            ( model, getPatient )
        
        LoadPatient (result) ->
            case result of 
                    Ok patientData ->
                        let
                          _ = Debug.log "It worked!" patientData
                        in
                          (model, Cmd.none)

                    Err error ->
                        let
                            _ = Debug.log "Oops!" error
                            errorMessage = 
                                case error of
                                    Http.NetworkError ->
                                        "Server Unreachable"
                                    Http.BadStatus response ->
                                        (toString response.status)
                                    Http.BadPayload message _ ->
                                        "Decoding failed: " ++ message
                                    _ ->
                                        (toString error)
                        in
                            ( { model | alertMessage = Just errorMessage }, Cmd.none)           

        CloseAlert ->
            ( { model | alertMessage = Nothing }, Cmd.none)
