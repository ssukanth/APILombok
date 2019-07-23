@acm_regression @session_regression @resetPassword_regression
Feature: Testing Reset Password API available for Agents - Orchestration Micro Services
  As a tester, I should be able to call customer reset password trigger from agents - Micro service exposed from the Orchestration layer.

  @acm_smoke @session_smoke @resetPassword_smoke
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer using valid input parameters (headers and body ) and expect status code 200 OK <scenarioName>
  Step-1: Create an account  step-2: Agent calls the Reset Password for the same customer by getting guid & objectId
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLName" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server must returns the ResponseCode "ORCH-0000" and Description "Account Created Successfully"
    And the server should return the guid objectId FirstName lastName EmailAddress PhoneNumber and no address

    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the valid body parameter guid and objectId
    And Tester calls the POST service
    Then The Customer's Password should be ready to reset by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName      | basePath                   | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                   |
      | with T - Customer | /v1/account/password/reset | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |
      | with L - Customer | /v1/account/password/reset | application/json | L      | TC_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |

  @resetPassword_positive
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer using valid input parameters (headers and body ) and expect status code 200 OK <scenarioName>
  Step-1: Create an account  step-2: Agent calls the Reset Password for the same customer by getting guid & objectId
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLName" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server must returns the ResponseCode "ORCH-0000" and Description "Account Created Successfully"
    And the server should return the guid objectId FirstName lastName EmailAddress PhoneNumber and no address

    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the valid body parameter guid and objectId
    And Tester calls the POST service
    Then The Customer's Password should be ready to reset by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName          | basePath                   | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                   |
      | with T - TMNA_AGENT   | /v1/account/password/reset | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |
      | with T - TC_AGENT     | /v1/account/password/reset | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |
      | with T - SERVCO_AGENT | /v1/account/password/reset | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |
      | with T - CA_AGENT     | /v1/account/password/reset | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |

      | with L - TMNA_AGENT   | /v1/account/password/reset | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |
      | with L - TC_AGENT     | /v1/account/password/reset | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |
      | with L - SERVCO_AGENT | /v1/account/password/reset | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |
      | with L - CA_AGENT     | /v1/account/password/reset | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 200        | ORSS-0000    | Request Executed Successfully |

  @resetPassword_MissingHeaders
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer by missing mandatory headers and expect status code 400 and appropriate response payload <scenarioName>
    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "4296d6d3c8f94c298aeddbcd99e99a5b" and objectId "4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b"
    And Tester calls the POST service
    Then The Customer's Password should not be ready to reset by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                             | basePath                   | ContentType      | XBRAND        | XCHANNEL      | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                           |
##Removing both Key & Value pairs
      | with missing header - XBRAND             | /v1/account/password/reset | application/json | MissingHeader | TMNA_AGENT    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCHANNEL       | /v1/account/password/reset | application/json | T             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCORRELATIONID | /v1/account/password/reset | application/json | T             | TMNA_AGENT    | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - Authorization  | /v1/account/password/reset | application/json | T             | TMNA_AGENT    | sendThroughCode | MissingHeader                            | 401        | ORSS-0015    | Unauthorized.                         |

      | with L - missing header - XCHANNEL       | /v1/account/password/reset | application/json | L             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - XCORRELATIONID | /v1/account/password/reset | application/json | L             | TMNA_AGENT    | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - Authorization  | /v1/account/password/reset | application/json | L             | TMNA_AGENT    | sendThroughCode | MissingHeader                            | 401        | ORSS-0015    | Unauthorized.                         |
