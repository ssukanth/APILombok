@OrchGenerateRemoteAuthCode_Regression
Feature: Testing OrchGenerateRemoteAuthCode_API
  User should get Authorization code to perform Remote Actions.

 #200 -Success Response
  @OrchGenerateRemoteAuthCode_SmokeTest @Sub_Smoke
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with valid input data <Message>
    Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" notifyByEmail "<notifyByEmail>" notifyByPhone "<notifyByPhone>" sendNotification "<sendNotification>"
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                             | Status  | responseCode   | description                   | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | notifyByEmail     | notifyByPhone        | sendNotification |
      | OrchGenerateRemoteAuthCode_Smoke_1  | 200     | ORCH-7000      | Request Processed Successfully|  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT051234353201  | 370729ccc2ed4a1494a40a25a5d00b12  | REMOTE_AUTHORIZATION  | true              | false 		        | true             |
      | OrchGenerateRemoteAuthCode_Smoke_2  | 200     | ORCH-7000      | Request Processed Successfully|  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542353196  | 06d1e3f0e00c4216ba86de15b4d00f27  | REMOTE_AUTHORIZATION  | true              | false                | true             |
      | OrchGenerateRemoteAuthCode_Smoke_3  | 200     | ORCH-7000      | Request Processed Successfully|  application/json|  T         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542353114  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true              | true                 | true             |

 #200 - Success
  @OrchGenerateRemoteAuthCode_PositiveTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with valid input data <Message>
    Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" notifyByEmail "<notifyByEmail>" notifyByPhone "<notifyByPhone>" sendNotification "<sendNotification>"
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                     | Status  | responseCode  | description                   | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | notifyByEmail | notifyByPhone  | sendNotification |
      | OrchGenerateRemoteAuthCode_PositiveTest_1   | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true          | false          | true             |
      | OrchGenerateRemoteAuthCode_PositiveTest_2   | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  T         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053196  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true          | false          | true             |
      | OrchGenerateRemoteAuthCode_PositiveTest_3   | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  T         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053197  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true          | true           | true             |
      | OrchGenerateRemoteAuthCode_PositiveTest_4   | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  T         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053198  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true          | true           | true             |
      | OrchGenerateRemoteAuthCode_PositiveTest_5   | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  T         | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053199  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | false         | true           | true             |
      | OrchGenerateRemoteAuthCode_PositiveTest_6   | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  T         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053110  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | false         | true           | true             |
      | OrchGenerateRemoteAuthCode_PositiveTest_7   | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  T         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053111  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | false         | false          | false            |
      | OrchGenerateRemoteAuthCode_PositiveTest_8   | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053112  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | false         | false          | false            |
      | OrchGenerateRemoteAuthCode_PositiveTest_9   | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  L         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053113  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true          | false          | false            |
      | OrchGenerateRemoteAuthCode_PositiveTest_10  | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  L         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053115  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true          | false          | false            |
      | OrchGenerateRemoteAuthCode_PositiveTest_11  | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  L         | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053116  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | false         | true           | false            |
      | OrchGenerateRemoteAuthCode_PositiveTest_12  | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  L         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053117  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | false         | true           | false            |
      | OrchGenerateRemoteAuthCode_PositiveTest_13  | 200     | ORCH-7000     | Request Processed Successfully|  application/json|  L         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053118  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true          | true           | false            |

#400 - Mandatory Header Attribute(s) Missing
  @OrchGenerateRemoteAuthCode_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" notifyByEmail "<notifyByEmail>" notifyByPhone "<notifyByPhone>" sendNotification "<sendNotification>"
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                       | Status  | responseCode | description                           | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | notifyByEmail       | notifyByPhone  | sendNotification |
      | Header Missing XBRAND         | 400     | ORCH-7001    | Mandatory Header Attribute(s) Missing |  application/json|            | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT051232053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | false           | true            |
      | Header Missing XCHANNEL       | 400     | ORCH-7001    | Mandatory Header Attribute(s) Missing |  application/json|  T         |               | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT051232053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | false           | true            |
      | Header Missing XCORRELATIONID | 400     | ORCH-7001    | Mandatory Header Attribute(s) Missing |  application/json|  T         | CA_SELF       |                 | 8923gf7126h44b14d3df08dd9f87a |JTEHT051232053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | false           | true            |
      | Header Missing Authorization  | 400     | ORCH-7001    | Mandatory Header Attribute(s) Missing |  application/json|  L         | US_SELF_AZURE | sendThroughCode |                               |JTEHT051232053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | false           | true            |

 #400 - Incorrect/Invalid Header values
  @OrchGenerateRemoteAuthCode_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Incorrect/Invalid Header Attribute(s)as input data <Message>
    Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" notifyByEmail "<notifyByEmail>" notifyByPhone "<notifyByPhone>" sendNotification "<sendNotification>"
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                            | Status| responseCode   | description                     | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | notifyByEmail       | notifyByPhone  | sendNotification |
      | Incorrect/Invalid XBRAND1          | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  A         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Incorrect/Invalid XBRAND2          | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  1         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Incorrect/Invalid XBRAND3          | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  #         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Incorrect/Invalid XCHANNEL1        | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  T         | UK_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Incorrect/Invalid XCHANNEL2        | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  L         | UK_@ELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Incorrect/Invalid XCHANNEL3        | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  T         | UK_1	      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Incorrect/Invalid XCORRELATIONID1  | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  T         | US_SELF_AZURE | 923gf!@7126h4   | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Incorrect/Invalid XCORRELATIONID2  | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  L         | CA_SELF       | 923gf 7126h4    | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Incorrect/Invalid XCORRELATIONID3  | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  T         | US_SELF       | 923gf7126h4     | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |

#400 - Mandatory Request Body Attribute(s) Missing
  @OrchGenerateRemoteAuthCode_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" notifyByEmail "<notifyByEmail>" notifyByPhone "<notifyByPhone>" sendNotification "<sendNotification>"
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                 | Status  | responseCode | description                               | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | notifyByEmail       | notifyByPhone  | sendNotification |
      | Body_Attribute_Missing vin              | 400     | ORCH-7003    | Mandatory Request Body Attributes Missing |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |                   | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Body_Attribute_Missing guid             | 400     | ORCH-7003    | Mandatory Request Body Attributes Missing |  application/json|  T         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  |                                   | REMOTE_AUTHORIZATION  | true                | true           | true             |
      | Body_Attribute_Missing purpose          | 400     | ORCH-7003    | Mandatory Request Body Attributes Missing |  application/json|  L         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  |                       | true                | true           | true             |
	  | Body_Attribute_sendNotification         | 400     | ORCH-7003    | Mandatory Request Body Attributes Missing |  application/json|  L         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  |                       | true                | true           |                  |
#      | Body_Attribute Missing email&Phone      | 400     | ORCH-7003    | Mandatory Request Body Attributes Missing |  application/json|  L         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  |                     |                | true             |

#400 - Incorrect/Invalid Request body attributes
  @OrchGenerateRemoteAuthCode_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Incorrect/Invalid Body Attribute(s) as input data <Message>
    Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" notifyByEmail "<notifyByEmail>" notifyByPhone "<notifyByPhone>" sendNotification "<sendNotification>"
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                  | Status  | responseCode  | description                                 | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | notifyByEmail       | notifyByPhone       | sendNotification |
      | Incorrect/Invalid_vin1                   | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J54         | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | false               | true             |
      | Incorrect/Invalid_vin4                   | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |@@@@@@@@@@@@@@@@@  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | false               | true             |
      | Incorrect/Invalid_vin5                   | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT 5J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true                | true             |
      | Incorrect/Invalid_guid1                  | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e#*f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true                | true             |
      | Incorrect/Invalid_guid2                  | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 3d43b77a30a8454bb1f9h             | REMOTE_AUTHORIZATION  | true                | true                | true             |
      | Incorrect/Invalid_guid3                  | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f91 | REMOTE_AUTHORIZATION  | true                | true                | true             |
      | Incorrect/Invalid_guid4                  | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537&11bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | true                | true                | true             |
      | Incorrect/Invalid_purpose1               | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 0e3044db62e940c8b76127ef9c32adb1  | REMOTE_123			   | true                | true                | true             |
      | Incorrect/Invalid_purpose2               | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 0e3044db62e940c8b76127ef9c32adb1  | !@#_   AUTHORIZATION  | true                | true                | true             |
      | Incorrect/Invalid_purpose3               | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATIONN | true                | true                | true             |
	  | Incorrect/Invalid_notifyByEmail          | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATIONN | treu                | true                | true             |
	  | Incorrect/Invalid_notifyByPhone          | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATIONN | true                | tree                | true             |	
	  | Incorrect/Invalid_sendNotification       | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATIONN | true                | true                | treu             |	
	  
#400 - Missing entire json body
  @OrchGenerateRemoteAuthCode_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with Missing entire json body
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                                 | Status  | responseCode | description                                 | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                  |
      | Missing entire jsonbody                 | 400     | ORCH-7003    | Mandatory Request Body Attributes Missing |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a  |

# 400 Missing json body except{}
  @OrchGenerateRemoteAuthCode_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Mandatory Body Attribute(s) Missing in input data <Message>
  Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with Missing entire json body except braces
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                                 | Status  | responseCode  | description                                | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 |
      | Missing  jsonbody Except braces         | 400     | ORCH-7003     | Mandatory Request Body Attributes Missing  |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |

# 400 Email Not verified
  @OrchGenerateRemoteAuthCode_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Customer Email not verified in OCPR as input data <Message>
    Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" notifyByEmail "<notifyByEmail>" notifyByPhone "<notifyByPhone>" sendNotification "<sendNotification>"
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message     		| Status  | responseCode  | description             | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | notifyByEmail       | notifyByPhone       | sendNotification |
      | Email Not Verified  | 400     | ORCH-7013     | Email Not Verified		|  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | b49c4db47bac44d68e939a5b9254825e  | REMOTE_AUTHORIZATION  | true               | false  	          | true             |
      | Email Not Verified  | 400     | ORCH-7013     | Email Not Verified		|  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | b49c4db47bac44d68e939a5b9254825e  | REMOTE_AUTHORIZATION  | true               | false			      | true             |

# 400 Phone Not verified
  @OrchGenerateRemoteAuthCode_NegativeTest
  Scenario Outline: OrchGenerate Authorization code to perform Remote actions _PostAPI with Customer Phone not verified in OCPR as input data <Message>
    Given Tester calls the OrcGenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs OrcGenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the OrcGenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" notifyByEmail "<notifyByEmail>" notifyByPhone "<notifyByPhone>" sendNotification "<sendNotification>"
    Then the OrcGenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The OrcGenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message     		| Status  | responseCode  | description             | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | notifyByEmail         | notifyByPhone       | sendNotification |
      | Phone Not Verified  | 400     | ORCH-7014     | Phone Not Verified		|  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 0e3044db62e940c8b76127ef9c32adb1  | REMOTE_AUTHORIZATION  | false                 | true                | true             |
      | Phone Not Verified  | 400     | ORCH-7014     | Phone Not Verified		|  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 0e3044db62e940c8b76127ef9c32adb1  | REMOTE_AUTHORIZATION  | false                 | true                | true             |
