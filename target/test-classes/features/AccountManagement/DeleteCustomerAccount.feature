@AcmUpdate_Regression @deleteCustomerAc_Regression
Feature: Testing Delete Customer Account  - Orchestration Micro Services
  As a tester, I should be able to delete the Customer Account by using Delete Customer Account Micro service exposed from the Orchestration layer.

  @acm_smoke @AcmUpdate_smoke @deleteCustomerAc_Smoke
  Scenario Outline: Delete the Customer account using Delete Customer Account API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLname" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server returns ResponseCode "ORCH-0000" Description "Account Created Successfully"
    And the response payload must match with the request payload for customerType "PERSON" firstName "TFname" lastName "TLname" email "sendThroughCode" phone "sendThroughCode" and GUID is not NULL or Empty

    Given The Delete Customer Account DELETE api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and guid
    And Tester calls the DELETE service
    Then the Customer account should be deleted in OCPR system by returning Status code "<searchStatusCode>"
   # And the server returns the ResponseCode "<searchResponseCode>" Description "<searchDescription>"
    Examples:
      | scenarioName           | basePath    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | searchStatusCode | searchResponseCode | searchDescription             |
      | with Toyota TMNA_AGENT | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |
      | with Lexus CA_AGENT    | /v1/account | application/json | L      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |

  @deleteCustomerAc_positive
  Scenario Outline: Delete the Customer account using Delete Customer Account API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLname" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server returns ResponseCode "ORCH-0000" Description "Account Created Successfully"
    And the response payload must match with the request payload for customerType "PERSON" firstName "TFname" lastName "TLname" email "sendThroughCode" phone "sendThroughCode" and GUID is not NULL or Empty

    Given The Delete Customer Account DELETE api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and guid
    And Tester calls the DELETE service
    Then the Customer account should be deleted in OCPR system by returning Status code "<searchStatusCode>"
 #   And the server returns the ResponseCode "<searchResponseCode>" Description "<searchDescription>"
    Examples:
      | scenarioName        | basePath    | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | searchStatusCode | searchResponseCode | searchDescription             |
      | with T TMNA_AGENT   | /v1/account | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |
      | with T TC_AGENT     | /v1/account | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |
      | with T SERVCO_AGENT | /v1/account | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |
      | with T CA_AGENT     | /v1/account | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |

      | with L TMNA_AGENT   | /v1/account | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |
      | with L TC_AGENT     | /v1/account | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |
      | with L SERVCO_AGENT | /v1/account | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |
      | with L CA_AGENT     | /v1/account | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 204              | OCPR-0000          | Request Executed Successfully |

  @deleteCustomerAc_MissingHeaders
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer by missing mandatory headers and expect status code 400 and appropriate response payload <scenarioName>
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLname" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server returns ResponseCode "ORCH-0000" Description "Account Created Successfully"
    And the response payload must match with the request payload for customerType "PERSON" firstName "TFname" lastName "TLname" email "sendThroughCode" phone "sendThroughCode" and GUID is not NULL or Empty
    
    Given The Delete Customer Account DELETE api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and guid 
    And Tester calls the DELETE service
    Then the Customer account should not be deleted in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                             | basePath    | ContentType      | XBRAND        | XCHANNEL      | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                           |
##Removing both Key & Value pairs
      | with missing header - XBRAND             | /v1/account | application/json | 	 		  | TMNA_AGENT    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCHANNEL       | /v1/account | application/json | T             | 			   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCORRELATIONID | /v1/account | application/json | T             | TMNA_AGENT    | 			     | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - Authorization  | /v1/account | application/json | T             | TMNA_AGENT    | sendThroughCode |                                          | 401        | ORCH-0015    | Unauthorized.                         |

      | with L - missing header - XCHANNEL       | /v1/account | application/json | L             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - XCORRELATIONID | /v1/account | application/json | L             | TMNA_AGENT    |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - Authorization  | /v1/account | application/json | L             | TMNA_AGENT    | sendThroughCode |                                          | 401        | ORCH-0015    | Unauthorized.                         |
###Passing Empty values
      | with missing header - XBRAND             | /v1/account | application/json |               | TMNA_AGENT    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCHANNEL       | /v1/account | application/json | T             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - XCORRELATIONID | /v1/account | application/json | T             | TMNA_AGENT    |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - missing header - Authorization  | /v1/account | application/json | T             | TMNA_AGENT    | sendThroughCode |                                          | 401        | ORCH-0015    | Unauthorized.                         |

      | with L - missing header - XCHANNEL       | /v1/account | application/json | L             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - XCORRELATIONID | /v1/account | application/json | L             | TMNA_AGENT    |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - missing header - Authorization  | /v1/account | application/json | L             | TMNA_AGENT    | sendThroughCode |                                          | 401        | ORCH-0015    | Unauthorized.                         |

  @deleteCustomerAc_MissingAuthorization
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using by missing mandatory Header of Authorization and expect status code 401 <scenarioName>
    Given The Delete Customer Account DELETE api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and guid
    And Tester calls the DELETE service
    Then the Customer account should not be deleted in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                            | basePath    | ContentType      | XBRAND | XCHANNEL      | XCORRELATIONID  | Authorization | statusCode | responseCode | description   |
