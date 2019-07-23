@AcmDetails_Regression @AcSearchByAgentUsingEmail
Feature: Testing Account Search by Agent using Email - Orchestration Micro Services
  As a tester, I should be able to search for a customer by Email as a Agent(TMNA_AGENT,TC_AGENT,SERVCO_AGENT,CA_AGENT) using Account Search by Agent Micro service exposed from the Orchestration layer.
  Searches for a customer based on Email and returns minimum required customer information.

  @acm_smoke @AcmDetails_smoke @AcSearchByAgentUsingEmail-Smoke
  Scenario Outline: Agent Search for a Customer's Account by Email using Agent Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "<basePath>"
    And Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "<createStatusCode>"
    And the server returns ResponseCode "<createResponseCode>" Description "<createDescription>"
    And the response payload must match with the request payload for customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" and GUID is not NULL or Empty

    Given The Agent Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and existedUserEmailAddress
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<searchStatusCode>"
    And the server returns the ResponseCode "<searchResponseCode>" Description "<searchDescription>"
    And the server returns the results for the searched email "<email>" and Fname and Lname details without null values for Customer type is PERSON
    Examples:
      | scenarioName           | basePath    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email           | phone           | createStatusCode | createResponseCode | createDescription            | searchStatusCode | searchResponseCode | searchDescription             |
      | with Toyota TMNA_AGENT | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Lexus CA_AGENT    | /v1/account | application/json | L      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |

  @AcSearchByAgentUsingEmail-Positive
  Scenario Outline: Agent Search for a Customer's Account by Email using Agent Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "<basePath>"
    And Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "<createStatusCode>"
    And the server returns ResponseCode "<createResponseCode>" Description "<createDescription>"
    And the response payload must match with the request payload for customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" and GUID is not NULL or Empty

    Given The Agent Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and existedUserEmailAddress
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<searchStatusCode>"
    And the server returns the ResponseCode "<searchResponseCode>" Description "<searchDescription>"
    And the server returns the results for the searched email "<email>" and Fname and Lname details without null values for Customer type is PERSON
    Examples:
      | scenarioName             | basePath    | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email           | phone           | createStatusCode | createResponseCode | createDescription            | searchStatusCode | searchResponseCode | searchDescription             |
      | with Toyota TMNA_AGENT   | /v1/account | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Toyota TC_AGENT     | /v1/account | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Toyota SERVCO_AGENT | /v1/account | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Toyota CA_AGENT     | /v1/account | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |

      | with Lexus TMNA_AGENT    | /v1/account | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Lexus TC_AGENT      | /v1/account | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Lexus SERVCO_AGENT  | /v1/account | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Lexus CA_AGENT      | /v1/account | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |


  @AcSearchByAgentUsingEmail-MissingHeaders
  Scenario Outline: Agent Search for a Customer's Account by Email using Agent Search API exposed from Orchestration layer with missing Headers and expect status code 400 <scenarioName>
    Given The Agent Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" email "<email>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                    | basePath    | ContentType      | XBRAND        | XCHANNEL      | XCORRELATIONID  | Authorization                            | email         | statusCode | responseCode | description                           |
#Removing both Key & Value pairs
      | with T - Missing XBRAND         | /v1/account | application/json | MissingHeader | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Missing XCHANNEL       | /v1/account | application/json | T             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Missing XCORRELATIONID | /v1/account | application/json | T             | US_DEALER     | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Missing Authorization  | /v1/account | application/json | T             | US_DEALER     | sendThroughCode | MissingHeader                            | test@test.com | 401        | ORCH-0015    | Unauthorized.                         |
      | with T - Missing email          | /v1/account | application/json | T             | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | MissingHeader | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |

      | with L - Missing XCHANNEL       | /v1/account | application/json | L             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - Missing XCORRELATIONID | /v1/account | application/json | L             | US_DEALER     | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - Missing Authorization  | /v1/account | application/json | L             | US_DEALER     | sendThroughCode | MissingHeader                            | test@test.com | 401        | ORCH-0015    | Unauthorized.                         |
      | with L - Missing email          | /v1/account | application/json | L             | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | MissingHeader | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |

