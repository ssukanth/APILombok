Feature: As a tester I should be able to test Endpoints if it accepts request to cancel subscription for a vehicle

  @OrchSubCancel_Smoke
  Scenario Outline: Cancel subscription for a vehicle with valid input data <Message>
    Given Tester calls the Orchestration Subscription PUT api with basePath
    When The user inputs for Orchestration-Subscription PUT API ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester put the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionIds "<subscriptionIds>"
    Then the Orch-Subscription PUT API returns the "<Status>" status code
    And The Orch-Subscription PUT API body response should have the ResponseCode "<responseCode>" , Description "<description>"

    Examples:
      | Message                | Status | responseCode | description                    | ContentType      | XCHANNEL | XBRAND | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | subscriptionIds              |
      | Acknowledged_Request_1 | 200    | ORCH-8000    | Request Processed Successfully | application/json | US_SELF  | T      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 5GZCZ23D13S847842 | 454c49b71d704e11b82377527291a2f4 | 5GZCZ23D13S847842-2445658080 |

   #200 - Success
  @OrchSubCancel
  Scenario Outline: Cancel subscription for a vehicle with valid input data "<Message>"
    Given Tester calls the Orchestration Subscription PUT api with basePath
    When The user inputs for Orchestration-Subscription PUT API ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester put the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionIds "<subscriptionIds>"
    Then the Orch-Subscription PUT API returns the "<Status>" status code
    And The Orch-Subscription PUT API body response should have the ResponseCode "<responseCode>" , Description "<description>"

    Examples:
      | Message                 | Status | responseCode | description                    | ContentType      | XCHANNEL   | XBRAND | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | subscriptionIds                 |
      | Acknowledged_Request_1  | 200    | ORCH-8000    | Request Processed Successfully | application/json | US_SELF    | T      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116748 | a0d4559c706d47df97b4d7754e3e8182 | 1J4GA59167L116748-4358709242    |
      | Acknowledged_Request_2  | 200    | ORCH-8000    | Request Processed Successfully | application/json | US_DEALER  | T      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116749 | 23d671b63d2b4c8c94e0e4e11443b232 | 1J4GA59167L116749-4358868526    |
      | Acknowledged_Request_3  | 200    | ORCH-8000    | Request Processed Successfully | application/json | TMNA_AGENT | T      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCNCREC1EZ248023 | a0d4559c706d47df97b4d7754e3e8182 | 1GCNCREC1EZ248023-4342756354    |
      | Acknowledged_Request_4  | 200    | ORCH-8000    | Request Processed Successfully | application/json | TC_AGENT   | T      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 8K7ZZ59167S555577 | a0d4559c706d47df97b4d7754e3e8182 | 8K7ZZ59167S555577-4342915452    |
      | Acknowledged_Request_5  | 200    | ORCH-8000    | Request Processed Successfully | application/json | CA_SELF    | T      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_6  | 200    | ORCH-8000    | Request Processed Successfully | application/json | CA_DEALER  | T      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_7  | 200    | ORCH-8000    | Request Processed Successfully | application/json | LER        | T      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_8  | 200    | ORCH-8000    | Request Processed Successfully | application/json | TRC        | T      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_9  | 200    | ORCH-8000    | Request Processed Successfully | application/json | US_SELF    | L      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_10 | 200    | ORCH-8000    | Request Processed Successfully | application/json | US_DEALER  | L      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_11 | 200    | ORCH-8000    | Request Processed Successfully | application/json | TMNA_AGENT | L      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_12 | 200    | ORCH-8000    | Request Processed Successfully | application/json | TC_AGENT   | L      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_13 | 200    | ORCH-8000    | Request Processed Successfully | application/json | CA_SELF    | L      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_14 | 200    | ORCH-8000    | Request Processed Successfully | application/json | CA_DEALER  | L      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_15 | 200    | ORCH-8000    | Request Processed Successfully | application/json | LER        | L      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Acknowledged_Request_16 | 200    | ORCH-8000    | Request Processed Successfully | application/json | TRC        | L      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |

 #400 - Mandatory Header Attribute(s) Missing
  @MissingOrSUBHD @OrchSubCancelNegative
  Scenario Outline: Verify Cancel subscription for a vehicle with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the Orchestration Subscription PUT api with basePath
    When The user inputs for Orchestration-Subscription PUT API ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester put the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionIds "<subscriptionIds>"
    Then the Orch-Subscription PUT API returns the "<Status>" status code
    And The Orch-Subscription PUT API body response should have the ResponseCode "<responseCode>" , Description "<description>"

    Examples:
      | Message                        | Status | responseCode | description                           | ContentType      | XCHANNEL   | XBRAND | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               | subscriberGuid                   | subscriptionIds                 |
      | Header_Missing X-CHANNEL       | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json |            | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Header_Missing X-CORRELATIONID | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | US_DEALER  | L      |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Header_Missing Authorization   | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | TMNA_AGENT | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Header_Missing DATETIME        | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | TC_AGENT   | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Header_Missing X-BRAND         | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | CA_DEALER  |        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |

   #400 - Incorrect/Invalid Header Values
  @InvlaidOrSUBHD @OrchSubCancelNegative
  Scenario Outline: Verify Cancel subscription for a vehicle with Incorrect/Invalid Header Values as invalid input data <Message>
    Given Tester calls the Orchestration Subscription PUT api with basePath
    When The user inputs for Orchestration-Subscription PUT API ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester put the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionIds "<subscriptionIds>"
    Then the Orch-Subscription PUT API returns the "<Status>" status code
    And The Orch-Subscription PUT API body response should have the ResponseCode "<responseCode>" , Description "<description>"

    Examples:
      | Message                           | Status | responseCode | description                     | ContentType      | XCHANNEL   | XBRAND | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               | subscriberGuid                   | subscriptionIds                 |
      | Incorrect/Invalid X-CHANNEL       | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | US_SELF!@  | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Incorrect/Invalid X-CORRELATIONID | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | US_DEALER  | T      | c52fdc72-8a0e-4600-92b0              | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Incorrect/Invalid Authorization   | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | TMNA_AGENT | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 923gf7126h44b14d3             | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Incorrect/Invalid DATETIME        | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | TC_AGENT   | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 151386        | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Incorrect/Invalid X-BRAND         | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | CA_DEALER  | B      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |

  #400 - Mandatory Request Body Attribute(s) Missing
  @MissingOrchBody @OrchSubCancelNegative
  Scenario Outline: Verify Cancel subscription for a vehicle with Mandatory Request Body Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the Orchestration Subscription PUT api with basePath
    When The user inputs for Orchestration-Subscription PUT API ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester put the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionIds "<subscriptionIds>"
    Then the Orch-Subscription PUT API returns the "<Status>" status code
    And The Orch-Subscription PUT API body response should have the ResponseCode "<responseCode>" , Description "<description>"

    Examples:
      | Message                                | Status | responseCode | description                               | ContentType      | XCHANNEL   | XBRAND | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               | subscriberGuid                   | subscriptionIds                 |
      | Body_Attribute_Missing_vin             | 400    | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | US_SELF    | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |                   | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Body_Attribute_Missing_subscriberGuid  | 400    | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | US_DEALER  | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 |                                  | ESEL1R3KLMJ9N7654-1531754984312 |
      | Body_Attribute_Missing_subscriptionIds | 400    | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | TMNA_AGENT | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c706d47df97b4d7754e3e8182 |                                 |

 #400 - Incorrect/Invalid Request body attributes
  @InvalidOrchBody @OrchSubCancelNegative
  Scenario Outline: Verify Cancel subscription for a vehicle with Incorrect/Invalid Request body attributes as invalid input data <Message>
    Given Tester calls the Orchestration Subscription PUT api with basePath
    When The user inputs for Orchestration-Subscription PUT API ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester put the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionIds "<subscriptionIds>"
    Then the Orch-Subscription PUT API returns the "<Status>" status code
    And The Orch-Subscription PUT API body response should have the ResponseCode "<responseCode>" , Description "<description>"

    Examples:
      | Message                           | Status | responseCode | description                                 | ContentType      | XCHANNEL   | XBRAND | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               | subscriberGuid                   | subscriptionIds                 |
      | Incorrect/Invalid_vin             | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | US_SELF    | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLM$%      | a0d4559c706d47df97b4d7754e3e8182 | ESEL1R3KLMJ9N7654-1531754984312 |
      | Incorrect/Invalid_subscriberGuid  | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | US_DEALER  | T      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | ESEL1R3KLMJ9N7654 | a0d4559c70:"{}97b4d7754e3e8182   | ESEL1R3KLMJ9N7654-1531754984312 |
