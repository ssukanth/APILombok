@AcmUpdate_Regression @UpdatesPhone_By_Agents-Self
Feature: Testing Agent/SELF updates Customer's Phone Number - Orchestration Micro Services
  As a tester, I should be able to update Customer's Phone Number as an Agent(TMNA_AGENT,TC_AGENT,SERVCO_AGENT,CA_AGENT) using update Customer's Phone Number Micro service exposed from the Orchestration layer.
  Updates the Customer's Phone Number  and returns minimum required customer information.

  @acm_smoke @AcmUpdate_smoke @UpdatesPhone_By_Agents_Self_Smoke
  Scenario Outline: Agent/SELF updates the Customer's Phone Number using update Customer's Phone Number API exposed from Orchestration layer using valid input parameters (headers and body ) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLName" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server must returns the ResponseCode "ORCH-0000" and Description "Account Created Successfully"
    And the server should return the guid objectId phoneType countryCode phoneNumber phoneVerified verificationDate

    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the valid body parameters guid objectId phoneType countryCode newPhoneNumber "<newPhoneNumber>" phoneVerified verificationDate
    And Tester calls the PUT service
    Then The Customer account should be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"
    And The response must contains the updated Phone Number
    Examples:
      | scenarioName                | basePath          | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | newPhoneNumber  | statusCode | responseCode | description                   |
      | with T - TMNA_AGENT Channel | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with L - CA_AGENT Channel   | /v1/account/phone | application/json | L      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |

    @UpdatesPhone_By_Agents-Self-Positive
  Scenario Outline: Agent/SELF updates the Customer's Phone Number using update Customer's Phone Number API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK <scenarioName>
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLName" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server must returns the ResponseCode "ORCH-0000" and Description "Account Created Successfully"
    And the server should return the guid objectId phoneType countryCode phoneNumber phoneVerified verificationDate

    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the valid body parameters guid objectId phoneType countryCode newPhoneNumber "<newPhoneNumber>" phoneVerified verificationDate
    And Tester calls the PUT service
    Then The Customer account should be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"
    And The response must contains the updated Phone Number
    Examples:
      | scenarioName                  | basePath          | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | newPhoneNumber  | statusCode | responseCode | description                   |
      | with T - TMNA_AGENT Channel   | /v1/account/phone | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with T - TC_AGENT Channel     | /v1/account/phone | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with T - SERVCO_AGENT Channel | /v1/account/phone | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with T - CA_AGENT Channel     | /v1/account/phone | application/json | T      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |

#      | with T - US_SELF Channel      | /v1/account/phone | application/json | T      | US_SELF      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
#      | with T - CA_SELF Channel      | /v1/account/phone | application/json | T      | CA_SELF      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with T - LER Channel          | /v1/account/phone | application/json | T      | LER          | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with T - TRC Channel          | /v1/account/phone | application/json | T      | TRC          | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |

      | with L - TMNA_AGENT Channel   | /v1/account/phone | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with L - TC_AGENT Channel     | /v1/account/phone | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with L - SERVCO_AGENT Channel | /v1/account/phone | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with L - CA_AGENT Channel     | /v1/account/phone | application/json | L      | CA_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |

#      | with L - US_SELF Channel      | /v1/account/phone | application/json | L      | US_SELF      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
#      | with L - CA_SELF Channel      | /v1/account/phone | application/json | L      | CA_SELF      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with L - LER Channel          | /v1/account/phone | application/json | L      | LER          | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |
      | with L - TRC Channel          | /v1/account/phone | application/json | L      | TRC          | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | sendThroughCode | 200        | OCPR-0000    | Request Executed Successfully |


  @UpdatesPhone_By_Agents-Self-MissingHeaders
  Scenario Outline: Agent/SELF updates the Customer's Phone Number using update Customer's Phone Number API exposed from Orchestration layer using missing headers and expect status code 400 <scenarioName>
    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "ffa87b3fb14346aa9722be96ae8dc1db" objectId "ffa87b3f-b143-46aa-9722-be96ae8dc1db" phoneType "MOBILE" countryCode "1" newPhoneNumber "7703104059" phoneVerified "false" verificationDate ""
    And Tester calls the PUT service
    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                                    | basePath          | ContentType      | XBRAND        | XCHANNEL      | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                           |
