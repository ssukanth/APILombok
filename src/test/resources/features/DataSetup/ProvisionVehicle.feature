@DataSetUp
Feature: Data setup - 1.Sign in data setup tool 2.Provision a new toyota/lexus vehicle, get vechile info. 3.Pass vehicle info into create vechile api service and call this api.

  Scenario Outline: Sign in data setup tool, provision a new toyota/lexus vehicle
    Given Tester login data setup tool using POST api at "<loginBasePath>"
    When Tester send a POST request to get response headers
    Then Tester get authorization from response headers
    
    Given Tester calls the provision vehicle POST api at "<provisionBasePath>"
    And Tester pass the authorization from login response into provision request header with ContentType "<ContentType>"
    When Tester post provision vehicle POST api service with json body having brand "<brand>" headUnit "<headUnit>" asiCode "<asiCode>" dcmType "<dcmType>" quantity "<quantity>" katashikiCode "<katashikiCode>"
    Then Tester get vin from response body
    
    Given Tester pass the vin into vehicle GET api then calls GET api at "<vehicleGetBasePath>"
    And Tester pass the authorization from login response into get vehicle request header with ContentType "<ContentType>"
    When Tester calls vehicle GET api service
    Then Tester get vehicle info from response body
    
    Given Tester calls the create vehicle api at "<vehicleCreateBasePath>"
    And Tester uses the headers with ContentType "<ContentType>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" XAPIKEY "<XAPIKEY>"
    When Tester pass the vehicle info from data setup tool into create vehicle POST api service
    Then The server returns the ResponseCode "<responseCode>" Description "<description>"

    Examples: 
      | loginBasePath | provisionBasePath | vehicleGetBasePath | vehicleCreateBasePath | ContentType      | Authorization | XCHANNEL | XCORRELATIONID  | XAPIKEY         | brand  | headUnit | asiCode | dcmType | quantity | statusCode | katashikiCode        | responseCode | description                  |
      | /login        | /pro/v2           | /vehicles/         | /v1/vehicle           | application/json | sendFromLogin | ADMIN    | sendThroughCode | sendThroughCode | Toyota | T2       | AB      | LGE     |        1 |        201 | ZET03003050383057283 | CVS-0100     | Vehicle Created Successfully |
      | /login        | /pro/v2           | /vehicles/         | /v1/vehicle           | application/json | sendFromLogin | ADMIN    | sendThroughCode | sendThroughCode | Lexus  | L2       | AB      | LGE     |        1 |        201 | ZET03003050383057283 | CVS-0100     | Vehicle Created Successfully |
      | /login        | /pro/v2           | /vehicles/         | /v1/vehicle           | application/json | sendFromLogin | ADMIN    | sendThroughCode | sendThroughCode | Lexus  | L2       | AB      | LGE     |        1 |        201 | ZET03003050383057283 | CVS-0100     | Vehicle Created Successfully |