@UpdateLCompleteSubscription_Regression
Feature: Testing UpdateLexusSubscription_API
  User should get Authorization code to perform Remote Actions.


 #200 -Success Response
  @UpdateLexusSubscription_SmokeTest @Sub_Smoke
  Scenario Outline: Update Lexus Subscription to Put with valid input data <Message>
    Given Tester calls the UpdateLexusSubscription_PutAPI
    When The user inputs UpdateLexusSubscription_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester Put the UpdateLexusSubscription_PutAPI service with json body having subscriptionGuid "<subscriptionGuid>" productCode "<productCode>" productID "<productID>"  ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>"
    Then the UpdateLexusSubscription_PutAPI server returns the "<Status>" status code
    And The UpdateLexusSubscription_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                         | Status | responseCode | description                    | xChannel  | xCorrelationId                       | authorization                 | dateTime      | ContentType      | subscriptionGuid                 | productCode        | productID                            | ratePlanID                       | subscriptionStartDate | subscriptionEndDate |
      | UpdateLexusSubscription_Smoke_1 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0651 | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | UpdateLexusSubscription_Smoke_2 | 200    | LCS-0000     | Request Processed Successfully | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0652 | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | UpdateLexusSubscription_Smoke_3 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0653 | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |


 #200 - Success
  @UpdateLexusSubscription_PositiveTest
  Scenario Outline: Update Lexus Subscription to Put with valid input data <Message>
    Given Tester calls the UpdateLexusSubscription_PutAPI
    When The user inputs UpdateLexusSubscription_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester Put the UpdateLexusSubscription_PutAPI service with json body having subscriptionGuid "<subscriptionGuid>" productCode "<productCode>" productID "<productID>"  ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>"
    Then the UpdateLexusSubscription_PutAPI server returns the "<Status>" status code
    And The UpdateLexusSubscription_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                | Status | responseCode | description                    | xChannel  | xCorrelationId                       | authorization                 | dateTime      | ContentType      | subscriptionGuid                 | productCode        | productID                            | ratePlanID                       | subscriptionStartDate | subscriptionEndDate |
      | UpdateLexusSubscription_PositiveTest_1 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0661 | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | UpdateLexusSubscription_PositiveTest_2 | 200    | LCS-0000     | Request Processed Successfully | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0662 | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | UpdateLexusSubscription_PositiveTest_3 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0663 | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | UpdateLexusSubscription_PositiveTest_4 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0667 | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | UpdateLexusSubscription_PositiveTest_5 | 200    | LCS-0000     | Request Processed Successfully | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0665 | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | UpdateLexusSubscription_PositiveTest_6 | 200    | LCS-0000     | Request Processed Successfully | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 4e88d69ba823491c8aa25670d5dd0666 | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |


#400 - Mandatory Header Attribute(s) Missing
  @UpdateLexusSubscription_NegativeTest
  Scenario Outline: Update Lexus Subscription to Put with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the UpdateLexusSubscription_PutAPI
    When The user inputs UpdateLexusSubscription_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester Put the UpdateLexusSubscription_PutAPI service with json body having subscriptionGuid "<subscriptionGuid>" productCode "<productCode>" productID "<productID>"  ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>"
    Then the UpdateLexusSubscription_PutAPI server returns the "<Status>" status code
    And The UpdateLexusSubscription_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                       | Status | responseCode | description                           | xChannel   | xCorrelationId                       | authorization                 | dateTime      | ContentType      | subscriptionGuid                     | productCode        | productID                            | ratePlanID                       | subscriptionStartDate | subscriptionEndDate |
      | Header Missing xChannel       | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing |            | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Header Missing Authorization  | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e |                               | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Header Missing xCorrelationId | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing | TMNA_AGENT |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Header Missing dateTime       | 400    | LCS-0001     | Mandatory Header Attribute(s) Missing | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a |               | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |


 #400 - Incorrect/Invalid Header values
  @UpdateLexusSubscription_NegativeTest
  Scenario Outline: Update Lexus Subscription to Put with Incorrect/Invalid Header Attribute(s)as input data <Message>
    Given Tester calls the UpdateLexusSubscription_PutAPI
    When The user inputs UpdateLexusSubscription_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester Put the UpdateLexusSubscription_PutAPI service with json body having subscriptionGuid "<subscriptionGuid>" productCode "<productCode>" productID "<productID>"  ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>"
    Then the UpdateLexusSubscription_PutAPI server returns the "<Status>" status code
    And The UpdateLexusSubscription_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                           | Status | responseCode | description                     | xChannel  | xCorrelationId                       | authorization                   | dateTime      | ContentType      | subscriptionGuid                      | productCode        | productID                            | ratePlanID                       | subscriptionStartDate | subscriptionEndDate |
      | Incorrect/Invalid xChannel1       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_SELF?  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56aa | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid xChannel2       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_DEAR   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56aa | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid Authorization1  | 400    | LCS-0002     | Incorrect/Invalid Header Values | TC_AGENT  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0MQP3inSoeIYWTRjO       | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a  | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid Authorization2  | 400    | LCS-0002     | Incorrect/Invalid Header Values | CA_SELF   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inS?><WTRjO | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a  | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid xCorrelationId1 | 400    | LCS-0002     | Incorrect/Invalid Header Values | LER       | 6dfd3c74-e7c8-21d67d77ff5e           | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56aa | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid xCorrelationId2 | 400    | LCS-0002     | Incorrect/Invalid Header Values | TRC       | 6dfd3c74-e7c8-4e02-ba90-?><          | 8923gf7126h44b14d3df08dd9f87a   | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56aa | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid dateTime1       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_SELF   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a   | 15117965      | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56aa | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid dateTime2       | 400    | LCS-0002     | Incorrect/Invalid Header Values | US_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a   | 15117?>       | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56aa | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |


