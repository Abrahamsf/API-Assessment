*** Settings ***
#Utilise Libraries
Library  String
Library  RequestsLibrary
Library  OperatingSystem

#Utilise different classes within solution
Resource  ../Resources/API_Testing/API_Calls.robot
Resource  ../Resources/API_Testing/Common.robot
Resource  ../Resources/API_Testing/Initialise.robot

Suite Setup  Initialise.Read test data from CSV
Suite Teardown  Delete All Sessions

*** Test Cases ***
Run_Assessment_E2E
    #Loop through external dataset
    :FOR    ${DATA_ROW}    IN    @{test_data}
     \   set suite variable  ${D_DATASET}  ${DATA_ROW}
     \   Initialise_Environment  ${D_DATASET}
     \   run keyword if  '${D_DATASET["Execute"]}' == 'yes'  Assessment_E2E

*** Keywords ***
Assessment_E2E
    Carbon Credits

Carbon Credits
    API_Calls.Carbon_Credits  ${D_DATASET}
