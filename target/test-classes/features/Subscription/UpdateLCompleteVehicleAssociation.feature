@UpdateLCompleteVehicleAssociation_Regression
Feature: Testing UpdateLCompleteVehicleAssociation_API
  User should get Authorization code to perform Remote Actions.

 #200 -Success Response
  @UpdateLCompleteVehicleAssociation_SmokeTest @Sub_Smoke
  Scenario Outline: Update Lexus Complete Vehicle Association to Put with valid input data <Message>
    Given Tester calls the UpdateLCompleteVehicleAssociation_PutAPI
    When The user inputs UpdateLCompleteVehicleAssociation_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester calls the UpdateLCompleteVehicleAssociation_PutAPI service with json body having guid "<guid>" vin "<vin>" startDate "<startDate>" createDate "<createDate>" createSource "<createSource>"
    Then the UpdateLCompleteVehicleAssociation_PutAPI server returns the "<Status>" status code
    And The UpdateLCompleteVehicleAssociation_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                                   | Status | responseCode | description                    | xChannel  | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                             | vin               | startDate  | createDate | createSource |
      | UpdateLCompleteVehicleAssociation_Smoke_1 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0651 | 1G1AL55F777262789 | 2019-03-12 | 2019-03-12 | US_DEALER    |
      | UpdateLCompleteVehicleAssociation_Smoke_2 | 200    | LCS-0000     | Request Processed Successfully | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0652 | 1G1AL55F777262790 | 2018-08-12 | 2018-08-12 | CA_DEALER    |
      | UpdateLCompleteVehicleAssociation_Smoke_3 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0653 | 1G1AL55F777262791 | 2019-11-12 | 2019-11-12 | LER          |


 #200 - Success
  @UpdateLCompleteVehicleAssociation_PositiveTest
  Scenario Outline: Update Lexus Complete Vehicle Association to Put with valid input data <Message>
    Given Tester calls the UpdateLCompleteVehicleAssociation_PutAPI
    When The user inputs UpdateLCompleteVehicleAssociation_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester calls the UpdateLCompleteVehicleAssociation_PutAPI service with json body having guid "<guid>" vin "<vin>" startDate "<startDate>" createDate "<createDate>" createSource "<createSource>"
    Then the UpdateLCompleteVehicleAssociation_PutAPI server returns the "<Status>" status code
    And The UpdateLCompleteVehicleAssociation_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                          | Status | responseCode | description                    | xChannel  | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                             | vin               | startDate  | createDate | createSource |
      | UpdateLCompleteVehicleAssociation_PositiveTest_1 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0661 | 1G1AL55F777262789 | 2019-03-12 | 2019-03-12 | US_DEALER    |
      | UpdateLCompleteVehicleAssociation_PositiveTest_2 | 200    | LCS-0000     | Request Processed Successfully | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0662 | 1G1AL55F777262790 | 2018-08-12 | 2018-07-12 | CA_DEALER    |
      | UpdateLCompleteVehicleAssociation_PositiveTest_3 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0663 | 1G1AL55F777262791 | 2019-11-12 | 2018-08-12 | LER          |
      | UpdateLCompleteVehicleAssociation_PositiveTest_4 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0667 | 1G1AL55F777262789 | 2019-03-12 | 2018-09-12 | US_DEALER    |
      | UpdateLCompleteVehicleAssociation_PositiveTest_5 | 200    | LCS-0000     | Request Processed Successfully | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0665 | 1G1AL55F777262790 | 2018-08-12 | 2019-12-12 | CA_DEALER    |
      | UpdateLCompleteVehicleAssociation_PositiveTest_6 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0666 | 1G1AL55F777262791 | 2019-11-12 | 2018-03-12 | LER          |


