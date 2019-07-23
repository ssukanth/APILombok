@GenerateRemoteAuthCode_Regression
Feature: Testing GenerateRemoteAuthCode_Post API
  User should get Authorization code to perform Remote Actions
# Author- Vijay Kadiri

   @Sub_Smoke @GenerateRemoteAuthCode_SmokeTest
  Scenario Outline: Generate Authorization code to perform Remote actions _PostAPI with valid input data <Message>
    Given Tester calls the GenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs GenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the GenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the GenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The GenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message      					| Status  | responseCode | description                    | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | email                      | phone      | sendNotification  |
      | GenerateRemoteAuthCode_Smoke_1  | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J578611236  | 7e3e92f5537146bcae4da08a30bb80a1  | REMOTE_AUTHORIZATION  | abc19@gmail.com            | 1234567890 | true              |
      | GenerateRemoteAuthCode_Smoke_2  | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J578611237  | 07cadafa079d4303b57448de07951e91  | REMOTE_AUTHORIZATION  | cbd12@yopmail.com          |        	  | true              |

 #200 - Success Request
  @GenerateRemoteAuthCode_PositiveTest
  Scenario Outline: Generate Authorization code to perform Remote actions _PostAPI with valid input data <Message>
    Given Tester calls the GenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs GenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the GenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the GenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The GenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message     			  	                | Status  | responseCode | description                    | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | email                        | phone       | sendNotification |
      | GenerateRemoteAuthCode_PostitiveTest_1  	| 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861111  | 7e3e92f5537146bcae4da08030bb80a1  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567890  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_2	    | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861112  | 07cadafa079d4303b57448ae07951ea2  | REMOTE_AUTHORIZATION  | abc002@gmail.com          | 1234567891  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_3	    | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861113  | 48ac15e3269f4ab89271cdbdbb8e2da3  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567892  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_4	    | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861114  | b71aa8a6d7bb4b2db6066ec39ebb1aa4  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567893  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_5      | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J517861115  | ad59373353c84ae68eff9cd64e8464a5  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567894  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_6      | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861116  | 95c4fc53112a4a15a0f247e3386e07a6  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1111111111  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_7      | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861117  | 04d4d3bffe0047bbaa4021f209935ca7  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567896  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_8      | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861118  | 3d43b77a30a8454bb1f9h0gb78047fa8  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567897  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_9      | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861119  | e126b7865f8441faa5f23ch17a949da9  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567890  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_10     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861120  | f512d608e36c42c89b10bdice71771b1  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567899  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_11	    | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861121  | 3ae1b94989304601aa9b5cje882abfb1  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567801  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_12     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861122  | b49c4db47bac44d68e939akb925482b3  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567802  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_13     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861123  | d02a313b2ce947739cccdaldf63c93b4  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567803  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_14     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861124  | d7c1a015ce644ce4a40ad0m5d20522b5  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567804  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_15     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861125  | 3d43b77a30a8454bb1f9h0nb78047fb6  | REMOTE_AUTHORIZATION  |                           |             | false            |
      | GenerateRemoteAuthCode_PostitiveTest_16     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861126  | 7e3e92f5537146bcae4da0oa30bb80b7  | REMOTE_AUTHORIZATION  |                           | 1234567805  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_17     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861127  | 95c4fc53112a4a15a0f247p3386e07b8  | REMOTE_AUTHORIZATION  |                           | 1111111111  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_18     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861128  | 48ac15e3269f4ab89271cdqdbb8e2db9  | REMOTE_AUTHORIZATION  | abc001@gmail.com          |   	      | true             |
      | GenerateRemoteAuthCode_PostitiveTest_19     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861129  | b71aa8a6d7bb4b2db6066er39ebb1ac1  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 			  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_20     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861130  | ad59373353c84ae68eff9cs64e8464c2  | REMOTE_AUTHORIZATION  | abc001@gmail.com          |			  | true             |
      | GenerateRemoteAuthCode_PostitiveTest_21     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861131  | 3d43b77a30a8454bb1f9h0tb78047fb6  | REMOTE_AUTHORIZATION  | abc001@gmail.com          |             | false            |
      | GenerateRemoteAuthCode_PostitiveTest_22     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861132  | 3d43b77a30a8454bb1f9h0ub78047fb6  | REMOTE_AUTHORIZATION  |                           | 1234567806  | false            |
      | GenerateRemoteAuthCode_PostitiveTest_23     | 200     | RAC-0000     | Request Processed Successfully |  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861133  | 3d43b77a30a8454bb1f9h0vb78047fb6  | REMOTE_AUTHORIZATION  |                           |             | false            |
      | GenerateRemoteAuthCode_Postitive_Test24  	| 200     | RAC-0000     | Request Processed Successfully |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J547861134  | 7e3e92f5537146bcae4da0wa30bb80a1  | REMOTE_AUTHORIZATION  | abc001@gmail.com          | 1234567890  | true             |

