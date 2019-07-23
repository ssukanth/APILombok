@OrchGetDetailsSubscription_Regression

Feature: Testing Orchestration subscription GET service_details to get details of subscription details
  User should be able to submit orchestration subscription GET service_details to get details of subscription details

  @Sub_Smoke @OrchGetDetailsSubscription
  Scenario Outline: Verify Orchestration subscription GET service_details with valid input data <Message>
    Given Tester calls the Orchestration subscription GET service_details api with "<vin>"
    When The user inputs Orchestration subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    Then the Orchestration subscription GET service_details server returns  "<Status>" status code
    And The Orchestration subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message | vin               | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      |
      | Smoke_1 | 1J4GA59167L116746 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Smoke_2 | 1J4GA59167L116747 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Smoke_3 | 1J4GA59167L116733 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |

  #200
  @OrchGetDetailsSubscription_PositiveTest
  Scenario Outline: Verify Orchestration subscription GET service_details with valid input data <Message>
    Given Tester calls the Orchestration subscription GET service_details api with "<vin>"
    When The user inputs Orchestration subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    Then the Orchestration subscription GET service_details server returns  "<Status>" status code
    And The Orchestration subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message     | vin               | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      |
      | Positive_1  | 1J4GA59167L116746 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_2  | 1J4GA59167L116747 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_3  | 1J4GA59167L116733 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_4  | 1J4GA59167L116751 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_5  | 1J4GA59167L116753 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_6  | 1J4GA59167L116755 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_7  | 1J4GA59167L116756 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_8  | YV1LS56D0X1639895 | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_9  | YV1LS56D0X1639896 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_10 | YV1LS56D0X1639897 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_11 | YV1LS56D0X1639898 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_12 | YV1LS56D0X1639899 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_13 | 5GZCZ23D13S847843 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_14 | 1J4GA59367L116746 | 404    | ORCH-8005    | VIN Not Found                  | application/json | L      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_15 | 1J4GA59167L106746 | 404    | ORCH-8005    | VIN Not Found                  | application/json | L      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Positive_16 | 1J4GA59167R116746 | 404    | ORCH-8005    | VIN Not Found                  | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |


  @OrchGetDetailsSubscription_NegativeTest
  Scenario Outline: Verify Orchestration subscription GET service_status with invalid input data as Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the Orchestration subscription GET service_details api with "<vin>"
    When The user inputs Orchestration subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    Then the Orchestration subscription GET service_details server returns  "<Status>" status code
    And The Orchestration subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                        | vin               | Status | responseCode | description                           | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      |
      | Header_Missing X-BRAND         | 1J4GA59167L116746 | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json |        | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Header_Missing X-CHANNEL       | 1J4GA59167L116746 | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | L      |            | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Header_Missing X-CORRELATIONID | 1J4GA59167L116746 | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | T      | US_DEALER  |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |
      | Header_Missing Authorization   | 1J4GA59167L116746 | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 |
      | Header_Missing DATETIME        | 1J4GA59167L116746 | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | L      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               |


  @OrchGetDetailsSubscription_NegativeTest
  Scenario Outline: Verify Orchestration subscription GET service_status with invalid input data as Incorrect/Invalid Header Values <Message>
    Given Tester calls the Orchestration subscription GET service_details api with "<vin>"
    When The user inputs Orchestration subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    Then the Orchestration subscription GET service_details server returns  "<Status>" status code
    And The Orchestration subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                             | vin               | Status | responseCode | description                     | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME                     |
      | Incorrect/Invalid X-BRAND_1         | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | O      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                |
      | Incorrect/Invalid X-BRAND_2         | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | 123    | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                |
      | Incorrect/Invalid X-BRAND_3         | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | %^*    | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                |
      | Incorrect/Invalid X-CHANNEL_1       | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | tmna_agent | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                |
      | Incorrect/Invalid X-CHANNEL_2       | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TMN_123    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                |
      | Incorrect/Invalid X-CHANNEL_3       | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | CA_6*(     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                |
      | Incorrect/Invalid X-CORRELATIONID_1 | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | US_SELF    | 127b2e65e4af4793a126bb9d?            | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                |
      | Incorrect/Invalid X-CORRELATIONID_2 | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | US_DEALER  | 127b2e65e4af4$%^3d8ed3d326bb9ded     | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                |
      | Incorrect/Invalid X-CORRELATIONID_3 | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | TMNA_AGENT | 127b2e65e4af4793aqasedTY             | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                |
      | Incorrect/Invalid Authorization_1   | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08        | 1511796583386                |
      | Incorrect/Invalid Authorization_2   | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | %^8                           | 1511796583386                |
      | Incorrect/Invalid Authorization_3   | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 1234tf6759853786908agrt       | 1511796583386                |
      | Incorrect/Invalid DATETIME_1        | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 5/30/2018                    |
      | Incorrect/Invalid DATETIME_2        | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-03-12T21:44:34.117+0702 |
      | Incorrect/Invalid DATETIME_3        | 1J4GA59167L116746 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   |


