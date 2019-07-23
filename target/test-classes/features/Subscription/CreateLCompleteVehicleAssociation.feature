@CreateLCompleteVehicleAssociation_Regression
Feature: Testing CreateLCompleteVehicleAssociation_API
  User should get Authorization code to perform Remote Actions.


 #200 -Success Response
  @CreateLCompleteVehicleAssociation_SmokeTest @Sub_Smoke
  Scenario Outline: Create Lexus Complete Vehicle Association to Post with valid input data <Message>
    Given Tester calls the CreateLCompleteVehicleAssociation_PostAPI
    When The user inputs CreateLCompleteVehicleAssociation_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester post the CreateLCompleteVehicleAssociation_PostAPI service with json body having guid "<guid>" createDate "<createDate>" createSource "<createSource>"
    Then the CreateLCompleteVehicleAssociation_PostAPI server returns the "<Status>" status code
    And The CreateLCompleteVehicleAssociation_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                                   | Status | responseCode | description                    | xChannel  | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                             | createDate | createSource |
      | CreateLCompleteVehicleAssociation_Smoke_1 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0651 | 2019-03-12 | US_DEALER    |
      | CreateLCompleteVehicleAssociation_Smoke_2 | 200    | LCS-0000     | Request Processed Successfully | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0652 | 2018-08-12 | CA_DEALER    |
      | CreateLCompleteVehicleAssociation_Smoke_3 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0653 | 2019-11-12 | LER          |


 #200 - Success
  @CreateLCompleteVehicleAssociation_PositiveTest
  Scenario Outline: Create Lexus Complete Vehicle Association to Post with valid input data <Message>
    Given Tester calls the CreateLCompleteVehicleAssociation_PostAPI
    When The user inputs CreateLCompleteVehicleAssociation_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester post the CreateLCompleteVehicleAssociation_PostAPI service with json body having guid "<guid>" createDate "<createDate>" createSource "<createSource>"
    Then the CreateLCompleteVehicleAssociation_PostAPI server returns the "<Status>" status code
    And The CreateLCompleteVehicleAssociation_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                          | Status | responseCode | description                    | xChannel  | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                             | createDate | createSource |
      | CreateLCompleteVehicleAssociation_PositiveTest_1 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0661 | 2019-03-12 | US_DEALER    |
      | CreateLCompleteVehicleAssociation_PositiveTest_2 | 200    | LCS-0000     | Request Processed Successfully | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0662 | 2018-07-12 | CA_DEALER    |
      | CreateLCompleteVehicleAssociation_PositiveTest_3 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0663 | 2018-08-12 | LER          |
      | CreateLCompleteVehicleAssociation_PositiveTest_4 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0667 | 2018-09-12 | US_DEALER    |
      | CreateLCompleteVehicleAssociation_PositiveTest_5 | 200    | LCS-0000     | Request Processed Successfully | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0665 | 2019-12-12 | CA_DEALER    |
      | CreateLCompleteVehicleAssociation_PositiveTest_6 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0666 | 2018-03-12 | LER          |


#400 - Mandatory Header Attribute(s) Missing
  @CreateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Create Lexus Complete Vehicle Association to Post with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the CreateLCompleteVehicleAssociation_PostAPI
    When The user inputs CreateLCompleteVehicleAssociation_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester post the CreateLCompleteVehicleAssociation_PostAPI service with json body having guid "<guid>" createDate "<createDate>" createSource "<createSource>"
    Then the CreateLCompleteVehicleAssociation_PostAPI server returns the "<Status>" status code
    And The CreateLCompleteVehicleAssociation_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                       | Status | responseCode | description                           | xChannel   | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                                 | createDate | createSource |
      | Header Missing xChannel       | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing |            | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | 2018-03-12 | US_DEALER    |
      | Header Missing Authorization  | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e |                               | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56b | 2018-03-12 | CA_DEALER    |
      | Header Missing xCorrelationId | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing | TMNA_AGENT |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56c | 2018-03-12 | LER          |
      | Header Missing dateTime       | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a |               | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56d | 2018-03-12 | US_DEALER    |


 #400 - Incorrect/Invalid Header values
  @CreateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Create Lexus Complete Vehicle Association to Post with Incorrect/Invalid Header Attribute(s)as input data <Message>
    Given Tester calls the CreateLCompleteVehicleAssociation_PostAPI
    When The user inputs CreateLCompleteVehicleAssociation_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester post the CreateLCompleteVehicleAssociation_PostAPI service with json body having guid "<guid>" createDate "<createDate>" createSource "<createSource>"
    Then the CreateLCompleteVehicleAssociation_PostAPI server returns the "<Status>" status code
    And The CreateLCompleteVehicleAssociation_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                           | Status | responseCode | description                     | xChannel  | xCorrelationId                       | authorization                   | dateTime      | ContentType      | guid                                 | createDate | createSource |
      | Incorrect/Invalid xChannel1       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_SELF?  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | 2018-03-12 | US_DEALER    |
      | Incorrect/Invalid xChannel2       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_DEAR   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56b | 2018-03-12 | CA_DEALER    |
      | Incorrect/Invalid Authorization1  | 400    | LCS-0002     | Incorrect/Invalid Header Values | TC_AGENT  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0MQP3inSoeIYWTRjO       | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56c | 2018-03-12 | LER          |
      | Incorrect/Invalid Authorization2  | 400    | LCS-0002     | Incorrect/Invalid Header Values | CA_SELF   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inS?><WTRjO | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56d | 2018-03-12 | US_DEALER    |
      | Incorrect/Invalid xCorrelationId1 | 400    | LCS-0002     | Incorrect/Invalid Header Values | LER       | 6dfd3c74-e7c8-21d67d77ff5e           | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56e | 2018-03-12 | US_DEALER    |
      | Incorrect/Invalid xCorrelationId2 | 400    | LCS-0002     | Incorrect/Invalid Header Values | TRC       | 6dfd3c74-e7c8-4e02-ba90-?><          | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56f | 2018-03-12 | CA_DEALER    |
      | Incorrect/Invalid dateTime1       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_SELF   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a   | 15117965      | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | 2018-03-12 | LER          |
      | Incorrect/Invalid dateTime2       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a   | 15117?>       | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56b | 2018-03-12 | US_DEALER    |


