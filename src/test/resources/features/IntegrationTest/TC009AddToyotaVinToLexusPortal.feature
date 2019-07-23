@AddToyotaVinToLexusPortal
Feature: Dealer via One Portal - Add Toyota VIN to Lexus Portal

 Scenario Outline: 1. Create a new customer account at Lexus portal
    Given JIT: Tester calls the Create Customer Account POST api at "<basePath>"
    And JIT: Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When JIT: Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then JIT: The customer account should be successfully created in the Azure and OCPR systems by returning Status code "<statusCode>"
    And JIT: Tester get guid from response body which will pass into create subscription api request payload
    
    Examples: 
      | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email              | phone           | statusCode | responseCode | description                  |
      | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | email.T-TMNA_AGENT | sendThroughCode |        201 | ORCH-0000    | Account Created Successfully |
  

Scenario Outline: 2. Search valid vin that generate from data setup
    Given JIT: Tester calls the GET request with Brand toyota "<Brand>" vin at "<basePath>"
    And JIT: Tester set the headers for adding Toyota vin with ContentType "<ContentType>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" xapikey "<XAPIKEY>"
    When JIT: Tester sends the GET request for toyota vin
    Then JIT: The toyota vehicle info is retrieved by returning Status code "<statusCode>"
    And JIT: The server returns the toyota vin with ResponseCode "<responseCode>" Description "<description>"

    Examples: 
      |Brand | basePath     | ContentType      | XCHANNEL | XCORRELATIONID  | XAPIKEY         | statusCode | responseCode | description                    |
      |lexus | /v1/vehicle/ | application/json | CTP      | sendThroughCode | sendThroughCode |        200 | CVS-0000     | Request Completed Successfully |
      
  Scenario Outline: 3. Get products package info
    Given JIT: Tester calls the Toyota products GET API request
    And JIT: Tester set the headers for Toyota packages with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" asicode "<asicode>" hwtype "<hwtype>" generation "<generation>" region "<region>"
    When JIT: Tester sends toyota products package request
    Then JIT: The toyota products GET api response returns "<Status>" status code
    And JIT: Get toyota package products from response and will pass into create subscription post request

    Examples: 
      | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | asicode | hwtype | generation | region |
      |    200 | PROD-0000    | Request Processed Successfully | application/json | T      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539118418115 | AB      |    010 | 17CYPLUS   | US     |
      
  Scenario Outline: 4. Create vehicle association
    Given JIT: Tester calls the Vehicle Association create POST api to add toyota vehicle
    And JIT: Tester set Create toyota vehicle-association headers with Guid ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When JIT: Tester post toyota Vehicle Association POST api service with payload resource generation "<generation>" region "<region>" preferredDealerCode "<preferredDealerCode>" role "<role>" nickName "<nickName>" status "<status>" createDate "<createDate>" createSource "<createSource>"
    Then JIT: Toyota Vehicle Association create POST api server returns "<statusCode>" status code
    And JIT: Toyota Vehicle Association create POST api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples: 
      | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | vin             | generation | region | preferredDealerCode | role  | nickName | status | createDate                   | createSource |
      |        200 | ORCH-6000    | Request Processed Successfully | application/json | T      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539118461573 | sendThroughCode | 17CYPLUS   | US     | D009J               | Owner | Tester1  | ACTIVE | 2018-03-12T21:44:34.117+0000 | US_SELF      |
  
  Scenario Outline: 5. Create Subscriptions
    Given JIT: Tester calls subscription create api request to subscribe toyota vehicle
    And JIT: Tester set the headers to subscribe toyota vehicle with ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When JIT: Tester post the service with payload resource having toyota vin subscriberGuid region "<region>" generation "<generation>" waiver "<waiver>" remoteUserGuid "<remoteUserGuid>" packageID productID type ratePlanID term termUnit subscriptionStartDate can "<can300>" serviceConnect "<serviceConnect>" dealerContact "<dealerContact>" ubi "<ubi>" createDate "<createDate>" createSource "<createSource>" termsAcceptanceDate "<termsAcceptanceDate>"
    Then JIT: Toyota subscription POST API returns the response with "<Status>" status code
    And JIT: Toyota subscription POST API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples: 
      | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | vin             | subscriberGuid  | region | generation | waiver | createDate                   | termsAcceptanceDate          | can300 | serviceConnect | dealerContact | ubi  | createSource |
      |    200 | ORCH-8000    | Request Processed Successfully | application/json | T      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539118462882 | sendThroughCode | sendThroughCode | US     | 17CYPLUS   | false  | 2018-10-09T13:54:22.881-0700 | 2018-10-09T13:54:22.881-0700 | True   | True           | True          | True | US_DEALER    |

Scenario Outline: 6. Verify vehicleStatus should be SUBSCRIBED
    Given JIT: Tester calls the ORCH Subscription GET request for toyota vin
    And JIT: Tester sents subscription GET request for toyota vin having headers with ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When JIT: Tester sends the subscription GET request for toyota vin
    Then JIT: Tester verify toyota vehicle status should be "<vehicleStatus>" status

    Examples: 
      | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | vehicleStatus |
      | application/json | T      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539375249564 | SUBSCRIBED    |

  Scenario Outline: 7. Find subscribed Vehicle and Unlink Vehicle
    Given JIT: Tester calls the Orchestration Vehicle Association PUT api with basePath to remove toyota vin
    When JIT: Tester inputs Orchestration Vehicle Association PUT api for toyoa vin with headers ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When JIT: Tester post Orchestration Vehicle Association PUT api service to for toyoat vin with json body having vin "<vin>" guid "<guid>" status "<status>"
    Then JIT: The Orchestration Vehicle Association PUT api server returns "<statusCode>" status code for toyota vin
    And JIT: The Orchestration Vehicle Association PUT api body response content should have the ResponseCode "<responseCode>" and Description "<description>" for toyota vin

    Examples: 
      | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding | guid            | vin             | status |
      |        200 | ORCH-6000    | Request Processed Successfully | application/json | L      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1530895403766 | deflate        | sendThroughCode | sendThroughCode | SOLD   |