#400 - Mandatory Header Attribute(s) Missing
  @UpdateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Update Lexus Complete Vehicle Association to Put with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the UpdateLCompleteVehicleAssociation_PutAPI
    When The user inputs UpdateLCompleteVehicleAssociation_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester calls the UpdateLCompleteVehicleAssociation_PutAPI service with json body having guid "<guid>" vin "<vin>" startDate "<startDate>" createDate "<createDate>" createSource "<createSource>"
    Then the UpdateLCompleteVehicleAssociation_PutAPI server returns the "<Status>" status code
    And The UpdateLCompleteVehicleAssociation_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                       | Status | responseCode | description                           | xChannel   | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                                 | vin               | startDate  | createDate | createSource |
      | Header Missing xChannel       | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing |            | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | 1G1AL55F777262789 | 2019-03-12 | 2018-03-12 | US_DEALER    |
      | Header Missing Authorization  | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e |                               | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56b | 1G1AL55F777262790 | 2018-08-12 | 2018-03-12 | CA_DEALER    |
      | Header Missing xCorrelationId | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing | TMNA_AGENT |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56c | 1G1AL55F777262791 | 2019-11-12 | 2018-03-12 | LER          |
      | Header Missing dateTime       | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a |               | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56d | 1G1AL55F777262789 | 2019-03-12 | 2018-03-12 | US_DEALER    |


 #400 - Incorrect/Invalid Header values
  @UpdateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Update Lexus Complete Vehicle Association to Put with Incorrect/Invalid Header Attribute(s)as input data <Message>
    Given Tester calls the UpdateLCompleteVehicleAssociation_PutAPI
    When The user inputs UpdateLCompleteVehicleAssociation_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester calls the UpdateLCompleteVehicleAssociation_PutAPI service with json body having guid "<guid>" vin "<vin>" startDate "<startDate>" createDate "<createDate>" createSource "<createSource>"
    Then the UpdateLCompleteVehicleAssociation_PutAPI server returns the "<Status>" status code
    And The UpdateLCompleteVehicleAssociation_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                           | Status | responseCode | description                     | xChannel  | xCorrelationId                       | authorization                   | dateTime      | ContentType      | guid                                 | vin               | startDate  | createDate | createSource |
      | Incorrect/Invalid xChannel1       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_SELF?  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | 1G1AL55F777262789 | 2019-03-12 | 2018-03-12 | US_DEALER    |
      | Incorrect/Invalid xChannel2       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_DEAR   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56b | 1G1AL55F777262790 | 2018-08-12 | 2018-03-12 | CA_DEALER    |
      | Incorrect/Invalid Authorization1  | 400    | LCS-0002     | Incorrect/Invalid Header Values | TC_AGENT  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0MQP3inSoeIYWTRjO       | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56c | 1G1AL55F777262791 | 2019-11-12 | 2018-03-12 | LER          |
      | Incorrect/Invalid Authorization2  | 400    | LCS-0002     | Incorrect/Invalid Header Values | CA_SELF   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inS?><WTRjO | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56d | 1G1AL55F777262789 | 2019-03-12 | 2018-03-12 | US_DEALER    |
      | Incorrect/Invalid xCorrelationId1 | 400    | LCS-0002     | Incorrect/Invalid Header Values | LER       | 6dfd3c74-e7c8-21d67d77ff5e           | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56e | 1G1AL55F777262790 | 2018-08-12 | 2018-03-12 | US_DEALER    |
      | Incorrect/Invalid xCorrelationId2 | 400    | LCS-0002     | Incorrect/Invalid Header Values | TRC       | 6dfd3c74-e7c8-4e02-ba90-?><          | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56f | 1G1AL55F777262791 | 2019-11-12 | 2018-03-12 | CA_DEALER    |
      | Incorrect/Invalid dateTime1       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_SELF   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a   | 15117965      | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | 1G1AL55F777262790 | 2018-08-12 | 2018-03-12 | LER          |
      | Incorrect/Invalid dateTime2       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a   | 15117?>       | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56b | 1G1AL55F777262791 | 2019-11-12 | 2018-03-12 | US_DEALER    |


