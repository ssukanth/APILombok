@AcmDetails_Regression @AcSearchByGuid
Feature: Testing Account Search by Agent,Dealer & SELF using guid - Orchestration Micro Services
  As a tester, I should be able to search for a customer by guid as a Agent,Dealer,SELF using Account Search Micro service exposed from the Orchestration layer.
  Searches for a customer based on guid and returns minimum required customer information.

  @acm_smoke @AcmDetails_smoke @AcSearchByGuid_smoke
  Scenario Outline: Agent/Dealer/SELF Search for a Customer's Account by guid using Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "<basePath>"
    And Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "<CreateStatusCode>"
    And the server returns ResponseCode "<CreateResponseCode>" Description "<CreateDescription>"
    And the response payload must match with the request payload for customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" and GUID is not NULL or Empty

    Given The fetch customer details GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and guid
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<SearchStatusCode>"
    And the server must returns the ResponseCode "<SearchResponseCode>" and Description "<SearchDescription>"
    And the server returns the results for the searched guid "<guid>" and Fname and Lname details without null values for Customer type is PERSON

    Examples:
      | scenarioName        | basePath    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email           | phone           | CreateStatusCode | CreateResponseCode | CreateDescription            | SearchStatusCode | SearchResponseCode | SearchDescription             |
      | with T - TMNA_AGENT | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with L - CA_DEALER  | /v1/account | application/json | L      | CA_DEALER  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |

  @AcSearchByGuid-Positive
  Scenario Outline: Agent/Dealer/SELF Search for a Customer's Account by guid using Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "<basePath>"
    And Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "<CreateStatusCode>"
    And the server returns ResponseCode "<CreateResponseCode>" Description "<CreateDescription>"
    And the response payload must match with the request payload for customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" and GUID is not NULL or Empty

    Given The fetch customer details GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and guid
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<SearchStatusCode>"
    And the server must returns the ResponseCode "<SearchResponseCode>" and Description "<SearchDescription>"
    And the server returns the results for the searched guid "<guid>" and Fname and Lname details without null values for Customer type is PERSON

    Examples:
      | scenarioName          | basePath    | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email           | phone           | CreateStatusCode | CreateResponseCode | CreateDescription            | SearchStatusCode | SearchResponseCode | SearchDescription             |
      | with T - TMNA_AGENT   | /v1/account | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with T - TC_AGENT     | /v1/account | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with T - SERVCO_AGENT | /v1/account | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with T - CA_AGENT     | /v1/account | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with T - US_DEALER    | /v1/account | application/json | T      | US_DEALER    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with T - CA_DEALER    | /v1/account | application/json | T      | CA_DEALER    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |

      | with L - TMNA_AGENT   | /v1/account | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with L - TC_AGENT     | /v1/account | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with L - SERVCO_AGENT | /v1/account | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with L - CA_AGENT     | /v1/account | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with L - US_DEALER    | /v1/account | application/json | L      | US_DEALER    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with L - CA_DEALER    | /v1/account | application/json | L      | CA_DEALER    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |

  @AcSearchByGuid-MissingHeaders
  Scenario Outline: Agent/Dealer/SELF Search for a Customer's Account by guid using Search API exposed from Orchestration layer by missing mandatory header (both key & value) and expect status code 400 OK <scenarioName>
    Given The fetch customer details GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" guid "<guid>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                    | basePath    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                             | statusCode | responseCode | description                           |
      | with Missing XBRAND             | /v1/account | application/json | null   | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Missing XCHANNEL       | /v1/account | application/json | T      | null       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Missing XCORRELATIONID | /v1/account | application/json | T      | TMNA_AGENT | null            | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Missing Authorization  | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | null                                     | 61ad8b941d4947cdbdf62c9d60e0693f | 401        | ORCH-0015    | Unauthorized.                         |
      | with T - Missing GUID           | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |

      | with L - Missing XCHANNEL       | /v1/account | application/json | L      | null       | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - Missing XCORRELATIONID | /v1/account | application/json | L      | TMNA_AGENT | null            | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - Missing Authorization  | /v1/account | application/json | L      | TMNA_AGENT | sendThroughCode | null                                     | 61ad8b941d4947cdbdf62c9d60e0693f | 401        | ORCH-0015    | Unauthorized.                         |
      | with L - Missing GUID           | /v1/account | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |

  @AcSearchByGuid-InvalidHeaders
  Scenario Outline: Agent/Dealer/SELF Search for a Customer's Account by guid using Search API exposed from Orchestration layer by missing mandatory header( value="") and expect status code 400 OK <scenarioName>
    Given The fetch customer details GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" guid "<guid>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                            | basePath    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                             | statusCode | responseCode | description                           |
      | with T - XBRAND as empty string         | /v1/account | application/json |        | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - XCHANNEL as empty string       | /v1/account | application/json | T      |            | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - XCORRELATIONID as empty string | /v1/account | application/json | T      | TMNA_AGENT |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Authorization as empty string  | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode |                                          | 61ad8b941d4947cdbdf62c9d60e0693f | 401        | ORCH-0015    | Unauthorized.                         |
      | with T - guid as empty string           | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |

      | with L - XCHANNEL as empty string       | /v1/account | application/json | L      |            | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - XCORRELATIONID as empty string | /v1/account | application/json | L      | TMNA_AGENT |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - Authorization as empty string  | /v1/account | application/json | L      | TMNA_AGENT | sendThroughCode |                                          | 61ad8b941d4947cdbdf62c9d60e0693f | 401        | ORCH-0015    | Unauthorized.                         |
      | with L - guid as empty string           | /v1/account | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |


  @AcSearchByGuid-InvalidHeaders
  Scenario Outline: Agent/Dealer/SELF Search for a Customer's Account by guid using Search API exposed from Orchestration layer by missing mandatory header( value="") and expect status code 400 OK <scenarioName>
    Given The fetch customer details GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" guid "<guid>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                                         | basePath    | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID                        | Authorization                            | guid                             | statusCode | responseCode | description                     |
