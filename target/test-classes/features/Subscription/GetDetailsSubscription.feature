@GetDetailsSubscription_Regression

Feature: Testing subscription GET service_details to get details of subscription details
  User should be able to submit subscription GET service_details to get details of subscription details

  @Sub_Smoke @GetDetailsSubscription_Smoke
  Scenario Outline: Verify Subscriptions_PostAPI with valid input data <Message>
    Given Tester calls the Subscriptions_PostAPI with basepath
    When The user inputs Subscriptions_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    When Tester post the Subscriptions_PostAPI service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" region "<region>" brand "<brand>" generation "<generation>" remoteUserAuthDate "<remoteUserAuthDate>"remoteUserGuid "<remoteUserGuid>" remotecreateSource "<remotecreateSource>" updateDate "<updateDate>" updateSource "<updateSource>" remoteAuthChannel "<remoteAuthChannel>" remotecreateDate "<remotecreateDate>" contractID "<contractID>" waiver "<waiver>" subscriptionID "<subscriptionID>" packageID "<packageID>" type "<type>" productID "<productID>" ratePlanID "<ratePlanID>" term "<term>" termUnit "<termUnit>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>" packagePrice "<packagePrice>" packageCurrency "<packageCurrency>" status "<status>"  can "<can300>" serviceConnect "<serviceConnect>" dealerContact "<dealerContact>" ubi "<ubi>" createDate "<createDate>" createSource "<createSource>" vehicleStatus "<vehicleStatus>" termsAcceptanceDate "<termsAcceptanceDate>"
    Then the subscriptions_PostAPI server returns the "<Status>" status code
    And The Subscriptions_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                    | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding | vin               | subscriberGuid                   | region | brand | generation | remoteUserAuthDate | remoteUserGuid | remotecreateSource | updateDate | updateSource | remoteAuthChannel | remotecreateDate | contractID      | waiver | subscriptionID | packageID | type  | productID | ratePlanID                       | term | termUnit | subscriptionStartDate | subscriptionEndDate | packagePrice | packageCurrency | status   | can300 | serviceConnect | dealerContact | ubi   | createDate                   | createSource | vehicleStatus | termsAcceptanceDate          |
      | CreateSubscription_Smoke_1 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | US_SELF   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1B3ES26C63D182100 | d9be913a1cb84cf183f0b24763565e28 | US     | L     | PRE17CY    |                    |                |                    |            |              |                   |                  | T-1533135990152 | false  | 1234           | 1234addec | Trial | PROD1     | 8adc8f996564fdb801656724bf3b389d | 120  | MTH      | 2018-08-12            | 2018-11-12          |              |                 | ACTIVE   | True   | False          | False         | False | 2018-03-12T21:44:34.117+0700 | CA_SELF      | SUBSCRIBED    | 2018-03-12T21:44:34.117+0700 |
      | CreateSubscription_Smoke_2 | 200    | SUB-0000     | Request Processed Successfully | application/json | L      | US_DEALER | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1GC4C1E86EF159400 | d9be91b84cf18+f0b245e290         | CA     | T     | 17CY       |                    |                |                    |            |              |                   |                  | T-1533135990152 | false  | 1234           | 1234addec | Paid  | PROD2     | 8adc8f996564fdb801656724bf3b389d | 20   | MTH      | 2018-08-12            | 2019-01-12          |              |                 | INACTIVE | False  | False          | True          | True  | 2018-03-12T21:44:34.117+0700 | US_DEALER    | SUBSCRIBED    | 2018-03-12T21:44:34.117+0700 |


  @Sub_Smoke @GetDetailsSubscription_Smoke
  Scenario Outline: Verify subscription GET service_details with valid input data <Message>
    Given Tester calls the subscription GET service_details api with "<vin>"
    When The user inputs subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    Then the subscription GET service_details server returns  "<Status>" status code
    And The subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                        | vin               | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |
      | GetDetailsSubscription_Smoke_1 | 1B3ES26C63D182100 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_Smoke_2 | 1GC4C1E86EF159400 | 200    | SUB-0000     | Request Processed Successfully | application/json | L      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |

  #200
  @GetDetailsSubscription_PositiveTest
  Scenario Outline: Verify subscription GET service_details with valid input data <Message>
    Given Tester calls the subscription GET service_details api with "<vin>"
    When The user inputs subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    Then the subscription GET service_details server returns  "<Status>" status code
    And The subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                   | vin               | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |
      | GetDetailsSubscription_1  | 1J4GA59167L116746 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_2  | 1J4GA59167L116747 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_3  | 1J4GA59167L116733 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_4  | 1J4GA59167L116751 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_5  | 1J4GA59167L116753 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_6  | 1J4GA59167L116755 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_7  | 1J4GA59167L116756 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_8  | YV1LS56D0X1639895 | 200    | SUB-0000     | Request Processed Successfully | application/json | T      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_9  | YV1LS56D0X1639896 | 200    | SUB-0000     | Request Processed Successfully | application/json | L      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_10 | YV1LS56D0X1639897 | 200    | SUB-0000     | Request Processed Successfully | application/json | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_11 | YV1LS56D0X1639898 | 200    | SUB-0000     | Request Processed Successfully | application/json | L      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_12 | YV1LS56D0X1639899 | 200    | SUB-0000     | Request Processed Successfully | application/json | L      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetDetailsSubscription_13 | 5GZCZ23D13S847843 | 200    | SUB-0000     | Request Processed Successfully | application/json | L      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |


  @GetDetailsSubscription_NegativeTest
  Scenario Outline: Verify  subscription GET service_details with invalid input data as Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the subscription GET service_details api with "<vin>"
    When The user inputs subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    Then the subscription GET service_details server returns  "<Status>" status code
    And The subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                        | vin               | Status | responseCode | description                           | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding |
      | Header_Missing Content-Type    | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing |                  | T      | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-BRAND         | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json |        | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-CHANNEL       | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | L      |            | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-CORRELATIONID | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | US_DEALER  |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing Authorization   | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 | deflate        |
      | Header_Missing DATETIME        | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | L      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | deflate        |
      | Header_Missing AcceptEncoding  | 1J4GA59167L116746 | 400    | SUB-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |                |

  @GetDetailsSubscription_NegativeTest
  Scenario Outline: Verify subscription GET service_details with invalid input data as Incorrect/Invalid Header Values <Message>
    Given Tester calls the subscription GET service_details api with "<vin>"
    When The user inputs subscription GET service_details headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    Then the subscription GET service_details server returns  "<Status>" status code
    And The subscription GET service_details response content should have the ResponseCode "<responseCode>" and Description "<description>"

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


