@OrchGenerateRemoteAuthCodeIMEI_Regression
Feature: Testing OrchValidateRemoteAuthCodeIMEI_API
  User should get Authorization code to perform Remote Actions.


 #200 -Success Response
  @OrchGenerateRemoteAuthCodeIMEI_SmokeTest @Sub_Smoke
  Scenario Outline: OrcValidate Authorization code to perform Remote actions _PostAPI with valid input data <Message>
    Given Tester calls the OrcValidateRemoteAuthCodeIMEI_PostAPI with imei "<imei>"
    When The user inputs OrcValidateRemoteAuthCodeIMEI_PostAPI headers ContentType "<contentType>" imei "<imei>" Authorization "<Authorization>" CV_AuthCode "<CV_AuthCode>"
    When Tester post the OrcValidateRemoteAuthCodeIMEI_PostAPI service with json body having whenAuthorized "<whenAuthorized>" role "<role>" iccid "<iccid>"
    Then the OrcValidateRemoteAuthCodeIMEI_PostAPI server returns the "<Status>" status code
    And The OrcValidateRemoteAuthCodeIMEI_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                                | Status | responseCode | description                    | contentType      | Authorization                 | imei           | CV_AuthCode | whenAuthorized | role           | iccid          |
      | OrchGenerateRemoteAuthCodeIMEI_Smoke_1 | 200    | ORCH-7000    | Request Processed Successfully | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 143304      | 1511796583386  | REMOTECMD_USER | 8408985644     |
      | OrchGenerateRemoteAuthCodeIMEI_Smoke_2 | 200    | ORCH-7000    | Request Processed Successfully | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 179417      | 1511796583386  | REMOTECMD_USER | 84089856446789 |
      | OrchGenerateRemoteAuthCodeIMEI_Smoke_3 | 200    | ORCH-7000    | Request Processed Successfully | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_USER | 8408985644     |


 #200 - Success
  @OrchGenerateRemoteAuthCodeIMEI_PositiveTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with valid input data <Message>
    Given Tester calls the OrcValidateRemoteAuthCodeIMEI_PostAPI with imei "<imei>"
    When The user inputs OrcValidateRemoteAuthCodeIMEI_PostAPI headers ContentType "<contentType>" imei "<imei>" Authorization "<Authorization>" CV_AuthCode "<CV_AuthCode>"
    When Tester post the OrcValidateRemoteAuthCodeIMEI_PostAPI service with json body having whenAuthorized "<whenAuthorized>" role "<role>" iccid "<iccid>"
    Then the OrcValidateRemoteAuthCodeIMEI_PostAPI server returns the "<Status>" status code
    And The OrcValidateRemoteAuthCodeIMEI_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                       | Status | responseCode | description                    | contentType      | Authorization                 | imei           | CV_AuthCode | whenAuthorized | role           | iccid          |
      | OrchGenerateRemoteAuthCodeIMEI_PositiveTest_1 | 200    | ORCH-7000    | Request Processed Successfully | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 143304      | 1511796583386  | REMOTECMD_USER | 8447884487     |
      | OrchGenerateRemoteAuthCodeIMEI_PositiveTest_2 | 200    | ORCH-7000    | Request Processed Successfully | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 179417      | 1511796583386  | REMOTECMD_USER | 84478844874567 |
      | OrchGenerateRemoteAuthCodeIMEI_PositiveTest_3 | 200    | ORCH-7000    | Request Processed Successfully | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_USER | 8447884487     |
      | OrchGenerateRemoteAuthCodeIMEI_PositiveTest_4 | 200    | ORCH-7000    | Request Processed Successfully | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 143304      | 1511796583386  | REMOTECMD_USER | 8447884487     |
      | OrchGenerateRemoteAuthCodeIMEI_PositiveTest_5 | 200    | ORCH-7000    | Request Processed Successfully | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 179417      | 1511796583386  | REMOTECMD_USER | 84478844877890 |
      | OrchGenerateRemoteAuthCodeIMEI_PositiveTest_6 | 200    | ORCH-7000    | Request Processed Successfully | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_USER | 8447884487     |