#400 - Mandatory Request Body Attribute(s) Missing
  @UpdateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Update Lexus Complete Vehicle Association to Put with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the UpdateLCompleteVehicleAssociation_PutAPI
    When The user inputs UpdateLCompleteVehicleAssociation_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester calls the UpdateLCompleteVehicleAssociation_PutAPI service with json body having guid "<guid>" vin "<vin>" startDate "<startDate>" createDate "<createDate>" createSource "<createSource>"
    Then the UpdateLCompleteVehicleAssociation_PutAPI server returns the "<Status>" status code
    And The UpdateLCompleteVehicleAssociation_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                             | Status | responseCode | description                               | xChannel | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                                 | vin               | startDate  | createDate | createSource |
      | Body_Attribute_Missing guid         | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json |                                      | 1G1AL55F777262789 | 2019-03-12 | 2018-03-12 | US_DEALER    |
      | Body_Attribute_Missing createDate   | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | TC_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56c | 1G1AL55F777262790 | 2018-08-12 |            | US_DEALER    |
      | Body_Attribute_Missing createSource | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | CA_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56d | 1G1AL55F777262791 | 2019-11-12 | 2018-03-12 |              |


#400 - Incorrect/Invalid Request body attributes
  @UpdateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Update Lexus Complete Vehicle Association to Put with Incorrect/Invalid Body Attribute(s) as input data <Message>
    Given Tester calls the UpdateLCompleteVehicleAssociation_PutAPI
    When The user inputs UpdateLCompleteVehicleAssociation_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester calls the UpdateLCompleteVehicleAssociation_PutAPI service with json body having guid "<guid>" vin "<vin>" startDate "<startDate>" createDate "<createDate>" createSource "<createSource>"
    Then the UpdateLCompleteVehicleAssociation_PutAPI server returns the "<Status>" status code
    And The UpdateLCompleteVehicleAssociation_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                         | Status | responseCode | description                                 | xChannel  | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                                 | vin               | startDate  | createDate       | createSource |
      | Incorrect/Invalid_guid1         | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_SELF   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 8923gf7126h44b14d                    | 1G1AL55F777262789 | 2019-03-12 | 2018-03-12       | US_DEALER    |
      | Incorrect/Invalid_guid2         | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 8923gf7126h44b14?><d9f87a            | 1G1AL55F777262790 | 2018-08-12 | 2018-03-12       | CA_DEALER    |
      | Incorrect/Invalid_createDate1   | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | LER       | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56e | 1G1AL55F777262791 | 2019-11-12 | 2018-03-12T21:44 | LER          |
      | Incorrect/Invalid_createDate2   | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | TRC       | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56f | 1G1AL55F777262789 | 2019-03-12 | 2018-03-12T2?><  | US_DEALER    |
      | Incorrect/Invalid_createSource1 | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_SELF   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | 1G1AL55F777262790 | 2018-08-12 | 2018-03-12       | US_DE        |
      | Incorrect/Invalid_createSource2 | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56b | 1G1AL55F777262791 | 2019-11-12 | 2018-03-12       | CA_DEA?><    |


#400 - Missing entire json body
  @UpdateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Update Lexus Complete Vehicle Association to Put with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the UpdateLCompleteVehicleAssociation_PutAPI
    When The user inputs UpdateLCompleteVehicleAssociation_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester put the UpdateLCompleteVehicleAssociation_PutAPI service with missing json body
    Then the UpdateLCompleteVehicleAssociation_PutAPI server returns the "<Status>" status code
    And The UpdateLCompleteVehicleAssociation_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                 | Status | responseCode | description                               | xChannel | xCorrelationId                       | authorization                 | dateTime      | ContentType      |
      | Missing entire jsonbody | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json |


# 400 Missing json body except{}
  @UpdateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Update Lexus Complete Vehicle Association to Put with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the UpdateLCompleteVehicleAssociation_PutAPI
    When The user inputs UpdateLCompleteVehicleAssociation_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester put the UpdateLCompleteVehicleAssociation_PutAPI service with missing json body except braces
    Then the UpdateLCompleteVehicleAssociation_PutAPI server returns the "<Status>" status code
    And The UpdateLCompleteVehicleAssociation_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                         | Status | responseCode | description                               | xChannel | xCorrelationId                       | authorization                 | dateTime      | ContentType      |
      | Missing  jsonbody Except braces | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json |