#      | with T - XBRAND as empty string                      | /v1/account       | application/json |        | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f  | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XBRAND-1                            | /v1/account | application/json | t      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XBRAND-2                            | /v1/account | application/json | l      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XBRAND-3                            | /v1/account | application/json | A      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - XBRAND with Number                          | /v1/account | application/json | 2      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - XBRAND with Symbol                          | /v1/account | application/json | @      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

#      | with T - XCHANNEL as empty string                    | /v1/account       | application/json | T      |              | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f  | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - XCHANNEL with case sensitive                | /v1/account | application/json | T      | us_dealer    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - XCHANNEL with Numbers                       | /v1/account | application/json | T      | 123          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - XCHANNEL with Symbold                       | /v1/account | application/json | T      | !@#          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - XCHANNEL does not exist                     | /v1/account | application/json | T      | LA_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

#      | with T - XCORRELATIONID as empty string              | /v1/account       | application/json | T      | TMNA_AGENT   |                                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f  | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account | application/json | T      | TC_AGENT     | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account | application/json | T      | TC_AGENT     | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account | application/json | T      | TC_AGENT     | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account | application/json | T      | TC_AGENT     | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account | application/json | T      | TC_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID without hyphen       | /v1/account | application/json | T      | SERVCO_AGENT | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 3 hyphens       | /v1/account | application/json | T      | SERVCO_AGENT | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 5 hyphens       | /v1/account | application/json | T      | SERVCO_AGENT | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with special symbols | /v1/account | application/json | T      | CA_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID length 35            | /v1/account | application/json | T      | CA_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Authorization as empty string               | /v1/account | application/json | T      | TMNA_AGENT   | sendThroughCode                       |                                          | 61ad8b941d4947cdbdf62c9d60e0693f | 401        | ORCH-0015    | Unauthorized.                   |

#      | with T - guid as empty string                        | /v1/account       | application/json | T      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                   | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
##Lexus

#      | with L - XCHANNEL as empty string                    | /v1/account       | application/json | L      |              | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f  | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - XCHANNEL with case sensitive                | /v1/account | application/json | L      | us_dealer    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - XCHANNEL with Numbers                       | /v1/account | application/json | L      | 123          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - XCHANNEL with Symbold                       | /v1/account | application/json | L      | !@#          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - XCHANNEL does not exist                     | /v1/account | application/json | L      | LA_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

#      | with L - XCORRELATIONID as empty string              | /v1/account       | application/json | L      | TMNA_AGENT   |                                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f  | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account | application/json | L      | TC_AGENT     | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account | application/json | L      | TC_AGENT     | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account | application/json | L      | TC_AGENT     | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account | application/json | L      | TC_AGENT     | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account | application/json | L      | TC_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID without hyphen       | /v1/account | application/json | L      | SERVCO_AGENT | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 3 hyphens       | /v1/account | application/json | L      | SERVCO_AGENT | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 5 hyphens       | /v1/account | application/json | L      | SERVCO_AGENT | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with special symbols | /v1/account | application/json | L      | CA_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID length 35            | /v1/account | application/json | L      | CA_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0693f | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Authorization as empty string               | /v1/account | application/json | L      | TMNA_AGENT   | sendThroughCode                       |                                          | 61ad8b941d4947cdbdf62c9d60e0693f | 401        | ORCH-0015    | Unauthorized.                   |

#      | with L - guid as empty string                        | /v1/account       | application/json | L      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                   | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

  @AcSearchByGuid-InvalidUser
  Scenario Outline: Agent/Dealer/SELF Search for a Customer's Account by guid using Search API exposed from Orchestration layer by missing mandatory header( value="") and expect status code 400 OK <scenarioName>
    Given The fetch customer details GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" guid "<guid>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                | basePath    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                              | statusCode | responseCode | description    |
      | with T - Invalid user(guid) | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0abcd  | 404        | OCPR-0011    | User Not Found |
      | with T - guid length 31     | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1d   | 404        | OCPR-0011    | User Not Found |
      | with T - guid length 33     | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1dba | 404        | OCPR-0011    | User Not Found |
      | with T - guid symbols !@    | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc!@#  | 404        | OCPR-0011    | User Not Found |
      | with L - Invalid user(guid) | /v1/account | application/json | L      | CA_DEALER  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 61ad8b941d4947cdbdf62c9d60e0abcd  | 404        | OCPR-0011    | User Not Found |
      | with L - guid length 31     | /v1/account | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1d   | 404        | OCPR-0011    | User Not Found |
      | with L - guid length 33     | /v1/account | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1dba | 404        | OCPR-0011    | User Not Found |
      | with L - guid symbols !@    | /v1/account | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc!@#  | 404        | OCPR-0011    | User Not Found |
