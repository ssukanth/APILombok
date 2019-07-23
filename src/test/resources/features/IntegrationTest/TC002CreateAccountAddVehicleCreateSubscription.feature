@CreateAccountAddVehicleCreateSubscription
Feature: Dealer One Portal - 1.Create Customer Account 2.Add vehicle 3.Create Subscription 4. Search account by phone number 5.Find vehicle, verify vehicle SUBSCRIBED status

  Scenario Outline: 1. Create a new customer account at Lexus portal
    Given JIT: Tester calls the Create Customer Account POST api at "<basePath>"
    And JIT: Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When JIT: Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then JIT: The customer account should be successfully created in the Azure and OCPR systems by returning Status code "<statusCode>"
    Then JIT: Tester get guid from response body which will pass into create subscription api request payload

    Examples: 
      | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email              | phone           | statusCode | responseCode | description                  |
      | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | email.T-TMNA_AGENT | sendThroughCode |        201 | ORCH-0000    | Account Created Successfully |

  Scenario Outline: 2. Search valid vin that generate from data setup
    Given JIT: Tester calls the GET request with Brand "<Brand>" vin at "<basePath>"
    And JIT: Tester set the headers with ContentType "<ContentType>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" xapikey "<XAPIKEY>"
    When JIT: Tester send the GET request
    Then JIT: The vehicle is able to add to system by returning Status code "<statusCode>"
    And JIT: The server returns the valid vin code ResponseCode "<responseCode>" Description "<description>"

    Examples: 
      |Brand | basePath     | ContentType      | XCHANNEL | XCORRELATIONID  | XAPIKEY         | statusCode | responseCode | description                    |
      |lexus | /v1/vehicle/ | application/json | CTP      | sendThroughCode | sendThroughCode |        200 | CVS-0000     | Request Completed Successfully |
      |lexus | /v1/vehicle/ | application/json | CTP      | sendThroughCode | sendThroughCode |        200 | CVS-0000     | Request Completed Successfully |
      
  Scenario Outline: 3. Get products package info
    Given JIT: Tester calls the product GET API request
    And JIT: Tester set the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" asicode "<asicode>" hwtype "<hwtype>" generation "<generation>" region "<region>"
    When JIT: Tester send product package request
    Then JIT: The product GET api server returns "<Status>" status code
    And JIT: Get package products from response and will pass into create subscription post request

    Examples: 
      | Status | responseCode | description                    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | asicode | hwtype | generation | region |
      |    200 | PROD-0000    | Request Processed Successfully | application/json | L      | ORCH_PROD | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539118418115 | AB      |    011 | 17CYPLUS   | US     |
      
  Scenario Outline: 4. Create vehicle association
    Given JIT: Tester calls the Orchestration Vehicle Association POST api
    And JIT: Tester set the headers with Guid ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When JIT: Tester post ORCH Vehicle Association POST api service with json body having generation "<generation>" region "<region>" preferredDealerCode "<preferredDealerCode>" role "<role>" nickName "<nickName>" status "<status>" createDate "<createDate>" createSource "<createSource>"
    Then JIT: ORCH Vehicle Association POST api server returns "<statusCode>" status code
    And JIT: ORCH Vehicle Association POST api body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples: 
      | statusCode | responseCode | description                    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | vin             | generation | region | preferredDealerCode | role  | nickName | status | createDate                   | createSource |
      |        200 | ORCH-6000    | Request Processed Successfully | application/json | L      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539118461573 | sendThroughCode | 17CYPLUS   | US     | D009J               | Owner | Tester1  | ACTIVE | 2018-03-12T21:44:34.117+0000 | US_SELF      |
      |        200 | ORCH-6000    | Request Processed Successfully | application/json | L      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539118461573 | sendThroughCode | 17CYPLUS   | US     | D009J               | Owner | Tester1  | ACTIVE | 2018-03-12T21:44:34.117+0000 | US_SELF      |  
  
  Scenario Outline: 5. Create Subscriptions
    Given JIT: Tester calls subscription create api
    And JIT: Tester set the headers with ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When JIT: Tester post the service with json body having vin subscriberGuid region "<region>" generation "<generation>" waiver "<waiver>" remoteUserGuid "<remoteUserGuid>" packageID productID type ratePlanID term termUnit subscriptionStartDate can "<can300>" serviceConnect "<serviceConnect>" dealerContact "<dealerContact>" ubi "<ubi>" createDate "<createDate>" createSource "<createSource>" termsAcceptanceDate "<termsAcceptanceDate>"
    Then JIT: the Orchestration - Subscription POST API returns the "<Status>" status code
    And JIT: The Orchestration - Subscription POST API body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples: 
      | Status | responseCode | description                    | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | vin             | subscriberGuid  | region | generation | waiver | createDate                   | termsAcceptanceDate          | can300 | serviceConnect | dealerContact | ubi  | createSource |
      |    200 | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539118462882 | sendThroughCode | sendThroughCode | US     | 17CYPLUS   | false  | 2018-10-09T13:54:22.881-0700 | 2018-10-09T13:54:22.881-0700 | True   | True           | True          | True | US_DEALER    |
      |    200 | ORCH-8000    | Request Processed Successfully | application/json | L      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539118462882 | sendThroughCode | sendThroughCode | US     | 17CYPLUS   | false  | 2018-10-09T13:54:22.881-0700 | 2018-10-09T13:54:22.881-0700 | True   | True           | True          | True | US_DEALER    |
      
  Scenario Outline: Search customer by phone number
    Given JIT: After subscription created, tester calls the Account Get api for search email address at "<basePath>"
    When JIT: After subscription created, tester sends the get request with Headers PhoneNumber ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    Then JIT: After subscription created, the customer account info is retrieved by searching phone number with StatusCode "<statusCode>" ResponseCode "<responseCode>" and Description "<description>"

    Examples: 
      | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | statusCode | responseCode | description                   |
      | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |        200 | OCPR-0000    | Request Executed Successfully |
  
  Scenario Outline: Verify vehicleStatus should be SUBSCRIBED
    Given JIT: Tester calls the ORCH Subscription GET request
    And JIT: Tester having headers with ContentType "<contentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>"
    When JIT: Tester send the ORCH Subscription GET request
    Then JIT: Tester verify vehicleStatus should be "<vehicleStatus>" vehicleStatus

    Examples: 
      | contentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                 | DATETIME      | vehicleStatus |
      | application/json | L      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539375249564 | SUBSCRIBED    |
      | application/json | L      | TRC      | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1539375249564 | SUBSCRIBED    |