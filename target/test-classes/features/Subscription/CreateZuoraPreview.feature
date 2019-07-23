@CreateZuoraPreview_Regression

Feature: Testing ZuoraPreview_PostAPI to create Preview Order for the customer
  User should be able to POST ZuoraPreview_PostAPI to create Preview Order for the customer

  @Sub_Smoke
  Scenario Outline: Verify ZuoraPreview_PostAPI to create Preview Order for the customer with valid input data <Message>
    Given Tester calls the ZuoraPreview_PostAPI with basePath
    When The user inputs ZuoraPreview_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>"
    When Tester post ZuoraPreview_PostAPI service with json body having city "<city>" state "<state>" country "<country>" orderDate "<orderDate>" ratePlanID "<ratePlanID>" period "<period>" periodType "<periodType>"
    Then the ZuoraPreview_PostAPI server returns the "<Status>" status code
    And The ZuoraPreview_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                   | Status | responseCode | description                    | ContentType      | xChannel  | xCorrelationId  | authorization                    | city  | state | country | orderDate  | ratePlanID                       | period | periodType |
      | ZuoraPreviewOrder_Smoke_1 | 200    | ZPR-0000     | Request Processed Successfully | application/json | US_SELF   | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | ZuoraPreviewOrder_Smoke_2 | 200    | ZPR-0000     | Request Processed Successfully | application/json | US_DEALER | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-07 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |


  #200
  @ZuoraPreviewOrder_PositiveTest
  Scenario Outline: Verify ZuoraPreview_PostAPI to create Preview Order for the customer with valid input data <Message>
    Given Tester calls the ZuoraPreview_PostAPI with basePath
    When The user inputs ZuoraPreview_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>"
    When Tester post ZuoraPreview_PostAPI service with json body having city "<city>" state "<state>" country "<country>" orderDate "<orderDate>" ratePlanID "<ratePlanID>" period "<period>" periodType "<periodType>"
    Then the ZuoraPreview_PostAPI server returns the "<Status>" status code
    And The ZuoraPreview_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message              | Status | responseCode | description                    | ContentType      | xChannel   | xCorrelationId  | authorization                    | city  | state | orderDate  | country | ratePlanID                       | period | periodType |
      | ZuoraPreviewOrder_1  | 200    | ZPR-0000     | Request Processed Successfully | application/json | US_SELF    | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | ZuoraPreviewOrder_2  | 200    | ZPR-0000     | Request Processed Successfully | application/json | US_DEALER  | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-07 | USA     | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | ZuoraPreviewOrder_3  | 200    | ZPR-0000     | Request Processed Successfully | application/json | TMNA_AGENT | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | ZuoraPreviewOrder_4  | 200    | ZPR-0000     | Request Processed Successfully | application/json | TC_AGENT   | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | ZuoraPreviewOrder_5  | 200    | ZPR-0000     | Request Processed Successfully | application/json | CA_SELF    | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | ZuoraPreviewOrder_6  | 200    | ZPR-0000     | Request Processed Successfully | application/json | CA_DEALER  | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | ZuoraPreviewOrder_7  | 200    | ZPR-0000     | Request Processed Successfully | application/json | LER        | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | ZuoraPreviewOrder_8  | 200    | ZPR-0000     | Request Processed Successfully | application/json | TRC        | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | ZuoraPreviewOrder_9  | 200    | ZPR-0000     | Request Processed Successfully | application/json | US_SELF    | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 5      | Month      |
      | ZuoraPreviewOrder_10 | 200    | ZPR-0000     | Request Processed Successfully | application/json | US_DEALER  | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 4      | Month      |
      | ZuoraPreviewOrder_11 | 200    | ZPR-0000     | Request Processed Successfully | application/json | TMNA_AGENT | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 3      | Month      |
      | ZuoraPreviewOrder_12 | 200    | ZPR-0000     | Request Processed Successfully | application/json | TC_AGENT   | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 2      | Month      |
      | ZuoraPreviewOrder_13 | 200    | ZPR-0000     | Request Processed Successfully | application/json | CA_SELF    | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 1      | Month      |
      | ZuoraPreviewOrder_14 | 200    | ZPR-0000     | Request Processed Successfully | application/json | CA_DEALER  | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | ZuoraPreviewOrder_15 | 200    | ZPR-0000     | Request Processed Successfully | application/json | LER        | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 4      | Month      |
      | ZuoraPreviewOrder_16 | 200    | ZPR-0000     | Request Processed Successfully | application/json | TRC        | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | 2018-10-01 | USA     | 8adc8f996564fdb801656724b2b837cf | 4      | Month      |


    #400- ZPR-0001: Mandatory Header Attribute(s) Missing
  @ZuoraPreviewOrder_NegativeTest
  Scenario Outline: Verify ZuoraPreview_PostAPI to create Preview Order for the customer with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the ZuoraPreview_PostAPI with basePath
    When The user inputs ZuoraPreview_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>"
    When Tester post ZuoraPreview_PostAPI service with json body having city "<city>" state "<state>" country "<country>" orderDate "<orderDate>" ratePlanID "<ratePlanID>" period "<period>" periodType "<periodType>"
    Then the ZuoraPreview_PostAPI server returns the "<Status>" status code
    And The ZuoraPreview_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                        | Status | responseCode | description                           | ContentType      | xChannel   | xCorrelationId                       | authorization                    | city  | state | country | orderDate  | ratePlanID                       | period | periodType |
      | Header_Missing X-CHANNEL       | 400    | ZPR-0001     | Mandatory Header Attribute(s) Missing | application/json |            | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-07 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | Header_Missing X-CORRELATIONID | 400    | ZPR-0001     | Mandatory Header Attribute(s) Missing | application/json | TMNA_AGENT |                                      | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | Header_Missing Authorization   | 400    | ZPR-0001     | Mandatory Header Attribute(s) Missing | application/json | CA_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e |                                  | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |


    #400-ZPR-0002: Incorrect/Invalid Header Values
  @ZuoraPreviewOrder_NegativeTest
  Scenario Outline: Verify ZuoraPreview_PostAPI to create Preview Order for the customer with Incorrect/Invalid Header Values as invalid input data <Message>
    Given Tester calls the ZuoraPreview_PostAPI with basePath
    When The user inputs ZuoraPreview_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>"
    When Tester post ZuoraPreview_PostAPI service with json body having city "<city>" state "<state>" country "<country>" orderDate "<orderDate>" ratePlanID "<ratePlanID>" period "<period>" periodType "<periodType>"
    Then the ZuoraPreview_PostAPI server returns the "<Status>" status code
    And The ZuoraPreview_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                                     | Status | responseCode | description                     | ContentType      | xChannel   | xCorrelationId                       | authorization                    | city  | state | country | orderDate  | ratePlanID                       | period | periodType |
      | Incorrect/Invalid Headers X-CHANNEL_1       | 400    | ZPR-0002     | Incorrect/Invalid Header Values | application/json | us_self    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | Incorrect/Invalid Headers X-CHANNEL_2       | 400    | ZPR-0002     | Incorrect/Invalid Header Values | application/json | 456        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | Incorrect/Invalid Headers X-CHANNEL_3       | 400    | ZPR-0002     | Incorrect/Invalid Header Values | application/json | ^&%$       | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | Incorrect/Invalid Headers X-CORRELATIONID_1 | 400    | ZPR-0002     | Incorrect/Invalid Header Values | application/json | LER        | 6dfd3c74-e7c8-4e02-ba90-             | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | Incorrect/Invalid Headers X-CORRELATIONID_2 | 400    | ZPR-0002     | Incorrect/Invalid Header Values | application/json | TRC        | 6dfd3c74-e7c8-4e02-ba90-21d6#$77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | Incorrect/Invalid Headers X-CORRELATIONID_3 | 400    | ZPR-0002     | Incorrect/Invalid Header Values | application/json | US_SELF    | 1234abcde                            | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 5      | Month      |
      | Incorrect/Invalid Headers Authorization_1   | 400    | ZPR-0002     | Incorrect/Invalid Header Values | application/json | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5M-P3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 4      | Month      |
      | Incorrect/Invalid Headers Authorization_2   | 400    | ZPR-0002     | Incorrect/Invalid Header Values | application/json | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | $%&((                            | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 3      | Month      |
      | Incorrect/Invalid Headers Authorization_3   | 400    | ZPR-0002     | Incorrect/Invalid Header Values | application/json | TC_AGENT   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a    | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 2      | Month      |


  #Missing entire json body
  @ZuoraPreviewOrder_NegativeTest
  Scenario Outline: Verify ZuoraPreview_PostAPI to create Preview Order for the customer with Missing entire json body as invalid input data <Message>
    Given Tester calls the ZuoraPreview_PostAPI with basePath
    When The user inputs ZuoraPreview_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>"
    When Tester post ZuoraPreview_PostAPI service Missing entire json body
    Then the ZuoraPreview_PostAPI server returns the "<Status>" status code
    And The ZuoraPreview_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                 | Status | responseCode | description                               | ContentType      | xChannel | xCorrelationId                       | authorization                    |
      | Missing entire jsonbody | 400    | ZPR-0003     | Mandatory Request Body Attributes Missing | application/json | US_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO |


  #Missing json body except{}
  @ZuoraPreviewOrder_NegativeTest
  Scenario Outline: Verify ZuoraPreview_PostAPI to create Preview Order for the customer with Missing entire json body except braces as invalid input data <Message>
    Given Tester calls the ZuoraPreview_PostAPI with basePath
    When The user inputs ZuoraPreview_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>"
    When Tester post ZuoraPreview_PostAPI service Missing json body except braces
    Then the ZuoraPreview_PostAPI server returns the "<Status>" status code
    And The ZuoraPreview_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                         | Status | responseCode | description                               | ContentType      | xChannel  | xCorrelationId                       | authorization                    |
      | Missing  jsonbody Except braces | 400    | ZPR-0003     | Mandatory Request Body Attributes Missing | application/json | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO |


  # Missing json body keeping key and removing mandatory value
  @ZuoraPreviewOrder_NegativeTest
  Scenario Outline: Verify ZuoraPreview_PostAPI to create Preview Order for the customer with Missing json body keeping key and removing mandatory value as invalid input data <Message>
    Given Tester calls the ZuoraPreview_PostAPI with basePath
    When The user inputs ZuoraPreview_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>"
    When Tester post ZuoraPreview_PostAPI service with json body having city "<city>" state "<state>" country "<country>" orderDate "<orderDate>" ratePlanID "<ratePlanID>" period "<period>" periodType "<periodType>"
    Then the ZuoraPreview_PostAPI server returns the "<Status>" status code
    And The ZuoraPreview_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                           | Status | responseCode | description                               | ContentType      | xChannel   | xCorrelationId                       | authorization                    | city  | state | country | orderDate  | ratePlanID                       | period | periodType |
      | Mandatory body_Missing City       | 400    | ZPR-0003     | Mandatory Request Body Attributes Missing | application/json | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO |       | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | Mandatory body_Missing_State      | 400    | ZPR-0003     | Mandatory Request Body Attributes Missing | application/json | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano |       | USA     | 2018-10-07 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | Mandatory body_Missing_country    | 400    | ZPR-0003     | Mandatory Request Body Attributes Missing | application/json | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    |         | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | Mandatory body_Missing_orderDate  | 400    | ZPR-0003     | Mandatory Request Body Attributes Missing | application/json | TC_AGENT   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     |            | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | Mandatory body_Missing_ratePlanID | 400    | ZPR-0003     | Mandatory Request Body Attributes Missing | application/json | CA_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 |                                  | 8      | Month      |
      | Mandatory body_Missing_period     | 400    | ZPR-0003     | Mandatory Request Body Attributes Missing | application/json | LER        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf |        | Month      |
      | Mandatory body_Missing_periodType | 400    | ZPR-0003     | Mandatory Request Body Attributes Missing | application/json | TRC        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 8      |            |


  #400-ZPR-0004: Incorrect/Invalid Request Body Attribute(s)
  @ZuoraPreviewOrder_NegativeTest
  Scenario Outline: Verify ZuoraPreview_PostAPI to create Preview Order for the customer with Incorrect/Invalid Request Body Attribute(s) as invalid input data <Message>
    Given Tester calls the ZuoraPreview_PostAPI with basePath
    When The user inputs ZuoraPreview_PostAPI headers ContentType "<ContentType>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>"
    When Tester post ZuoraPreview_PostAPI service with json body having city "<city>" state "<state>" country "<country>" orderDate "<orderDate>" ratePlanID "<ratePlanID>" period "<period>" periodType "<periodType>"
    Then the ZuoraPreview_PostAPI server returns the "<Status>" status code
    And The ZuoraPreview_PostAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                             | Status | responseCode | description                                 | ContentType      | xChannel   | xCorrelationId                       | authorization                    | city              | state | country | orderDate  | ratePlanID                       | period | periodType |
      | Incorrect/Invalid body_City _1      | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1G3NL14U0M        | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | Incorrect/Invalid body_City _2      | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1G3NL14U0MM0#$083 | TX    | USA     | 2018-10-07 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | Incorrect/Invalid body_State_1      | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TXA   | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | Incorrect/Invalid body_State_2      | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | TC_AGENT   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX?   | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | Incorrect/Invalid body_country_1    | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | CA_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USAAA   | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 6      | Month      |
      | Incorrect/Invalid body_country_2    | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | LER        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USA??   | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 8      | Month      |
      | Incorrect/Invalid body_orderDate_1  | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | LER        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USA     | 2018-1     | 8adc8f996564fdb801656724b2b837cf | 4      | Month      |
      | Incorrect/Invalid body_orderDate_2  | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USA     | 2011-10-?  | 8adc8f996564fdb801656724b2b837cf | 3      | Month      |
      | Incorrect/Invalid body_ratePlanID_1 | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USA     | 2018-10-01 | 8adc8f996564fd?>b2b837cf         | 2      | Month      |
      | Incorrect/Invalid body_ratePlanID_2 | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USA     | 2018-10-01 | 8adc8f996564fdb8016567dsfdsf     | 2      | Month      |
      | Incorrect/Invalid body_period_1     | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 150    | Month      |
      | Incorrect/Invalid body_period_2     | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 0      | Month      |
      | Incorrect/Invalid body_periodType_1 | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 2      | MonthA     |
      | Incorrect/Invalid body_periodType_2 | 400    | ZPR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | Plano             | TX    | USA     | 2018-10-01 | 8adc8f996564fdb801656724b2b837cf | 2      | Month??    |
