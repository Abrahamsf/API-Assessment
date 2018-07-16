*** Settings ***
Library  RequestsLibrary
Library  BuiltIn
Library  Collections

Resource  ../API_Testing/Asserts.robot
Resource  ../API_Testing/Common.robot

*** Keywords ***
Carbon_Credits
    [Arguments]  ${test_data}

    #Set EndPoint
    common.Set_Params  catalogue=false

    #Create session
    common.Create_Request_Session  ${S_SESSION_URI}  #${headers}

    #Send Request
    ${Response} =  common.Send_GET_Request  ${S_URL_Env}  ${S_PARAMS}

    #Check response
    run keyword if  '${Response.status_code}' == '200'  Asserts.Carbon_Credits_Positive_Asserts  ${Response.text}  ${test_data}
    ...  ELSE  Asserts.Carbon_Credits_Negative_Asserts  ${Response.text}  ${test_data}