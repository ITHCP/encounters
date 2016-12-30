module Messages exposing (..)

import Http

import Model exposing (..)

type Msg 
    = LoadPatient (Result Http.Error String)
    | CloseAlert  