@ProdGet_Regression
Feature: Testing Product_GetAPI service API to retrieve product & service details
  User should be able to submit Product_GetAPI service API to retrieve product & service details

  @Sub_SmokeTest
  Scenario Outline: Verify Get product service with valid input data <Message>
    Given Tester calls the product GET API
    When The user inputs product GET API headers XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    Then the product GET API server returns "<Status>" status code
    Then And The product GET API body response should have  ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message    | Status | responseCode | description                    | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |
      | Positive_1 | 200    | PROD-0000    | Request Processed Successfully | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |


   #200
  @Prod_GETPositiveTest
  Scenario Outline: Verify Get product service with valid input data <Message>
    Given Tester calls the product GET API
    When The user inputs product GET API headers XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    Then the product GET API server returns "<Status>" status code
    Then And The product GET API body response should have  ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message    | Status | responseCode | description                    | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |
      | Positive_1 | 200    | PROD-0000    | Request Processed Successfully | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_2 | 200    | PROD-0000    | Request Processed Successfully | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_3 | 200    | PROD-0000    | Request Processed Successfully | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_4 | 200    | PROD-0000    | Request Processed Successfully | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |

  #400
  @ProdGet_Negative
  Scenario Outline: Verify Get product service with invalid input data as Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the product GET API
    When The user inputs product GET API headers XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    Then the product GET API server returns "<Status>" status code
    Then And The product GET API body response should have  ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                        | Status | responseCode | description                           | XBRAND | XCHANNEL  | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding |
      | Header_Missing X-CHANNEL       | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | T      |           | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-BRAND         | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing |        | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-CORRELATIONID | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | T      | ORCH_PROD |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing Authorization   | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | T      | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 | deflate        |
      | Header_Missing DATETIME        | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | L      | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | deflate        |



  #400
  @ProdGet_Negative
  Scenario Outline: Verify Get product service with invalid input data as Incorrect/Invalid Header Values <Message>
    Given Tester calls the product GET API
    When The user inputs product GET API headers XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    Then the product GET API server returns "<Status>" status code
    Then And The product GET API body response should have  ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                             | Status | responseCode | description                     | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME                     | AcceptEncoding |
      | Incorrect/Invalid X-BRAND_1         | 400    | PROD-0002    | Incorrect/Invalid Header Values | O      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-BRAND_2         | 400    | PROD-0002    | Incorrect/Invalid Header Values | 123    | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-BRAND_3         | 400    | PROD-0002    | Incorrect/Invalid Header Values | %^*    | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CHANNEL_1       | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD@ | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CHANNEL_2       | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PR    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CHANNEL_3       | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | orch_prod  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CORRELATIONID_1 | 400    | PROD-0002    | Incorrect/Invalid Header Values | L      | ORCH_PROD  | c52fdc72-8a0e-4600-                  | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CORRELATIONID_2 | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD  | abcherkk09                           | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CORRELATIONID_3 | 400    | PROD-0002    | Incorrect/Invalid Header Values | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee?f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Authorization_1   | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08        | 1511796583386                | deflate        |
      | Incorrect/Invalid Authorization_2   | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | %^8                           | 1511796583386                | deflate        |
      | Incorrect/Invalid Authorization_3   | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 1234tf6759853786908agrt       | 1511796583386                | deflate        |
      | Incorrect/Invalid DATETIME_1        | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 5/30/2018                    | deflate        |
      | Incorrect/Invalid DATETIME_2        | 400    | PROD-0002    | Incorrect/Invalid Header Values | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-03-12T21:44:34.117+0702 | deflate        |
      | Incorrect/Invalid DATETIME_3        | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        |
      | Incorrect/Invalid DATETIME_4        | 400    | PROD-0002    | Incorrect/Invalid Header Values | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 43-15-2018                   | deflate        |
      | Incorrect/Invalid Accept-Encoding_1 | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate?       |
      | Incorrect/Invalid Accept-Encoding_2 | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | abc            |
      | Incorrect/Invalid Accept-Encoding_3 | 400    | PROD-0002    | Incorrect/Invalid Header Values | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | 1234           |


  #400
  @ProdGet_Negative
  Scenario Outline: Verify Get product service with invalid input data as Incorrect/Invalid Header Values <Message>
    Given Tester calls the product GET API
    When The user inputs product GET API headers XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    Then the product GET API server returns "<Status>" status code
    Then And The product GET API body response should have  ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message               | Status | responseCode | description        | XBRAND | XCHANNEL  | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding |
      | Packages not found _1 | 400    | PROD-0006    | Packages not found | T      | CA_DEALER | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Packages not found _2 | 400    | PROD-0006    | Packages not found | T      | US_DEALER | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Packages not found _3 | 400    | PROD-0006    | Packages not found | L      | LER       | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
    