#400 - Mandatory Header Attribute(s) Missing
  @GenerateRemoteAuthCode_NegativeTest
  Scenario Outline: Generate Authorization code to perform Remote actions _PostAPI with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the GenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs GenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the GenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the GenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The GenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                       | Status  | responseCode | description                           | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | email               | phone       | sendNotification |
      | Header Missing XBRAND         | 400     | RAC-0001     | Mandatory Header Attribute(s) Missing |  application/json|            | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542050022  | 7e3e92f5537146bcae4da08a30bb80f1  | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Header Missing XCHANNEL       | 400     | RAC-0001     | Mandatory Header Attribute(s) Missing |  application/json|  T         |               | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542050023  | 7e3e92f5537146bcae4da08a30bb80f2  | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Header Missing XCORRELATIONID | 400     | RAC-0001     | Mandatory Header Attribute(s) Missing |  application/json|  L         | ONEAPP        |                 | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542050024  | 7e3e92f5537146bcae4da08a30bb80f3  | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Header Missing Authorization  | 400     | RAC-0001     | Mandatory Header Attribute(s) Missing |  application/json|  T         | TRC           | sendThroughCode |                               |JTEHT05J542050025  | 7e3e92f5537146bcae4da08a30bb80f4  | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |

#400 - Incorrect/Invalid Header values
  @GenerateRemoteAuthCode_NegativeTest
  Scenario Outline: Generate Authorization code to perform Remote actions _PostAPI with Incorrect/Invalid Header Attribute(s)as input data <Message>
    Given Tester calls the GenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs GenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the GenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the GenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The GenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                            | Status| responseCode   | description                     | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | email               | phone       | sendNotification |
      | Incorrect/Invalid XBRAND1          | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  A         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542011111  | 7e3e92f5537146bcae4da08a30bb80a1  | REMOTE_AUTHORIZATION  | psirik199@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid XBRAND2          | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  1         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542011112  | 7e3e92f5537146bcae4da08a30bb80a2  | REMOTE_AUTHORIZATION  | psirik299@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid XBRAND3          | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  #         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542011113  | 7e3e92f5537146bcae4da08a30bb80a3  | REMOTE_AUTHORIZATION  | psirik399@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid XCHANNEL1        | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  T         | TR            | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542011114  | 7e3e92f5537146bcae4da08a30bb80a4  | REMOTE_AUTHORIZATION  | psirik499@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid XCHANNEL2        | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  L         | UK_@ELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542011115  | 7e3e92f5537146bcae4da08a30bb80a5  | REMOTE_AUTHORIZATION  | psirik599@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid XCHANNEL3        | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  T         | UK_1          | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542011116  | 7e3e92f5537146bcae4da08a30bb80a6  | REMOTE_AUTHORIZATION  | psirik699@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid XCORRELATIONID1  | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  T         | US_SELF       | 923gf!@7126h4   | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542011117  | 7e3e92f5537146bcae4da08a30bb80a7  | REMOTE_AUTHORIZATION  | psirik799@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid XCORRELATIONID2  | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  L         | CA_SELF_AZURE | 923gf 7126h4    | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542011118  | 7e3e92f5537146bcae4da08a30bb80a8  | REMOTE_AUTHORIZATION  | psirik899@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid XCORRELATIONID3  | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  T         | US_SELF_AZURE | 923gf7126h4     | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542011119  | 7e3e92f5537146bcae4da08a30bb80a9  | REMOTE_AUTHORIZATION  | psirik999@gmail.com | 1234567890  | true             |
#      | Incorrect/Invalid AUTHORIZATION1   | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  L         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h                   |JTEHT05J542011118  | 7e3e92f5537146bcae4da08a30bb80a8  | REMOTE_AUTHORIZATION  | psirik899@gmail.com | 1234567890  | true             |
#      | Incorrect/Invalid AUTHORIZATION2   | 400   | RAC-0002       | Incorrect/Invalid Header Values |  application/json|  T         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d@!*^&!       |JTEHT05J542011119  | 7e3e92f5537146bcae4da08a30bb80a9  | REMOTE_AUTHORIZATION  | psirik999@gmail.com | 1234567890  | true             |



