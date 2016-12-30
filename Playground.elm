module Playground exposing (..) 

import Config exposing (..)

import Http
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Decode exposing (..)


-- ###################################################
-- ####  MODEL  ######################################
-- ###################################################

type alias Model = 
    { 
        json : String
    }

initialModel : Model
initialModel = 
    { 
        json = ""
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
                            _ = Debug.log json
                        in
                            ({ model | json = jsonData }, Cmd.none)
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


json : String
json = 
    """ 
    { "phrase": "Hello, World!" } 
    """ 

decoder : Decoder String
decoder = 
    field "phrase" string 

decodingResult : Result String String
decodingResult = 
    decodeString decoder json


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