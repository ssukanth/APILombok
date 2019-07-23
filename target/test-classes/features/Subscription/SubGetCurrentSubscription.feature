@GetCurrentSubscription_Regression

Feature: Testing current subscription GET service_details to get details of current subscription details
  User should be able to submit current subscription GET service_details to get details of current subscription details

  @Sub_Smoke @GetCurrentSubscription_Smoke
  Scenario Outline: Verify current subscription GET service_details with valid input data <Message>
    Given Tester calls the current subscription GET service_details api with "<vin>"
    When The user inputs current subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    Then the current subscription GET service_details server returns  "<Status>" status code
    And The current subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                        | vin               | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |
      | GetCurrentSubscription_Smoke_1 | 2J4GA59167L116701 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |


  #200
  @GetCurrentDetailsSubscription_PositiveTest
  Scenario Outline: Verify current subscription GET service_details with valid input data <Message>
    Given Tester calls the current subscription GET service_details api with "<vin>"
    When The user inputs current subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    Then the current subscription GET service_details server returns  "<Status>" status code
    And The current subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                   | vin               | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |
      | GetCurrentSubscription_1  | 2J4GA59167L116702 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetCurrentSubscription_2  | 2J4GA59167L116703 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetCurrentSubscription_3  | 2J4GA59167L116704 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | VIN_NOT_FOUND             | 2J4GA59167L116719 | 404    | SUB-0008     | VIN not found                  | application/json | T      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |


  @GetCurrentDetailsSubscription_NegativeTest
  Scenario Outline: Verify current subscription GET service_details with invalid input data as Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the current subscription GET service_details api with "<vin>"
    When The user inputs current subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    Then the current subscription GET service_details server returns  "<Status>" status code
    And The current subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                        | vin               | Status | responseCode | description                           | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding |
      | Header_Missing Content-Type    | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing |                  | T      | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-BRAND         | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json |        | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-CHANNEL       | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | L      |            | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-CORRELATIONID | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | US_DEALER  |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing Authorization   | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 | deflate        |
      | Header_Missing DATETIME        | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | L      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | deflate        |
      | Header_Missing AcceptEncoding  | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |                |

  @GetCurrentDetailsSubscription_NegativeTest
  Scenario Outline: Verify current subscription GET service_details with invalid input data as Incorrect/Invalid Header Values <Message>
    Given Tester calls the current subscription GET service_details api with "<vin>"
    When The user inputs current subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    Then the current subscription GET service_details server returns  "<Status>" status code
    And The current subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                                     | vin               | Status | responseCode | description                     | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME                     | AcceptEncoding |
      | Incorrect/Invalid Headers X-BRAND_1         | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | O      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers X-BRAND_2         | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | 123    | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers X-BRAND_3         | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | %^*    | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers X-CHANNEL_1       | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | tmna_agent | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers X-CHANNEL_2       | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | TMN_123    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers X-CHANNEL_3       | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | CA_6*(     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers X-CORRELATIONID_1 | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | L      | US_SELF    | 127b2e65e4af4793a126bb9d?            | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers X-CORRELATIONID_2 | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | US_DEALER  | 127b2e65e4af4$%^3d8ed3d326bb9ded     | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers X-CORRELATIONID_3 | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | L      | TMNA_AGENT | 127b2e65e4af4793aqasedTY             | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers Authorization_1   | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08        | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers Authorization_2   | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | %^8                           | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers Authorization_3   | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 1234tf6759853786908agrt       | 1511796583386                | deflate        |
      | Incorrect/Invalid Headers DATETIME_1        | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 5/30/2018                    | deflate        |
      | Incorrect/Invalid Headers DATETIME_2        | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | L      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-03-12T21:44:34.117+0702 | deflate        |
      | Incorrect/Invalid Headers DATETIME_3        | 1J4GA59167L116746 | 400    | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        |