##Passing Empty values
      | with missing header - XBRAND             | /v1/account/password/reset | application/json |               | TMNA_AGENT    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCHANNEL       | /v1/account/password/reset | application/json | T             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCORRELATIONID | /v1/account/password/reset | application/json | T             | TMNA_AGENT    |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - Authorization  | /v1/account/password/reset | application/json | T             | TMNA_AGENT    | sendThroughCode |                                          | 401        | ORSS-0015    | Unauthorized.                         |

      | with L - missing header - XCHANNEL       | /v1/account/password/reset | application/json | L             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - XCORRELATIONID | /v1/account/password/reset | application/json | L             | TMNA_AGENT    |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - Authorization  | /v1/account/password/reset | application/json | L             | TMNA_AGENT    | sendThroughCode |                                          | 401        | ORSS-0015    | Unauthorized.                         |

  @resetPassword_MissingAuthorization
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer using by missing mandatory Header of Authorization and expect status code 401 <scenarioName>
    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "4296d6d3c8f94c298aeddbcd99e99a5b" and objectId "4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b"
    And Tester calls the POST service
    Then The Customer's Password should not be ready to reset by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                            | basePath                   | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization | statusCode | responseCode | description   |
##Removing both Key & Value pairs
      | with T - missing header - Authorization | /v1/account/password/reset | application/json | T      | TMNA_AGENT | sendThroughCode | MissingHeader | 401        | ORSS-0015    | Unauthorized. |
      | with L - missing header - Authorization | /v1/account/password/reset | application/json | L      | TMNA_AGENT | sendThroughCode | MissingHeader | 401        | ORSS-0015    | Unauthorized. |
##Passing Empty values
      | with T - missing header - Authorization | /v1/account/password/reset | application/json | T      | TMNA_AGENT | sendThroughCode |               | 401        | ORSS-0015    | Unauthorized. |
      | with L - missing header - Authorization | /v1/account/password/reset | application/json | L      | TMNA_AGENT | sendThroughCode |               | 401        | ORSS-0015    | Unauthorized. |

  @resetPassword_InvalidHeaders
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer using invalid Headers and expect status code 400 <scenarioName>
    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "4296d6d3c8f94c298aeddbcd99e99a5b" and objectId "4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b"
    And Tester calls the POST service
    Then The Customer's Password should not be ready to reset by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                                         | basePath                   | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                        | Authorization                            | statusCode | responseCode | description                     |
      | with invalid header - XBRAND                         | /v1/account/password/reset | application/json | t      | TMNA_AGENT | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account/password/reset | application/json | l      | TMNA_AGENT | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account/password/reset | application/json | A      | TMNA_AGENT | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account/password/reset | application/json | 2      | TMNA_AGENT | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account/password/reset | application/json | @      | TMNA_AGENT | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-case sensitive             | /v1/account/password/reset | application/json | T      | us_dealer  | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Numbers                    | /v1/account/password/reset | application/json | T      | 123        | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Symbols                    | /v1/account/password/reset | application/json | T      | !@#        | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-US_SELF                    | /v1/account/password/reset | application/json | T      | US_SELF    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-CA_SELF                    | /v1/account/password/reset | application/json | T      | CA_SELF    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-US_DEALER                  | /v1/account/password/reset | application/json | T      | US_DEALER  | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-CA_DEALER                  | /v1/account/password/reset | application/json | T      | CA_DEALER  | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-TRC                        | /v1/account/password/reset | application/json | T      | TRC        | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-LER                        | /v1/account/password/reset | application/json | T      | LER        | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID without hyphen       | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 3 hyphens       | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 5 hyphens       | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with special symbols | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID length 35            | /v1/account/password/reset | application/json | T      | TMNA_AGENT | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
