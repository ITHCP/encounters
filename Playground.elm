module Playground exposing (..) 

import Config exposing (..)
import Server exposing (..)

import Http
import Html exposing (..) 
import Json.Decode exposing (..) 

json = 
    """ 
    { "phrase": "Hello, World!" } 
    """ 

decoder = 
    field "phrase" string 

decodingResult = 
    decodeString decoder json
    
view result = 
    case result of 
        Ok value -> 
            text (toString value) 
            
        Err err -> 
            text (toString err) 
            
main = view decodingResult

-- elm-live Playground.elm --open --output=playground.js