#400 - Mandatory Header Attribute(s) Missing
  @OrchGenerateRemoteAuthCodeIMEI_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the OrcValidateRemoteAuthCodeIMEI_PostAPI with imei "<imei>"
    When The user inputs OrcValidateRemoteAuthCodeIMEI_PostAPI headers ContentType "<contentType>" imei "<imei>" Authorization "<Authorization>" CV_AuthCode "<CV_AuthCode>"
    When Tester post the OrcValidateRemoteAuthCodeIMEI_PostAPI service with json body having whenAuthorized "<whenAuthorized>" role "<role>" iccid "<iccid>"
    Then the OrcValidateRemoteAuthCodeIMEI_PostAPI server returns the "<Status>" status code
    And The OrcValidateRemoteAuthCodeIMEI_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                      | Status | responseCode | description                           | contentType      | Authorization                 | imei           | CV_AuthCode | whenAuthorized | role           | iccid          |
      | Header Missing imei          | 400    | ORCH-7001    | Mandatory Header Attribute(s) Missing | application/json | 8923gf7126h44b14d3df08dd9f87a |                | 143304      | 1511796583386  | REMOTECMD_USER | 8447884487     |
      | Header Missing Authorization | 400    | ORCH-7001    | Mandatory Header Attribute(s) Missing | application/json |                               | 10900000009999 | 179417      | 1511796583386  | REMOTECMD_USER | 84478844874567 |
      | Header Missing CV_AuthCode   | 400    | ORCH-7001    | Mandatory Header Attribute(s) Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 |             | 1511796583386  | REMOTECMD_USER | 8447884487     |
      | Header Missing ContentType   | 400    | ORCH-7001    | Mandatory Header Attribute(s) Missing |                  | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 143304      | 1511796583386  | REMOTECMD_USER | 8447884487     |
      | Header Missing imei          | 400    | RAC-0001     | Mandatory Header Attribute(s) Missing | application/json | 8923gf7126h44b14d3df08dd9f87a |                | 179417      | 1511796583386  | REMOTECMD_USER | 84478844877890 |
      | Header Missing Authorization | 400    | RAC-0001     | Mandatory Header Attribute(s) Missing | application/json |                               | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_USER | 8447884487     |
      | Header Missing CV_AuthCode   | 400    | RAC-0001     | Mandatory Header Attribute(s) Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | A1000004104635 | 179417      | 1511796583386  | REMOTECMD_USER | 5718537079     |
      | Header Missing ContentType   | 400    | RAC-0001     | Mandatory Header Attribute(s) Missing |                  | 8923gf7126h44b14d3df08dd9f87a | A10000041029D7 | 153699      | 1511796583386  | REMOTECMD_USER | 5718537079     |


 #400 - Incorrect/Invalid Header values
  @OrchGenerateRemoteAuthCodeIMEI_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Incorrect/Invalid Header Attribute(s)as input data <Message>
    Given Tester calls the OrcValidateRemoteAuthCodeIMEI_PostAPI with imei "<imei>"
    When The user inputs OrcValidateRemoteAuthCodeIMEI_PostAPI headers ContentType "<contentType>" imei "<imei>" Authorization "<Authorization>" CV_AuthCode "<CV_AuthCode>"
    When Tester post the OrcValidateRemoteAuthCodeIMEI_PostAPI service with json body having whenAuthorized "<whenAuthorized>" role "<role>" iccid "<iccid>"
    Then the OrcValidateRemoteAuthCodeIMEI_PostAPI server returns the "<Status>" status code
    And The OrcValidateRemoteAuthCodeIMEI_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                          | Status | responseCode | description                     | contentType      | Authorization                 | imei           | CV_AuthCode | whenAuthorized | role           | iccid      |
      | Incorrect/Invalid imei1          | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000        | 143304      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid imei2          | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | azcvbnhyo      | 179417      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid imei3          | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021?> | 153699      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid Authorization1 | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df0         | A100000011111C | 143304      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid Authorization2 | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3dppppppp    | 10900000009999 | 179417      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid Authorization3 | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd?;    | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid CV_AuthCode1   | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | A1000004104635 | 179         | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid CV_AuthCode2   | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041029D7 | 153uy       | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid CV_AuthCode3   | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 14330:?     | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid ContentType1   | 400    | ORCH-7002    | Incorrect/Invalid Header Values | application      | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 179417      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid imei1          | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000        | 153699      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid imei2          | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | azcvbnhyo      | 143304      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid imei3          | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021?> | 179417      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid Authorization1 | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df0         | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid Authorization2 | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3dppppppp    | A1000004104635 | 179417      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid Authorization3 | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd?;    | A100000011111C | 153699      | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid CV_AuthCode1   | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 179         | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid CV_AuthCode2   | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 153uy       | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid CV_AuthCode3   | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 14330:?     | 1511796583386  | REMOTECMD_USER | 5718537079 |
      | Incorrect/Invalid ContentType1   | 400    | RAC-0002     | Incorrect/Invalid Header Values | application/     | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 143304      | 1511796583386  | REMOTECMD_USER | 5718537079 |


