@CreateAccountAddVehicleWithVinNotInSystem
Feature: Dealer One Portal - 1.Create Customer Account 2.Add vehicle with the VIN that not exist in system

  Scenario Outline: Create a new customer account
    Given JIT: Tester calls the Create Customer Account POST api at "<basePath>"
    And JIT: Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When JIT: Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then JIT: The customer account should be successfully created in the Azure and OCPR systems by returning Status code "<statusCode>"

    Examples: 
      | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email              | phone           | statusCode | responseCode | description                  |
      | /v1/account | application/json | T      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | email.T-TMNA_AGENT | sendThroughCode |        201 | ORCH-0000    | Account Created Successfully |
      | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | email.T-TMNA_AGENT | sendThroughCode |        201 | ORCH-0000    | Account Created Successfully |
      
  Scenario Outline: Add vehicle with the VIN that not exist in system and verify the response
    Given JIT: Tester calls the GET request at "<basePath>"
    And JIT: Tester uses the headers with ContentType "<ContentType>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" xapikey "<XAPIKEY>"
    When JIT: Tester send a GET request
    Then JIT: The vehicle is unable to add to system by returning Status code "<statusCode>"
    And JIT: The server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples: 
      | basePath     | ContentType      | XCHANNEL | XCORRELATIONID  | XAPIKEY          | statusCode | responseCode | description       |
      | /v1/vehicle/ | application/json | CTP      | sendThroughCode | sendThroughCode	|        404 | CVS-0002     | Vehicle not found |