#400 - Mandatory Request Body Attribute(s) Missing
  @GenerateRemoteAuthCode_NegativeTest
  Scenario Outline: Generate Authorization code to perform Remote actions _PostAPI with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the GenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs GenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the GenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the GenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The GenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                 | Status  | responseCode | description                                | contentType        | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | email               | phone       | sendNotification |
      | Body_Attribute_Missing vin              | 400     | RAC-0003     | Mandatory Request Body Attributes Missing  |  application/json  |  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |                   | 7e3e92f5537146bcae4da08a30bb8af9  | REMOTE_AUTHORIZATION  | pairiki99@gmail.com | 1234567890  | true             |
      | Body_Attribute_Missing guid             | 400     | RAC-0003     | Mandatory Request Body Attributes Missing  |  application/json  |  T         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J786013191  |                                   | REMOTE_AUTHORIZATION  | pbiriki99@gmail.com | 1234567890  | true             |
      | Body_Attribute_Missing purpose          | 400     | RAC-0003     | Mandatory Request Body Attributes Missing  |  application/json  |  T         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J786023192  | 7e3e92f5537146bcae4da08a30bb8bf9  |                       | pciriki99@gmail.com | 1234567890  | true             |
      | Body_Attribute Missing email&Phone      | 400     | RAC-0003     | Mandatory Request Body Attributes Missing  |  application/json  |  T         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J786033193  | 7e3e92f5537146bcae4da08a30bb8cf9  | REMOTE_AUTHORIZATION  |                     |             | true             |

#400 - Incorrect/Invalid Request body attributes
  @GenerateRemoteAuthCode_NegativeTest
  Scenario Outline: Generate Authorization code to perform Remote actions _PostAPI with Incorrect/Invalid Body Attribute(s) as input data <Message>
    Given Tester calls the GenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs GenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the GenerateRemoteAuthCode_PostAPI service with json body having vin "<vin>" guid "<guid>" purpose "<purpose>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the GenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The GenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                  | Status  | responseCode  | description                                 | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                              |  purpose              | email               | phone       | sendNotification |
      | Incorrect/Invalid_vin1                   | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J54         | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_vin4                   | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |@@@@@@@@@@@@@@@@@  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_guid1                  | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e#*f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_guid2                  | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 3d43b77a30a8454bb1f9h             | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_guid3                  | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f91 | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_guid4                  | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537&11bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_purpose1               | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_123			   | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_purpose2               | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | !@#_   AUTHORIZATION  | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_purpose3               | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATIONN | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_sendNotification1      | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATIONN | psiriki99@gmail.com | 1234567890  | treu             |
	  | Incorrect/Invalid_sendNotification2      | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATIONN | psiriki99@gmail.com | 1234567890  | fasle            |
	  | Incorrect/Invalid_email1                 | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | psiriki99.gmail.com |             | true             |
      | Incorrect/Invalid_email2                 | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | positive1 gmail.com |             | true             |
      | Incorrect/Invalid_email3                 | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  | psiriki99#gmail.com |             | true             |
#      | Incorrect/Invalid_phone1                 | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  L         | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  |                     | 1#34567890  | true             |
#      | Incorrect/Invalid_phone3                 | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  |                     | 1234		   | true             |
#      | Incorrect/Invalid_phone4                 | 400     | RAC-0004      | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | REMOTE_AUTHORIZATION  |                     | 12345678901 | true             |


#400 - Missing entire json body
  @GenerateRemoteAuthCode_NegativeTest
  Scenario Outline: Generate Authorization code to perform Remote actions _PostAPI with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the GenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs GenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the GenerateRemoteAuthCode_PostAPI service with Missing entire json body
    Then the GenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The GenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                 | Status  | responseCode | description                                | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 |
      | Missing entire jsonbody                 | 400     | RAC-0003     | Mandatory Request Body Attributes Missing  |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |

 # Missing json body except{}
  @GenerateRemoteAuthCode_NegativeTest
  Scenario Outline: Generate Authorization code to perform Remote actions _PostAPI with Mandatory Body Attribute(s)except braces Missing in input data <Message>
    Given Tester calls the GenerateRemoteAuthCode_PostAPI with basepath
    When The user inputs GenerateRemoteAuthCode_PostAPI headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester post the GenerateRemoteAuthCode_PostAPI service with Missing entire json body except braces
    Then the GenerateRemoteAuthCode_PostAPI server returns the "<Status>" status code
    And The GenerateRemoteAuthCode_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                 | Status  | responseCode  | description                                | contentType      | XBRAND     | XCHANNEL      | XCORRELATIONID  | Authorization                 |
      | Missing  jsonbody Except braces         | 400     | RAC-0003      | Mandatory Request Body Attributes Missing  |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |
