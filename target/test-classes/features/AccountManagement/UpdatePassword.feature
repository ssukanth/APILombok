@AcmUpdate_Regression @updatePassword_Regression
Feature: Testing update customer's Password API available for Customer - Orchestration Micro Services
  As a tester, I should be able to call update customer's Password API to update the password - Micro service exposed from the Orchestration layer.

  @acm_smoke @AcmUpdate_smoke @updatePassword_smoke
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using valid input parameters (headers and body ) and expect status code 200 OK <scenarioName>
  Step-1: Call Create Account API  --> Get guid,objectId, email
  Step-2: Call Generate OTP        --> send guid,objectId, email get confirmation
  Step-3: Call get OTP API 		--> send guid,objectId and get OTP
  Step-4: Call update Password API --> send guid,objectId, newPassword and verificationCode(OTP)
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLName" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server must returns the ResponseCode "ORCH-0000" and Description "Account Created Successfully"
    And the server should return the guid objectId FirstName lastName EmailAddress PhoneNumber and no address

    Given Tester calls the Generate OTP API
    When The Tester uses the valid headers to Generate OTP API
    And Tester uses the valid body parameter to Generate OTP API
    And Tester calls the POST service
    Then The server returns the Status code "200"

    Given Tester calls the Get OTP API
    When The Tester uses the valid headers to Get OTP API
    And Tester calls the GET service
    Then The server returns the Status code "200"

    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the valid body parameter guid objectId verificationCode and password "<newPassword>"
    And Tester calls the PUT service
    Then The server returns the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName      | basePath             | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | newPassword  | statusCode | responseCode | description                   |
      | with T - Customer | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@123 | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - Customer | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@123 | 200        | ORCH-0000    | Request Executed Successfully |

  @updatePassword_positive
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using valid input parameters (headers and body ) and expect status code 200 OK <scenarioName>
  Step-1: Call Create Account API  --> Get guid,objectId, email
  Step-2: Call Generate OTP        --> send guid,objectId, email get confirmation
  Step-3: Call get OTP API 		--> send guid,objectId and get OTP
  Step-4: Call update Password API --> send guid,objectId, newPassword and verificationCode(OTP)
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLName" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server must returns the ResponseCode "ORCH-0000" and Description "Account Created Successfully"
    And the server should return the guid objectId FirstName lastName EmailAddress PhoneNumber and no address

    Given Tester calls the Generate OTP API
    When The Tester uses the valid headers to Generate OTP API
    And Tester uses the valid body parameter to Generate OTP API
    And Tester calls the POST service
    Then The server returns the Status code "200"

    Given Tester calls the Get OTP API
    When The Tester uses the valid headers to Get OTP API
    And Tester calls the GET service
    Then The server returns the Status code "200"

    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the valid body parameter guid objectId verificationCode and password "<newPassword>"
    And Tester calls the PUT service
    Then The server returns the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                                                                     | basePath             | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | newPassword      | statusCode | responseCode | description                   |
      | with T - ONEAPP                                                                  | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@123     | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - LER                                                                     | /v1/account/password | application/json | T      | LER      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@123     | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - TRC                                                                     | /v1/account/password | application/json | T      | TRC      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@123     | 200        | ORCH-0000    | Request Executed Successfully |

      | with T - Password 8 char                                                         | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo#1         | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - Password 9 char                                                         | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - Password 10 char                                                        | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - Password 11 char                                                        | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - Password 12 char                                                        | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - Password 13 char                                                        | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - Password 14 char                                                        | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - Password 15 char                                                        | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - Password 16 char                                                        | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PasswordWith16Ch | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - for Password with uppercase letter, lowercase letter, number 0          | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password0        | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - for Password with uppercase letter, lowercase letter, number 9          | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PaSymbolsOly_+-= | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - for Password with uppercase letter, number, special character/symbol    | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | A1234567890!@#   | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - for Password with lowercase letter, number, special character/symbol    | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | a1234567890!@#   | 200        | ORCH-0000    | Request Executed Successfully |
      | with T - for Password with Upper,lower Cases,number and special character/symbol | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@1234    | 200        | ORCH-0000    | Request Executed Successfully |

      | with L - ONEAPP                                                                  | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@123     | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - LER                                                                     | /v1/account/password | application/json | L      | LER      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@123     | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - TRC                                                                     | /v1/account/password | application/json | L      | TRC      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@123     | 200        | ORCH-0000    | Request Executed Successfully |

      | with L - Password 8 char                                                         | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo#1         | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - Password 9 char                                                         | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - Password 10 char                                                        | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - Password 11 char                                                        | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - Password 12 char                                                        | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - Password 13 char                                                        | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - Password 14 char                                                        | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - Password 15 char                                                        | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Passwo!@9        | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - Password 16 char                                                        | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PasswordWith16Ch | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - for Password with uppercase letter, lowercase letter, number 0          | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password0        | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - for Password with uppercase letter, lowercase letter, number 9          | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PaSymbolsOly_+-= | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - for Password with uppercase letter, number, special character/symbol    | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | A1234567890!@#   | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - for Password with lowercase letter, number, special character/symbol    | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | a1234567890!@#   | 200        | ORCH-0000    | Request Executed Successfully |
      | with L - for Password with Upper,lower Cases,number and special character/symbol | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Password@1234    | 200        | ORCH-0000    | Request Executed Successfully |


  @updatePassword_MissingHeaders
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer by missing mandatory headers and expect status code 400 and appropriate response payload <scenarioName>
    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "4296d6d3c8f94c298aeddbcd99e99a5b" and objectId "4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b" verificationCode "123456" newPassword "Password2123"
    And Tester calls the PUT service
    Then The server returns the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                             | basePath             | ContentType      | XBRAND        | XCHANNEL      | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                           |
##Removing both Key & Value pairs
      | with missing header - XBRAND             | /v1/account/password | application/json | MissingHeader | ONEAPP        | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCHANNEL       | /v1/account/password | application/json | T             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCORRELATIONID | /v1/account/password | application/json | T             | ONEAPP        | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - Authorization  | /v1/account/password | application/json | T             | ONEAPP        | sendThroughCode | MissingHeader                            | 401        | ORCH-0015    | Unauthorized.                         |

      | with L - missing header - XCHANNEL       | /v1/account/password | application/json | L             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - XCORRELATIONID | /v1/account/password | application/json | L             | ONEAPP        | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - Authorization  | /v1/account/password | application/json | L             | ONEAPP        | sendThroughCode | MissingHeader                            | 401        | ORCH-0015    | Unauthorized.                         |
##Passing Empty values
      | with missing header - XBRAND             | /v1/account/password | application/json |               | ONEAPP        | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCHANNEL       | /v1/account/password | application/json | T             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCORRELATIONID | /v1/account/password | application/json | T             | ONEAPP        |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - Authorization  | /v1/account/password | application/json | T             | ONEAPP        | sendThroughCode |                                          | 401        | ORCH-0015    | Unauthorized.                         |

      | with L - missing header - XCHANNEL       | /v1/account/password | application/json | L             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - XCORRELATIONID | /v1/account/password | application/json | L             | ONEAPP        |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - Authorization  | /v1/account/password | application/json | L             | ONEAPP        | sendThroughCode |                                          | 401        | ORCH-0015    | Unauthorized.                         |

  @updatePassword_MissingAuthorization
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using by missing mandatory Header of Authorization and expect status code 401 <scenarioName>
    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "4296d6d3c8f94c298aeddbcd99e99a5b" and objectId "4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b" verificationCode "123456" newPassword "Password2123"
    And Tester calls the PUT service
    Then The server returns the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                            | basePath             | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization | statusCode | responseCode | description   |
##Removing both Key & Value pairs
      | with T - missing header - Authorization | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | MissingHeader | 401        | ORCH-0015    | Unauthorized. |
      | with L - missing header - Authorization | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | MissingHeader | 401        | ORCH-0015    | Unauthorized. |
