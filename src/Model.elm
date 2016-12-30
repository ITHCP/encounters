module Model exposing (..)

-- MODEL ALIAS #######################################

type alias Model = 
    { name : String
    , alertMessage : Maybe String
    , patient : Patient
    }

type alias Patient = 
    { id : String
    , nameGiven : String
    , nameFamily : String
    }

-- MODEL #######################################

initialModel : Model
initialModel = 
    { name = ""
    , patient = initialPatient
    , alertMessage = Nothing -- Just "Oops!"
    }

initialPatient : Patient
initialPatient =
    { id = "None"
    , nameGiven = "None"
    , nameFamily = "None"
    }