#Removing both Key & Value pairs
      | with XBRAND Header Key & Value pair             | /v1/account/phone | application/json | MissingHeader | TMNA_AGENT    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - XCHANNEL Header Key & Value pair       | /v1/account/phone | application/json | T             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - XCORRELATIONID Header Key & Value pair | /v1/account/phone | application/json | T             | TC_AGENT      | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Authorization Header Key & Value pair  | /v1/account/phone | application/json | T             | CA_AGENT      | sendThroughCode | MissingHeader                            | 401        | ORCH-0015    | Unauthorized.                         |

      | with L - XCHANNEL Header Key & Value pair       | /v1/account/phone | application/json | L             | MissingHeader | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - XCORRELATIONID Header Key & Value pair | /v1/account/phone | application/json | L             | TC_AGENT      | MissingHeader   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - Authorization Header Key & Value pair  | /v1/account/phone | application/json | L             | SERVCO_AGENT  | sendThroughCode | MissingHeader                            | 401        | ORCH-0015    | Unauthorized.                         |

##Passing Empty values
      | with XBRAND Header Value                        | /v1/account/phone | application/json |               | TMNA_AGENT    | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - XCHANNEL Header Value                  | /v1/account/phone | application/json | T             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - XCORRELATIONID HeaderValue             | /v1/account/phone | application/json | T             | TC_AGENT      |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with T - Authorization Header Value             | /v1/account/phone | application/json | T             | SERVCO_AGENT  | sendThroughCode |                                          | 401        | ORCH-0015    | Unauthorized.                         |

      | with L - XCHANNEL Header Value                  | /v1/account/phone | application/json | L             |               | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - XCORRELATIONID HeaderValue             | /v1/account/phone | application/json | L             | TC_AGENT      |                 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0001    | Mandatory Header Attribute(s) Missing |
      | with L - Authorization Header Value             | /v1/account/phone | application/json | L             | CA_AGENT      | sendThroughCode |                                          | 401        | ORCH-0015    | Unauthorized.                         |

  @UpdatesPhone_By_Agents-Self-InvalidHeaders
  Scenario Outline: Agent/SELF updates the Customer's Phone Number using update Customer's Phone Number API exposed from Orchestration layer using invalid headers and expect status code 400 <scenarioName>
    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "ffa87b3fb14346aa9722be96ae8dc1db" objectId "ffa87b3f-b143-46aa-9722-be96ae8dc1db" phoneType "MOBILE" countryCode "1" newPhoneNumber "7703104059" phoneVerified "false" verificationDate ""
    And Tester calls the PUT service
    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                                         | basePath          | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID                        | Authorization                            | statusCode | responseCode | description                     |
      | with Invalid XBRAND-1                                | /v1/account/phone | application/json | t      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-2                                | /v1/account/phone | application/json | l      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-3                                | /v1/account/phone | application/json | A      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-4                                | /v1/account/phone | application/json | 2      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with Invalid XBRAND-5                                | /v1/account/phone | application/json | @      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-case sensitive             | /v1/account/phone | application/json | T      | us_dealer    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Numbers                    | /v1/account/phone | application/json | T      | 123          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Symbols                    | /v1/account/phone | application/json | T      | !@#          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-LA_SELF                    | /v1/account/phone | application/json | T      | LA_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account/phone | application/json | T      | TC_AGENT     | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account/phone | application/json | T      | TC_AGENT     | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account/phone | application/json | T      | TC_AGENT     | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account/phone | application/json | T      | TC_AGENT     | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account/phone | application/json | T      | TC_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID without hyphen       | /v1/account/phone | application/json | T      | SERVCO_AGENT | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 3 hyphens       | /v1/account/phone | application/json | T      | SERVCO_AGENT | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 5 hyphens       | /v1/account/phone | application/json | T      | SERVCO_AGENT | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with special symbols | /v1/account/phone | application/json | T      | CA_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID length 35            | /v1/account/phone | application/json | T      | CA_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

