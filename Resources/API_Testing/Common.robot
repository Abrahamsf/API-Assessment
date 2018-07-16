*** Settings ***
Library  RequestsLibrary
Library  BuiltIn
Library  Collections
Library  DateTime

*** Variables ***

#Globals (Uppercase)
${S_PARAMS}

#Environment
${S_URL_Env}
${S_URL_Srv}
${S_SESSION_URI}

#Dictionaries
@{test_data}
@{D_DATA}
@{D_DATASET}

*** Keywords ***
####################################################################  SETs  ####################################################################
Set_Params
    [Arguments]  ${params}
    set suite variable  ${S_PARAMS}  ${params}

####################################################################  GETs  ####################################################################
Get_Params
    [Return]  ${S_PARAMS}


####################################################################  HEADERS  ####################################################################
#No headers needed for GET request

####################################################################  DATA  ####################################################################
##No data needed for GET request

####################################################################  REQUEST  ####################################################################

Create_Request_Session
    [Arguments]  ${session_uri}

    Create Session  httpbin  ${session_uri}  verify=True


Send_GET_Request
    [Arguments]  ${env}  ${params}

    ${r} =  get request  httpbin  ${env}  params=${params}
    delete all sessions
    [Return]  ${r}