@PatchRemoteAuthCode_Regression
Feature: Testing ValidateRemoteAuthCode_Patch API
  User should validate the authorization code using patch API
  # Author- Vijay Kadiri
  #200 -Success Response
  @Sub_Smoke @PatchRemoteAuthCode_Smoke
  Scenario Outline: ValidateRemoteAuthCode_Patch API with valid input data <Message>
    Given Tester calls the ValidateRemoteAuthCode_Patch API with basepath
    When The user inputs ValidateRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls ValidateRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the ValidateRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The ValidateRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                     | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | email               | phone      | sendNotification |
      | PatchRemoteAuthCode_Smoke_1 | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542987654 | 7e3e92f5537146bcae4da08a30bb80f1 | 369681   | zxc@gmail.com       | 1234567890 | true             |
      | PatchRemoteAuthCode_Smoke_2 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | CA_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542012311 | 07cadafa079d4303b57448de079511a2 | 123456   | psiriki01@gmail.com |            | true             |

  #200 -Success Response
  @PatchRemoteAuthCode_PositiveTest
  Scenario Outline: ValidateRemoteAuthCode_Patch API with valid input data <Message>
    Given Tester calls the ValidateRemoteAuthCode_Patch API with basepath
    When The user inputs ValidateRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls ValidateRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the ValidateRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The ValidateRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                             | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | email            | phone      | sendNotification |
      | PatchRemoteAuthCode_PositiveTest_1  | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111111 | 7e3e92f5537146bcae4da08030bb80a1 | 669552   | abc001@gmail.com | 1234567890 | true             |
      | PatchRemoteAuthCode_PositiveTest_2  | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111112 | 07cadafa079d4303b57448ae07951ea2 | 298310   | abc002@gmail.com | 1234567891 | true             |
      | PatchRemoteAuthCode_PositiveTest_3  | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111113 | 48ac15e3269f4ab89271cdbdbb8e2da3 | 520282   | abc001@gmail.com | 1234567892 | true             |
      | PatchRemoteAuthCode_PositiveTest_4  | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111114 | b71aa8a6d7bb4b2db6066ec39ebb1aa4 | 246057   | abc001@gmail.com | 1234567893 | true             |
      | PatchRemoteAuthCode_PositiveTest_5  | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J511111115 | ad59373353c84ae68eff9cd64e8464a5 | 744792   | abc001@gmail.com | 1234567894 | true             |
      | PatchRemoteAuthCode_PositiveTest_6  | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542111116 | 95c4fc53112a4a15a0f247e3386e07a6 | 294208   | abc001@gmail.com | 1111111111 | true             |
      | PatchRemoteAuthCode_PositiveTest_7  | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542111117 | 04d4d3bffe0047bbaa4021f209935ca7 | 512837   | abc001@gmail.com | 1234567896 | true             |
      | PatchRemoteAuthCode_PositiveTest_8  | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542111118 | 3d43b77a30a8454bb1f9h0gb78047fa8 | 208388   | abc001@gmail.com | 1234567897 | true             |
      | PatchRemoteAuthCode_PositiveTest_9  | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542111119 | e126b7865f8441faa5f23ch17a949da9 | 145533   | abc001@gmail.com | 1234567898 | true             |
      | PatchRemoteAuthCode_PositiveTest_10 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111120 | f512d608e36c42c89b10bdice71771b1 | 577495   | abc001@gmail.com | 1234567899 | true             |
      | PatchRemoteAuthCode_PositiveTest_11 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111121 | 3ae1b94989304601aa9b5cje882abfb1 | 957631   | abc001@gmail.com | 1234567801 | true             |
      | PatchRemoteAuthCode_PositiveTest_12 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111122 | b49c4db47bac44d68e939akb925482b3 | 341671   | abc001@gmail.com | 1234567802 | true             |
      | PatchRemoteAuthCode_PositiveTest_13 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111123 | d02a313b2ce947739cccdaldf63c93b4 | 270207   | abc001@gmail.com | 1234567803 | true             |
      | PatchRemoteAuthCode_PositiveTest_14 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111124 | d7c1a015ce644ce4a40ad0m5d20522b5 | 389514   | abc001@gmail.com | 1234567804 | true             |
      | PatchRemoteAuthCode_PositiveTest_16 | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111125 | 3d43b77a30a8454bb1f9h0nb78047fb6 | 652080   | abc001@gmail.com |            | false            |
      | PatchRemoteAuthCode_PositiveTest_17 | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111126 | 7e3e92f5537146bcae4da0oa30bb80b7 | 389814   |                  | 1234567805 | true             |
      | PatchRemoteAuthCode_PositiveTest_18 | 200    | RAC-0000     | Request Processed Successfully | application/json | T      | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111127 | 95c4fc53112a4a15a0f247p3386e07b8 | 204137   |                  | 1111111111 | true             |
      | PatchRemoteAuthCode_PositiveTest_19 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111128 | 48ac15e3269f4ab89271cdqdbb8e2db9 | 350861   | abc001@gmail.com |            | true             |
      | PatchRemoteAuthCode_PositiveTest_20 | 200    | RAC-0000     | Request Processed Successfully | application/json | L      | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J541111129 | b71aa8a6d7bb4b2db6066er39ebb1ac1 | 451427   | abc001@gmail.com |            | true             |

