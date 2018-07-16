# API-Assessment
A simple GET call and assertions with Robot Framework
Externalised Data via a csv file.

Tools/Software needed to run automation code:
  -Python 2.7..(pip should be installed as well with installation)-https://www.python.org/downloads/release/python-2715/
  -Pycharm (Community Edition)-https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=windows&code=PCC
  -Robot Framework(pip install robotframework)-https://github.com/robotframework/robotframework/blob/master/INSTALL.rst 
  -External Libraries  - RequestsLibrary-https://github.com/bulkan/robotframework-requests
                       - CSVLibrary-https://github.com/s4int/robotframework-CSVLibrary
                      

Structure of Code:
 - All data is externalised via a csv data sheet.
 - This csv file is stored in the "Data" folder and is named "AssessmentE2E.csv".
 - The data(rows in file) controls the amount of tests.
 - The code is split between different classes for scalability eg. API_Calls.robot - Contains all code to do the API call.
                                                                   Asserts.robot   - Contains all assertions.
                                                                   Common.robot    - Contains all common keywords/functions used.
                                                                   Initialise.robot- Contains all code needed for inilization/setup before                                                                                      script can run.
 - The code is run by running the test file, Assessment_E2E.robot.
 - The command used to run the Assessment_E2E is saved within "runAssessmentE2E.bat" for Mac and Windows.
 - All results of tests run are written to the results folder whick contains the Log, Output and Report.
 
