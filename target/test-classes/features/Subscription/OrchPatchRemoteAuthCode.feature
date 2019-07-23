@OrchGenerateRemoteAuthCode_Regression
Feature: Testing Validate OrchRemoteAuthCode_Patch API
  User should validate the authorization code using patch API
  # Author- Vijay Kadiri
  # 200 Success Response
  @Sub_Smoke @OrchGenerateRemoteAuthCode_SmokeTest
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with valid input data <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" sendNotification "<sendNotification>"
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message   | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | sendNotification |
      | Sub_Smoke | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Sub_Smoke | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | CA_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087652 | ecc9e22a945e46a2b74d399ae12ff132 | 762571   | true             |


     #200 Success Response
  @OrchGenerateRemoteAuthCode_Positive
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with valid input data <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API with json body having imei "<imei>" guid "<guid>" authcode "<authcode>" sendNotification "<sendNotification>"
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                             | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL      | XCORRELATIONID  | Authorization                 | imei            | guid                             | authcode | sendNotification |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907209 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907210 | 07cadafa079d4303b57448de07951e80 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907211 | 48ac15e3269f4ab89271cdddbb8e2d6b | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907212 | b71aa8a6d7bb4b2db6066e139ebb1af4 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907213 | ad59373353c84ae68eff9ce64e8464f5 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907214 | 95c4fc53112a4a15a0f24743386e0795 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907215 | 04d4d3bffe0047bbaa40215209935cca | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907216 | 3d43b77a30a8454bb1f9h0bb78047f1d | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | CA_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907217 | e126b7865f8441faa5f23cd17a949dc8 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | LER           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907218 | f512d608e36c42c89b10bddce717714d | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907219 | 3ae1b94989304601aa9b5cce882abf0f | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907220 | b49c4db47bac44d68e939a5b9254825e | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907221 | d02a313b2ce947739cccda1df63c93a1 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | CA_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907222 | d7c1a015ce644ce4a40ad0e5d205221e | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907223 | 3d43b77a30a8454bb1f9h0bb78047f1d | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907224 | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | US_SELF_AZURE | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907225 | 95c4fc53112a4a15a0f24743386e0795 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | T      | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907226 | 48ac15e3269f4ab89271cdddbb8e2d6b | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | TRC           | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907227 | b71aa8a6d7bb4b2db6066e139ebb1af4 | 123456   | true             |
      | OrchGenerateRemoteAuthCode_Positive | 200    | ORCH-7000    | Request Processed Successfully | application/json | L      | ONEAPP        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907228 | ad59373353c84ae68eff9ce64e8464f5 | 123456   | true             |

#400 - Mandatory Header Attribute(s) Missing
  @OrchAuthCodeRemote_Patch_Negative
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" sendNotification "<sendNotification>"
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                       | Status | responseCode | description                           | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | sendNotification |
      | Header Missing XBRAND         | 400    | ORCH-7001    | Mandatory Header Attribute(s) Missing | application/json |        | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Header Missing XCHANNEL       | 400    | ORCH-7001    | Mandatory Header Attribute(s) Missing | application/json | T      |          | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Header Missing XCORRELATIONID | 400    | ORCH-7001    | Mandatory Header Attribute(s) Missing | application/json | T      | US_SELF  |                 | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Header Missing Authorization  | 400    | ORCH-7001    | Mandatory Header Attribute(s) Missing | application/json | T      | US_SELF  | sendThroughCode |                               | JTEHT05J542087651 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |

#400 - Incorrect/Invalid Header values
  @OrchAuthCodeRemote_Patch_Negative
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with Incorrect/Invalid Header values <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" sendNotification "<sendNotification>"
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                           | Status | responseCode | description                     | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | sendNotification |
      | Incorrect/Invalid XBRAND1         | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | A      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Incorrect/Invalid XBRAND2         | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 1      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Incorrect/Invalid XBRAND3         | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | #      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Incorrect/Invalid XCHANNEL1       | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | T      | UK_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Incorrect/Invalid XCHANNEL2       | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | L      | UK_@ELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Incorrect/Invalid XCHANNEL3       | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | T      | UK_1     | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Incorrect/Invalid XCORRELATIONID1 | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | 923gf!@7126h4   | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Incorrect/Invalid XCORRELATIONID2 | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | 923gf 7126h4    | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
      | Incorrect/Invalid XCORRELATIONID3 | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | 923gf7126h4     | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 7e3e92f5537146bcae4da08a30bb80f9 | 977592   | true             |
#                  | Incorrect/Invalid Authorization1   | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf712!@#*_ 4d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | 977592				   |  true             |
#                  | Incorrect/Invalid Authorization2   | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf712                     |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | 977592				   |  true             |
#                  | Incorrect/Invalid Authorization3   | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  T         | US_SELF       | sendThroughCode | 11111111111111111111111111111 |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | 977592				   |  true             |
#                  | Incorrect/Invalid Authorization4   | 400   | ORCH-7002      | Incorrect/Invalid Header Values |  application/json|  T         | US_SELF       | sendThroughCode | AAAAAAAAAAAAAAAAAAAAAAAAAAAAA |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  | 977592				   |  true             |

#400 - Mandatory Request Body Attribute(s) Missing
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with Mandatory Request Body Attribute(s) Missing <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" sendNotification "<sendNotification>"
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                 | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | sendNotification |
      | Body_Attribute_Missing vin              | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |                   | 7e3e92f5537146bcae4da08a30bb80f9 | 123456   | true             |
      | Body_Attribute_Missing guid             | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 |                                  | 123456   | true             |
      | Body_Attribute_Missing sendNotification | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 |                                  | 123456   |                  |
#                  | Body_Attribute_Missing authcode         | 400     | ORCH-7003    | Mandatory Request Body Attributes Missing |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542053195  | 7e3e92f5537146bcae4da08a30bb80f9  |                       | true             |

#400 - Incorrect/Invalid Request body attributes
  @OrchAuthCodeRemote_Patch_Negative
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with Incorrect/Invalid Request body attributes <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" sendNotification "<sendNotification>"
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                            | Status | responseCode | description                                 | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin                | guid                              | authcode | sendNotification |
      | Incorrect/Invalid_vin1             | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J54         | 7e3e92f5537146bcae4da08a30bb80f9  | 977592   | true             |
      | Incorrect/Invalid_vin2             | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | AAAAAAAAAAAAAAAAAA | 7e3e92f5537146bcae4da08a30bb80f9  | 977592   | true             |
      | Incorrect/Invalid_vin3             | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 111111111111111111 | 7e3e92f5537146bcae4da08a30bb80f9  | 977592   | true             |
      | Incorrect/Invalid_vin4             | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | @@@@@@@@@@@@@@@@@  | 7e3e92f5537146bcae4da08a30bb80f9  | 977592   | true             |
#     | Incorrect/Invalid_guid1     			| 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542087651  | 7e3e92f553714@bcae4da08a30bb80f9  | 977592				   |  true             |
      | Incorrect/Invalid_guid2            | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651  | 7e3e92f553714a30bb80f9            | 977592   | true             |
      | Incorrect/Invalid_guid3            | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651  | 7e3e92f5537146bcae4da08a30bb80f91 | 977592   | true             |
#                  | Incorrect/Invalid_authcode1              | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542087651  | 7e3e92f5537146bcae4da08a30bb80f9  | 12345A				   | true              |
#                  | Incorrect/Invalid_authcode2              | 400     | ORCH-7004     | Incorrect/Invalid Request Body Attribute(s) |  application/json|  T         | US_SELF       | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |JTEHT05J542087651  | 7e3e92f5537146bcae4da08a30bb80f9  | !@#123				   | true              |
      | Incorrect/Invalid_authcode3        | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651  | 7e3e92f5537146bcae4da08a30bb80f9  | 12345    | true             |
      | Incorrect/Invalid_sendNotification | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542087651  | 7e3e92f5537146bcae4da08a30bb80f9  | 12345    | treu             |

#400 - Incorrect/Invalid Request body attributes
  @OrchAuthCodeRemote_Patch_Negative
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with Incorrect/Invalid Request body attributes <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API with json body having imei "<imei>" guid "<guid>" authcode "<authcode>" sendNotification "<sendNotification>"
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                            | Status | responseCode | description                                 | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | imei               | guid                              | authcode | sendNotification |
      | Incorrect/Invalid_imei1            | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J54         | 7e3e92f5537146bcae4da08a30bb80f9  | 977592   | true             |
      | Incorrect/Invalid_imei2            | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | AAAAAAAAAAAAAAAAAA | 7e3e92f5537146bcae4da08a30bb80f9  | 977592   | true             |
      | Incorrect/Invalid_guid1            | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907209    | 7e3e92f553714a30bb80f9            | 977592   | true             |
      | Incorrect/Invalid_guid2            | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907209    | 7e3e92f5537146bcae4da08a30bb80f91 | 977592   | true             |
      | Incorrect/Invalid_authcode1        | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907209    | 7e3e92f5537146bcae4da08a30bb80f9  | 12345    | true             |
      | Incorrect/Invalid_sendNotification | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 344255141907209    | 7e3e92f5537146bcae4da08a30bb80f9  | 977592   | treu             |

 #400 - Missing entire json body
  @OrchAuthCodeRemote_Patch_Negative
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with Missing entire json body <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API with Missing entire json body
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                 | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 |
      | Missing entire jsonbody | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |

#400- Missing json body except{}
  @OrchAuthCodeRemote_Patch_Negative
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with Missing entire json body except braces <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API Missing entire json body except braces
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                               | Status | responseCode | description                               | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 |
      | Missing entire jsonbody except braces | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |

#400 Email/Phone Not Verified  for Auth Code Verification
  @OrchAuthCodeRemote_Patch_Negative
  Scenario Outline: Validate OrchRemoteAuthCode_Patch API with data that is not verified email/phone for Authcode verification <Message>
    Given Tester calls the Validate OrchRemoteAuthCode_Patch API with basepath
    When The user inputs Validate OrchRemoteAuthCode_Patch API headers ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls Validate OrchRemoteAuthCode_Patch API with json body having vin "<vin>" guid "<guid>" authcode "<authcode>" sendNotification "<sendNotification>"
    Then the Validate OrchRemoteAuthCode_Patch API server returns the "<Status>" status code
    And The Validate OrchRemoteAuthCode_Patch API body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                              | Status | responseCode | description                                          | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | vin               | guid                             | authcode | sendNotification |
      | Email/Phone Not Verified  for Auth Code Verification | 400    | ORCH-7016    | Email/Phone Not Verified  for Auth Code Verification | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053195 | 8154d24167ed4254bba3f00f72d63261 | 123456   | true             |
      | Email/Phone Not Verified  for Auth Code Verification | 400    | ORCH-7016    | Email/Phone Not Verified  for Auth Code Verification | application/json | T      | CA_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | JTEHT05J542053196 | 8154d24167ed4254bba3f00f72d63261 | 123456   | true             |

