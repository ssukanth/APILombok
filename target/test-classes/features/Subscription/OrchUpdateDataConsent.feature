@OrchUpdateDataConsent_Regression
Feature: Testing Orch_Subscriptions_PatchDataConsentAPI
  User should be able to PATCH dataconsent for subscription in orchestration

  #create(post) one subscrition to be able to test the update
  @Sub_Smoke @OrchSubPOST_smoke
  Scenario Outline: Verify Orch_Subscriptions_PostAPI with valid input data <Message>
    Given Tester calls the api with basePath
    When The user inputs ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" region "<region>" generation "<generation>" waiver "<waiver>" remoteUserGuid "<remoteUserGuid>" packageID "<packageID>" productID "<productID>" type "<type>" ratePlanID "<ratePlanID>" term "<term>" termUnit "<termUnit>" subscriptionStartDate "<subscriptionStartDate>" can "<can300>" serviceConnect "<serviceConnect>" dealerContact "<dealerContact>" ubi "<ubi>" createDate "<createDate>" createSource "<createSource>" termsAcceptanceDate "<termsAcceptanceDate>"
    Then the Orchestration - Subscription POST API returns the "<Status>" status code
    And The Orchestration - Subscription POST API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                      | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | region | generation | waiver | remoteUserGuid | packageID | type  | productID | ratePlanID                       | term | termUnit | subscriptionStartDate | can300 | serviceConnect | dealerContact | ubi   | createDate                   | createSource | termsAcceptanceDate          |
      | OrchCreateSubscription_Smoke | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116751 | 23d671b63d2b4c8c94e0e4e11443b232 | US     | PRE17CY    | false  | 1234           | 12        | Trial | 22        | 8adc8f996564fdb801656724bf3b389d | 9    | MTH      | 2018-05-30            | True   | True           | True          | False | 2018-03-12T21:44:34.117+0700 | US_SELF      | 2018-03-12T21:44:34.117+0700 |

  #update the VIN created above for smoke test
  @Sub_Smoke @OrchSubUpdateDataConsent_smoke
  Scenario Outline: Verify Orch_Subscriptions_UpdateDataConsentAPI with valid input data <Message>
    Given Tester calls the Orch_Subscriptions_UpdateDataConsentAPI with basePath
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" can "<can300>", serviceConnect "<serviceConnect>", dealerContact "<dealerContact>", ubi "<ubi>"
    Then The Orch_Subscriptions_UpdateDataConsentAPI returns "<statusCode>" status code
    And The Orch_Subscriptions_UpdateDataConsentAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message        | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | can300 | serviceConnect | dealerContact | ubi   |
      | Request_smoke  | 200        | ORCH-8000    | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116751 | 23d671b63d2b4c8c94e0e4e11443b232 | False  | False          | False         | False |

  #200 - Success
  @OrchCreateSubscription_CreationForUpdate
  Scenario Outline: Verify Orch_Subscriptions_PostAPI with valid input data <Message>
    Given Tester calls the api with basePath
    When The user inputs ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" region "<region>" generation "<generation>" waiver "<waiver>" remoteUserGuid "<remoteUserGuid>" packageID "<packageID>" productID "<productID>" type "<type>" ratePlanID "<ratePlanID>" term "<term>" termUnit "<termUnit>" subscriptionStartDate "<subscriptionStartDate>" can "<can300>" serviceConnect "<serviceConnect>" dealerContact "<dealerContact>" ubi "<ubi>" createDate "<createDate>" createSource "<createSource>" termsAcceptanceDate "<termsAcceptanceDate>"
    Then the Orchestration - Subscription POST API returns the "<Status>" status code
    And The Orchestration - Subscription POST API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                   | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | region | generation | waiver | remoteUserGuid | packageID | type  | productID | ratePlanID                       | term | termUnit | subscriptionStartDate | can300 | serviceConnect | dealerContact | ubi   | createDate                   | createSource | termsAcceptanceDate          |
      | OrchCreateSubscription_1  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | 23d671b63d2b4c8c94e0e4e11443b232 | US     | PRE17CY    | false  | 1234           | 12        | Trial | 22        | 8adc8f996564fdb801656724bf3b389d | 7    | MTH      | 2018-11-30            | True   | True           | True          | False | 2018-03-12T21:44:34.117+0700 | US_SELF      | 2018-03-12T21:44:34.117+0700 |
      | OrchCreateSubscription_2  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191882 | dec4de2ad3a940ac9c9750cd6b10fb10 | CA     | 17CY       | false  | ABCD           | 12        | Paid  | PROD45    | 8adc8f996564fdb801656724bf3b389d | 4    | MTH      | 2018-11-30            | True   | True           | True          | False | 2018-03-12T21:44:34.117+0701 | LER          | 2018-03-12T21:44:34.117+0700 |
      | OrchCreateSubscription_3  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191883 | 71b916cc80174c6f9c343515b40fb6e2 | TDPR   | 17CYPLUS   | false  |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 10   | MTH      | 2018-11-30            | True   | True           | True          | False | 2018-03-12T21:44:34.117+0702 | TRC          | 2018-03-12T21:44:34.117+0700 |
      | OrchCreateSubscription_4  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191884 | d43212073fb245eb85ebd6a2d762ebf5 | HI     | PRE17CY    | false  |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 12   | MTH      | 2018-11-30            | True   | True           | True          | False | 2018-03-12T21:44:34.117+0703 | US_DEALER    | 2018-03-12T21:44:34.117+0700 |
      | OrchCreateSubscription_5  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191885 | 958fdf3c966b426b89a2265815be8837 | US     | 17CY       | false  |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 10   | MTH      | 2018-11-30            | True   | False          | True          | True  | 2018-03-12T21:44:34.117+0704 | TMNA_AGENT   | 2018-03-12T21:44:34.117+0700 |
      | OrchCreateSubscription_6  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191886 | 25f79f0722054368b00d0214ab0a4c80 | CA     | 17CYPLUS   | false  |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 8    | MTH      | 2018-11-30            | True   | False          | True          | True  | 2018-06-19T08:18:51.100-0700 | TC_AGENT     | 2018-03-12T21:44:34.117+0700 |
      | OrchCreateSubscription_7  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191887 | 35213f456cfa48f094fed92e8c49ee04 | TDPR   | PRE17CY    | false  |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 9    | MTH      | 2018-11-30            | False  | False          | True          | True  | 2018-06-19T08:18:51.100-0700 | CA_SELF      | 2018-03-12T21:44:34.117+0700 |
      | OrchCreateSubscription_8  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191888 | 7a067c40e7748849483eeff923a56d22 | HI     | 17CY       | false  |                | 1234addec | Trial | PROD45    | 8adc8f996564fdb801656724bf3b389d | 5    | MTH      | 2018-11-30            | False  | False          | True          | True  | 2018-06-19T08:18:51.100-0700 | CA_DEALER    | 2018-03-12T21:44:34.117+0700 |

  #200 - Success
  @OrchSubUpdateDataConsent_positive
  Scenario Outline: Verify Orch_Subscriptions_UpdateDataConsentAPI with valid input data <Message>
    Given Tester calls the Orch_Subscriptions_UpdateDataConsentAPI with basePath
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" can "<can300>", serviceConnect "<serviceConnect>", dealerContact "<dealerContact>", ubi "<ubi>"
    Then The Orch_Subscriptions_UpdateDataConsentAPI returns "<statusCode>" status code
    And The Orch_Subscriptions_UpdateDataConsentAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"
    #using the 8 VINs GUID to create subscriptions, then update the dataconsent
    Examples:
      | Message    | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | can300 | serviceConnect | dealerContact | ubi   |
      | Request_1  | 200        | ORCH-8000    | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | 23d671b63d2b4c8c94e0e4e11443b232 | True   | True           | True          | True  |
      | Request_2  | 200        | ORCH-8000    | Request Processed Successfully | application/json | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | dec4de2ad3a940ac9c9750cd6b10fb10 | True   | True           | False         | False |
      | Request_3  | 200        | ORCH-8000    | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | 71b916cc80174c6f9c343515b40fb6e2 | True   | False          | False         | False |
      | Request_4  | 200        | ORCH-8000    | Request Processed Successfully | application/json | L      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | d43212073fb245eb85ebd6a2d762ebf5 | False  | False          | True          | False |
      | Request_5  | 200        | ORCH-8000    | Request Processed Successfully | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | 958fdf3c966b426b89a2265815be8837 | True   | True           | True          | True  |
      | Request_6  | 200        | ORCH-8000    | Request Processed Successfully | application/json | L      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | 25f79f0722054368b00d0214ab0a4c80 | True   | True           | False         | False |
      | Request_7  | 200        | ORCH-8000    | Request Processed Successfully | application/json | T      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | 35213f456cfa48f094fed92e8c49ee04 | True   | False          | False         | False |
      | Request_8  | 200        | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | 7a067c40e7748849483eeff923a56d22 | False  | False          | True          | False |
      | NO_VIN     | 404        | ORCH-8005    | VIN not found                  | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191881 | 99ad232df5584a3ea/9b54c9         | True   | True           | True          | False |

  @OrchSubUpdateDataConsent_NegativeTest_1
  Scenario Outline: Verify Orch_Subscriptions_UpdateDataConsentAPI with invalid input data as Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the Orch_Subscriptions_UpdateDataConsentAPI with basePath
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" can "<can300>", serviceConnect "<serviceConnect>", dealerContact "<dealerContact>", ubi "<ubi>"
    Then The Orch_Subscriptions_UpdateDataConsentAPI returns "<statusCode>" status code
    And The Orch_Subscriptions_UpdateDataConsentAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                        | statusCode | responseCode | description                           |  ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               | can300 | serviceConnect | dealerContact | ubi   |
      | Header_Missing DATETIME        | 400        | ORCH-8001    | Mandatory Header Attribute(s) Missing |  application/json | L      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | 5TFAY5F12FXVA2100 | True   | True           | True          | True  |
      | Header_Missing X-BRAND         | 400        | ORCH-8001    | Mandatory Header Attribute(s) Missing |  application/json |        | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | 5TFAY5F12FXVA2100 | True   | True           | False         | False |
      | Header_Missing X-CHANNEL       | 400        | ORCH-8001    | Mandatory Header Attribute(s) Missing |  application/json | T      |            | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | 5TFAY5F12FXVA2100 | True   | False          | False         | False |
      | Header_Missing X-CORRELATIONID | 400        | ORCH-8001    | Mandatory Header Attribute(s) Missing |  application/json | L      | LER        |                                      | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | 5TFAY5F12FXVA2100 | False  | False          | False         | False |
      | Header_Missing Authorization   | 400        | ORCH-8001    | Mandatory Header Attribute(s) Missing |  application/json | T      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1530895403766 | 5TFAY5F12FXVA2100 | True   | True           | True          | True |

  @OrchSubUpdateDataConsent_NegativeTest_2
  Scenario Outline: Orch_Subscriptions_UpdateDataConsentAPI with invalid input data as Incorrect/Invalid Header Values <Message>
    Given Tester calls the Orch_Subscriptions_UpdateDataConsentAPI with basePath
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" can "<can300>", serviceConnect "<serviceConnect>", dealerContact "<dealerContact>", ubi "<ubi>"
    Then The Orch_Subscriptions_UpdateDataConsentAPI returns "<statusCode>" status code
    And The Orch_Subscriptions_UpdateDataConsentAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                             | statusCode | responseCode | description                     |  ContentType     | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME                     | AcceptEncoding | vin               | can300 | serviceConnect | dealerContact | ubi   |
      | Incorrect/Invalid X-BRAND_1         | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | O      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | True   | True           | True          | True  |
      | Incorrect/Invalid X-BRAND_2         | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | 123    | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | True   | True           | True          | False |
      | Incorrect/Invalid X-BRAND_3         | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | $g%    | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | True   | False          | False         | False |
      | Incorrect/Invalid X-CHANNEL_1       | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | uuyj       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | False  | False          | False         | False |
      | Incorrect/Invalid X-CHANNEL_2       | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | us_self    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | True   | True           | True          | True  |
      | Incorrect/Invalid X-CHANNEL_3       | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | ju&(       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | True   | True           | True          | False |
      | Incorrect/Invalid X-CORRELATIONID_1 | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | US_SELF    | c52fdc72-8a0e-                       | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | True   | True           | False         | False |
      | Incorrect/Invalid X-CORRELATIONID_2 | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | LER        | abcherkk09%^&*(%$^&&^%$###           | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | False  | False          | False         | False |
      | Incorrect/Invalid X-CORRELATIONID_3 | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | US_DEALER  | c52fd _1234567890                    | 8923gf7126h44b14d3df08dd9f87a | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | True   | True           | True          | True  |
      | Incorrect/Invalid Authorization_1   | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08        | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | True   | True           | False         | False |
      | Incorrect/Invalid Authorization_2   | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 87%37$                        | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | True   | True           | True          | False |
      | Incorrect/Invalid Authorization_3   | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 86725%878#8676                | 1530895403766                | deflate        | 5TFAY5F12FXVA2100 | False  | False          | False         | False |
      | Incorrect/Invalid DATETIME_1        | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 07/05/2018                   | deflate        | 5TFAY5F12FXVA2100 | True   | True           | True          | True  |
      | Incorrect/Invalid DATETIME_2        | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-07-05T21:44:34.117+0702 | deflate        | 5TFAY5F12FXVA2100 | True   | True           | True          | False |
      | Incorrect/Invalid DATETIME_3        | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        | 5TFAY5F12FXVA2100 | True   | False          | False         | False |
      | Incorrect/Invalid DATETIME_4        | 400        | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 43-15-2018                   | deflate        | 5TFAY5F12FXVA2100 | False  | False          | False         | False |

  #Missing entire json body
  #400 - Mandatory Request Body Attributes Missing
  @OrchSubUpdateDataConsent_NegativeTest_3
  Scenario Outline:Verify Orch_Subscriptions_UpdateDataConsentAPI with Mandatory Request Body Attributes Missing entire json body as invalid input data <Message>
    Given Tester calls the Orch_Subscriptions_UpdateDataConsentAPI with basePath
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester Orch_Subscriptions_UpdateDataConsentAPI service Missing entire json body
    Then The Orch_Subscriptions_UpdateDataConsentAPI returns "<statusCode>" status code
    And The Orch_Subscriptions_UpdateDataConsentAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                 | statusCode | responseCode | description                               | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID                       | Authorization                 | DATETIME      |
      | Missing Entire jsonbody | 400        | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 |

  # Missing json body except{}
  #400 - Mandatory Request Body Attributes Missing
  @OrchSubUpdateDataConsent_NegativeTest_4
  Scenario Outline: Verify Orch_Subscriptions_UpdateDataConsentAPI with Mandatory Request Body Attributes Missing json body except{} as invalid input data <Message>
    Given Tester calls the Orch_Subscriptions_UpdateDataConsentAPI with basePath
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester Orch_Subscriptions_UpdateDataConsentAPI service Missing entire json body except braces
    Then The Orch_Subscriptions_UpdateDataConsentAPI returns "<statusCode>" status code
    And The Orch_Subscriptions_UpdateDataConsentAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                 | statusCode | responseCode | description                               |  ContentType      | XBRAND | XCHANNEL | XCORRELATIONID                       | Authorization                 | DATETIME      |
      | Missing jsonbody_braces | 400        | ORCH-8003    | Mandatory Request Body Attributes Missing |  application/json | L      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 |

  @OrchSubUpdateDataConsent_NegativeTest_5
  Scenario Outline: Verify Orch_Subscriptions_UpdateDataConsentAPI with Mandatory Request Body Attributes Missing <Message>
    Given Tester calls the Orch_Subscriptions_UpdateDataConsentAPI with basePath
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" can "<can300>", serviceConnect "<serviceConnect>", dealerContact "<dealerContact>", ubi "<ubi>"
    Then The Orch_Subscriptions_UpdateDataConsentAPI returns "<statusCode>" status code
    And The Orch_Subscriptions_UpdateDataConsentAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"
    Examples:
      | Message                             | statusCode | responseCode | description                               |		vin				| subscriberGuid                   | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      |can300 | serviceConnect | dealerContact | ubi   |
      | Body_Attribute_Missing_vin          | 400        | ORCH-8003    | Mandatory Request Body Attributes Missing |						| 0476179a47a741bb9797d83587e4f0c6 | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 |True   | True           | True          | True  |
      | Body_Attribute_Missing_guid         | 400        | ORCH-8003    | Mandatory Request Body Attributes Missing |	5TFAY5F12FXVA2100	|                                  | application/json | L      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 |True   | True           | True          | False |
      | Body_Attribute_Missing_dataConsent  | 400        | ORCH-8003    | Mandatory Request Body Attributes Missing |	5TFAY5F12FXVA2100	| 0476179a47a741bb9797d83587e4f0c6 | application/json | L      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 |       |                |               |       |

  @OrchSubUpdateDataConsent_NegativeTest_6
  Scenario Outline: Verify Orch_Subscriptions_UpdateDataConsentAPI with Incorrect/Invalid Request Body Attribute(s) <Message>
    Given Tester calls the Orch_Subscriptions_UpdateDataConsentAPI with basePath
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" can "<can300>", serviceConnect "<serviceConnect>", dealerContact "<dealerContact>", ubi "<ubi>"
    Then The Orch_Subscriptions_UpdateDataConsentAPI returns "<statusCode>" status code
    And The Orch_Subscriptions_UpdateDataConsentAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"
    Examples:
      | Message                                         | statusCode | responseCode | description                                 | subscriberGuid                   | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               |  can300 | serviceConnect | dealerContact | ubi   |
      | Incorrect/Invalid Body Attribute vin_1          | 400        | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | 0476179a47a741bb9797d83587e4f0c6 | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | 1J4GA59167L1      |  True   | True           | True          | True  |
      | Incorrect/Invalid Body Attribute vin_2          | 400        | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | 0476179a47a741bb9797d83587e4f0c6 | application/json | L      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | 1J4GA5916#$%^*(   |  True   | True           | False         | False |
      | Incorrect/Invalid Body Attribute guid           | 400        | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | d83587e4f0c6                     | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | 5TFAY5F12FXVA2100 |  True   | True           | True          | False |
      | Incorrect/Invalid Body Attribute dataconsent    | 400        | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | 0476179a47a741bb9797d83587e4f0c6 | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | 5TFAY5F12FXVA2100 |  FFF    | AAAA           | False         | False |

  @OrchSubUpdateDataConsent_NegativeTest_7
  Scenario Outline: Verify Orch_Subscriptions_UpdateDataConsentAPI with VIN but no matching GUID <Message>
    Given Tester calls the Orch_Subscriptions_UpdateDataConsentAPI with basePath
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When The user inputs Orch_Subscriptions_UpdateDataConsentAPI with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" can "<can300>", serviceConnect "<serviceConnect>", dealerContact "<dealerContact>", ubi "<ubi>"
    Then The Orch_Subscriptions_UpdateDataConsentAPI returns "<statusCode>" status code
    And The Orch_Subscriptions_UpdateDataConsentAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"
    Examples:
      | Message            | statusCode | responseCode | description                                    | subscriberGuid                   | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               |   can300 | serviceConnect | dealerContact | ubi   |
      | GUID_NOT_EXIST_10  | 200        | ORCH-8013    | GUID does not match with the subscription GUID | 0476179a47a741bb9797d83587e4f0c6 | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | 1J4GA59167L116788 |   True   | True           | True          | False |
