@OrchUpdateRemoteUser_Regression


Feature: Testing Orch_Subscriptions_PutAPI_Set subscription for a RemoteUser
  User should be able to call PUT Orch_Subscriptions_PutAPI_Set subscription for a RemoteUser

  @Sub_Smoke @OrchUpdateRemoteUser_Smoke
  Scenario Outline: Verify Orch_Subscriptions_PutAPI for Remote with valid input data <Message>
    Given Tester calls the update RemoteGuid api with basePath
    When The user inputs OrchSub headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester request the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" remoteUserGuid "<remoteUserGuid>"
    Then the Orchestration - Subscription PUT API returns the "<Status>" status code
    And The Orchestration - Subscription PUT API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                    | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | remoteUserGuid                   |
      | OrchUpdateRemoteUser_Smoke | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59179P116707 | 23d671b63d2b4c8c94e0e4e11443b232 | 23d671b63d2b4c8c94e0e4e11443b232 |


  #200 - Success
  @OrchUpdateRemoteUser_PositiveTest
  Scenario Outline: Verify Orch_Subscriptions_PutAPI for Remote with valid input data <Message>
    Given Tester calls the update RemoteGuid api with basePath
    When The user inputs OrchSub headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester request the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" remoteUserGuid "<remoteUserGuid>"
    Then the Orchestration - Subscription PUT API returns the "<Status>" status code
    And The Orchestration - Subscription PUT API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                 | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | subscriberGuid                   | remoteUserGuid                   |
      | OrchUpdateRemoteUser_1  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191301 | 23d671b63d2b4c8c94e0e4e11443b232 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_2  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191302 | dec4de2ad3a940ac9c9750cd6b10fb10 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_3  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191303 | 71b916cc80174c6f9c343515b40fb6e2 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_4  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191304 | d43212073fb245eb85ebd6a2d762ebf5 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_5  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191305 | 958fdf3c966b426b89a2265815be8837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_6  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191306 | 25f79f0722054368b00d0214ab0a4c80 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_7  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191307 | 35213f456cfa48f094fed92e8c49ee04 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_8  | 200    | ORCH-8000    | Request Processed Successfully | application/json | T      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191308 | 7a067c40e7748849483eeff923a56d22 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_9  | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191309 | 449410f3890c491986243ab66621294b | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_10 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 2G1WT55K089191310 | bea24bace6384c94999c586a351c773d | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_11 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCEK14WX1Z154801 | 781567c64aed434a962c5012d41411ac | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_12 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCEK14WX1Z154802 | cfd6e98346dc54d3d9a42a3b93d23af8 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_13 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCEK14WX1Z154803 | 85165aee5ac343f89e65508f99a167c8 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_14 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCEK14WX1Z154804 | 454c49b71d704e11b82377527291a2f4 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_15 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCEK14WX1Z154805 | 1f=cf9a927+a44c5a4a7be40         | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_16 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCEK14WX1Z154806 | 99ad232df5584a3ea/9b54c9         | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_17 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCEK14WX1Z154807 | 454c49b71d704e11ty2377527291a2f4 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_18 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCEK14WX1Z154808 | 1f=cf9a927+a44c5a4a7be89         | 23d671b63d2b4c8c94e0e4e11443b232 |
      | OrchUpdateRemoteUser_19 | 200    | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1GCEK14WX1Z154809 | 99ad232df5584a3ea/9b5456         | 23d671b63d2b4c8c94e0e4e11443b232 |

  #400 - Mandatory Header Attribute(s) Missing
  @OrchUpdateRemoteUser_NegativeTest
  Scenario Outline:Verify Orch_Subscriptions_PutAPI for Remote with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the update RemoteGuid api with basePath
    When The user inputs OrchSub headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester request the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" remoteUserGuid "<remoteUserGuid>"
    Then the Orchestration - Subscription PUT API returns the "<Status>" status code
    And The Orchestration - Subscription PUT API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                        | Status | responseCode | description                           | contentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               | subscriberGuid                   | remoteUserGuid                   |
      | Header_Missing X-BRAND         | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json |        | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Header_Missing X-CHANNEL       | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | L      |            | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Header_Missing X-CORRELATIONID | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Header_Missing Authorization   | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | L      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Header_Missing DATETIME        | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | T      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |

  #400 -Incorrect/Invalid Header Values
  @OrchUpdateRemoteUser_NegativeTest
  Scenario Outline:Verify Orch_Subscriptions_PutAPI for Remote with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the update RemoteGuid api with basePath
    When The user inputs OrchSub headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester request the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" remoteUserGuid "<remoteUserGuid>"
    Then the Orchestration - Subscription PUT API returns the "<Status>" status code
    And The Orchestration - Subscription PUT API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                             | Status | responseCode | description                     | contentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME                     | vin               | subscriberGuid                   | remoteUserGuid                   |
      | Incorrect/Invalid X-BRAND_1         | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | U      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid X-BRAND_2         | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | I&**   | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid X-BRAND_3         | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | 12     | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid X-CHANNEL_1       | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | us_self    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid X-CHANNEL_2       | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | 1234       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid X-CHANNEL_3       | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | us_%&      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid X-CORRELATIONID_1 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | TRC        | c52fdc72-8a0e-4600-92b0              | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid X-CORRELATIONID_2 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9??d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid X-CORRELATIONID_3 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | TMNA_AGENT | abcde                                | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid Authorization_1   | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 5678923gf7126h44ABC           | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid Authorization_2   | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 5678923gf7126h44???           | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid Authorization_3   | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | abcde                         | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid DATETIME_1        | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-10-10                   | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid DATETIME_2        | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 5/30/2018                    | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid DATETIME_3        | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-03-12T21:44:34.117+0702 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |

  #Missing entire json body
  #400 - Mandatory Request Body Attributes Missing

  @OrchUpdateRemoteUser_NegativeTest
  Scenario Outline:Verify Orch_Subscriptions_RemoteUser_PutAPI with Mandatory Request Body Attributes Missing entire json body as invalid input data <Message>
    Given Tester calls the update RemoteGuid api with basePath
    When The user inputs OrchSub headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester request the service Missing entire json body
    Then the Orchestration - Subscription PUT API returns the "<Status>" status code
    And The Orchestration - Subscription PUT API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL | XCORRELATIONID                       | Authorization                 | DATETIME      |
      | Mandatory body_Missing | 400    | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |

  # Missing json body keeping key and removing value
  # 400 - Mandatory Request Body Attributes Missing
  @OrchUpdateRemoteUser_NegativeTest
  Scenario Outline:Verify Orch_Subscriptions_PutAPI with Mandatory Request Body Attributes Missing json body keeping key and removing value as invalid input data <Message>
    Given Tester calls the update RemoteGuid api with basePath
    When The user inputs OrchSub headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester request the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" remoteUserGuid "<remoteUserGuid>"
    Then the Orchestration - Subscription PUT API returns the "<Status>" status code
    And The Orchestration - Subscription PUT API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                               | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               | subscriberGuid                   | remoteUserGuid                   |
      | Missing Mandatory body_vin            | 400    | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |                   | 23d671b63d2b4c8c94e0e4e11443b232 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Missing Mandatory body_subscriberGuid | 400    | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | T      | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116747 |                                  | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Missing Mandatory body_remoteUserGuid | 400    | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | T      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116748 | 71b916cc80174c6f9c343515b40fb6e2 |                                  |



  #400- Incorrect/Invalid Request Body Attribute(s)
  @OrchUpdateRemoteUser_NegativeTest
  Scenario Outline:Verify Orch_Subscriptions_PutAPI with Incorrect/Invalid Request Body Attribute(s) Values as invalid input data <Message>
    Given Tester calls the update RemoteGuid api with basePath
    When The user inputs OrchSub headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester request the service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" remoteUserGuid "<remoteUserGuid>"
    Then the Orchestration - Subscription PUT API returns the "<Status>" status code
    And The Orchestration - Subscription PUT API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                             | Status | responseCode | description                                 | contentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | vin                        | subscriberGuid                   | remoteUserGuid                   |
      | Incorrect/Invalid_VIN _1            | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 123ASDejukdsefujskwdjsc#5^ | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid_VIN _2            | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1234fdkj                   | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid_VIN _3            | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 123456234defsetfdsk        | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid_subscriberGuid _1 | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327          | adefiuth789jdeujksndbdshjwjksdk  | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid_subscriberGuid _2 | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327          | sdkilooo                         | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid_subscriberGuid _3 | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327          | 675&knmfhjucd/                   | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Incorrect/Invalid_remoteUserGuid _1 | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327          | b7865bfc632f40f3b5f1560bfc822837 | 23d671b63d2b4c8c94e0e4e1         |
      | Incorrect/Invalid_remoteUserGuid _2 | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327          | b7865bfc632f40f3b5f1560bfc822837 | 23d671b!@#$/1443b232             |
      | Incorrect/Invalid_remoteUserGuid _3 | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327          | b7865bfc632f40f3b5f1560bfc822837 | ksdjfb/;dyrf zs                  |