#      | with T - Invalid Authorization                       | /v1/account/email | application/json | T      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7  | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
#      | with T - Invalid Authorization                       | /v1/account/email | application/json | T      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7A | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCHANNEL-case sensitive             | /v1/account/phone | application/json | L      | us_dealer    | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Numbers                    | /v1/account/phone | application/json | L      | 123          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-Symbols                    | /v1/account/phone | application/json | L      | !@#          | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCHANNEL-LA_SELF                    | /v1/account/phone | application/json | L      | LA_SELF      | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

      | with T - Invalid XCORRELATIONID format 9-4-4-4-12    | /v1/account/phone | application/json | L      | TC_AGENT     | 176558819-aace-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-5-4-4-12    | /v1/account/phone | application/json | L      | TC_AGENT     | 17655881-aace5-43a2-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-5-4-12    | /v1/account/phone | application/json | L      | TC_AGENT     | 17655881-aace-43a25-a58e-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-5-12    | /v1/account/phone | application/json | L      | TC_AGENT     | 17655881-aace-43a2-a58e5-2c3e1fd0eb93 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID format 8-4-4-4-13    | /v1/account/phone | application/json | L      | TC_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0eb93A | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID without hyphen       | /v1/account/phone | application/json | L      | SERVCO_AGENT | 17655881AaaceA43a2Aa58eA2c3e1fd0eb93  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 3 hyphens       | /v1/account/phone | application/json | L      | SERVCO_AGENT | 123e4567-e89b-12d3-a456426655440000   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with 5 hyphens       | /v1/account/phone | application/json | L      | SERVCO_AGENT | 123e4567-e89b-12d3-a456-4266-55440000 | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID with special symbols | /v1/account/phone | application/json | L      | CA_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0e!@#  | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
      | with T - Invalid XCORRELATIONID length 35            | /v1/account/phone | application/json | L      | CA_AGENT     | 17655881-aace-43a2-a58e-2c3e1fd0eb9   | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0002    | Incorrect/Invalid Header Values |

