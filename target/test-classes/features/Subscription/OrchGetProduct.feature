@OrchGetProduct_Regression

Feature: Testing Orchestration Get Prodcuts API
  User should be able to submit Orchestration GetProductsService API to retrive all product and service details

  @Sub_Smoke
  Scenario Outline: Verify Orchestration GetProductsService API with valid input data <Message>
    Given Tester calls the Orchestration GetProductsService API with basePath
    When The user inputs the Orchestration GetProductsService API headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    Then Orchestration GetProductsService API returns the status code"<Status>"
    And Orchestration GetProductsService API body should have the Response code "<responseCode>", Description "<description>"

    Examples:
      | Message    | Status | responseCode | description                    | ContentType      | xBrand | xChannel  | xCorrelationId  | authorization                 | dateTime      | acceptEncoding |
      | Positive_1 | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | US_SELF   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_2 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | US_DEALER | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |


  #200-Successful Request
  @OrchGetProduct_Positive
  Scenario Outline: Verify Orchestration GetProductsService API with valid input data <Message>
    Given Tester calls the Orchestration GetProductsService API with basePath
    When The user inputs the Orchestration GetProductsService API headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    Then Orchestration GetProductsService API returns the status code"<Status>"
    And Orchestration GetProductsService API body should have the Response code "<responseCode>", Description "<description>"

    Examples:
      | Message    | Status | responseCode | description                    | ContentType      | xBrand | xChannel   | xCorrelationId  | authorization                 | dateTime      | acceptEncoding |
      | Positive_1 | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_2 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_3 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_4 | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_5 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_6 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_6 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Positive_7 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |


#400 - Mandatory Header Attribute(s) Missing
  @OrchGetProduct_negative
  Scenario Outline: Verify Orchestration Get Products API with headers having Missing mandatory data<Message>
    Given Tester calls the Orchestration GetProductsService API with basePath
    When The user inputs the Orchestration GetProductsService API headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    Then Orchestration GetProductsService API returns the status code"<Status>"
    And Orchestration GetProductsService API body should have the Response code "<responseCode>", Description "<description>"

    Examples:
      | Message                        | Status | responseCode | description                           | ContentType      | xBrand | xChannel   | xCorrelationId  | authorization                 | dateTime      | acceptEncoding |
      | Header_Missing	X-BRAND         | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json |        | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing	X-CHANNEL       | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      |            | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing	X-CORRELATIONID | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | L      | TMNA_AGENT |                 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing	Authorization   | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | TC_AGENT   | sendThroughCode |                               | 1511796583386 | deflate        |
      | Header_Missing	DATETIME        | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |               | deflate        |
      | Header_Missing	Accept-Encoding | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |                |


#400 - Incorrect/Invalid Header values
  @OrchGetProduct_negative
  Scenario Outline: Verify Orchestration Get Products API with headers having Incorrect/Invalid Header values<Message>
    Given Tester calls the Orchestration GetProductsService API with basePath
    When The user inputs the Orchestration GetProductsService API headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>"
    Then Orchestration GetProductsService API returns the status code"<Status>"
    And Orchestration GetProductsService API body should have the Response code "<responseCode>", Description "<description>"
    Examples:
      | Message                            | Status | responseCode | description                     | ContentType      | xBrand | xChannel   | xCorrelationId  | authorization                 | dateTime      | acceptEncoding |
      | Incorrect/Invalid	X-BRAND         | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | M      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Incorrect/Invalid	X-CHANNEL       | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | TC_AGENT?  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Incorrect/Invalid	X-CORRELATIONID | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | L      | CA_SELF    | XXXXXXXX        | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Incorrect/Invalid	Authorization   | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | US_DEALER  | sendThroughCode | 44b14d3df08d                  | 1511796583386 | deflate        |
      | Incorrect/Invalid	DATETIME        | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 6583386       | deflate        |
      | Incorrect/Invalid	Accept-Encoding | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | inflate        |
      | Incorrect/Invalid	asicode         | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