##Passing Empty values
      | with T - missing header - Authorization | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode |               | 401        | ORCH-0015    | Unauthorized. |
      | with L - missing header - Authorization | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode |               | 401        | ORCH-0015    | Unauthorized. |

  @updatePassword_InvalidHeaders
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using invalid Headers and expect status code 404 <scenarioName>
    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "4296d6d3c8f94c298aeddbcd99e99a5b" and objectId "4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b" verificationCode "123456" newPassword "Password2123"
    And Tester calls the PUT service
    Then The server returns the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                                         | basePath             | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID                        | Authorization                            | statusCode | responseCode | description                     |
      | with invalid header - XBRAND                         | /v1/account/password | application/json | t      | ONEAPP       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account/password | application/json | l      | ONEAPP       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account/password | application/json | A      | ONEAPP       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account/password | application/json | 2      | ONEAPP       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account/password | application/json | @      | ONEAPP       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-case sensitive             | /v1/account/password | application/json | T      | us_dealer    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Numbers                    | /v1/account/password | application/json | T      | 123          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Symbols                    | /v1/account/password | application/json | T      | !@#          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-US_SELF                    | /v1/account/password | application/json | T      | US_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-CA_SELF                    | /v1/account/password | application/json | T      | CA_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-US_DEALER                  | /v1/account/password | application/json | T      | US_DEALER    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-CA_DEALER                  | /v1/account/password | application/json | T      | CA_DEALER    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-TMNA_AGNET                 | /v1/account/password | application/json | T      | TMNA_AGNET   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-TC_AGENT                   | /v1/account/password | application/json | T      | TC_AGENT     | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-SERVCO_AGNET               | /v1/account/password | application/json | T      | SERVCO_AGNET | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-CA_AGENT                   | /v1/account/password | application/json | T      | CA_AGENT     | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account/password | application/json | T      | ONEAPP       | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account/password | application/json | T      | ONEAPP       | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account/password | application/json | T      | ONEAPP       | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account/password | application/json | T      | ONEAPP       | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account/password | application/json | T      | ONEAPP       | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID without hyphen       | /v1/account/password | application/json | T      | ONEAPP       | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 3 hyphens       | /v1/account/password | application/json | T      | ONEAPP       | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 5 hyphens       | /v1/account/password | application/json | T      | ONEAPP       | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with special symbols | /v1/account/password | application/json | T      | ONEAPP       | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID length 35            | /v1/account/password | application/json | T      | ONEAPP       | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCHANNEL-case sensitive             | /v1/account/password | application/json | L      | us_dealer    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Numbers                    | /v1/account/password | application/json | L      | 123          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Symbols                    | /v1/account/password | application/json | L      | !@#          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCHANNEL-US_SELF                    | /v1/account/password | application/json | L      | US_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-CA_SELF                    | /v1/account/password | application/json | L      | CA_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-US_DEALER                  | /v1/account/password | application/json | L      | US_DEALER    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-CA_DEALER                  | /v1/account/password | application/json | L      | CA_DEALER    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-TMNA_AGNET                 | /v1/account/password | application/json | L      | TMNA_AGNET   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-TC_AGENT                   | /v1/account/password | application/json | L      | TC_AGENT     | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-SERVCO_AGNET               | /v1/account/password | application/json | L      | SERVCO_AGNET | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-CA_AGENT                   | /v1/account/password | application/json | L      | CA_AGENT     | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account/password | application/json | L      | ONEAPP       | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account/password | application/json | L      | ONEAPP       | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account/password | application/json | L      | ONEAPP       | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account/password | application/json | L      | ONEAPP       | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account/password | application/json | L      | ONEAPP       | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID without hyphen       | /v1/account/password | application/json | L      | ONEAPP       | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 3 hyphens       | /v1/account/password | application/json | L      | ONEAPP       | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 5 hyphens       | /v1/account/password | application/json | L      | ONEAPP       | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with special symbols | /v1/account/password | application/json | L      | ONEAPP       | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID length 35            | /v1/account/password | application/json | L      | ONEAPP       | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

  @updatePassword_MissingBody1
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer by MISSING WHOLE BODY INCLUDING {} BRACES and expect status code 400 <scenarioName>
    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester calls the PUT service without body including braces
    Then The server returns the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                  | basePath             | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                               |
      | with T - ONEAPP Channel       | /v1/account/password | application/json | T      | ONEAPP       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - ONEAPP Channel       | /v1/account/password | application/json | T      | ONEAPP       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

      | with L - ONEAPP Channel       | /v1/account/password | application/json | L      | ONEAPP       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - ONEAPP Channel       | /v1/account/password | application/json | L      | ONEAPP       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

  @updatePassword_MissingBody2
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer by MISSING WHOLE BODY EXCLUDING {} BRACES and expect status code 400 <scenarioName>
    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester calls the PUT service without body excluding braces
    Then The server returns the Status code "<statusCode>"
    And the server returns ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                  | basePath             | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                               |
      | with T - ONEAPP Channel       | /v1/account/password | application/json | T      | ONEAPP       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - ONEAPP Channel       | /v1/account/password | application/json | T      | ONEAPP       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

      | with L - ONEAPP Channel       | /v1/account/password | application/json | L      | ONEAPP       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - ONEAPP Channel       | /v1/account/password | application/json | L      | ONEAPP       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

  @updatePassword_MissingBody3
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer by missing mandatory body parameter(key & value) and expect status code 400 <scenarioName>
    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" objectId "<objectId>" newPassword "<newPassword>" and verificationCode "<verificationCode>"
    And Tester calls the PUT service
    Then The server returns the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                             | basePath             | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | newPassword  | verificationCode | statusCode | responseCode | description                               |
      | with T - ONEAPP missing guid             | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | Password@123 | 123456           | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - ONEAPP missing objectId         | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | Password@123 | 123456           | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - ONEAPP missing newPassword      | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | null         | 123456           | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - ONEAPP missing verificationCode | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | Password@123 | null             | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

      | with L - ONEAPP missing guid             | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | Password@123 | 123456           | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - ONEAPP missing objectId         | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | Password@123 | 123456           | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - ONEAPP missing newPassword      | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | null         | 123456           | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - ONEAPP missing verificationCode | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | Password@123 | null             | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

  @updatePassword_InValidBody1
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using invalid body parameter values(Empty value) and expect status code 400 <scenarioName>
    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" objectId "<objectId>" newPassword "<newPassword>" and verificationCode "<verificationCode>"
    And Tester calls the PUT service
    Then The server returns the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"
    Examples:
      | scenarioName                                       | basePath             | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | newPassword  | verificationCode | statusCode | responseCode | description                                 |
      | with T - ONEAPP invalid body guid ("")             | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | Password@123 | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - ONEAPP invalid body objectId ("")         | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | Password@123 | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - ONEAPP invalid body newPassword ("")      | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b |              | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - ONEAPP invalid body verificationCode ("") | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | Password@123 |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - ONEAPP invalid body guid ("")             | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | Password@123 | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - ONEAPP invalid body objectId ("")         | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | Password@123 | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - ONEAPP invalid body newPassword ("")      | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b |              | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - ONEAPP invalid body verificationCode ("") | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | Password@123 |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

  @updatePassword_InValidBody2
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using invalid body parameter values(invalid value) and expect status code 400 <scenarioName>
    Given Tester calls the update Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" objectId "<objectId>" newPassword "<newPassword>" and verificationCode "<verificationCode>"
    And Tester calls the PUT service
    Then The server returns the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"
    Examples:
      | scenarioName                                                              | basePath             | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | guid                              | objectId                              | newPassword       | verificationCode | statusCode | responseCode | description                                 |
      | with T - invalid body - guid length 31                                    | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1d   | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - guid length 33                                    | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1dba | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - guid symbols !@                                   | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc!@#  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with T - invalid body - objectId len 35                                   | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1d   | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - objectId len 37                                   | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1dbA | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with T - invalid body - password len 7                                    | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Passw@7           | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - password len 17                                   | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | PasswordLength@17 | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Password with uppercase letter and lowercase only | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Password with uppercase letter and Number only    | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | PASS1234          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Password with uppercase letter and Symbol only    | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | PASS!@#$          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Password with lowercase letter and Number only    | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | pass1234          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Password with lowercase letter and Symbol only    | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | pass!@#$          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Password with Number and Symbol/SpecialChar only  | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 1234!@#$          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with T - invalid body - verificationCode len 5                            | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 12345            | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - verificationCode len 7                            | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 1234567          | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
 #     | with T - invalid body - verificationCode with char                        | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123abc           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
 #     | with T - invalid body - verificationCode with symbol                      | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123!@#           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - guid length 31                                    | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1d   | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - guid length 33                                    | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1dba | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - guid symbols !@                                   | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc!@#  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - objectId len 35                                   | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1d   | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - objectId len 37                                   | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1dbA | Password@123      | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - password len 7                                    | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Passw@7           | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - password len 17                                   | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | PasswordLength@17 | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Password with uppercase letter and lowercase only | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Password with uppercase letter and Number only    | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | PASS1234          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Password with uppercase letter and Symbol only    | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | PASS!@#$          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Password with lowercase letter and Number only    | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | pass1234          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Password with lowercase letter and Symbol only    | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | pass!@#$          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Password with Number and Symbol/SpecialChar only  | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 1234!@#$          | 123456           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - verificationCode len 5                            | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 12345            | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - verificationCode len 7                            | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 1234567          | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
#      | with L - invalid body - verificationCode with char                        | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123abc           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
#     | with L - invalid body - verificationCode with symbol                      | /v1/account/password | application/json | L      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | Password@123      | 123!@#           | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
#  @updatePassword_InvalidUser
#  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using invalid objectId(Invalid User) and expect status code 404 <scenarioName>
#    Given Tester calls the update Password POST api at "<basePath>"
#    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
#    And Tester uses the body parameters guid "<guid>" objectId "<objectId>" newPassword "<newPassword>" and verificationCode "<verificationCode>"
#    And Tester calls the PUT service
#    Then The server returns the Status code "<statusCode>"
#    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"
#    Examples:
#     | scenarioName         | basePath             | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | newPassword  | verificationCode | statusCode | responseCode | description    |
#     | with T - InValidUser | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5A | Password@123 | 123456           | 404        | ORSS-0011    | User Not Found |
#     | with L - InValidUser | /v1/account/password | application/json | T      | ONEAPP   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5A | Password@123 | 123456           | 404        | ORSS-0011    | User Not Found |