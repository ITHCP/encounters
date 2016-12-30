module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Model exposing (..)
import Template exposing (..)

import Messages exposing (..)
import Commands exposing (..)


-- VIEW FUNCTIONS #######################################

patient : Model -> Html Msg
patient model =
    let
        patient = model.patient
        patientName =
            ((toString patient.nameFamily) ++ ", " ++ (toString patient.nameGiven))
                |> String.toUpper 
                |> text     
    in
        h2 [ class "lead" ] 
            [ patientName ] 

alertMessage : Maybe String -> Html Msg
alertMessage alertMessage = 
    case alertMessage of
        Just message ->
            div [ class "alert" ]
                [ span [ class "close", onClick CloseAlert ] [ text "X" ]
                , text message 
                ]
        Nothing ->
            text ""

-- VIEW #######################################

view : Model -> Html Msg
view model = 
    div [ class "content" ]
        [ viewHeader "Patient Encounter" 
        , patient model
        , alertMessage model.alertMessage
        , div [ class "debug" ] [ text (toString model) ]
        , viewFooter
        ]
