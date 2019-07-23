Feature: Testing Orchestration Get Package API
  User should be able to Orchestration Get PackageDetails service API to retrieve subscription information in Product details
  
 #200 -Successful Request
  @OrchPackage_Positive
  Scenario Outline: Verify Orchestration Get PackageDetails service API with valid input data <Message>
    Given Tester calls the Orchestration Get PackageDetails service API with basePath
    When The user inputs the Orchestration Get PackageDetails service API  headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>" asi-code "<asi-Code>" hw-type "<hw-type>" generation "<generation>" region "<region>"
    Then Orchestration Get PackageDetails service API returns the status code"<Status>"
    And Orchestration Get PackageDetails service API body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message     | Status | responseCode | description                    | ContentType      | xBrand | xChannel   | xCorrelationId  | authorization                 | dateTime      | acceptEncoding | asi-Code | hw-type | generation | region |
      | Positive_1  | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_2  | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_3  | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_4  | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_5  | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_6  | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_7  | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_8  | 200    | ORCH-4000    | Request Processed Successfully | application/json | T      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_9  | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_10 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_11 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_12 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_13 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_14 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_15 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Positive_16 | 200    | ORCH-4000    | Request Processed Successfully | application/json | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |

#400 - Mandatory Header Attribute(s) Missing
  @OrchPackage_Negative
  Scenario Outline: Verify Orchestration Get PackageDetails service API with valid input data <Message>
    Given Tester calls the Orchestration Get PackageDetails service API with basePath
    When The user inputs the Orchestration Get PackageDetails service API  headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>" asi-code "<asi-Code>" hw-type "<hw-type>" generation "<generation>" region "<region>"
    Then Orchestration Get PackageDetails service API returns the status code"<Status>"
    And Orchestration Get PackageDetails service API body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                        | Status | responseCode | description                           | ContentType      | xBrand | xChannel   | xCorrelationId  | authorization                 | dateTime      | acceptEncoding | asi-Code | hw-type | generation | region |
      | Header_Missing	X-BRAND        | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json |        | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Header_Missing	xChannel       | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      |            | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Header_Missing	xCorrelationId | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT |                 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Header_Missing	authorization  | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | sendThroughCode |                               | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Header_Missing	dateTime       | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a |               | deflate        | E        | 9       | 17CY       | US     |
      | Header_Missing	acceptEncoding | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 |                | E        | 9       | 17CY       | US     |
      | Header_Missing	asi-Code       | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |          | 9       | 17CY       | US     |
      | Header_Missing	hw-type        | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        |         | 17CY       | US     |
      | Header_Missing	generation     | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       |            | US     |
      | Header_Missing	region         | 400    | ORCH-4001    | Mandatory Header Attribute(s) Missing | application/json | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       |        |

#400 - Incorrect/Invalid Header Values
  @OrchPackage_Negative
  Scenario Outline: Verify Orchestration Get PackageDetails service API with valid input data <Message>
    Given Tester calls the Orchestration Get PackageDetails service API with basePath
    When The user inputs the Orchestration Get PackageDetails service API  headers ContentType "<ContentType>" XBRAND "<xBrand>" XCHANNEL "<xChannel>" XCORRELATIONID "<xCorrelationId>" Authorization "<authorization>" DATETIME "<dateTime>" AcceptEncoding "<acceptEncoding>" asi-code "<asi-Code>" hw-type "<hw-type>" generation "<generation>" region "<region>"
    Then Orchestration Get PackageDetails service API returns the status code"<Status>"
    And Orchestration Get PackageDetails service API body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:
      | Message                            | Status | responseCode | description                     | ContentType      | xBrand | xChannel | xCorrelationId  | authorization                 | dateTime      | acceptEncoding | asi-Code | hw-type | generation | region |
      | Incorrect/Invalid	X-BRAND        | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | B      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Incorrect/Invalid	xChannel       | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | L      | UK_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Incorrect/Invalid	xCorrelationId | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | XXXX            | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Incorrect/Invalid	authorization  | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | sendThroughCode | 8923gf7                       | 1511796583386 | deflate        | E        | 9       | 17CY       | US     |
      | Incorrect/Invalid	dateTime       | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796       | deflate        | E        | 9       | 17CY       | US     |
      | Incorrect/Invalid	acceptEncoding | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | inflate        | E        | 9       | 17CY       | US     |
      | Incorrect/Invalid	asi-Code       | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1        | 9       | 17CY       | US     |
      | Incorrect/Invalid	hw-type        | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | A       | 17CY       | US     |
      | Incorrect/Invalid	generation     | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CM       | US     |
      | Incorrect/Invalid	region         | 400    | ORCH-4002    | Incorrect/Invalid Header Values | application/json | T      | US_SELF  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | E        | 9       | 17CY       | UK     |

   