#400 - Mandatory Request Body Attribute(s) Missing
  @CreateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Create Lexus Complete Vehicle Association to Post with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the CreateLCompleteVehicleAssociation_PostAPI
    When The user inputs CreateLCompleteVehicleAssociation_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester post the CreateLCompleteVehicleAssociation_PostAPI service with json body having guid "<guid>" createDate "<createDate>" createSource "<createSource>"
    Then the CreateLCompleteVehicleAssociation_PostAPI server returns the "<Status>" status code
    And The CreateLCompleteVehicleAssociation_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                             | Status | responseCode | description                               | xChannel   | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                                 | createDate | createSource |
      | Body_Attribute_Missing guid         | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json |                                      | 2018-03-12 | US_DEALER    |
      | Body_Attribute_Missing createDate   | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | TC_AGENT   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56c |            | US_DEALER    |
      | Body_Attribute_Missing createSource | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56d | 2018-03-12 |              |


#400 - Incorrect/Invalid Request body attributes
  @CreateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Create Lexus Complete Vehicle Association to Post with Incorrect/Invalid Body Attribute(s) as input data <Message>
    Given Tester calls the CreateLCompleteVehicleAssociation_PostAPI
    When The user inputs CreateLCompleteVehicleAssociation_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester post the CreateLCompleteVehicleAssociation_PostAPI service with json body having guid "<guid>" createDate "<createDate>" createSource "<createSource>"
    Then the CreateLCompleteVehicleAssociation_PostAPI server returns the "<Status>" status code
    And The CreateLCompleteVehicleAssociation_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                         | Status | responseCode | description                                 | xChannel   | xCorrelationId                       | authorization                 | dateTime      | ContentType      | guid                                 | createDate       | createSource |
      | Incorrect/Invalid_guid1         | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 8923gf7126h44b14d                    | 2018-03-12       | US_DEALER    |
      | Incorrect/Invalid_guid2         | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 8923gf7126h44b14?><d9f87a            | 2018-03-12       | CA_DEALER    |
      | Incorrect/Invalid_createDate1   | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | LER        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56e | 2018-03-12T21:44 | LER          |
      | Incorrect/Invalid_createDate2   | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | TRC        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56f | 2018-03-12T2?><  | US_DEALER    |
      | Incorrect/Invalid_createSource1 | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | 2018-03-12       | US_DE        |
      | Incorrect/Invalid_createSource2 | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56b | 2018-03-12       | CA_DEA?><    |


#400 - Missing entire json body
  @CreateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Create Lexus Complete Vehicle Association to Post with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the CreateLCompleteVehicleAssociation_PostAPI
    When The user inputs CreateLCompleteVehicleAssociation_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester post the CreateLCompleteVehicleAssociation_PostAPI service with missing json body
    Then the CreateLCompleteVehicleAssociation_PostAPI server returns the "<Status>" status code
    And The CreateLCompleteVehicleAssociation_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                 | Status | responseCode | description                               | xChannel | xCorrelationId                       | authorization                 | dateTime      | ContentType      |
      | Missing entire jsonbody | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json |


# 400 Missing json body except{}
  @CreateLCompleteVehicleAssociation_NegativeTest
  Scenario Outline: Create Lexus Complete Vehicle Association to Post with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the CreateLCompleteVehicleAssociation_PostAPI
    When The user inputs CreateLCompleteVehicleAssociation_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester post the CreateLCompleteVehicleAssociation_PostAPI service with missing json body except braces
    Then the CreateLCompleteVehicleAssociation_PostAPI server returns the "<Status>" status code
    And The CreateLCompleteVehicleAssociation_PostAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                         | Status | responseCode | description                               | xChannel | xCorrelationId                       | authorization                 | dateTime      | ContentType      |
      | Missing  jsonbody Except braces | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json |

