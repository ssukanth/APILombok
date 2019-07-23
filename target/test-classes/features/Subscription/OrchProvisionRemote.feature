@OrchProvisionRemote_Regression

Feature: Testing Orch_Provisioning_Remote_PostAPI Provisioning for a vehicle based on subscribed products
  User should be able to POST Orch_Provisioning_Remote_PostAPI Provisioning for a vehicle based on subscribed products

  @Sub_Smoke @OrchProvisionRemote_Smoke
  Scenario Outline: Verify Orch_Provisioning_Remote_PostAPI with valid input data <Message>
    Given Tester calls the api with Remote basePath
    When The user inputs Orch_Provisioning_Remote_PostAPI ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the Orch_Provisioning_Remote_PostAPI service with json body having vin "<vin>" guid "<guid>"
    Then The Orch_Provisioning_Remote_PostAPI returns the "<Status>" status code
    And The Orch_Provisioning_Remote_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                     | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | guid                             |
      | ORCH_Acknowledged Request_1 | 202    | ORCH-0000    | Request processed successfully | application/json | T      | TC       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59179P116746 | 23d671b63d2b4c8c94e0e4e11443b232 |

    #To generate auth code for patchRemoteAuthCode
  @GenerateRemoteAuthCode_PositiveTestforOrchProvision
  Scenario Outline: Generate Authorization code to perform Remote actions _PostAPI with valid input data <Message>
    Given Tester calls the GenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs GenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the GenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the GenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The GenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                        | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                             | purpose              | email             | phone      | sendNotification |
      | GenerateRemoteAuthCode_Smoke_1 | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHK25J57H611236 | 7e3e92f5537146bcae4da08a30bb80a1 | REMOTE_AUTHORIZATION | abc19@gmail.com   | 1234567890 | true             |
      | GenerateRemoteAuthCode_Smoke_2 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | LER      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHK05J542051235 | 07cadafa079d4303b57448de07951e91 | REMOTE_AUTHORIZATION | cbd12@yopmail.com | 1234567890 | true             |

    #To generate VIN and guid for OrchProvisionRemote #200 -Success Response
  @PatchRemoteAuthCode_PositiveTestforOrchProvision
  Scenario Outline: ValidateRemoteAuthCode_Patch API with valid input data <Message>
    Given Tester calls the ValidateRemoteAuthCode_Patch API with basepath
    When The user inputs ValidateRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls ValidateRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the ValidateRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The ValidateRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                            | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | email             | phone      | sendNotification |
      | PatchRemoteAuthCode_PositiveTest_1 | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHK25J57H611236 | 7e3e92f5537146bcae4da08a30bb80a1 | 369951   | abc19@gmail.com   | 1234567890 | true             |
      | PatchRemoteAuthCode_PositiveTest_2 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | LER      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHK05J542051235 | 07cadafa079d4303b57448de07951e91 | 922804   | cbd12@yopmail.com | 1234567890 | true             |
      | PatchRemoteAuthCode_PositiveTest_3 | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | LER      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111113 | 48ac15e3269f4ab89271cdbdbb8e2da3 | 520282   | abc001@gmail.com | 1234567892 | true             |
      | PatchRemoteAuthCode_PositiveTest_4 | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111114 | b71aa8a6d7bb4b2db6066ec39ebb1aa4 | 246057   | abc001@gmail.com | 1234567893 | true             |
      | PatchRemoteAuthCode_PositiveTest_5 | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | ONEAPP   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J511111115 | ad59373353c84ae68eff9cd64e8464a5 | 744792   | abc001@gmail.com | 1234567894 | true             |

  #200 - Success
  @OrchProvisionRemote_PositiveTest
  Scenario Outline: Verify Orch_Provisioning_ProvisionPackage_PostAPI with valid input data <Message>
    Given Tester calls the api with Remote basePath
    When The user inputs Orch_Provisioning_Remote_PostAPI ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the Orch_Provisioning_Remote_PostAPI service with json body having vin "<vin>" guid "<guid>"
    Then The Orch_Provisioning_Remote_PostAPI returns the "<Status>" status code
    And The Orch_Provisioning_Remote_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                      | Status | responseCode| description                    | contentType      | XBRAND | XCHANNEL    | XCORRELATIONID  | Authorization                 | DATETIME      | vin               | guid                             |
      | ORCH_Acknowledged Request_1  | 202    | PROV-0000   | Request Processed Successfully | application/json | T      | TRC         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | JTEHK25J57H611236 | 7e3e92f5537146bcae4da08a30bb80a1 |
      | ORCH_Acknowledged Request_2  | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | LER         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | JTEHK05J542051235 | 07cadafa079d4303b57448de07951e91 |
      | ORCH_Acknowledged Request_3  | 202    | PROV-0000   | Request Processed Successfully | application/json | T      | TRC         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116748 | 71b916cc80174c6f9c343515b40fb6e2 |
      | ORCH_Acknowledged Request_4  | 202    | PROV-0000   | Request Processed Successfully | application/json | T      | TSC         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116749 | d43212073fb245eb85ebd6a2d762ebf5 |
      | ORCH_Acknowledged Request_5  | 202    | PROV-0000   | Request Processed Successfully | application/json | T      | ADMIN_TOOL  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116750 | 958fdf3c966b426b89a2265815be8837 |
      | ORCH_Acknowledged Request_6  | 202    | PROV-0000   | Request Processed Successfully | application/json | T      | TSC         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116751 | 25f79f0722054368b00d0214ab0a4c80 |
      | ORCH_Acknowledged Request_7  | 202    | PROV-0000   | Request Processed Successfully | application/json | T      | TC          | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116752 | 35213f456cfa48f094fed92e8c49ee04 |
      | ORCH_Acknowledged Request_8  | 202    | PROV-0000   | Request Processed Successfully | application/json | T      | LER         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116753 | 7a067c40e7748849483eeff923a56d22 |
      | ORCH_Acknowledged Request_9  | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | TC          | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116754 | 449410f3890c491986243ab66621294b |
      | ORCH_Acknowledged Request_10 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | LER         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116755 | bea24bace6384c94999c586a351c773d |
      | ORCH_Acknowledged Request_11 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | TRC         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116756 | 781567c64aed434a962c5012d41411ac |
      | ORCH_Acknowledged Request_12 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | TSC         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YV1LS56D0X1639895 | cfd6e98346dc54d3d9a42a3b93d23af8 |
      | ORCH_Acknowledged Request_13 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | ADMIN_TOOL  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YV1LS56D0X1639896 | 85165aee5ac343f89e65508f99a167c8 |
      | ORCH_Acknowledged Request_14 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | TC          | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YV1LS56D0X1639897 | 454c49b71d704e11b82377527291a2f4 |
      | ORCH_Acknowledged Request_15 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | TSC         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YV1LS56D0X1639898 | 1f=cf9a927+a44c5a4a7be40         |
      | ORCH_Acknowledged Request_16 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | LER         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YV1LS56D0X1639899 | 99ad232df5584a3ea/9b54c9         |
      | ORCH_Acknowledged Request_17 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | TC          | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 5GZCZ23D13S847843 | 454c49b71d704e11ty2377527291a2f4 |
      | ORCH_Acknowledged Request_18 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | LER         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | JH4DC4433RS801009 | 1f=cf9a927+a44c5a4a7be89         |
      | ORCH_Acknowledged Request_19 | 202    | PROV-0000   | Request Processed Successfully | application/json | L      | TRC         | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | JH4KA3250JC001617 | 99ad232df5584a3ea/9b5456         |


 #400 - Mandatory Header Attribute(s) Missing
  @OrchProvisionRemote_NegativeTest
  Scenario Outline:Verify Orch_Provisioning_ProvisionPackage_PostAPI with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the api with Remote basePath
    When The user inputs Orch_Provisioning_Remote_PostAPI ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the Orch_Provisioning_Remote_PostAPI service with json body having vin "<vin>" guid "<guid>"
    Then The Orch_Provisioning_Remote_PostAPI returns the "<Status>" status code
    And The Orch_Provisioning_Remote_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                        | Status | responseCode | description                           | contentType      | XBRAND | XCHANNEL  | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               | guid                             |
      | Header_Missing X-BRAND         | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json |        | TSC       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Header_Missing X-CHANNEL       | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | L      |           | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Header_Missing X-CORRELATIONID | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | T      | LER       |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Header_Missing Authorization   | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | L      | TRC       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Header_Missing DATETIME        | 400    | ORCH-8001    | Mandatory Header Attribute(s) Missing | application/json | T      | TC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |


 #400 -Incorrect/Invalid Header Values
  @OrchProvisionRemote_NegativeTest
  Scenario Outline:Verify Orch_Provisioning_ProvisionPackage_PostAPI with Incorrect/Invalid Header Values  as invalid input data <Message>
    Given Tester calls the api with Remote basePath
    When The user inputs Orch_Provisioning_Remote_PostAPI ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the Orch_Provisioning_Remote_PostAPI service with json body having vin "<vin>" guid "<guid>"
    Then The Orch_Provisioning_Remote_PostAPI returns the "<Status>" status code
    And The Orch_Provisioning_Remote_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                             | Status | responseCode | description                     | contentType      | XBRAND | XCHANNEL    | XCORRELATIONID                       | Authorization                 | DATETIME                     | vin               | guid                             |
      | Incorrect/Invalid X-BRAND_1         | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | U      | TC          | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid X-BRAND_2         | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | I&**   | LER         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid X-BRAND_3         | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | 12     | TRC         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid X-CHANNEL_1       | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TSC!        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid X-CHANNEL_2       | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | ADMINTOOL   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid X-CHANNEL_3       | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TARP_AGE12  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid X-CORRELATIONID_1 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | TC          | c52fdc72-8a0e-4600-92b0              | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid X-CORRELATIONID_2 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TSC         | c52fdc72-8a0e-4600-92b0-ee9??d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid X-CORRELATIONID_3 | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | TC          | abcde                                | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid Authorization_1   | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | LER         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 5678923gf7126h44ABC           | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid Authorization_2   | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TRC         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 5678923gf7126h44???           | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid Authorization_3   | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TSC         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | abcde                         | 1511796583386                | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid DATETIME_1        | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | ADMIN_TOOL  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-10-10                   | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid DATETIME_2        | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | T      | TSC         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 5/30/2018                    | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid DATETIME_3        | 400    | ORCH-8002    | Incorrect/Invalid Header Values | application/json | L      | LER         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-03-12T21:44:34.117+0702 | YS3EH49G083529327 | b7865bfc632f40f3b5f1560bfc822837 |


   #400 - Missing entire json body
  @OrchProvisionRemote_NegativeTest
  Scenario Outline:Verify Orch_Provisioning_ProvisionPackage_PostAPI with Mandatory Request Body Attributes Missing entire json body as invalid input data <Message>
    Given Tester calls the api with Remote basePath
    When The user inputs Orch_Provisioning_Remote_PostAPI ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the Orch_Provisioning_Remote_PostAPI service with json body having vin "<vin>" guid "<guid>"
    Then The Orch_Provisioning_Remote_PostAPI returns the "<Status>" status code
    And The Orch_Provisioning_Remote_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL | XCORRELATIONID                       | Authorization                 | DATETIME      |
      | Mandatory body_Missing | 400    | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | T      | TC       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |



   #400 - Missing json body except{}
  @OrchProvisionRemote_NegativeTest
  Scenario Outline:Verify Orch_Provisioning_ProvisionPackage_PostAPI with Mandatory Request Body Attributes Missing json body except{} as invalid input data <Message>
    Given Tester calls the api with Remote basePath
    When The user inputs Orch_Provisioning_Remote_PostAPI ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the Orch_Provisioning_Remote_PostAPI service with json body having vin "<vin>" guid "<guid>"
    Then The Orch_Provisioning_Remote_PostAPI returns the "<Status>" status code
    And The Orch_Provisioning_Remote_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                              | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL | XCORRELATIONID                       | Authorization                 | DATETIME      |
      | Mandatory body_Missing except braces | 400    | ORCH-8003    | Mandatory Request Body Attributes Missing | application/json | L      | TC       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |



  #400 - Mandatory Request Body Attributes Missing
  @OrchProvisionRemote_NegativeTest
  Scenario Outline:Verify Orch_Provisioning_ProvisionPackage_PostAPI with Mandatory Request Body Attributes Missing json body keeping key and removing value as invalid input data <Message>
    Given Tester calls the api with Remote basePath
    When The user inputs Orch_Provisioning_Remote_PostAPI ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the Orch_Provisioning_Remote_PostAPI service with json body having vin "<vin>" guid "<guid>"
    Then The Orch_Provisioning_Remote_PostAPI returns the "<Status>" status code
    And The Orch_Provisioning_Remote_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                               | Status | responseCode | description                                 | contentType      | XBRAND | XCHANNEL | XCORRELATIONID                       | Authorization                 | DATETIME      | vin               | guid                             |
      | Missing Mandatory body_vin            | 400    | ORCH-8003    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | TC       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |                   | 23d671b63d2b4c8c94e0e4e11443b232 |
      | Missing Mandatory body_subscriberGuid | 400    | ORCH-8003    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | LER      | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1J4GA59167L116747 |                                  |


  #400- Incorrect/Invalid Request Body Attribute(s)
  @OrchProvisionRemote_NegativeTest
  Scenario Outline:Verify Orch_Provisioning_ProvisionPackage_PostAPI with Incorrect/Invalid Request Body Attribute(s) Values as invalid input data <Message>
    Given Tester calls the api with Remote basePath
    When The user inputs Orch_Provisioning_Remote_PostAPI ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When Tester post the Orch_Provisioning_Remote_PostAPI service with json body having vin "<vin>" guid "<guid>"
    Then The Orch_Provisioning_Remote_PostAPI returns the "<Status>" status code
    And The Orch_Provisioning_Remote_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                             | Status | responseCode | description                                 | contentType      | XBRAND | XCHANNEL    | XCORRELATIONID                       | Authorization                 | DATETIME      | vin                        | guid                             |
      | Incorrect/Invalid_VIN _1            | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | LER         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 123ASDejukdsefujskwdjsc#5^ | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid_VIN _2            | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TRC         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 1234fdkj                   | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid_VIN _3            | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TSC         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | 123456234defsetfdsk        | b7865bfc632f40f3b5f1560bfc822837 |
      | Incorrect/Invalid_subscriberGuid _1 | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | ADMIN_TOOL  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327          | adefiuth789jdeujksndbdshjwjksdk  |
      | Incorrect/Invalid_subscriberGuid _2 | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TC          | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327          | sdkilooo                         |
      | Incorrect/Invalid_subscriberGuid _3 | 400    | ORCH-8004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TSC         | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | YS3EH49G083529327          | 675&knmfhjucd/                   |
