*** Settings ***
Library  RequestsLibrary
Library  BuiltIn
Library  String

Resource  ../API_Testing/Common.robot

*** Keywords ***

Carbon_Credits_Positive_Asserts
    [Arguments]  ${json}  ${test_data}

    #Convert response to JSON Dictionary
    ${json} =  evaluate  json.loads('''${json}''')  json

    #Retrieve Promotions Gallery Description
    ${desc} =  get from dictionary  ${json["Promotions"][1]}  Description

    #Data manipulation - to bypass user input errors
    ${canRelist_result} =  convert to string  ${json["CanRelist"]}
    ${canRelist_result} =  convert to lowercase  ${canRelist_result}
    ${canRelist_data} =  convert to lowercase  ${test_data["CanRelist"]}

    #Asserts
    dictionary should contain item  ${json}  Name  ${test_data["Name"]}                     #Name Assertion
    should be equal as strings  ${canRelist_result}  ${canRelist_data}                      #CanRelist Assertion
    should contain  ${json["Promotions"][1]["Description"]}  ${test_data["PromoGalleryDesc"]}              #Promotions Gallery Description Assertion

    log to console  --Carbon Credits Positive Asserts Complete


Carbon_Credits_Negative_Asserts
    [Arguments]  ${json}  ${test_data}

    should contain  ${json}  ${test_data["ErrorMessage"]}
    log  ${json}
    log to console  --Carbon Credits Negative Asserts Complete

#--------------------------------------------------------------------