##Lexus
      | with L - Invalid XCHANNEL-case sensitive             | /v1/account/password/reset | application/json | L      | us_dealer  | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Numbers                    | /v1/account/password/reset | application/json | L      | 123        | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Symbols                    | /v1/account/password/reset | application/json | L      | !@#        | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCHANNEL-US_SELF                    | /v1/account/password/reset | application/json | L      | US_SELF    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-CA_SELF                    | /v1/account/password/reset | application/json | L      | CA_SELF    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-US_DEALER                  | /v1/account/password/reset | application/json | L      | US_DEALER  | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-CA_DEALER                  | /v1/account/password/reset | application/json | L      | CA_DEALER  | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-TRC                        | /v1/account/password/reset | application/json | L      | TRC        | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-LER                        | /v1/account/password/reset | application/json | L      | LER        | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID without hyphen       | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 3 hyphens       | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 5 hyphens       | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with special symbols | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID length 35            | /v1/account/password/reset | application/json | L      | TMNA_AGENT | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0002    | Incorrect/Invalid Header Values |

  @resetPassword_MissingBody1
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer by MISSING WHOLE BODY INCLUDING {} BRACES and expect status code 400 <scenarioName>
    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester calls the logout POST service without body including braces
    Then The Customer's Password should not be ready to reset by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                  | basePath                   | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                               |
      | with T - TMNA_AGENT Channel   | /v1/account/password/reset | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - TC_AGENT Channel     | /v1/account/password/reset | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - SERVCO_AGENT Channel | /v1/account/password/reset | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - CA_AGENT Channel     | /v1/account/password/reset | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |

      | with L - TMNA_AGENT Channel   | /v1/account/password/reset | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - TC_AGENT Channel     | /v1/account/password/reset | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - SERVCO_AGENT Channel | /v1/account/password/reset | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - CA_AGENT Channel     | /v1/account/password/reset | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |

  @resetPassword_MissingBody2
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer by MISSING WHOLE BODY EXCLUDING {} BRACES and expect status code 400 <scenarioName>
    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester calls the logoutPOST service without body excluding braces
    Then The Customer's Password should not be ready to reset by returning Status code "<statusCode>"
    And the server returns ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                  | basePath                   | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                               |
      | with T - TMNA_AGENT Channel   | /v1/account/password/reset | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - TC_AGENT Channel     | /v1/account/password/reset | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - SERVCO_AGENT Channel | /v1/account/password/reset | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - CA_AGENT Channel     | /v1/account/password/reset | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |

      | with L - TMNA_AGENT Channel   | /v1/account/password/reset | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - TC_AGENT Channel     | /v1/account/password/reset | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - SERVCO_AGENT Channel | /v1/account/password/reset | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - CA_AGENT Channel     | /v1/account/password/reset | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |

  @resetPassword_MissingBody3
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer by missing mandatory body parameter(key & value) and expect status code 400 <scenarioName>
    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" and objectId "<objectId>"
    And Tester calls the POST service
    Then The Customer's Password should not be ready to reset by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                           | basePath                   | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | statusCode | responseCode | description                               |
      | with T - TMNA_AGENT missing guid       | /v1/account/password/reset | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - TMNA_AGENT missing objectId   | /v1/account/password/reset | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - TC_AGENT missing guid         | /v1/account/password/reset | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - TC_AGENT missing objectId     | /v1/account/password/reset | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - SERVCO_AGENT missing guid     | /v1/account/password/reset | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - SERVCO_AGENT missing objectId | /v1/account/password/reset | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - CA_AGENT missing guid         | /v1/account/password/reset | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with T - CA_AGENT missing objectId     | /v1/account/password/reset | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |

      | with L - TMNA_AGENT missing guid       | /v1/account/password/reset | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - TMNA_AGENT missing objectId   | /v1/account/password/reset | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - TC_AGENT missing guid         | /v1/account/password/reset | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - TC_AGENT missing objectId     | /v1/account/password/reset | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - SERVCO_AGENT missing guid     | /v1/account/password/reset | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - SERVCO_AGENT missing objectId | /v1/account/password/reset | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - CA_AGENT missing guid         | /v1/account/password/reset | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |
      | with L - CA_AGENT missing objectId     | /v1/account/password/reset | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b | null                                 | 400        | ORSS-0003    | Mandatory Request Body Attributes Missing |

  @resetPassword_InValidBody1
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer using invalid body parameter values(Empty value) and expect status code 400 <scenarioName>
    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" and objectId "<objectId>"
    And Tester calls the POST service
    Then The Customer's Password should not be ready to reset by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"
    Examples:
      | scenarioName                                     | basePath                   | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | statusCode | responseCode | description                                 |
      | with T - TMNA_AGENT invalid body guid ("")       | /v1/account/password/reset | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - TMNA_AGENT invalid body objectId ("")   | /v1/account/password/reset | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - TC_AGENT invalid body guid ("")         | /v1/account/password/reset | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - TC_AGENT invalid body objectId ("")     | /v1/account/password/reset | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - SERVCO_AGENT invalid body guid ("")     | /v1/account/password/reset | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - SERVCO_AGENT invalid body objectId ("") | /v1/account/password/reset | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - CA_AGENT invalid body guid ("")         | /v1/account/password/reset | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - CA_AGENT invalid body objectId ("")     | /v1/account/password/reset | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - TMNA_AGENT invalid body guid ("")       | /v1/account/password/reset | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - TMNA_AGENT invalid body objectId ("")   | /v1/account/password/reset | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - TC_AGENT invalid body guid ("")         | /v1/account/password/reset | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - TC_AGENT invalid body objectId ("")     | /v1/account/password/reset | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - SERVCO_AGENT invalid body guid ("")     | /v1/account/password/reset | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - SERVCO_AGENT invalid body objectId ("") | /v1/account/password/reset | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - CA_AGENT invalid body guid ("")         | /v1/account/password/reset | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 4296d6d3-c8f9-4c29-8aed-dbcd99e99a5b | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - CA_AGENT invalid body objectId ("")     | /v1/account/password/reset | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 4296d6d3c8f94c298aeddbcd99e99a5b |                                      | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |

  @resetPassword_InValidBody2
  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer using invalid body parameter values(invalid value) and expect status code 400 <scenarioName>
    Given Tester calls the Reset Password POST api at "<basePath>"
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" and objectId "<objectId>"
    And Tester calls the POST service
    Then The Customer's Password should not be ready to reset by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"
    Examples:
      | scenarioName                            | basePath                   | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                              | objectId                              | statusCode | responseCode | description                                 |
      | with T - invalid body - guid length 31  | /v1/account/password/reset | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1d   | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - guid length 33  | /v1/account/password/reset | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1dba | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - guid symbols !@ | /v1/account/password/reset | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc!@#  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with T - invalid body - objectId len 35 | /v1/account/password/reset | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1d   | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - objectId len 37 | /v1/account/password/reset | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1dbA | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - guid length 31  | /v1/account/password/reset | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1d   | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - guid length 33  | /v1/account/password/reset | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1dba | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - guid symbols !@ | /v1/account/password/reset | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc!@#  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - objectId len 35 | /v1/account/password/reset | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1d   | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - objectId len 37 | /v1/account/password/reset | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1dbA | 400        | ORSS-0004    | Incorrect/Invalid Request Body Attribute(s) |

#  @resetPassword_InvalidUser
#  Scenario Outline: Agents calls the Reset Password API to reset API exposed from Orchestration layer using invalid objectId(Invalid User) and expect status code 404 <scenarioName>
#    Given Tester calls the Reset Password POST api at "<basePath>"
#    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
#    And Tester uses the body parameters guid "<guid>" and objectId "<objectId>"
#    And Tester calls the POST service
#    Then The Customer's Password should not be ready to reset by returning Status code "<statusCode>"
#    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"
#    Examples:
#      | scenarioName         | basePath           | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | statusCode | responseCode | description    |
#      | with T - InValidUser | /v1/account/logout | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1dA | 404        | ORSS-0011    | User Not Found |
#      | with L - InValidUser | /v1/account/logout | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 03dae37ba0dd4af199d73a61d39622d0 | 03dae37b-a0dd-4af1-99d7-3a61d39622dL | 404        | ORSS-0011    | User Not Found |
