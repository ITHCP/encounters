-- TO DO: Where to decode Json for Patient Model?

module Playground exposing (..) 

import Config exposing (..)

import Http
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Decode as Decode exposing (Decoder, field, succeed)


-- ###################################################
-- ####  MODEL  ######################################
-- ###################################################

type alias Model = 
    { 
        json : String
        , patient : Patient
    }

type alias Patient = 
    { 
        id : Int
    }    

initialModel : Model
initialModel = 
    { 
        patient = initialPatient        
        , json = ""

    }

initialPatient : Patient
initialPatient = 
    { 
        id = 0
    }    

-- ###################################################
-- ####  UPDATE  #####################################   
-- ###################################################

type Msg 
    = LoadJson (Result Http.Error String)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of    
        LoadJson (result) ->
            case result of 
                    Ok jsonData ->
                        let
                            _ = Debug.log jsonData
                        in
                            ({ model | json = jsonData }, Cmd.none)
                            -- ({ model | json = jsonData }, Cmd.none)
                    Err error ->
                        let
                            _ = Debug.log "ERROR: " error
                        in
                            (model, Cmd.none)  

getJson : Cmd Msg
getJson =
    patientUrl
        |> Http.getString
        |> Http.send LoadJson

decoder : Decoder String
decoder = 
    field "phrase" Decode.string 

decodePatient : Decoder Patient
decodePatient = 
    Decode.map Patient
        (field "id" Decode.int)


-- ###################################################
-- ####  VIEW  #######################################
-- ###################################################

view : Model -> Html Msg
view model = 
    div [ class "debug" ] [ text (toString model) ]


-- ###################################################
-- ####  MAIN  #######################################
-- ###################################################

main : Program Never Model Msg
main =
    Html.program
        { init = ( initialModel, getJson )
        , view = view
        , update = update
        , subscriptions = ( \_ -> Sub.none )
        }

-- ###################################################
-- ####  NOTES  ######################################
-- ###################################################
--
-- elm-live Playground.elm --open --output=playground.js
--