#      | with T - Invalid Authorization                       | /v1/account/phone | application/json | L      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7  | 400        | ORCH-0002    | Incorrect/Invalid Header Values |
#      | with T - Invalid Authorization                       | /v1/account/phone | application/json | L      | TMNA_AGENT   | sendThroughCode                       | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7A | 400        | ORCH-0002    | Incorrect/Invalid Header Values |


  @UpdatesPhone_By_Agents-Self-MissingBody
  Scenario Outline: Agent/SELF updates the Customer's Phone Number using update Customer's Phone Number API exposed from Orchestration layer by MISSING WHOLE BODY INCLUDING {} BRACES and expect status code 400 and appropriate response payload <scenarioName>
    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester calls the PUT service without body including braces
    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                  | basePath          | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                               |
      | with T - TMNA_AGENT Channel   | /v1/account/phone | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - TC_AGENT Channel     | /v1/account/phone | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - SERVCO_AGENT Channel | /v1/account/phone | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - TC_AGENT Channel     | /v1/account/phone | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

      | with L - TMNA_AGENT Channel   | /v1/account/phone | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - TC_AGENT Channel     | /v1/account/phone | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - SERVCO_AGENT Channel | /v1/account/phone | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - TC_AGENT Channel     | /v1/account/phone | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

  @UpdatesPhone_By_Agents-Self-MissingBody
  Scenario Outline: Agent/SELF updates the Customer's Phone Number using update Customer's Phone Number API exposed from Orchestration layer by MISSING WHOLE BODY EXCLUDING {} BRACES and expect status code 400 and appropriate response payload <scenarioName>
    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester calls the PUT service without body excluding braces
    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                  | basePath          | ContentType      | XBRAND | XCHANNEL     | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                               |
      | with T - TMNA_AGENT Channel   | /v1/account/phone | application/json | T      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - TC_AGENT Channel     | /v1/account/phone | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - SERVCO_AGENT Channel | /v1/account/phone | application/json | T      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - TC_AGENT Channel     | /v1/account/phone | application/json | T      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

      | with L - TMNA_AGENT Channel   | /v1/account/phone | application/json | L      | TMNA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - TC_AGENT Channel     | /v1/account/phone | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - SERVCO_AGENT Channel | /v1/account/phone | application/json | L      | SERVCO_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - TC_AGENT Channel     | /v1/account/phone | application/json | L      | TC_AGENT     | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

  @UpdatesPhone_By_Agents-Self-MissingBody-New
  Scenario Outline: Agent/SELF updates the Customer's Phone Number using update Customer's Phone Number API exposed from Orchestration layer by missing mandatory body(both kay,value ) and expect status code 400 and appropriate response payload <scenarioName>
    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" objectId "<objectId>" phoneType "<phoneType>" countryCode "<countryCode>" newPhoneNumber "<newPhoneNumber>" phoneVerified "<phoneVerified>" verificationDate "<verificationDate>"
    And Tester calls the PUT service
    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                         | basePath          | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | phoneType | countryCode | newPhoneNumber | phoneVerified | verificationDate | statusCode | responseCode | description                               |
      | with T - missing body - guid         | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | 7703104059     | false         |                  | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - missing body - objectId     | /v1/account/phone | application/json | T      | TC_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | null                                 | Azure     | 1           | 7703104059     | false         |                  | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - missing body - Phone Number | /v1/account/phone | application/json | T      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | null           | false         |                  | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with T - missing body - phoneVerfied | /v1/account/phone | application/json | T      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | 7703104059     | null          |                  | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

      | with L - missing body - guid         | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | null                             | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | 7703104059     | false         |                  | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - missing body - objectId     | /v1/account/phone | application/json | L      | TC_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | null                                 | Azure     | 1           | 7703104059     | false         |                  | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - missing body - Phone Number | /v1/account/phone | application/json | L      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | null           | false         |                  | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |
      | with L - missing body - phoneVerfied | /v1/account/phone | application/json | L      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | 7703104059     | null          |                  | 400        | ORCH-0003    | Mandatory Request Body Attributes Missing |

  @UpdatesPhone_By_Agents-Self-InValidBody-New
  Scenario Outline: Agent/SELF updates the Customer's Phone Number using update Customer's Phone Number API exposed from Orchestration layer by missing mandatory body and expect status code 400 and appropriate response payload <scenarioName>
    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" objectId "<objectId>" phoneType "<phoneType>" countryCode "<countryCode>" newPhoneNumber "<newPhoneNumber>" phoneVerified "<phoneVerified>" verificationDate "<verificationDate>"
    And Tester calls the PUT service
    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                         | basePath          | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | phoneType | countryCode | newPhoneNumber | phoneVerified | verificationDate | statusCode | responseCode | description                                 |
      | with T - missing body - guid         | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - missing body - objectId     | /v1/account/phone | application/json | T      | TC_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db |                                      | Azure     | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - missing body - Phone Number | /v1/account/phone | application/json | T      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           |                | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - missing body - phoneVerfied | /v1/account/phone | application/json | T      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | 7703104059     |               |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - missing body - guid         | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |                                  | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - missing body - objectId     | /v1/account/phone | application/json | L      | TC_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db |                                      | Azure     | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - missing body - Phone Number | /v1/account/phone | application/json | L      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           |                | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - missing body - phoneVerfied | /v1/account/phone | application/json | L      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1db | Azure     | 1           | 7703104059     |               |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

  @UpdatesPhone_By_Agents-Self-InValidBody
  Scenario Outline: UpdatesPhone_By_Agents-Self-InValidBodyAgent/SELF updates the Customer's Phone Number using update Customer's Phone Number API exposed from Orchestration layer by using invalid input body and expect status code 400 and appropriate response payload <scenarioName>
    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" objectId "<objectId>" phoneType "<phoneType>" countryCode "<countryCode>" newPhoneNumber "<newPhoneNumber>" phoneVerified "<phoneVerified>" verificationDate "<verificationDate>"
    And Tester calls the PUT service
    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                                            | basePath          | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                              | objectId                              | phoneType | countryCode | newPhoneNumber | phoneVerified | verificationDate | statusCode | responseCode | description                                 |
      | with T - invalid body - guid length 31                  | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1d   | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - guid length 33                  | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1dba | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - guid symbols !@                 | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc!@#  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with T - invalid body - objectId len 35                 | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1d   | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - objectId len 37                 | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1dbA | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with T - invalid body - phoneType cases sensitive-1     | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | mobile    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - phoneType cases sensitive-2     | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | landline  | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - phoneType cases sensitive-3     | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | other     | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - phoneType Numbers               | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 123456    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - phoneType Symbols               | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | !@#$%^    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with T - invalid body - countryCode Chars               | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | A           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - countryCode Symbols             | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | @           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with T - invalid body - Phone # with 1 digit            | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 1              | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Phone # with 9 digit            | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 123456789      | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Phone # with 11 digit           | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 12345678901    | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Phone # with characters         | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | characters     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - Phone # with Symbols            | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | !@#$%^&*()     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with T - invalid body - PhoneVerified cases sensitive-1 | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | TRUE          |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - PhoneVerified cases sensitive-2 | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | FALSE         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - PhoneVerified Numbers           | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | 2134          |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with T - invalid body - PhoneVerified Symbols           | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | !@#$%         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

