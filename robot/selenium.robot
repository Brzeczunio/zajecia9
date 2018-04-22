*** Settings ***
Library  Selenium2Library
Suite Setup  Open Browser To Login Page
Suite Teardown  Close Browser

*** Variables ***
${WEBSITE}  http://www.poczta.wp.pl/
${LOGIN}  testerwsb_t1
${PASSWORD}  adam1234

*** Test Cases ***
Go To Website
  Input Text  //*[@id='login']  ${LOGIN}
  Input Password  //*[@id='password']  ${PASSWORD}
  Click Button  //*[@id='btnSubmit']
  ${TEXT}=  Get Text  //*[@title='Odebrane']
  Should be equal  ${TEXT}  Odebrane

*** Keywords ***
Open Browser To Login Page
  Open Browser  ${WEBSITE}
  Maximize Browser Window
