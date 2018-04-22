*** Settings ***
Library  Selenium2Library
Test Setup  Open Browser To Login Page
Test Teardown  Close Browser

*** Variables ***
${WEBSITE}  http://www.poczta.wp.pl/
${LOGIN}  testerwsb_t1
${PASSWORD}  adam1234
${WRONG_LOGIN}  adam123576
${WRONG_PASSWORD}  asd

*** Test Cases ***
Go To Website With Valid Login And Password
  Input Text  //*[@id='login']  ${LOGIN}
  Input Password  //*[@id='password']  ${PASSWORD}
  Click Button  //*[@id='btnSubmit']
  ${TEXT}=  Get Text  //*[@title='Odebrane']
  Should be equal  ${TEXT}  Odebrane

Go To Website With Valid Login And Wrong Password
  Input Text  //*[@id='login']  ${LOGIN}
  Input Password  //*[@id='password']  ${WRONG_PASSWORD}
  Click Button  //*[@id='btnSubmit']
  ${TEXT}=  Get Text  //*[@class='Error-msg']
  Should be equal  ${TEXT}  Niestety podany login lub hasło jest błędne.

Go To Website With Wrong Login And Valid Password
  Input Text  //*[@id='login']  ${WRONG_LOGIN}
  Input Password  //*[@id='password']  ${PASSWORD}
  Click Button  //*[@id='btnSubmit']
  ${TEXT}=  Get Text  //*[@class='szary error']/h1
  Should be equal  ${TEXT}  Niestety podany login lub hasło jest błędne (sprawdź czy nie jest wciśnięty klawisz CapsLock)

*** Keywords ***
Open Browser To Login Page
  Open Browser  ${WEBSITE}
  Maximize Browser Window