#      | with T - invalid body - verificationDate  12 digits     | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         | 151179658338     | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
#      | with T - invalid body - verificationDate  14 digits     | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         | 1511796583386    | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
#      | with T - invalid body - verificationDate  Chars         | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         | abcdefghijklm    | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
#      | with T - invalid body - verificationDate  symbols       | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         | !@#$%^&*()!@#    | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
##Lexus
      | with L - invalid body - guid length 31                  | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1d   | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - guid length 33                  | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1dba | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - guid symbols !@                 | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc!@#  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - objectId len 35                 | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1d   | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - objectId len 37                 | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1dbA | MOBILE    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - phoneType cases sensitive-1     | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | mobile    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - phoneType cases sensitive-2     | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | landline  | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - phoneType cases sensitive-3     | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | other     | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - phoneType Numbers               | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | 123456    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - phoneType Symbols               | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | !@#$%^    | 1           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - countryCode Chars               | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | A           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - countryCode Symbols             | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | @           | 7703104059     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - Phone # with 1 digit            | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 1              | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Phone # with 9 digit            | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 123456789      | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Phone # with 11 digit           | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 12345678901    | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Phone # with characters         | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | characters     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - Phone # with Symbols            | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | !@#$%^&*()     | false         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

      | with L - invalid body - PhoneVerified cases sensitive-1 | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | TRUE          |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - PhoneVerified cases sensitive-2 | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | FALSE         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - PhoneVerified Numbers           | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | 2134          |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
      | with L - invalid body - PhoneVerified Symbols           | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | !@#$%         |                  | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

#      | with L - invalid body - verificationDate  12 digits     | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         | 151179658338     | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
#      | with L - invalid body - verificationDate  14 digits     | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         | 1511796583386    | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
#      | with L - invalid body - verificationDate  Chars         | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         | abcdefghijklm    | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |
#      | with L - invalid body - verificationDate  symbols       | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db  | ffa87b3f-b143-46aa-9722-be96ae8dc1db  | MOBILE    | 1           | 7703104059     | false         | !@#$%^&*()!@#    | 400        | ORCH-0004    | Incorrect/Invalid Request Body Attribute(s) |

  @UpdatesPhone_By_Agents-Self-ExistedUser
  Scenario Outline: Agent updates the Customer's Email using update Customer's Email API exposed from Orchestration layer by using existed user phone number and expect status code 400 and appropriate response payload <scenarioName> (Step-1: Create a 1st account and store guid,objectId Step-2: Create 2nd account and store Phone Number Step-3: Update the 1st account with 2nd account Phone Number)
    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLName" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server must returns the ResponseCode "ORCH-0000" and Description "Account Created Successfully"
    And the server should return the guid objectId phoneType countryCode phoneNumber phoneVerified verificationDate

    Given Tester calls the Create Customer Account POST api at "/v1/account"
    And Tester uses the headers with ContentType "application/json" XBRAND "T" XCHANNEL "TMNA_AGENT" XCORRELATIONID "sendThroughCode" Authorization "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t"
    When Tester post the service with json body having customerType "PERSON" firstName "TFname" lastName "TLName" email "sendThroughCode" phone "sendThroughCode"
    Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code "201"
    And the server must returns the ResponseCode "ORCH-0000" and Description "Account Created Successfully"
    And the server should return the newGuid newObjectId newPhoneType newCountryCode newPhoneNumber newPhoneVerified newVerificationDate

    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid objectId phoneType countryCode phoneVerified verificationDate with existedUserPhoneNumber
    And Tester calls the PUT service
    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                 | basePath          | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description         |
      | with T - Existed User Phone# | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0010    | User Already Exists |
      | with L - Existed User Phone# | /v1/account/phone | application/json | L      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 400        | ORCH-0010    | User Already Exists |