#400 - Mandatory Request Body Attribute(s) Missing
  @OrchGenerateRemoteAuthCodeIMEI_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the OrcValidateRemoteAuthCodeIMEI_PostAPI with imei "<imei>"
    When The user inputs OrcValidateRemoteAuthCodeIMEI_PostAPI headers ContentType "<contentType>" imei "<imei>" Authorization "<Authorization>" CV_AuthCode "<CV_AuthCode>"
    When Tester post the OrcValidateRemoteAuthCodeIMEI_PostAPI service with json body having whenAuthorized "<whenAuthorized>" role "<role>" iccid "<iccid>"
    Then the OrcValidateRemoteAuthCodeIMEI_PostAPI server returns the "<Status>" status code
    And The OrcValidateRemoteAuthCodeIMEI_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                               | Status | responseCode | description                               | contentType      | Authorization                 | imei           | CV_AuthCode | whenAuthorized | role           | iccid      |
      | Body_Attribute_Missing whenAuthorized | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 143304      |                | REMOTECMD_USER | 5718537079 |
      | Body_Attribute_Missing role           | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 179417      | 1511796583386  |                | 5718537079 |
      | Body_Attribute_Missing iccid          | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_USER |            |
      | Body_Attribute_Missing whenAuthorized | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 143304      |                | REMOTECMD_USER | 5718537079 |
      | Body_Attribute_Missing role           | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 179417      | 1511796583386  |                | 5718537079 |
      | Body_Attribute_Missing iccid          | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_USER |            |


