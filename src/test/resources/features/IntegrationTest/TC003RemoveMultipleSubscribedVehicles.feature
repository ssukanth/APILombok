@RemoveMultipleSubscribedVehicles
Feature: Dealer via One Portal - 1.Search Customer - by Email Address 2.Find Multiple Subscribed Vehicles and Unlink Vehicle

  Scenario Outline: Search customer by email address
    Given JIT: Tester calls the Account Get api to search email address at "<basePath>"
    When JIT: Tester sends the get request with Headers customer Email ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    Then JIT: Customer account info is retrieved by searching email address with StatusCode "<statusCode>" ResponseCode "<responseCode>" and Description "<description>"

    Examples: 
      | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                   |
      | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |        200 | OCPR-0000    | Request Executed Successfully |

  Scenario Outline: Find Multiple Subscribed Vehicles and Unlink Vehicle
    Given JIT: Tester calls the Orchestration Vehicle Association PUT api with basePath
    When JIT: The user inputs Orchestration Vehicle Association PUT api ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When JIT: Tester post Orchestration Vehicle Association PUT api service with json body having vin "<vin>" guid "<guid>" status "<status>"
    Then JIT: The Orchestration Vehicle Association PUT api server returns "<statusCode>" status code
    And JIT: The Orchestration Vehicle Association PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples: 
      | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding | guid            | vin             | status |
      |        200 | ORCH-6000    | Request Processed Successfully | application/json | L      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | sendThroughCode | sendThroughCode | SOLD   |
      |        200 | ORCH-6000    | Request Processed Successfully | application/json | L      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | sendThroughCode | sendThroughCode | SOLD   |