#  @UpdatesPhone_By_Agents-Self-ExistedUser
#  Scenario Outline: Agent updates the Customer's Email using update Customer's Email API exposed from Orchestration layer by using existed user phone number and expect status code 400 and appropriate response payload <scenarioName>
#    Given The update Customer's Phone Number PUT api service "<basePath>" is up
#    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
#    And Tester uses the body parameters guid "<guid>" objectId "<objectId>" phoneType "<phoneType>" countryCode "<countryCode>" newPhoneNumber "<existedUserPhoneNumber>" phoneVerified "<phoneVerified>" verificationDate "<verificationDate>"
#    And Tester calls the PUT service
#    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
#    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"
#
#    Examples:
#      | scenarioName                 | basePath          | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | phoneType | countryCode | existedUserPhoneNumber | phoneVerified | verificationDate | statusCode | responseCode | description         |
#      | with T - Existed User Phone# | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | d49adfda844946e2bd388d00a2485303 | d49adfda-8449-46e2-bd38-8d00a2485303 | MOBILE    | 1           | 9234500003             | false         |                  | 400        | ORCH-0010    | User Already Exists |
#      | with L - Existed User Phone# | /v1/account/phone | application/json | L      | CA_AGENT   | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 6875910b6c464fdb96df4a82b29e7fdf | 6875910b-6c46-4fdb-96df-4a82b29e7fdf | MOBILE    | 1           | 9234500004             | false         |                  | 400        | ORCH-0010    | User Already Exists |

  @UpdatesPhone_By_Agents-Self-InValidUser
  Scenario Outline: Agent updates the Customer's Email using update Customer's Email API exposed from Orchestration layer by using invalid objectId(Invalid User) and expect status code 404 and appropriate response payload <scenarioName>
    Given The update Customer's Phone Number PUT api service "<basePath>" is up
    When The Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    And Tester uses the body parameters guid "<guid>" objectId "<objectId>" phoneType "<phoneType>" countryCode "<countryCode>" newPhoneNumber "<newPhoneNumber>" phoneVerified "<phoneVerified>" verificationDate "<verificationDate>"
    And Tester calls the PUT service
    Then The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code "<statusCode>"
    And the server must returns the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | scenarioName                     | basePath          | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                            | guid                             | objectId                             | phoneType | countryCode | newPhoneNumber | phoneVerified | verificationDate | statusCode | responseCode | description    |
      | with T - invalid body - objectId | /v1/account/phone | application/json | T      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | ffa87b3fb14346aa9722be96ae8dc1db | ffa87b3f-b143-46aa-9722-be96ae8dc1dA | MOBILE    | 1           | 9234569999     | false         |                  | 404        | ORCH-0011    | User Not Found |
      | with L - invalid body - objectId | /v1/account/phone | application/json | L      | TMNA_AGENT | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | 03dae37ba0dd4af199d73a61d39622d0 | 03dae37b-a0dd-4af1-99d7-3a61d39622dL | MOBILE    | 1           | 9234569999     | false         |                  | 404        | ORCH-0011    | User Not Found |