#Passing Empty values

      | with T -Missing XBRAND value    | /v1/account | application/json |               | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Missing XCHANNEL       | /v1/account | application/json | T             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Missing XCORRELATIONID | /v1/account | application/json | T             | US_DEALER     |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Missing Authorization  | /v1/account | application/json | T             | US_DEALER     | sendThroughCode |                                          | test@test.com | 401        | ORCH-0015    | Unauthorized.                         |
      | with T - Missing email          | /v1/account | application/json | T             | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |               | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |

      | with L - Missing XCHANNEL       | /v1/account | application/json | L             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - Missing XCORRELATIONID | /v1/account | application/json | L             | US_DEALER     |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - Missing Authorization  | /v1/account | application/json | L             | US_DEALER     | sendThroughCode |                                          | test@test.com | 401        | ORCH-0015    | Unauthorized.                         |
      | with L - Missing email          | /v1/account | application/json | L             | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |               | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |


  @AcSearchByAgentUsingEmail-InvalidHeaders
  Scenario Outline: Agent Search for a Customer's Account by Email using Agent Search API exposed from Orchestration layer using invalid headers and expect status code 400 <scenarioName>
    Given The Agent Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" email "<email>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                                         | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID                        | Authorization                            | email                                            | statusCode | responseCode | description                     |
      | with Invalid XBRAND-1                                | /v1/account | application/json | t      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-2                                | /v1/account | application/json | l      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-3                                | /v1/account | application/json | A      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-4                                | /v1/account | application/json | 2      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-5                                | /v1/account | application/json | @      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-case sensitive             | /v1/account | application/json | T      | us_dealer | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Numbers                    | /v1/account | application/json | T      | 123       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Symbols                    | /v1/account | application/json | T      | !@#       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-LA_SELF                    | /v1/account | application/json | T      | LA_SELF   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Toyota.us_self_20180709_14.43.27.284@tdomain.com | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account | application/json | T      | US_DEALER | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account | application/json | T      | US_DEALER | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID without hyphen       | /v1/account | application/json | T      | US_DEALER | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 3 hyphens       | /v1/account | application/json | T      | US_DEALER | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 5 hyphens       | /v1/account | application/json | T      | US_DEALER | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with special symbols | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID length 35            | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid EMAIL                               | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | !#$#@com.com                                     | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
#      | with T - Invalid EMAIL without period in domain                          | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Toyotaca_self_20180709_14@tdomaincom             | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid EMAIL without name                  | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | @yopmail.com.com                                 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid EMAIL without @                     | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Toyota.us_self_20180711_10.59.47.187yopmail.com  | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid EMAIL without domain                | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Toyota.us_self_20180711_10.59.47.187@.com        | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid EMAIL without period after domain   | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Toyota.us_self_20180711_10.59.47.187@yopmailcom  | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid EMAIL without suffix after domain   | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Toyota.us_self_20180711_10.59.47.187@yopmail.    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCHANNEL-case sensitive             | /v1/account | application/json | L      | us_dealer | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Numbers                    | /v1/account | application/json | L      | 123       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Symbols                    | /v1/account | application/json | L      | !@#       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-LA_SELF                    | /v1/account | application/json | L      | LA_SELF   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account | application/json | T      | US_DEALER | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account | application/json | T      | US_DEALER | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID without hyphen       | /v1/account | application/json | T      | US_DEALER | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 3 hyphens       | /v1/account | application/json | T      | US_DEALER | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 5 hyphens       | /v1/account | application/json | T      | US_DEALER | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with special symbols | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID length 35            | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | test@test.com                                    | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid EMAIL                               | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | !#$#@com.com                                     | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
#      | with L - Invalid EMAIL without period                          | /v1/account | application/json | L      | TMNA_AGENT | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Toyotaca_self_20180709_14@tdomaincom             | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid EMAIL without name                  | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | @yopmail.com.com                                 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid EMAIL without @                     | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Lexus.us_self_20180711_10.59.47.187yopmail.com   | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid EMAIL without domain                | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Lexus.us_self_20180711_10.59.47.187@.com         | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid EMAIL without period after domain   | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Lexus.us_self_20180711_10.59.47.187@yopmailcom   | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid EMAIL without suffix after domain   | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | Lexus.us_self_20180711_10.59.47.187@yopmail.     | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

  @AcSearchByAgentUsingEmail-InvalidUser
  Scenario Outline: Agent Search for a Customer's Account by Email using Agent Search API exposed from Orchestration layer using invalid user email and expect status code 404 <scenarioName>
    Given The Agent Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" email "<email>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                      | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | email               | statusCode | responseCode | description    |
      | with email wihtout having account | /v1/account | application/json | T      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ram.testing@ram.com | 404        | OCPR-0011    | User Not Found |

#  @AcSearchByAgentUsingEmail-InternalServerError/SystemNotAvailable
#  Scenario Outline: Agent Search for a Customer's Account by Email using Agent Search API exposed from Orchestration layer using valid input when InternalServerError/SystemNotAvailable and expect status code 500 <scenarioName>
#    Given The Agent Search for a Customer Account GET api service "<basePath>" is down
#    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" email "<email>"
#    And Tester calls the GET service
#    Then the Customer account details can not be searched in ORCH and OCPR system by returning Status code "<statusCode>"
#    And the server returns the ResponseCode "<responseCode>" Description "<description>"
#
#    Examples:
#      | scenarioName                                | basePath | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | email              | statusCode | responseCode | description           |
#      | with InternalServerError/SystemNotAvailable | /v1/down | application/json | T      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | testuser@gmail.com | 500        | ORCH-0006    | Internal Server Error |