#400 - Incorrect/Invalid Request body attributes
  @OrchGenerateRemoteAuthCodeIMEI_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Incorrect/Invalid Body Attribute(s) as input data <Message>
    Given Tester calls the OrcValidateRemoteAuthCodeIMEI_PostAPI with imei "<imei>"
    When The user inputs OrcValidateRemoteAuthCodeIMEI_PostAPI headers ContentType "<contentType>" imei "<imei>" Authorization "<Authorization>" CV_AuthCode "<CV_AuthCode>"
    When Tester post the OrcValidateRemoteAuthCodeIMEI_PostAPI service with json body having whenAuthorized "<whenAuthorized>" role "<role>" iccid "<iccid>"
    Then the OrcValidateRemoteAuthCodeIMEI_PostAPI server returns the "<Status>" status code
    And The OrcValidateRemoteAuthCodeIMEI_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                           | Status | responseCode | description                                 | contentType      | Authorization                 | imei           | CV_AuthCode | whenAuthorized | role              | iccid         |
      | Incorrect/Invalid_whenAuthorized1 | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 143304      | 1511796        | REMOTECMD_USER    | 5718537079    |
      | Incorrect/Invalid_whenAuthorized2 | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 179417      | 1511fjfgj      | REMOTECMD_USER    | 5718537079    |
      | Incorrect/Invalid_whenAuthorized3 | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 153699      | 151179658?><   | REMOTECMD_USER    | 5718537079    |
      | Incorrect/Invalid_role1           | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 143304      | 1511796583386  | REMOTECMD         | 5718537079    |
      | Incorrect/Invalid_role2           | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 179417      | 1511796583386  | REMOTECMDsfgsdfgs | 5718537079    |
      | Incorrect/Invalid_role3           | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_U?&*    | 5718537079    |
      | Incorrect/Invalid_iccid1          | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A1000004104635 | 179417      | 1511796583386  | REMOTECMD_USER    | 5718          |
      | Incorrect/Invalid_iccid2          | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041029D7 | 153699      | 1511796583386  | REMOTECMD_USER    | 57185fgfdbvdf |
      | Incorrect/Invalid_iccid3          | 400    | ORCH-7004    | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 153699      | 1511796583386  | REMOTECMD_USER    | 571853?(%^    |
      | Incorrect/Invalid_whenAuthorized1 | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 143304      | 1511796        | REMOTECMD_USER    | 5718537079     |
      | Incorrect/Invalid_whenAuthorized2 | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 179417      | 1511fjfgj      | REMOTECMD_USER    | 5718537079     |
      | Incorrect/Invalid_whenAuthorized3 | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 153699      | 151179658?><   | REMOTECMD_USER    | 5718537079     |
      | Incorrect/Invalid_role1           | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 143304      | 1511796583386  | REMOTECMD         | 5718537079     |
      | Incorrect/Invalid_role2           | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 179417      | 1511796583386  | REMOTECMDsfgsdfgs | 5718537079     |
      | Incorrect/Invalid_role3           | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A1000004104635 | 153699      | 1511796583386  | REMOTECMD_U?&*    | 5718537079     |
      | Incorrect/Invalid_iccid1          | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A100000011111C | 179417      | 1511796583386  | REMOTECMD_USER    | 5718           |
      | Incorrect/Invalid_iccid2          | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 153699      | 1511796583386  | REMOTECMD_USER    | 57185fgfdbvdf  |
      | Incorrect/Invalid_iccid3          | 400    | RAC-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | 8923gf7126h44b14d3df08dd9f87a | A10000041021B5 | 153699      | 1511796583386  | REMOTECMD_USER    | 571853?(%^     |


#400 - Missing entire json body
  @OrchGenerateRemoteAuthCodeIMEI_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the OrcValidateRemoteAuthCodeIMEI_PostAPI with imei "<imei>"
    When The user inputs OrcValidateRemoteAuthCodeIMEI_PostAPI headers ContentType "<contentType>" imei "<imei>" Authorization "<Authorization>" CV_AuthCode "<CV_AuthCode>"
    When Tester post the OrcValidateRemoteAuthCodeIMEI_PostAPI service with json body having whenAuthorized "<whenAuthorized>" role "<role>" iccid "<iccid>"
    Then the OrcValidateRemoteAuthCodeIMEI_PostAPI server returns the "<Status>" status code
    And The OrcValidateRemoteAuthCodeIMEI_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                 | Status | responseCode | description                               | contentType      | Authorization                 | imei           | CV_AuthCode |
      | Missing entire jsonbody | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 153699      |
      | Missing entire jsonbody | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 153699      |


# 400 Missing json body except{}
  @OrchGenerateRemoteAuthCodeIMEI_NegativeTest
  Scenario Outline: OrcGenerate Authorization code to perform Remote actions _PostAPI with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the OrcValidateRemoteAuthCodeIMEI_PostAPI with imei "<imei>"
    When The user inputs OrcValidateRemoteAuthCodeIMEI_PostAPI headers ContentType "<contentType>" imei "<imei>" Authorization "<Authorization>" CV_AuthCode "<CV_AuthCode>"
    When Tester post the OrcValidateRemoteAuthCodeIMEI_PostAPI service with json body having whenAuthorized "<whenAuthorized>" role "<role>" iccid "<iccid>"
    Then the OrcValidateRemoteAuthCodeIMEI_PostAPI server returns the "<Status>" status code
    And The OrcValidateRemoteAuthCodeIMEI_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                         | Status | responseCode | description                               | contentType      | Authorization                 | imei           | CV_AuthCode |
      | Missing  jsonbody Except braces | 400    | ORCH-7003    | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 153699      |
      | Missing  jsonbody Except braces | 400    | RAC-0003     | Mandatory Request Body Attributes Missing | application/json | 8923gf7126h44b14d3df08dd9f87a | 10900000009999 | 153699      |

