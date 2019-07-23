@GetPreviewSubscription_Regression

Feature: Testing preview subscription GET service_details to get details of preview subscription details
  User should be able to submit preview subscription GET service_details to get details of preview subscription details

  @Sub_Smoke @GetPreviewSubscription_Smoke
  Scenario Outline: Verify preview subscription GET service_details with valid input data <Message>
    Given Tester calls the preview subscription GET service_details api with "<vin>"
    When The user inputs preview subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>" hw-type "<hwtype>" asi-code "<asicode>" generation "<generation>" region "<region>"
    Then the preview subscription GET service_details server returns  "<Status>" status code
    And The preview subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    # 2J4GA59167L116701 'SOLD' trial endDate > today
    Examples:
      | Message                        | vin               | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |hwtype|asicode|generation|region|
      | GetPreviewSubscription_Smoke_1 | 2J4GA59167L116701 | 200    | SPVW-0000    | Request processed successfully | application/json | T      | CA_DEALER| sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |17CY      |US    |

  #200
  @GetPreviewSubscription_PositiveTest
  Scenario Outline: Verify preview subscription GET service_details with valid input data <Message>
    Given Tester calls the preview subscription GET service_details api with "<vin>"
    When The user inputs preview subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>" hw-type "<hwtype>" asi-code "<asicode>" generation "<generation>" region "<region>"
    Then the preview subscription GET service_details server returns  "<Status>" status code
    And The preview subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    # subscription cases: 'SUBSCRIBED', 'SOLD' with no Trial left, 'SOLD' with trial endDate not passed yet, New VIN (VIN not Found.
    # 2J4GA59167L116702 'SOLD' trial passed endDate < today no trial left
    # 2J4GA59167L116703, 2J4GA59167L116704 "SUBSCRIBED"
    # 2J4GA59167L116719 VIN does not exist
    Examples:

      | Message                   | vin               | Status | responseCode  | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |hwtype|asicode|generation|region|
      | NO_TRIAL_LEFT             | 2J4GA59167L116702 | 200    | SPVW-0000     | Request processed successfully | application/json | T      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |17CY      |US    |
      | FOUND_SUBSCRIBED          | 2J4GA59167L116703 | 200    | SPVW-0006     | SUBSCRIPTION_FOUND             | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |17CY      |US    |
      | FOUND_SUBSCRIBED          | 2J4GA59167L116704 | 200    | SPVW-0006     | SUBSCRIPTION_FOUND             | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |17CY      |US    |
      | NEW_VIN                   | 2J4GA59167L116719 | 200    | SPVW-0000     | Request processed successfully | application/json | T      | ONEAPP     | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |17CY      |US    |


  @GetPreviewSubscription_NegativeTest
  Scenario Outline: Verify preview subscription GET service_details with invalid input data as Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the preview subscription GET service_details api with "<vin>"
    When The user inputs preview subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>" hw-type "<hwtype>" asi-code "<asicode>" generation "<generation>" region "<region>"
    Then the preview subscription GET service_details server returns  "<Status>" status code
    And The preview subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                        | vin               | Status | responseCode  | description                           | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding |hwtype|asicode|generation|region|
      | Header_Missing X-BRAND         | 1J4GA59167L116746 | 400    | SPVW-0001     | Mandatory Header Attribute(s) Missing | application/json |        | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |17CY      |US    |
      | Header_Missing X-CHANNEL       | 1J4GA59167L116746 | 400    | SPVW-0001     | Mandatory Header Attribute(s) Missing | application/json | L      |            | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |17CY      |US    |
      | Header_Missing X-CORRELATIONID | 1J4GA59167L116746 | 400    | SPVW-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | US_DEALER  |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |17CY      |US    |
      | Header_Missing Authorization   | 1J4GA59167L116746 | 400    | SPVW-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 | deflate        |8     |L      |17CY      |US    |
      | Header_Missing DATETIME        | 1J4GA59167L116746 | 400    | SPVW-0001     | Mandatory Header Attribute(s) Missing | application/json | L      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | deflate        |8     |L      |17CY      |US    |
      | Header_Missing HW_Type         | 1J4GA59167L116746 | 400    | SPVW-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | ONEAPP     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |      |L      |17CY      |US    |
      | Header_Missing ASI_Code        | 1J4GA59167L116746 | 400    | SPVW-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | ONEAPP     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |       |17CY      |US    |
      | Header_Missing_Generation      | 1J4GA59167L116746 | 400    | SPVW-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | ONEAPP     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |          |US    |
      | Header_Missing Region          | 1J4GA59167L116746 | 400    | SPVW-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | ONEAPP     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |8     |L      |17CY      |      |

  @GetPreviewSubscription_NegativeTest
  Scenario Outline: Verify preview subscription GET service_details with invalid input data as Incorrect/Invalid Header Values <Message>
    Given Tester calls the preview subscription GET service_details api with "<vin>"
    When The user inputs preview subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>" hw-type "<hwtype>" asi-code "<asicode>" generation "<generation>" region "<region>"
    Then the preview subscription GET service_details server returns  "<Status>" status code
    And The preview subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                                     | vin               | Status | responseCode | description                     | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME                     | AcceptEncoding |hwtype|asicode|generation|region|
      | Incorrect/Invalid Headers X-BRAND_1         | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | O      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers X-BRAND_2         | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | 123    | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers X-BRAND_3         | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | %^*    | ONEAPP     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers X-CHANNEL_1       | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | tmna_agent | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers X-CHANNEL_2       | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | TMN_123    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers X-CHANNEL_3       | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | CA_6*(     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers X-CORRELATIONID_2 | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | US_DEALER  | 127b2e65e4af4$%^3d8ed3d326bb9ded     | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers X-CORRELATIONID_3 | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | L      | TMNA_AGENT | 127b2e65e4af4793aqasedTY             | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers Authorization_1   | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08        | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers Authorization_2   | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | %^8                           | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers Authorization_3   | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 1234tf6759853786908agrt       | 1511796583386                | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers DATETIME_1        | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | ONEAPP     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 5/30/2018                    | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers DATETIME_2        | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | L      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-03-12T21:44:34.117+0702 | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers DATETIME_3        | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        |8     |L      |17CY      |US    |
      | Incorrect/Invalid Headers HW_TYPE           | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        |99999 |L      |17CY      |US    |
      | Incorrect/Invalid Headers ASI_CODE          | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | ONEAPP     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        |8     |ZZ     |17CY      |US    |
      | Incorrect/Invalid Headers GENERATION        | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | ONEAPP     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        |8     |L      |TEST      |US    |
      | Incorrect/Invalid Headers REGION            | 1J4GA59167L116746 | 400    | SPVW-0002    | Incorrect/Invalid Header Values | application/json | T      | ONEAPP     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        |99999 |L      |17CY      |TX    |