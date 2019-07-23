@CreateSubscription_Regression

Feature: Testing OrchestrationVINAssociation_PutAPI service to update status to SOLD

  @Sub_Smoke @Orch_CreateVehAssocForStatusUpdateSmoke
  Scenario Outline: Verify Orchestration_VINAssociation_PutAPI with valid input data <Message>
    Given Tester calls the Orchestration Vehicle Association PUT Api with basePath
    When The user inputs Orchestration Vehicle Association PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When Tester put Orchestration Vehicle Association PUT api service with json body having vin "<vin>" guid "<guid>"  preferredDealerCode "<preferredDealerCode>"  nickName "<nickName>" timeZone<timeZone>
    Then the Orchestration Vehicle Association PUT api server returns "<statusCode>" status code
    And The Orchestration Vehicle Association PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message            | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding | vin               | guid                             | preferredDealerCode | nickName | timeZone |
      | Orch_VA_Positive_1 | 200        | ORCH-6000    | Request Processed Successfully | application/json | T      | US_SELF   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2100 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 1        |
      | Orch_VA_Positive_2 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | US_DEALER | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2200 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester2  | 2        |


  @OrchCreateVehAssocForStatusUpdate_PositiveTest
  Scenario Outline: Verify Orchestration_VINAssociation_PutAPI with valid input data <Message>
    Given Tester calls the Orchestration Vehicle Association PUT Api with basePath
    When The user inputs Orchestration Vehicle Association PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When Tester put Orchestration Vehicle Association PUT api service with json body having vin "<vin>" guid "<guid>"  preferredDealerCode "<preferredDealerCode>"  nickName "<nickName>" timeZone<timeZone>
    Then the Orchestration Vehicle Association PUT api server returns "<statusCode>" status code
    And The Orchestration Vehicle Association PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message            | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding | vin               | guid                             | preferredDealerCode | nickName | timeZone |
      | Orch_VA_Positive_1 | 200        | ORCH-6000    | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2100 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 1        |
      | Orch_VA_Positive_2 | 200        | ORCH-6000    | Request Processed Successfully | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2200 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester2  | 2        |
      | Orch_VA_Positive_3 | 200        | ORCH-6000    | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2300 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 3        |
      | Orch_VA_Positive_4 | 200        | ORCH-6000    | Request Processed Successfully | application/json | T      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2400 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester2  | 5        |
      | Orch_VA_Positive_5 | 200        | ORCH-6000    | Request Processed Successfully | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2500 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 33       |
      | Orch_VA_Positive_6 | 200        | ORCH-6000    | Request Processed Successfully | application/json | T      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2600 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester2  | 12       |
      | Orch_VA_Positive_7 | 200        | ORCH-6000    | Request Processed Successfully | application/json | T      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2700 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 15       |
      | Orch_VA_Positive_1 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2800 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 1        |
      | Orch_VA_Positive_2 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA2900 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester2  | 2        |
      | Orch_VA_Positive_3 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA3000 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 3        |
      | Orch_VA_Positive_4 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA3100 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester2  | 5        |
      | Orch_VA_Positive_5 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA3200 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 33       |
      | Orch_VA_Positive_6 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA3300 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester2  | 12       |
      | Orch_VA_Positive_7 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA3400 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 15       |
      | Orch_VA_Positive_8 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA3500 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester2  | 20       |
      | Orch_VA_Positive_8 | 200        | ORCH-6000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 5TFAY5F12FXVA3600 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester2  | 20       |



 #400
  @Orch_UpdateVehAssocNegativeTest
  Scenario Outline: Verify Orchestration_VINAssociation_PutAPI with invalid input data as Mandatory Header Attribute(s) Missing <Message>

    Given Tester calls the Orchestration Vehicle Association PUT api with basePath
    When The user inputs Orchestration Vehicle Association PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When Tester put Orchestration Vehicle Association PUT api service with json body having vin "<vin>" guid "<guid>"  preferredDealerCode "<preferredDealerCode>"  nickName "<nickName>" timeZone<timeZone>
    Then the Orchestration Vehicle Association PUT api server returns "<statusCode>" status code
    And The Orchestration Vehicle Association PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                        | statusCode | responseCode | description                           | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding | vin               | guid                             | preferredDealerCode | nickName | timeZone |
      | Header_Missing X-BRAND         | 400        | ORCH-6001    | Mandatory Header Attribute(s) Missing | application/json |        | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 1        |
      | Header_Missing X-CHANNEL       | 400        | ORCH-6001    | Mandatory Header Attribute(s) Missing | application/json | T      |            | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 2        |
      | Header_Missing X-CORRELATIONID | 400        | ORCH-6001    | Mandatory Header Attribute(s) Missing | application/json | L      | LER        |                                      | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 3        |
      | Header_Missing Authorization   | 400        | ORCH-6001    | Mandatory Header Attribute(s) Missing | application/json | T      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 5        |
      | Header_Missing DATETIME        | 400        | ORCH-6001    | Mandatory Header Attribute(s) Missing | application/json | L      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 33       |


    #400
  @Orch_UpdateVehAssocNegativeTest
  Scenario Outline: Verify Orchestration_VINAssociation_PutAPI with invalid input data as Incorrect/Invalid Header Values <Message>

    Given Tester calls the Orchestration Vehicle Association PUT api with basePath
    When The user inputs Orchestration Vehicle Association PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When Tester put Orchestration Vehicle Association PUT api service with json body having vin "<vin>" guid "<guid>"  preferredDealerCode "<preferredDealerCode>"  nickName "<nickName>" timeZone<timeZone>
    Then the Orchestration Vehicle Association PUT api server returns "<statusCode>" status code
    And The Orchestration Vehicle Association PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                             | statusCode | responseCode | description                     | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding | vin               | guid                             | preferredDealerCode | nickName | timeZone |
      | Incorrect/Invalid X-BRAND_1         | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | S      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 1        |
      | Incorrect/Invalid X-BRAND_2         | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | t      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 1        |
      | Incorrect/Invalid X-BRAND_3         | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | T?     | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 1        |
      | Incorrect/Invalid X-CHANNEL_1       | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | T      | dksksa     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 2        |
      | Incorrect/Invalid X-CHANNEL_2       | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | T      | ler        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 2        |
      | Incorrect/Invalid X-CHANNEL_3       | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | T      | TRC>       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 2        |
      | Incorrect/Invalid X-CORRELATIONID_1 | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | L      | LER        | sdkjfskdsdv                          | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 3        |
      | Incorrect/Invalid X-CORRELATIONID_2 | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | L      | LER        | c52fdc72-92b0-ee9f6d866b22           | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 3        |
      | Incorrect/Invalid X-CORRELATIONID_3 | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | L      | LER        | c52fdc72-?ee9f6d866b22               | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 3        |
      | Incorrect/Invalid Authorization_1   | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | T      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | sdvndskdkjvfjslk              | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 5        |
      | Incorrect/Invalid Authorization_2   | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | T      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h449f87a            | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 5        |
      | Incorrect/Invalid Authorization_3   | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | T      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08d?>     | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 5        |
      | Incorrect/Invalid DATETIME_1        | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | L      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-09-06    | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 33       |
      | Incorrect/Invalid DATETIME_2        | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | L      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 15305403766   | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 33       |
      | Incorrect/Invalid DATETIME_3        | 400        | ORCH-6002    | Incorrect/Invalid Header Values | application/json | L      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403?>  | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 33       |

 #400
  @Orch_UpdateVehAssocNegativeTest
  Scenario Outline: Verify Orchestration_VINAssociation_PutAPI with invalid input data as Mandatory Request Body Attributes Missing <Message>

    Given Tester calls the Orchestration Vehicle Association PUT api with basePath
    When The user inputs Orchestration Vehicle Association PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When Tester put Orchestration Vehicle Association PUT api service with json body having vin "<vin>" guid "<guid>"  preferredDealerCode "<preferredDealerCode>"  nickName "<nickName>" timeZone<timeZone>
    Then the Orchestration Vehicle Association PUT api server returns "<statusCode>" status code
    And The Orchestration Vehicle Association PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                     | statusCode | responseCode | description                               | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding | vin               | guid                             | preferredDealerCode | nickName | timeZone |
      | Body_Attribute_Missing_vin  | 400        | ORCH-6003    | Mandatory Request Body Attributes Missing | application/json | T      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        |                   | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 1        |
      | Body_Attribute_Missing_guid | 400        | ORCH-6003    | Mandatory Request Body Attributes Missing | application/json | T      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 |                                  | 1234                | Tester1  | 3        |

    #400
  @Orch_UpdateVehAssocNegativeTest
  Scenario Outline: Verify Orchestration_VINAssociation_PutAPI with invalid input data as Incorrect/Invalid Request Body Attribute(s) <Message>

    Given Tester calls the Orchestration Vehicle Association PUT api with basePath
    When The user inputs Orchestration Vehicle Association PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    When Tester put Orchestration Vehicle Association PUT api service with json body having vin "<vin>" guid "<guid>"  preferredDealerCode "<preferredDealerCode>"  nickName "<nickName>" timeZone<timeZone>
    Then the Orchestration Vehicle Association PUT api server returns "<statusCode>" status code
    And The Orchestration Vehicle Association PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                                 | statusCode | responseCode | description                                 | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding | vin               | guid                             | preferredDealerCode | nickName | timeZone |
      | Incorrect/Invalid Body Attribute vin_1  | 400        | ORCH-6004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | alkdnvd           | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 31       |
      | Incorrect/Invalid Body Attribute vin_2  | 400        | ORCH-6004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE1HA69866     | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 31       |
      | Incorrect/Invalid Body Attribute vin_3  | 400        | ORCH-6004    | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2R?:<866  | 78caf9dca59442898ece2b81f6b7e6bc | 1234                | Tester1  | 31       |
      | Incorrect/Invalid Body Attribute guid_1 | 400        | ORCH-6004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442892b81f6b7e6bc     | 1234                | Tester1  | 32       |
      | Incorrect/Invalid Body Attribute guid_2 | 400        | ORCH-6004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | 78caf9dca59442898ece2?>1f6b7e6bc | 1234                | Tester1  | 32       |
      | Incorrect/Invalid Body Attribute guid_3 | 400        | ORCH-6004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | TC_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | 1FDEE14N2RHA69866 | djjdsacsdjds                     | 1234                | Tester1  | 32       |