#400 - Mandatory Header Attribute(s) Missing
  @PatchRemoteAuthCode_NegativeTest
  Scenario Outline: ValidateRemoteAuthCode_Patch API with Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the ValidateRemoteAuthCode_Patch API with basepath
    When The user inputs ValidateRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls ValidateRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the ValidateRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The ValidateRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                       | Status | responseCode | description                           | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | email               | phone      | sendNotification |
      | Header Missing XBRAND         | 400    | RAC-0001     | Mandatory Header Attribute(s) Missing | application/json |        | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542012345 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Header Missing XCHANNEL       | 400    | RAC-0001     | Mandatory Header Attribute(s) Missing | application/json | T      |          | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542012346 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Header Missing XCORRELATIONID | 400    | RAC-0001     | Mandatory Header Attribute(s) Missing | application/json | L      | CA_SELF  |                 | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542012347 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Header Missing Authorization  | 400    | RAC-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | US_SELF  | sendThroughCode |                               | JTEHT05J542012348 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |

#400 - Incorrect/Invalid Header values
  @PatchRemoteAuthCode_NegativeTest
  Scenario Outline: ValidateRemoteAuthCode_Patch API with Incorrect/Invalid Header Attribute(s)as input data <Message>
    Given Tester calls the ValidateRemoteAuthCode_Patch API with basepath
    When The user inputs ValidateRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls ValidateRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the ValidateRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The ValidateRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                           | Status | responseCode | description                     | contentType      | XBRAND | XCHANNEL      | XCORRELATIONID  | Authorization                  | vin               | guid                             | authcode | email               | phone      | sendNotification |
      | Incorrect/Invalid XBRAND1         | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | A      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a  | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid XBRAND2         | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 1      | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a  | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid XBRAND3         | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | #      | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a  | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid XCHANNEL1       | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | T      | UK_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a  | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid XCHANNEL2       | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | L      | UK_@ELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a  | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid XCHANNEL3       | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | T      | UK_1          | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a  | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid XCORRELATIONID1 | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | L      | US_SELF       | 923gf!@7126h4   | 8923gf7126h44b14d3df08dd9f87a  | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid XCORRELATIONID2 | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | T      | CA_SELF_AZURE | 923gf 7126h4    | 8923gf7126h44b14d3df08dd9f87a  | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid XCORRELATIONID3 | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | T      | LER           | 923gf7126h4     | 8923gf7126h44b14d3df08dd9f87a  | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid Authorization1  | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | T      | CA_SELF_AZURE | sendThroughCode | 8923gf7126h                    | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid Authorization2  | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | T      | LER           | sendThroughCode | 8923gf7126h4@!#                | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Incorrect/Invalid Authorization3  | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | T      | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a1 | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |

#400 - Mandatory Request Body Attribute(s) Missing
  @PatchRemoteAuthCode_NegativeTest
  Scenario Outline: ValidateRemoteAuthCode_Patch API with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the ValidateRemoteAuthCode_Patch API with basepath
    When The user inputs ValidateRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls ValidateRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the ValidateRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The ValidateRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                            | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL      | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | email               | phone      | sendNotification |
      | Body_Attribute_Missing vin         | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |                   | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Body_Attribute_Missing guid        | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | L      | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 |                                  | 123456   | psiriki99@gmail.com | 1234567890 | true             |
      | Body_Attribute_Missing authcode    | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | T      | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 |          | psiriki99@gmail.com | 1234567890 | true             |
      | Body_Attribute Missing email&Phone | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | L      | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   |                     |            | true             |
      | Body_Attribute_Missing authcode    | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | T      | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | psiriki99@gmail.com | 1234567890 |                  |

#400 - Incorrect/Invalid Request body attributes
  @PatchRemoteAuthCode_NegativeTest
  Scenario Outline: ValidateRemoteAuthCode_Patch API with Incorrect/Invalid Body Attribute(s) as input data <Message>
    Given Tester calls the ValidateRemoteAuthCode_Patch API with basepath
    When The user inputs ValidateRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls ValidateRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" email "<email>" phone "<phone>" sendNotification "<sendNotification>"
    Then the ValidateRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The ValidateRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                            | Status | responseCode | description                                 | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                              | authcode | email               | phone       | sendNotification |
      | Incorrect/Invalid_vin1             | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J54        | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_vin4             | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | @@@@@@@@@@@@@@@@@ | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_vin5             | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT 5J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_guid1            | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e#*f5537146bcae4da08a30bb80f9  | 123456   | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_guid2            | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 3d43b77a30a8454bb1f9h             | 123456   | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_guid3            | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f91 | 123456   | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_guid4            | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537&11bcae4da08a30bb80f9  | 123456   | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_authcode1        | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 123REM   | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_authcode3        | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 1234567  | psiriki99@gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_email1           | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | psiriki99.gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_email2           | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | positive1 gmail.com | ABCD        | true             |
      | Incorrect/Invalid_email3           | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | psiriki99#gmail.com | 1234567890  | true             |
      | Incorrect/Invalid_phone1           | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | psiriki99@gmail.com | 1#34567890  | true             |
      | Incorrect/Invalid_phone2           | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | positive1 gmail.com | 14567890    | true             |
      | Incorrect/Invalid_phone3           | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | psiriki99@gmail.com | 12345678901 | true             |
      | Incorrect/Invalid_sendNotification | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9  | 123456   | psiriki99#gmail.com | 1234567890  | treu             |

 #400 - Missing entire json body
  @PatchRemoteAuthCode_NegativeTest
  Scenario Outline: ValidateRemoteAuthCode_Patch API with missing entire json Body as input data <Message>
    Given Tester calls the ValidateRemoteAuthCode_Patch API with basepath
    When Tester calls ValidateRemoteAuthCode_Patch API with with Missing entire json body
    Then the ValidateRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The ValidateRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"
    When The user inputs ValidateRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    Examples:

      | Message                 | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 |
      | Missing entire jsonbody | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |

 # Missing json body except{}
  @PatchRemoteAuthCode_NegativeTest
  Scenario Outline: ValidateRemoteAuthCode_Patch API with missing entire json Body except braces as input data <Message>
    Given Tester calls the ValidateRemoteAuthCode_Patch API with basepath
    When The user inputs ValidateRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls ValidateRemoteAuthCode_Patch API with with Missing entire json body except braces
    Then the ValidateRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The ValidateRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                               | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 |
      | Missing entire jsonbody except braces | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |
