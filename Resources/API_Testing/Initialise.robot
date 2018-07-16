*** Settings ***
Library  CSVLibrary

Resource  ../API_Testing/Common.robot

Documentation    Class used to read test data from CSV file and Initialise environment


*** Keywords ***

#Read data
Read test data from CSV
    #Read the CSV and load data into a Dictionary
    @{test_data_dict}=  read csv file to associative  ${EXECDIR}/Data/AssessmentE2E_Data.csv

    #Set Dictionary as a suite variable
    set suite variable  @{test_data}  @{test_data_dict}

#Set Evironment Variables
Initialise_Environment
    [Arguments]  ${data}
    #Set the environment the test will be run on
    ${Env} =  convert to lower case  ${data["TestEnvironment"]}

    #Logic added for the ability to run on different environments depending on data provided
    run keyword if  '${Env}' == 'dev'  SetDev_Environment

SetDev_Environment
    set suite variable  ${S_URL_Srv}  api.tmsandbox.co.nz
    set suite variable  ${S_URL_Env}  /v1/Categories/6327/Details.json
    set suite variable  ${S_SESSION_URI}  https://${S_URL_Srv}

SetUat_Environment
#TODO Add the rest of the environments
