@AcmDetails_Regression @AcSearchByDealerUsingPhone
Feature: Testing Account Search by Dealer using Phone Number - Orchestration Micro Services
  As a tester, I should be able to search for a customer by Phone number as a Dealer(US_DEALER,CA_DEALER) by using Account Search by Dealer Micro service exposed from the Orchestration layer.
  Searches for a customer based on Phone number and returns minimum required customer information.

  @acm_smoke @AcmDetails_smoke @AcSearchByDealerUsingPhone-Smoke
  Scenario Outline: Dealer Search for a Customer's Account by Phone number using Dealer Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "<basePath>"
    And Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "<createStatusCode>"
    And the server returns ResponseCode "<createResponseCode>" Description "<createDescription>"
    And the response payload must match with the request payload for customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" and GUID is not NULL or Empty

    Given The Dealer Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and existedUserPhoneNumber
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<searchStatusCode>"
    And the server returns the ResponseCode "<searchResponseCode>" Description "<searchDescription>"
    And the server returns the results for the searched phone "<phone>" and Fname and Lname details without null values for Customer type is PERSON
    Examples:
      | scenarioName          | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email           | phone           | createStatusCode | createResponseCode | createDescription            | searchStatusCode | searchResponseCode | searchDescription             |
      | with Toyota US_DEALER | /v1/account | application/json | T      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Lexus CA_DEALER  | /v1/account | application/json | L      | CA_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |

  @AcSearchByDealerUsingPhone-Positive
  Scenario Outline: Dealer Search for a Customer's Account by Phone number using Dealer Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "<basePath>"
    And Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "<createStatusCode>"
    And the server returns ResponseCode "<createResponseCode>" Description "<createDescription>"
    And the response payload must match with the request payload for customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" and GUID is not NULL or Empty

    Given The Dealer Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and existedUserPhoneNumber
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<searchStatusCode>"
    And the server returns the ResponseCode "<searchResponseCode>" Description "<searchDescription>"
    And the server returns the results for the searched phone "<phone>" and Fname and Lname details without null values for Customer type is PERSON
    Examples:
      | scenarioName          | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email           | phone           | createStatusCode | createResponseCode | createDescription            | searchStatusCode | searchResponseCode | searchDescription             |
      | with Toyota US_DEALER | /v1/account | application/json | T      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Toyota CA_DEALER | /v1/account | application/json | T      | CA_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Lexus US_DEALER  | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |
      | with Lexus CA_DEALER  | /v1/account | application/json | L      | CA_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode | 201              | ORCH-0000          | Account Created Successfully | 200              | OCPR-0000          | Request Executed Successfully |

  @AcSearchByDealerUsingPhone-MissingHeaders
  Scenario Outline: Dealer Search for a Customer's Account by Phone number using Dealer Search API exposed from Orchestration layer with missing Headers and expect status code 400 <scenarioName>
    Given The Dealer Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" phone "<phone>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName       | basePath    | ContentType      | XBRAND        | XCHANNEL      | XCORRELATIONID  | Authorization                            | phone         | statusCode | responseCode | description                           |
#Removing both Key & Value pairs
      | with T - US_DEALER | /v1/account | application/json | MissingHeader | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |

      | with T - US_DEALER | /v1/account | application/json | T             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - US_DEALER | /v1/account | application/json | T             | US_DEALER     | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - US_DEALER | /v1/account | application/json | T             | US_DEALER     | sendThroughCode | MissingHeader                            | 7703104059    | 401        | ORCH-0015    | Unauthorized.                         |
      | with T - US_DEALER | /v1/account | application/json | T             | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | MissingHeader | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |

      | with L - US_DEALER | /v1/account | application/json | L             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - US_DEALER | /v1/account | application/json | L             | US_DEALER     | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - US_DEALER | /v1/account | application/json | L             | US_DEALER     | sendThroughCode | MissingHeader                            | 7703104059    | 401        | ORCH-0015    | Unauthorized.                         |
      | with L - US_DEALER | /v1/account | application/json | L             | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | MissingHeader | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |


#Passing Empty values

      | with T - US_DEALER | /v1/account | application/json |               | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - US_DEALER | /v1/account | application/json | T             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - US_DEALER | /v1/account | application/json | T             | US_DEALER     |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - US_DEALER | /v1/account | application/json | T             | US_DEALER     | sendThroughCode |                                          | 7703104059    | 401        | ORCH-0015    | Unauthorized.                         |
      | with T - US_DEALER | /v1/account | application/json | T             | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |               | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |

      | with L - US_DEALER | /v1/account | application/json | L             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - US_DEALER | /v1/account | application/json | L             | US_DEALER     |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059    | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - US_DEALER | /v1/account | application/json | L             | US_DEALER     | sendThroughCode |                                          | 7703104059    | 401        | ORCH-0015    | Unauthorized.                         |
      | with L - US_DEALER | /v1/account | application/json | L             | US_DEALER     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |               | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |


  @AcSearchByDealerUsingPhone-InvalidHeaders
  Scenario Outline: Dealer Search for a Customer's Account by Phone number using Dealer Search API exposed from Orchestration layer using invalid headers and expect status code 400 <scenarioName>
    Given The Dealer Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" phone "<phone>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                                         | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID                        | Authorization                            | phone      | statusCode | responseCode | description                     |

      | with Invalid XBRAND-1                                | /v1/account | application/json | t      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-2                                | /v1/account | application/json | l      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-3                                | /v1/account | application/json | A      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-4                                | /v1/account | application/json | 2      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-5                                | /v1/account | application/json | @      | US_DEALER | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-case sensitive             | /v1/account | application/json | T      | us_dealer | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Numbers                    | /v1/account | application/json | T      | 123       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Symbols                    | /v1/account | application/json | T      | !@#       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-LA_SELF                    | /v1/account | application/json | T      | LA_SELF   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account | application/json | T      | US_DEALER | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account | application/json | T      | US_DEALER | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID without hyphen       | /v1/account | application/json | T      | US_DEALER | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 3 hyphens       | /v1/account | application/json | T      | US_DEALER | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 5 hyphens       | /v1/account | application/json | T      | US_DEALER | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with special symbols | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID length 35            | /v1/account | application/json | T      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCHANNEL-case sensitive             | /v1/account | application/json | L      | us_dealer | sendThroughCode                       | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Numbers                    | /v1/account | application/json | L      | 123       | sendThroughCode                       | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Symbols                    | /v1/account | application/json | L      | !@#       | sendThroughCode                       | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-LA_SELF                    | /v1/account | application/json | L      | LA_SELF   | sendThroughCode                       | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account | application/json | L      | US_DEALER | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account | application/json | L      | US_DEALER | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID without hyphen       | /v1/account | application/json | L      | US_DEALER | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 3 hyphens       | /v1/account | application/json | L      | US_DEALER | 123e4567-e89b-12d3-a456426655440000   | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 5 hyphens       | /v1/account | application/json | L      | US_DEALER | 123e4567-e89b-12d3-a456-4266-55440000 | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with special symbols | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID length 35            | /v1/account | application/json | L      | US_DEALER | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | sendThroughCode                          | 7703104059 | 400        | ORCH-0002    | Incorrect/Invalid Header Values |


  @AcSearchByDealerUsingPhone-InvalidUser
  Scenario Outline: Dealer Search for a Customer's Account by Phone number using Dealer Search API exposed from Orchestration layer using invalid user phone and expect status code 404 <scenarioName>
    Given The Dealer Search for a Customer Account GET api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" phone "<phone>"
    And Tester calls the GET service
    Then the Customer account details should be searched in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                            | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | phone       | statusCode | responseCode | description    |
      | with phone without having account       | /v1/account | application/json | T      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 9876543210  | 404        | OCPR-0011    | User Not Found |

      | with T - Invalid Phone number length 1  | /v1/account | application/json | T      | US_DEALER | sendThroughCode | sendThroughCode                          | 7           | 404        | OCPR-0011    | User Not Found |
      | with T - Invalid Phone number length 9  | /v1/account | application/json | T      | US_DEALER | sendThroughCode | sendThroughCode                          | 903104059   | 404        | OCPR-0011    | User Not Found |
      | with T - Invalid Phone number length 11 | /v1/account | application/json | T      | US_DEALER | sendThroughCode | sendThroughCode                          | 77031040599 | 404        | OCPR-0011    | User Not Found |
#      | with T - Invalid Phone with chars       | /v1/account | application/json | T      | US_DEALER | sendThroughCode | sendThroughCode                          | abcdefghig  | 404        | OCPR-0011    | User Not Found |
#      | with T - Invalid Phone with symbols     | /v1/account | application/json | T      | US_DEALER | sendThroughCode | sendThroughCode                          | !@#$%^&*()  | 404        | OCPR-0011    | User Not Found |

      | with L - Invalid Phone number length 1  | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7           | 404        | OCPR-0011    | User Not Found |
      | with L - Invalid Phone number length 9  | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 770310405   | 404        | OCPR-0011    | User Not Found |
      | with L - Invalid Phone number length 11 | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 77031040511 | 404        | OCPR-0011    | User Not Found |
#      | with L - Invalid Phone with chars       | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | abcdefghig  | 404        | OCPR-0011    | User Not Found |
#      | with L - Invalid Phone with symbols     | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | !@#$%^&*()  | 404        | OCPR-0011    | User Not Found |

#  @AcSearchByDealerUsingPhone-InternalServerError/SystemNotAvailable
#  Scenario Outline: Dealer Search for a Customer's Account by Phone number using Dealer Search API exposed from Orchestration layer using valid input when InternalServerError/SystemNotAvailable and expect status code 500 <scenarioName>
#    Given The Dealer Search for a Customer Account GET api service "<basePath>" is down
#    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" phone "<phone>"
#    And Tester calls the GET service
#    Then the Customer account details can not be searched in ORCH and OCPR system by returning Status code "<statusCode>"
#    And the server returns the ResponseCode "<responseCode>" Description "<description>"
#
#    Examples:
#      | scenarioName                                | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | phone      | statusCode | responseCode | description           |
#      | with InternalServerError/SystemNotAvailable | /v1/account | application/json | T      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 7703104059 | 500        | ORCH-0006    | Internal Server Error |