##Removing both Key & Value pairs
      | with T - missing header - Authorization | /v1/account | application/json | T      | TMNA_AGENT    | sendThroughCode |               | 401        | ORCH-0015    | Unauthorized. |
      | with L - missing header - Authorization | /v1/account | application/json | L      | TMNA_AGENT    | sendThroughCode |               | 401        | ORCH-0015    | Unauthorized. |
##Passing Empty values
      | with T - missing header - Authorization | /v1/account | application/json | T      | TMNA_AGENT    | sendThroughCode |               | 401        | ORCH-0015    | Unauthorized. |
      | with L - missing header - Authorization | /v1/account | application/json | L      | TMNA_AGENT    | sendThroughCode |               | 401        | ORCH-0015    | Unauthorized. |

  @deleteCustomerAc_InvalidHeaders
  
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using invalid Headers and expect status code 404 <scenarioName>
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLname" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server returns ResponseCode "ORCH-0000" Description "Account Created Successfully"
    And the response payload must match with the request payload for customerType "PERSON" firstName "TFname" lastName "TLname" email "sendThroughCode" phone "sendThroughCode" and GUID is not NULL or Empty
    
    Given The Delete Customer Account DELETE api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and guid
    And Tester calls the DELETE service
    Then the Customer account should not be deleted in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName                                         | basePath    | ContentType      | XBRAND | XCHANNEL      | XCORRELATIONID                        | Authorization                            | statusCode | responseCode | description                     |
      | with invalid header - XBRAND                         | /v1/account | application/json | t      | TMNA_AGENT    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account | application/json | l      | TMNA_AGENT    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account | application/json | A      | TMNA_AGENT    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account | application/json | 2      | TMNA_AGENT    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with invalid header - XBRAND                         | /v1/account | application/json | @      | TMNA_AGENT    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-case sensitive             | /v1/account | application/json | T      | us_dealer     | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Numbers                    | /v1/account | application/json | T      | 123           | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Symbols                    | /v1/account | application/json | T      | !@#           | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-US_SELF                    | /v1/account | application/json | T      | US_SELF       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-CA_SELF                    | /v1/account | application/json | T      | CA_SELF       | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-US_DEALER                  | /v1/account | application/json | T      | US_DEALER     | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-CA_DEALER                  | /v1/account | application/json | T      | CA_DEALER     | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account | application/json | T      | TMNA_AGENT    | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account | application/json | T      | TMNA_AGENT    | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account | application/json | T      | TMNA_AGENT    | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account | application/json | T      | TMNA_AGENT    | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account | application/json | T      | TMNA_AGENT    | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID without hyphen       | /v1/account | application/json | T      | TMNA_AGENT    | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 3 hyphens       | /v1/account | application/json | T      | TMNA_AGENT    | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 5 hyphens       | /v1/account | application/json | T      | TMNA_AGENT    | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with special symbols | /v1/account | application/json | T      | TMNA_AGENT    | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID length 35            | /v1/account | application/json | T      | TMNA_AGENT    | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCHANNEL-case sensitive             | /v1/account | application/json | L      | us_dealer     | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Numbers                    | /v1/account | application/json | L      | 123           | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-Symbols                    | /v1/account | application/json | L      | !@#           | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCHANNEL-US_SELF                    | /v1/account | application/json | L      | US_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-CA_SELF                    | /v1/account | application/json | L      | CA_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-US_DEALER                  | /v1/account | application/json | L      | US_DEALER    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCHANNEL-CA_DEALER                  | /v1/account | application/json | L      | CA_DEALER    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with L - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account | application/json | L      | TMNA_AGENT    | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account | application/json | L      | TMNA_AGENT    | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account | application/json | L      | TMNA_AGENT    | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account | application/json | L      | TMNA_AGENT    | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account | application/json | L      | TMNA_AGENT    | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID without hyphen       | /v1/account | application/json | L      | TMNA_AGENT    | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 3 hyphens       | /v1/account | application/json | L      | TMNA_AGENT    | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with 5 hyphens       | /v1/account | application/json | L      | TMNA_AGENT    | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID with special symbols | /v1/account | application/json | L      | TMNA_AGENT    | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with L - Invalid XCORRELATIONID length 35            | /v1/account | application/json | L      | TMNA_AGENT    | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

  @deleteCustomerAc_InvalidUser
  Scenario Outline: Customer calls the update Password API to update the password exposed from Orchestration layer using invalid objectId(Invalid User) and expect status code 404 <scenarioName>
    Given The Delete Customer Account DELETE api service "<basePath>" is up
    When Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" and guid "<objectId>"
    And Tester calls the DELETE service
    Then the Customer account should not be deleted in OCPR system by returning Status code "<statusCode>"
    And the server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples:
      | scenarioName         | basePath    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | objectId                             | statusCode | responseCode | description    |
      | with T - InValidUser | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3f-b143-46aa-9722-be96ae8dc1dA | 404        | ORCH-0011    | User Not Found |
      | with L - InValidUser | /v1/account | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 03dae37b-a0dd-4af1-99d7-3a61d39622dL | 404        | ORCH-0011    | User Not Found |