#400 - Mandatory Request Body Attribute(s) Missing
  @UpdateLexusSubscription_NegativeTest
  Scenario Outline: Update Lexus Subscription to Put with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the UpdateLexusSubscription_PutAPI
    When The user inputs UpdateLexusSubscription_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester Put the UpdateLexusSubscription_PutAPI service with json body having subscriptionGuid "<subscriptionGuid>" productCode "<productCode>" productID "<productID>"  ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>"
    Then the UpdateLexusSubscription_PutAPI server returns the "<Status>" status code
    And The UpdateLexusSubscription_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                      | Status | responseCode | description                               | xChannel   | xCorrelationId                       | authorization                 | dateTime      | ContentType      | subscriptionGuid                     | productCode        | productID                            | ratePlanID                           | subscriptionStartDate | subscriptionEndDate |
      | Body_Attribute_Missing subscriptionGuid      | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json |                                      | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890     | 2018-08-12            | 2019-08-12          |
      | Body_Attribute_Missing productCode           | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a |                    | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890     | 2018-08-12            | 2019-08-12          |
      | Body_Attribute_Missing productID             | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT |                                      | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 2018-08-12            | 2019-08-12          |
      | Body_Attribute_Missing ratePlanID            | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | TC_AGENT   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 8adc8f996564fdb801656724beb33890     |                                      | 2018-08-12            | 2019-08-12          |
      | Body_Attribute_Missing subscriptionStartDate | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890     |                       | 2019-08-12          |
      | Body_Attribute_Missing subscriptionEndDate   | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890     | 2018-08-12            |                     |

#400 - Incorrect/Invalid Request body attributes
  @UpdateLexusSubscription_NegativeTest
  Scenario Outline: Update Lexus Subscription to Put with Incorrect/Invalid Body Attribute(s) as input data <Message>
    Given Tester calls the UpdateLexusSubscription_PutAPI
    When The user inputs UpdateLexusSubscription_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester Put the UpdateLexusSubscription_PutAPI service with json body having subscriptionGuid "<subscriptionGuid>" productCode "<productCode>" productID "<productID>"  ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>"
    Then the UpdateLexusSubscription_PutAPI server returns the "<Status>" status code
    And The UpdateLexusSubscription_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"

    Examples:
      | Message                                  | Status | responseCode | description                                 | xChannel   | xCorrelationId                       | authorization                 | dateTime      | ContentType      | subscriptionGuid                     | productCode        | productID                            | ratePlanID                       | subscriptionStartDate | subscriptionEndDate |
      | Incorrect/Invalid_subscriptionGuid1      | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 8923gf7126h44b14d                    | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid_subscriptionGuid2      | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 8923gf7126h44b14?><d9f87a            | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid_productCode1           | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | A100000B5          | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid_productCode2           | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | TC_AGENT   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | A10000001?><       | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid_productID1             | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 2018-03-12T21:44:34                  | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid_productID2             | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | CA_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 2018-03-12T21:44:3?><                | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid_ratePlanID1            | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | LER        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 2018-03-12T21:44                 | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid_ratePlanID2            | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | TRC        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 2018-03-12T2?><                  | 2018-08-12            | 2019-08-12          |
      | Incorrect/Invalid_subscriptionStartDate1 | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08               | 2019-08-12          |
      | Incorrect/Invalid_subscriptionStartDate2 | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-?8-12            | 2019-08-12          |
      | Incorrect/Invalid_subscriptionEndDate1   | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-08-            |
      | Incorrect/Invalid_subscriptionEndDate2   | 400    | LCS-0004     | Incorrect/Invalid Request Body Attribute(s) | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json | 14c5b880-29e7-4951-be3e-9f74f9eca56a | PROD_SAFETYCONNECT | 9f785e5b-d46d-4b21-a2fd-e594d622139e | 8adc8f996564fdb801656724beb33890 | 2018-08-12            | 2019-0?2            |

#400 - Missing entire json body
  @UpdateLexusSubscription_NegativeTest
  Scenario Outline: Update Lexus Subscription to Put with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the UpdateLexusSubscription_PutAPI
    When The user inputs UpdateLexusSubscription_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester Put the UpdateLexusSubscription_PutAPI service with missing json body
    Then the UpdateLexusSubscription_PutAPI server returns the "<Status>" status code
    And The UpdateLexusSubscription_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                 | Status | responseCode | description                               | xChannel | xCorrelationId                       | authorization                 | dateTime      | ContentType      |
      | Missing entire jsonbody | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json |


# 400 Missing json body except{}
  @UpdateLexusSubscription_NegativeTest
  Scenario Outline: Update Lexus Subscription to Put with Mandatory Body Attribute(s) Missing in input data <Message>
    Given Tester calls the UpdateLexusSubscription_PutAPI
    When The user inputs UpdateLexusSubscription_PutAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>"
    When Tester Put the UpdateLexusSubscription_PutAPI service with missing json body except braces
    Then the UpdateLexusSubscription_PutAPI server returns the "<Status>" status code
    And The UpdateLexusSubscription_PutAPI body response should have the responseCode "<responseCode>" and description "<description>"
    Examples:
      | Message                         | Status | responseCode | description                               | xChannel | xCorrelationId                       | authorization                 | dateTime      | ContentType      |
      | Missing  jsonbody Except braces | 400    | LCS-0003     | Mandatory Request Body Attributes Missing | US_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | application/json |

