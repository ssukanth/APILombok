@GetPackages_Regression
Feature: Testing Product_GetAPI service to retrieve subscription in product details
  User should be able to submit Product_GetAPI service to retrieve subscription in product details

  @Sub_Smoke @GetPackages_Smoke
  Scenario Outline: Verify Get product service with valid input data <Message>
    Given Tester calls the product GET api with basePath
    When The user inputs product GET api headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>" asicode "<asicode>" hwtype "<hwtype>" generation "<generation>" region "<region>"
    Then the product GET api server returns  "<Status>" status code
    And The product GET api body response should have  ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message             | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding | asicode | hwtype | generation | region |
      | GetPackages_Smoke_1 | 200    | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | US     |
      | GetPackages_Smoke_2 | 200    | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 18CY       | CA     |


  #200
  @GetPackages_PositiveTest
  Scenario Outline: Verify Get product service with valid input data <Message>
    Given Tester calls the product GET api with basePath
    When The user inputs product GET api headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>" asicode "<asicode>" hwtype "<hwtype>" generation "<generation>" region "<region>"
    Then the product GET api server returns  "<Status>" status code
    And The product GET api body response should have  ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message        | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding | asicode | hwtype | generation | region |
      | GetPackages_1  | 200    | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | US     |
      | GetPackages_2  | 200    | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 18CY       | CA     |
      | GetPackages_3  | 200    | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 19CY       | TDPR   |
      | GetPackages_4  | 200    | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | HI     |
      | GetPackages_5  | 200    | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 18CY       | US     |
      | GetPackages_6  | 200    | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 19CY       | CA     |
      | GetPackages_7  | 200    | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | TDPR   |
      | GetPackages_8  | 200    | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 18CY       | HI     |
      | GetPackages_9  | 200    | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 19CY       | US     |
      | GetPackages_10 | 200    | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | CA     |
      | GetPackages_11 | 200    | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 18CY       | TDPR   |
      | GetPackages_12 | 200    | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 19CY       | HI     |
      | GetPackages_13 | 200    | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | US     |
      | GetPackages_14 | 200    | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 18CY       | CA     |
      | GetPackages_15 | 200    | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 19CY       | TDPR   |
      | GetPackages_16 | 200    | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | HI     |

  #400
  @GetPackages_NegativeTest
  Scenario Outline: Verify Get product service with invalid input data as Mandatory Header Attribute(s) Missing <Message>
    Given Tester calls the product GET api with basePath
    When The user inputs product GET api headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>" asicode "<asicode>" hwtype "<hwtype>" generation "<generation>" region "<region>"
    Then the product GET api server returns  "<Status>" status code
    And The product GET api body response should have  ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                        | Status | responseCode | description                           | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding | asicode | hwtype | generation | region |
      | Header_Missing X-CHANNEL       | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | application/json | T      |           | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | US     |
      | Header_Missing X-BRAND         | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | application/json |        | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | TDPR   |
      | Header_Missing X-CORRELATIONID | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | application/json | T      | ORCH_PROD |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       | CA     |
      | Header_Missing Authorization   | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | application/json | T      | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 | deflate        | E       | 9      | 17CY       | HI     |
      | Header_Missing DATETIME        | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | application/json | L      | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | deflate        | E       | 9      | 17CY       | CA     |
      | Header_Missing asi-code        | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | application/json | T      | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |         | 9      | 17CY       | TDPR   |
      | Header_Missing hw-type         | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | application/json | L      | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       |        | 17CY       | CA     |
      | Header_Missing generation      | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | application/json | T      | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      |            | HI     |
      | Header_Missing region          | 400    | PROD-0001    | Mandatory Header Attribute(s) Missing | application/json | T      | ORCH_PROD | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E       | 9      | 17CY       |        |



  #400
  @GetPackages_NegativeTest
  Scenario Outline: Verify Get product service with invalid input data as Incorrect/Invalid Header Values <Message>
    Given Tester calls the product GET api with basePath
    When The user inputs product GET api headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>" asicode "<asicode>" hwtype "<hwtype>" generation "<generation>" region "<region>"
    Then the product GET api server returns  "<Status>" status code
    And The product GET api body response should have  ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                                     | Status | responseCode | description                     | ContentType      | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME                     | AcceptEncoding | asicode | hwtype | generation | region |
      | Incorrect/Invalid Headers X-BRAND_1         | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | O      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | US     |
      | Incorrect/Invalid Headers X-BRAND_2         | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | 123    | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | TDPR   |
      | Incorrect/Invalid Headers X-BRAND_3         | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | %^*    | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | CA     |
      | Incorrect/Invalid Headers X-CHANNEL_1       | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | tmna_agent | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | US     |
      | Incorrect/Invalid Headers X-CHANNEL_2       | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | TMN_123    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | TDPR   |
      | Incorrect/Invalid Headers X-CHANNEL_3       | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | CA_6*(     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | CA     |
      | Incorrect/Invalid Headers X-CORRELATIONID_1 | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | L      | ORCH_PROD  | c52fdc72-8a0e-4600-                  | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | US     |
      | Incorrect/Invalid Headers X-CORRELATIONID_2 | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | abcherkk09                           | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | TDPR   |
      | Incorrect/Invalid Headers X-CORRELATIONID_3 | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee?f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | CA     |
      | Incorrect/Invalid Headers Authorization_1   | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08        | 1511796583386                | deflate        | E       | 9      | 17CY       | US     |
      | Incorrect/Invalid Headers Authorization_2   | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | %^8                           | 1511796583386                | deflate        | E       | 9      | 17CY       | TDPR   |
      | Incorrect/Invalid Headers Authorization_3   | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 1234tf6759853786908agrt       | 1511796583386                | deflate        | E       | 9      | 17CY       | CA     |
      | Incorrect/Invalid Headers DATETIME_1        | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 5/30/2018                    | deflate        | E       | 9      | 17CY       | US     |
      | Incorrect/Invalid Headers DATETIME_2        | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-03-12T21:44:34.117+0702 | deflate        | E       | 9      | 17CY       | TDPR   |
      | Incorrect/Invalid Headers DATETIME_3        | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        | E       | 9      | 17CY       | CA     |
      | Incorrect/Invalid Headers DATETIME_4        | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 43-15-2018                   | deflate        | E       | 9      | 17CY       | CA     |
      | Incorrect/Invalid Headers asi-code_1        | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | ^&*M    | 9      | 17CY       | US     |
      | Incorrect/Invalid Headers asi-code_2        | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | 11      | 9      | 17CY       | TDPR   |
      | Incorrect/Invalid Headers asi-code_3        | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | EE      | 9      | 17CY       | CA     |
      | Incorrect/Invalid Headers hw-type_1         | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | B      | 17CY       | US     |
      | Incorrect/Invalid Headers hw-type_2         | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | ^&*M   | 17CY       | TDPR   |
      | Incorrect/Invalid Headers hw-type_3         | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 1234   | 17CY       | CA     |
      | Incorrect/Invalid Headers generation_1      | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY!      | US     |
      | Incorrect/Invalid Headers generation_2      | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17C        | TDPR   |
      | Incorrect/Invalid Headers generation_3      | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | abcd       | CA     |
      | Incorrect/Invalid Headers region_1          | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | L      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | FA     |
      | Incorrect/Invalid Headers region_2          | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | US_1   |
      | Incorrect/Invalid Headers region_3          | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | $%^&*  |
      | Incorrect/Invalid Headers region_4          | 400    | PROD-0002    | Incorrect/Invalid Header Values | application/json | T      | ORCH_PROD  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        | E       | 9      | 17CY       | tdpr   |
