@SubUpdateSubscription_Regression
Feature: Testing Subscriptions_PutAPI for a vehicle
  User should be able to update a subscriptions from WAIVER to SUBSCRIBED

  #created by Lisha Shao 09-17-2018 SUB-MANAGEMENT update Subscription from WAIVED to SUBSCRIBED. It will call ZUORA to creating subscriptions in this process.

  #200 - Success  create a WAIVER subscription first before testing update functionality
  @OrchSubCreateForUpdate-POST-RECORDS
  Scenario Outline: Verify Orch_Subscriptions_PostAPI with valid input data <Message>
    Given Tester calls the api with basePath
    When The user inputs ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" region "<region>" generation "<generation>" waiver "<waiver>" remoteUserGuid "<remoteUserGuid>" packageID "<packageID>" productID "<productID>" type "<type>" ratePlanID "<ratePlanID>" term "<term>" termUnit "<termUnit>" subscriptionStartDate "<subscriptionStartDate>" can "<can300>" serviceConnect "<serviceConnect>" dealerContact "<dealerContact>" ubi "<ubi>" createDate "<createDate>" createSource "<createSource>" termsAcceptanceDate "<termsAcceptanceDate>"
    Then the Orchestration - Subscription POST API returns the "<Status>" status code
    And The Orchestration - Subscription POST API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                      | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | region | generation | waiver | remoteUserGuid | packageID | type  | productID | ratePlanID                       | term | termUnit | subscriptionStartDate | can300 | serviceConnect | dealerContact | ubi   | createDate                   | createSource |termsAcceptanceDate            |
      | ORCH_WAIVER Request_1        | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116701 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |
      | ORCH_WAIVER Request_2        | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116702 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |
      | ORCH_WAIVER Request_3        | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116703 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |
      | ORCH_WAIVER Request_4        | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116704 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |
      | ORCH_WAIVER Request_5        | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116705 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |
      | ORCH_WAIVER Request_6        | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116706 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |
      | ORCH_WAIVER Request_7        | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116707 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |
      | ORCH_WAIVER Request_8        | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116708 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |
      | ORCH_WAIVER Request_9        | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116709 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |
      | ORCH_WAIVER Request_10       | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116710 | dec4de2ad3a940ac9c9750cd6b10fb11 | HI     | PRE17CY    | true   |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 2    | MTH      | 2018-09-30            | True   | False          | False         | False | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700  |

  @UpdateSubscription_smoke
  Scenario Outline: Verify Subscriptions_PutAPI with valid input data <Message>
    Given Tester calls the Subscription PUT api with basePath
    When The user inputs Subscription PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When The user inputs Subscription PUT with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" vehicleStatus "<vehicleStatus>" updateDate "<updateDate>" updateSource "<updateSource>"
    Then The Subscription PUT api returns "<statusCode>" status code
    And The Subscription PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message    | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | vehicleStatus |AcceptEncoding|updateDate                  |updateSource     |
      | Request_1  | 200        | SUB-0000     | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2J4GA59167L116701 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |deflate       |2018-09-25T21:44:34.117+0000|US_SELF          |

  #200 - Success
  @UpdateSubscription
  Scenario Outline: Verify Subscriptions_PutAPI with valid input data <Message>
    Given Tester calls the Subscription PUT api with basePath
    When The user inputs Subscription PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When The user inputs Subscription PUT with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" vehicleStatus "<vehicleStatus>" updateDate "<updateDate>" updateSource "<updateSource>"
    Then The Subscription PUT api returns "<statusCode>" status code
    And The Subscription PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"
    Examples:
      | Message    | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      |AcceptEncoding| vin              | subscriberGuid                   | vehicleStatus |updateDate                   |updateSource|
      | Request_2  | 200        | SUB-0000     | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate      |2J4GA59167L116702 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |2018-09-25T21:44:34.117+0000 |US_SELF     |
      | Request_3  | 200        | SUB-0000     | Request Processed Successfully | application/json | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate      |2J4GA59167L116703 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |2018-09-25T21:44:34.117+0000 |US_DEALER   |
      | Request_4  | 200        | SUB-0000     | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate      |2J4GA59167L116704 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |2018-09-25T21:44:34.117+0000 |TMNA_AGENT  |
      | Request_5  | 200        | SUB-0000     | Request Processed Successfully | application/json | L      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate      |2J4GA59167L116705 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |2018-09-25T21:44:34.117+0000 |TC_AGENT    |
      | Request_6  | 200        | SUB-0000     | Request Processed Successfully | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate      |2J4GA59167L116706 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |2018-09-25T21:44:34.117+0000 |CA_SELF     |
      | Request_7  | 200        | SUB-0000     | Request Processed Successfully | application/json | L      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate      |2J4GA59167L116707 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |2018-09-25T21:44:34.117+0000 |CA_DEALER   |
      | Request_8  | 200        | SUB-0000     | Request Processed Successfully | application/json | T      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate      |2J4GA59167L116708 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |2018-09-25T21:44:34.117+0000 |LER         |
      | Request_9  | 200        | SUB-0000     | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate      |2J4GA59167L116709 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |2018-09-25T21:44:34.117+0000 |TRC         |
      | NO_VIN     | 404        | SUB-0008     | VIN not found                  | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate      |2K1LS56D0X1639899 | dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED    |2018-09-25T21:44:34.117+0000 |TRC         |

     #400
  @SubUpdate_NegativeTest_1
  Scenario Outline: Verify Subscriptions_PutAPI with invalid input data as Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the Subscription PUT api with basePath
    When The user inputs Subscription PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When The user inputs Subscription PUT with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" vehicleStatus "<vehicleStatus>" updateDate "<updateDate>" updateSource "<updateSource>"
    Then The Subscription PUT api returns "<statusCode>" status code
    And The Subscription PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                        | statusCode | responseCode | description                           |  ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding | vin               | vehicleStatus |subscriberGuid                  |updateDate                  |updateSource|
      | Header_Missing DATETIME        | 400        | SUB-0001     | Mandatory Header Attribute(s) Missing |  application/json | L      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Header_Missing X-BRAND         | 400        | SUB-0001     | Mandatory Header Attribute(s) Missing |  application/json |        | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Header_Missing X-CHANNEL       | 400        | SUB-0001     | Mandatory Header Attribute(s) Missing |  application/json | T      |            | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Header_Missing X-CORRELATIONID | 400        | SUB-0001     | Mandatory Header Attribute(s) Missing |  application/json | L      | LER        |                                      | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Header_Missing Authorization   | 400        | SUB-0001     | Mandatory Header Attribute(s) Missing |  application/json | T      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1530895403766 | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |

#400
  @SubUpdate_NegativeTest_2
  Scenario Outline: Subscriptions_PutAPI with invalid input data as Incorrect/Invalid Header Values <Message>
    Given Tester calls the Subscription PUT api with basePath
    When The user inputs Subscription PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When The user inputs Subscription PUT with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" vehicleStatus "<vehicleStatus>" updateDate "<updateDate>" updateSource "<updateSource>"
    Then The Subscription PUT api returns "<statusCode>" status code
    And The Subscription PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                             | statusCode | responseCode | description                     |  ContentType     | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME                     | AcceptEncoding | vin               | vehicleStatus |subscriberGuid                  |updateDate                  |updateSource|
      | Incorrect/Invalid X-BRAND_1         | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | O      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid X-BRAND_2         | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | 123    | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid X-BRAND_3         | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | $g%    | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid X-CHANNEL_1       | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | uuyj       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid X-CHANNEL_2       | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | us_self    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid X-CHANNEL_3       | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | ju&(       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid X-CORRELATIONID_1 | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | L      | US_SELF    | c52fdc72-8a0e-                       | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid X-CORRELATIONID_2 | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | LER        | abcherkk09%^&*(%$^&&^%$###           | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid X-CORRELATIONID_3 | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | US_DEALER  | c52fd _1234567890                    | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid Authorization_1   | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | L      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08        | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid Authorization_2   | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 87%37$                        | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid Authorization_3   | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 86725%878#8676                | 1530895403766                | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid DATETIME_1        | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 07/05/2018                   | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid DATETIME_2        | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-07-05T21:44:34.117+0702 | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid DATETIME_3        | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |
      | Incorrect/Invalid DATETIME_4        | 400        | SUB-0002     | Incorrect/Invalid Header Values | application/json | L      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 43-15-2018                   | deflate        | 2J4GA59167L116709 | SUBSCRIBED    |dec4de2ad3a940ac9c9750cd6b10fb11|2018-09-25T21:44:34.117+0000|US_SELF     |

 # Missing json body except{}
 #400 - Mandatory Request Body Attributes Missing
  @SubUpdate_NegativeTest_3
  Scenario Outline: Verify Subscriptions_PutAPI with Mandatory Request Body Attributes Missing json body except{} as invalid input data <Message>
    Given Tester calls the Subscription PUT api with basePath
    When The user inputs Subscription PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When Tester Subscription PUT api service Missing json body except braces
    Then The Subscription PUT api returns "<statusCode>" status code
    And The Subscription PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                 | statusCode | responseCode | description                           |  ContentType      | XBRAND | XCHANNEL | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding |
      | Missing jsonbody_braces | 400        | SUB-0003     | Mandatory Body Attribute(s) Missing   |  application/json | L      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        |

    #400
  @SubUpdate_NegativeTest_4
  Scenario Outline: Verify Subscriptions_PutAPI with Mandatory Request Body Attributes Missing <Message>
    Given Tester calls the Subscription PUT api with basePath
    When The user inputs Subscription PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When The user inputs Subscription PUT with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" vehicleStatus "<vehicleStatus>" updateDate "<updateDate>" updateSource "<updateSource>"
    Then The Subscription PUT api returns "<statusCode>" status code
    And The Subscription PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                             | statusCode | responseCode | description                                 |		vin				| subscriberGuid                   | vehicleStatus  |ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding |updateDate                  |updateSource|
      | Body_Attribute_Missing_vin          | 400        | SUB-0004     | Incorrect/Invalid Request Body Attribute(s) |						| dec4de2ad3a940ac9c9750cd6b10fb11 | SUBSCRIBED		|application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        |2018-09-25T21:44:34.117+0000|US_SELF     |
      | Body_Attribute_Missing_guid         | 400        | SUB-0004     | Incorrect/Invalid Request Body Attribute(s) |	2J4GA59167L116707	|                                  | SUBSCRIBED		|application/json | L      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        |2018-09-25T21:44:34.117+0000|US_SELF     |
      | Body_Attribute_Missing_vehicleStatus| 400        | SUB-0004     | Incorrect/Invalid Request Body Attribute(s) |	2J4GA59167L116708	| dec4de2ad3a940ac9c9750cd6b10fb11 | 				|application/json | L      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        |2018-09-25T21:44:34.117+0000|US_SELF     |

    #400
  @SubUpdate_NegativeTest_5
  Scenario Outline: Verify Subscriptions_PutAPI with Incorrect/Invalid Request Body Attribute(s) <Message>
    Given Tester calls the Subscription PUT api with basePath
    When The user inputs Subscription PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When The user inputs Subscription PUT with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" vehicleStatus "<vehicleStatus>" updateDate "<updateDate>" updateSource "<updateSource>"
    Then The Subscription PUT api returns "<statusCode>" status code
    And The Subscription PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                                         | statusCode | responseCode| description                                 | subscriberGuid                   | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding | vin               |   vehicleStatus |
      | Incorrect/Invalid Body Attribute vin_1          | 400        | SUB-0004    | Incorrect/Invalid Request Body Attribute(s) | dec4de2ad3a940ac9c9750cd6b10fb11 | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1J4GA59167L1      |   SUBSCRIBED    |
      | Incorrect/Invalid Body Attribute vin_2          | 400        | SUB-0004    | Incorrect/Invalid Request Body Attribute(s) | dec4de2ad3a940ac9c9750cd6b10fb11 | application/json | L      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1J4GA5916#$%^*(   |   SUBSCRIBED    |
      | Incorrect/Invalid Body Attribute guid           | 400        | SUB-0004    | Incorrect/Invalid Request Body Attribute(s) | d83587e4f0c6                     | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 2J4GA59167L116701 |   SUBSCRIBED    |
      | Incorrect/Invalid Body Attribute vehicleStatus  | 400        | SUB-0004    | Incorrect/Invalid Request Body Attribute(s) | dec4de2ad3a940ac9c9750cd6b10fb11 | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 2J4GA59167L116701 |   TEST          |

