@CreateSubscriptionZuora_Regression

Feature: Testing Zuora_PostAPI_to Create Subscription in Zuora
  User should be able to POST Zuora_PostAPI_to Create Subscription in Zuora

  @Sub_Smoke
  Scenario Outline: Verify Zuora_PostAPI_to Create Subscription in Zuora with valid input data <Message>
    Given Tester calls the Zuora POST api with basePath
    When The user inputs Zuora POST api headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    When Tester post Zuora POST api service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionID "<subscriptionID>" packageID "<packageID>" productID "<productID>" ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>" term "<term>" termUnit "<termUnit>"
    Then the Zuora POST api server returns the "<Status>" status code
    And The Zuora POST api body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                         | Status | responseCode | description                    | ContentType      | xBrand | xChannel  | xCorrelationId  | authorization                    | dateTime      | acceptEncoding | vin               | subscriberGuid                   | subscriptionID  | packageID | productID | ratePlanID                       | subscriptionStartDate | subscriptionEndDate | term | termUnit |
      | CreateSubscriptionZuora_Smoke_1 | 200    | ZUR-0000     | Request processed successfully | application/json | T      | US_SELF   | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034070 | 1e3f4ef53c6e4a249c79099a107acf4c | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 1    | MTH      |
      | CreateSubscriptionZuora_Smoke_2 | 200    | ZUR-0000     | Request processed successfully | application/json | L      | US_DEALER | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034071 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |


  #200
  @CreateSubscriptionZuora_PositiveTest
  Scenario Outline: Verify Zuora_PostAPI_to Create Subscription in Zuora with valid input data <Message>
    Given Tester calls the Zuora POST api with basePath
    When The user inputs Zuora POST api headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    When Tester post Zuora POST api service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionID "<subscriptionID>" packageID "<packageID>" productID "<productID>" ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>" term "<term>" termUnit "<termUnit>"
    Then the Zuora POST api server returns the "<Status>" status code
    And The Zuora POST api body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                    | Status | responseCode | description                    | ContentType      | xBrand | xChannel   | xCorrelationId  | authorization                    | dateTime      | acceptEncoding | vin               | subscriberGuid                   | subscriptionID  | packageID | productID | ratePlanID                       | subscriptionStartDate | subscriptionEndDate | term | termUnit |
      | CreateSubscriptionZuora_1  | 200    | ZUR-0000     | Request processed successfully | application/json | T      | US_SELF    | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM031080 | 1e3f4ef53c6e4a249c79099a107acf4c | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-10-11            | 2018-11-11          | 1    | MTH      |
      | CreateSubscriptionZuora_2  | 200    | ZUR-0000     | Request processed successfully | application/json | T      | US_DEALER  | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM032083 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-11            | 2019-02-11          | 3    | MTH      |
      | CreateSubscriptionZuora_3  | 200    | ZUR-0000     | Request processed successfully | application/json | T      | TMNA_AGENT | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM033084 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-12            | 2019-02-12          | 3    | MTH      |
      | CreateSubscriptionZuora_4  | 200    | ZUR-0000     | Request processed successfully | application/json | T      | TC_AGENT   | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034085 | a4b05760e03e40918ac92d52f2fe0364 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-11            | 2019-04-11          | 4    | MTH      |
      | CreateSubscriptionZuora_5  | 200    | ZUR-0000     | Request processed successfully | application/json | T      | CA_SELF    | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM035086 | 1c623a92de134cfb98805b4c5c586a07 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-12            | 2019-04-12          | 4    | MTH      |
      | CreateSubscriptionZuora_6  | 200    | ZUR-0000     | Request processed successfully | application/json | T      | CA_DEALER  | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM036087 | 5c8deec5d0d44831aaf20f2fed52813e | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-10-13            | 2018-11-13          | 1    | MTH      |
      | CreateSubscriptionZuora_7  | 200    | ZUR-0000     | Request processed successfully | application/json | T      | LER        | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM037088 | a5bb6d1c59df4c97827f04428e23313f | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-10            | 2019-02-10          | 3    | MTH      |
      | CreateSubscriptionZuora_8  | 200    | ZUR-0000     | Request processed successfully | application/json | T      | TRC        | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM038089 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-15            | 2019-02-15          | 3    | MTH      |
      | CreateSubscriptionZuora_9  | 200    | ZUR-0000     | Request processed successfully | application/json | L      | US_SELF    | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM039090 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-01            | 2019-04-01          | 4    | MTH      |
      | CreateSubscriptionZuora_10 | 200    | ZUR-0000     | Request processed successfully | application/json | L      | US_DEALER  | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM040091 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-02            | 2019-04-02          | 4    | MTH      |
      | CreateSubscriptionZuora_11 | 200    | ZUR-0000     | Request processed successfully | application/json | L      | TMNA_AGENT | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM041092 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-10-10            | 2018-11-10          | 1    | MTH      |
      | CreateSubscriptionZuora_12 | 200    | ZUR-0000     | Request processed successfully | application/json | L      | TC_AGENT   | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM042093 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-16            | 2019-02-16          | 3    | MTH      |
      | CreateSubscriptionZuora_13 | 200    | ZUR-0000     | Request processed successfully | application/json | L      | CA_SELF    | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM043094 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-17            | 2019-02-17          | 3    | MTH      |
      | CreateSubscriptionZuora_14 | 200    | ZUR-0000     | Request processed successfully | application/json | L      | CA_DEALER  | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM044095 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-08            | 2019-04-08          | 4    | MTH      |
      | CreateSubscriptionZuora_15 | 200    | ZUR-0000     | Request processed successfully | application/json | L      | LER        | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM045096 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-18            | 2019-04-18          | 4    | MTH      |
      | CreateSubscriptionZuora_16 | 200    | ZUR-0000     | Request processed successfully | application/json | L      | TRC        | sendThroughCode | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM046097 | 4e88d69ba823491c8aa25670d5dd0664 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-11-22            | 2019-04-22          | 4    | MTH      |


    #400- ZUR-0001: Mandatory Header Attribute(s) Missing
  @CreateSubscriptionZuora_NegativeTest
  Scenario Outline: Verify Zuora_PostAPI_to Create Subscription in Zuora with Mandatory Header Attribute(s) Missing as invalid input data <Message>
    Given Tester calls the Zuora POST api with basePath
    When The user inputs Zuora POST api headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    When Tester post Zuora POST api service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionID "<subscriptionID>" packageID "<packageID>" productID "<productID>" ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>" term "<term>" termUnit "<termUnit>"
    Then the Zuora POST api server returns the "<Status>" status code
    And The Zuora POST api body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                        | Status | responseCode | description                           | ContentType      | xBrand | xChannel   | xCorrelationId                       | authorization                    | dateTime      | acceptEncoding | vin               | subscriberGuid                   | subscriptionID  | packageID | productID | ratePlanID                       | subscriptionStartDate | subscriptionEndDate | term | termUnit |
      | Header_Missing X-BRAND         | 400    | ZUR-0001     | Mandatory Header Attribute(s) Missing | application/json |        | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 1    | MTH      |
      | Header_Missing X-CHANNEL       | 400    | ZUR-0001     | Mandatory Header Attribute(s) Missing | application/json | L      |            | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Header_Missing X-CORRELATIONID | 400    | ZUR-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT |                                      | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Header_Missing Authorization   | 400    | ZUR-0001     | Mandatory Header Attribute(s) Missing | application/json | L      | CA_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e |                                  | 1511796583386 | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |
      | Header_Missing DATETIME        | 400    | ZUR-0001     | Mandatory Header Attribute(s) Missing | application/json | T      | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO |               | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |


    #400-ZUR-0002: Incorrect/Invalid Header Values
  @CreateSubscriptionZuora_NegativeTest
  Scenario Outline: Verify Zuora_PostAPI_to Create Subscription in Zuora with Incorrect/Invalid Header Values as invalid input data <Message>
    Given Tester calls the Zuora POST api with basePath
    When The user inputs Zuora POST api headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    When Tester post Zuora POST api service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionID "<subscriptionID>" packageID "<packageID>" productID "<productID>" ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>" term "<term>" termUnit "<termUnit>"
    Then the Zuora POST api server returns the "<Status>" status code
    And The Zuora POST api body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                                     | Status | responseCode | description                     | ContentType      | xBrand | xChannel   | xCorrelationId                       | authorization                    | dateTime                     | acceptEncoding | vin               | subscriberGuid                   | subscriptionID  | packageID | productID | ratePlanID                       | subscriptionStartDate | subscriptionEndDate | term | termUnit |
      | Incorrect/Invalid Headers X-BRAND_1         | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | 123    | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 1    | MTH      |
      | Incorrect/Invalid Headers X-BRAND_2         | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | #$^&   | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Incorrect/Invalid Headers X-BRAND_3         | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | K      | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Incorrect/Invalid Headers X-CHANNEL_1       | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | us_self    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |
      | Incorrect/Invalid Headers X-CHANNEL_2       | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | 456        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |
      | Incorrect/Invalid Headers X-CHANNEL_3       | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | ^&%$       | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 1    | MTH      |
      | Incorrect/Invalid Headers X-CORRELATIONID_1 | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | LER        | 6dfd3c74-e7c8-4e02-ba90-             | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Incorrect/Invalid Headers X-CORRELATIONID_2 | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | TRC        | 6dfd3c74-e7c8-4e02-ba90-21d6#$77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Incorrect/Invalid Headers X-CORRELATIONID_3 | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | US_SELF    | 1234abcde                            | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |
      | Incorrect/Invalid Headers Authorization_1   | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | L      | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5M-P3inSoeIYWTRjO | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |
      | Incorrect/Invalid Headers Authorization_2   | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | $%&((                            | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 1    | MTH      |
      | Incorrect/Invalid Headers Authorization_3   | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | L      | TC_AGENT   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | 8923gf7126h44b14d3df08dd9f87a    | 1511796583386                | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Incorrect/Invalid Headers DATETIME_1        | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 2018-08-08                   | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Incorrect/Invalid Headers DATETIME_2        | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | CA_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 5/30/2018                    | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |
      | Incorrect/Invalid Headers DATETIME_3        | 400    | ZUR-0002     | Incorrect/Invalid Header Values | application/json | T      | LER        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 2018-03-12T21:44:34.117+0702 | deflate        | JS1GT74A522124333 | e72e7a36d51f4ed6acbdfacda719e6c5 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |


  #Missing entire json body
  @CreateSubscriptionZuora_NegativeTest
  Scenario Outline: Verify Zuora_PostAPI_to Create Subscription in Zuora with Missing entire json body as invalid input data <Message>
    Given Tester calls the Zuora POST api with basePath
    When The user inputs Zuora POST api headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    When Tester post Zuora POST api service Missing entire json body
    Then the Zuora POST api server returns the "<Status>" status code
    And The Zuora POST api body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                 | Status | responseCode | description                               | ContentType      | xBrand | xChannel | xCorrelationId                       | authorization                    | dateTime      | acceptEncoding |
      | Missing entire jsonbody | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        |


  #Missing json body except{}
  @CreateSubscriptionZuora_NegativeTest
  Scenario Outline: Verify Zuora_PostAPI_to Create Subscription in Zuora with Missing entire json body except braces as invalid input data <Message>
    Given Tester calls the Zuora POST api with basePath
    When The user inputs Zuora POST api headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    When Tester post Zuora POST api service Missing json body except braces
    Then the Zuora POST api server returns the "<Status>" status code
    And The Zuora POST api body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                         | Status | responseCode | description                               | ContentType      | xBrand | xChannel  | xCorrelationId                       | authorization                    | dateTime      | acceptEncoding |
      | Missing  jsonbody Except braces | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | L      | CA_DEALER | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        |


  # Missing json body keeping key and removing mandatory value
  @CreateSubscriptionZuora_NegativeTest
  Scenario Outline: Verify Zuora_PostAPI_to Create Subscription in Zuora with Missing json body keeping key and removing mandatory value as invalid input data <Message>
    Given Tester calls the Zuora POST api with basePath
    When The user inputs Zuora POST api headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    When Tester post Zuora POST api service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionID "<subscriptionID>" packageID "<packageID>" productID "<productID>" ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>" term "<term>" termUnit "<termUnit>"
    Then the Zuora POST api server returns the "<Status>" status code
    And The Zuora POST api body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                              | Status | responseCode | description                               | ContentType      | xBrand | xChannel   | xCorrelationId                       | authorization                    | dateTime      | acceptEncoding | vin               | subscriberGuid                   | subscriptionID  | packageID | productID | ratePlanID                       | subscriptionStartDate | subscriptionEndDate | term | termUnit |
      | Mandatory body_Missing Vin           | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | T      | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5x | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        |                   | e79d8856e3cf45a4bb1a0747c6a3fb39 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 1    | MTH      |
      | Mandatory body_subscriberGuid        | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | L      | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034085 |                                  | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Mandatory body_subscriptionID        | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | T      | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034084 | 4e88d69ba823491c8aa25670d5dd0664 |                 | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 3    | MTH      |
      | Mandatory body_packageID             | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | L      | TC_AGENT   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034085 | bddfcb0c33b9442e80e69be8f01dde8e | sendThroughCode |           | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |
      | Mandatory body_productID             | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | T      | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034086 | d9f0ec3f497543358ced4d3dff43906e | sendThroughCode | 1234addec |           | 8adc8f996564fdb801656724beb33890 | 2018-08-08            | 2018-10-10          | 4    | MTH      |
      | Mandatory body_ratePlanID            | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | L      | CA_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034087 | 4039d45569514e60be5cbace0962c7bc | sendThroughCode | 1234addec | PROD45    |                                  | 2018-08-08            | 2018-10-10          | 1    | MTH      |
      | Mandatory body_subscriptionStartDate | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | T      | LER        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034088 | 02067dee30544ebc8d71e037fe7848b3 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 |                       | 2018-10-10          | 3    | MTH      |
      | Mandatory body_ssubscriptionEndDate  | 400    | ZUR-0003     | Mandatory Request Body Attributes Missing | application/json | T      | TRC        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034088 | 02067dee30544ebc8d71e037fe7848b3 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08            |                     | 3    | MTH      |


  #400-ZUR-0004: Incorrect/Invalid Request Body Attribute(s)
  @CreateSubscriptionZuora_NegativeTest
  Scenario Outline: Verify Zuora_PostAPI_to Create Subscription in Zuora with Incorrect/Invalid Request Body Attribute(s) as invalid input data <Message>
    Given Tester calls the Zuora POST api with basePath
    When The user inputs Zuora POST api headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    When Tester post Zuora POST api service with json body having vin "<vin>" subscriberGuid "<subscriberGuid>" subscriptionID "<subscriptionID>" packageID "<packageID>" productID "<productID>" ratePlanID "<ratePlanID>" subscriptionStartDate "<subscriptionStartDate>" subscriptionEndDate "<subscriptionEndDate>" term "<term>" termUnit "<termUnit>"
    Then the Zuora POST api server returns the "<Status>" status code
    And The Zuora POST api body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                                        | Status | responseCode | description                                 | ContentType      | xBrand | xChannel   | xCorrelationId                       | authorization                    | dateTime      | acceptEncoding | vin               | subscriberGuid                   | subscriptionID  | packageID | productID | ratePlanID                       | subscriptionStartDate        | subscriptionEndDate          | term | termUnit |
      | Incorrect/Invalid body_VIN _1                  | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0M        | e79d8856e3cf45a4bb1a0747c6a3fb39 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08                   | 2018-10-10                   | 1    | MTH      |
      | Incorrect/Invalid body_VIN _2                  | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM0#$083 | aecb7fe70c1043f082ee627326c6b720 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08                   | 2018-10-10                   | 3    | MTH      |
      | Incorrect/Invalid body_VIN _3                  | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G31111111111111  | bcf8b0cc82e04f568bb785d2a14e9f85 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08                   | 2018-10-10                   | 3    | MTH      |
      | Incorrect/Invalid body_subscriberGuid_1        | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | TMNA_AGENT | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034083 | bcf8b0cc82e04f568bb785d24e9f85   | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08                   | 2018-10-10                   | 4    | MTH      |
      | Incorrect/Invalid body_subscriberGuid_2        | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | TC_AGENT   | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034083 | bcf8b0cc82e04f568bb785d2a14e$%76 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08                   | 2018-10-10                   | 4    | MTH      |
      | Incorrect/Invalid body_subscriberGuid_3        | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | CA_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034083 | bcf8b0cc82e04f568b               | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08                   | 2018-10-10                   | 1    | MTH      |
      | Incorrect/Invalid body_subscriptionStartDate_1 | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | CA_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034083 | aecb7fe70c1043f082ee627326c6b720 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 1511796583386                | 2018-10-10                   | 3    | MTH      |
      | Incorrect/Invalid body_subscriptionStartDate_2 | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | LER        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034084 | bcf8b0cc82e04f568bb785d2a14e9f85 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 5/30/2018                    | 2018-10-10                   | 3    | MTH      |
      | Incorrect/Invalid body_subscriptionStartDate_3 | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | T      | TRC        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034088 | 02067dee30544ebc8d71e037fe7848b3 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-03-40T21:44:34.117+0702 | 2018-10-10                   | 4    | MTH      |
      | Incorrect/Invalid body_subscriptionEndDate_1   | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | LER        | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034088 | 02067dee30544ebc8d71e037fe7848b3 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08                   | 1511796583386                | 4    | MTH      |
      | Incorrect/Invalid body_subscriptionEndDate_2   | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | US_SELF    | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034088 | 02067dee30544ebc8d71e037fe7848b3 | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08                   | 5/30/2018                    | 1    | MTH      |
      | Incorrect/Invalid body_subscriptionEndDate_3   | 400    | ZUR-0004     | Incorrect/Invalid Request Body Attribute(s) | application/json | L      | US_DEALER  | 6dfd3c74-e7c8-4e02-ba90-21d67d77ff5e | kqJFPdJB0QOMNON5MQP3inSoeIYWTRjO | 1511796583386 | deflate        | 1G3NL14U0MM034088 | c13t6fb648e=f410788+ec07         | sendThroughCode | 1234addec | PROD45    | 8adc8f996564fdb801656724beb33890 | 2018-08-08                   | 2018-03-39T21:44:34.117+0702 | 3    | MTH      |
