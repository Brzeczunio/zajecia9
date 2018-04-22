*** Settings ***
Library  Name.py
Library  SSHLibrary
Suite Setup  Open Connection And Log In
Suite Teardown  Close All Connections

*** Variables ***
${NAME2}  Hakunamatatata
${REMOTE_HOST}  localhost
${REMOTE_USERNAME}  tester01
${REMOTE_PASSWORD}  U8fsbaqd/

*** Test Cases ***
My test
  Log to console  ${NAME2}

My test2
  My log  Lorem ipsum

My test3
  My log2 Lorem ipsum

My test4
  ${Result}=  My Name
  Should be equal  ${Result}  Damian

SHHTest
  ${rc}=  Execute command  uname -a
  Log to console  ${rc}

*** Keywords ***
My log
  [Arguments]  ${Variable}
  Log to console  ${Variable}

My log2 ${Variable}
  Log to console  ${Variable}

Open Connection And Log In
  Open Connection  ${REMOTE_HOST}
  Login  ${REMOTE_USERNAME}  ${REMOTE_PASSWORD}
