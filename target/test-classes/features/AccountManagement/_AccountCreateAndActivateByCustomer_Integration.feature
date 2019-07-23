
Feature: Testing Activate Customer Account - Orchestration Micro Services
  As a tester, I should be able to Activate Customer's Account by using Account Activation Micro service exposed from the Orchestration layer.
  Self service endpoint that takes in solely an activation code/OTP. It activates a consumer’s account in Azure AD by using the activation code/OTP.

  @ActivateCustomerAccount-Integration-Smoke
  Scenario Outline: Activate Customer Account by integrating three API services: 1.Create Customer Account 2.Send GUID and Get OTP by Test API Service 3.Send GUID and OTP to Activate Account API Service <scenarioName>
    Given Create Customer Account POST api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When the Tester post the service with json body having guid "<guid>" objectId "<objectId>" customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" password "<password>"
    Then the Status code should be "<creationStatusCode>"
    And must have the ResponseCode "<creationResponseCode>" Description "<creationDescription>"

    Given OTP Generator API is available
    And OTP Generator uses the header GUID which got from the Account Creation POST API Response
    And Tester calls the OTP Generator GET service and store the OTP from response

    Given Activate Customer Account PATCH api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls the PATCH service with json body having OTP and GUID
    Then the Status code should be "<creationStatusCode>"
    Then the Status code should be "<activationStatusCode>"
    And must have the ResponseCode "<activationResponseCode>" Description "<activationDescription>"

    Examples:
      | scenarioName        | basePath    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email                | phone           | password     | creationStatusCode | creationResponseCode | creationDescription          | activationStatusCode | activationResponseCode | activationDescription |
      | with Toyota US_SELF | /v1/account | application/json | T      | US_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-T-us_self | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |
      | with Lexus LER      | /v1/account | application/json | L      | LER      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-L-ler     | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |


  @ActivateCustomerAccount-Integration-Positive
  Scenario Outline: Activate Customer Account by integrating three API services: 1.Create Customer Account 2.Send GUID and Get OTP by Test API Service 3.Send GUID and OTP to Activate Account API Service <scenarioName>
    Given Create Customer Account POST api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When the Tester post the service with json body having guid "<guid>" objectId "<objectId>" customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" password "<password>"
    Then the Status code should be "<creationStatusCode>"
    And must have the ResponseCode "<creationResponseCode>" Description "<creationDescription>"

    Given OTP Generator API is available
    And OTP Generator uses the header GUID which got from the Account Creation POST API Response
    And Tester calls the OTP Generator GET service and store the OTP from response

    Given Activate Customer Account PATCH api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls the PATCH service with json body having OTP and GUID
    Then the Status code should be "<creationStatusCode>"
    Then the Status code should be "<activationStatusCode>"
    And must have the ResponseCode "<activationResponseCode>" Description "<activationDescription>"

    Examples:
      | scenarioName                   | basePath    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email                  | phone           | password     | creationStatusCode | creationResponseCode | creationDescription          | activationStatusCode | activationResponseCode | activationDescription |
      | with Toyota US_SELF            | /v1/account | application/json | T      | US_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-T-us_self   | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |
      | with Toyota CA_SELF            | /v1/account | application/json | T      | CA_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |              | TFname    | TLname   | Test.email-T-ca_self   | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |
      | with Toyota TRC                | /v1/account | application/json | T      | TRC      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-T-trc       | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |
      | with Toyota LER                | /v1/account | application/json | T      | LER      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-T-ler       | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |

      | with Lexus US_SELF             | /v1/account | application/json | L      | US_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t |              | TFname    | TLname   | test.Email-L-us_self   | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |
      | with Lexus CA_SELF             | /v1/account | application/json | L      | CA_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | Test.Email-L-ca_self   | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |
      | with Lexus TRC                 | /v1/account | application/json | L      | TRC      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-L-trc       | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |
      | with Lexus LER                 | /v1/account | application/json | L      | LER      | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-L-ler       | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |

      | with T US_SELF canadian French | /v1/account | application/json | T      | US_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | Prénom    | Nom      | Courriel-Nom-T-us_self | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |
      | with L CA_SELF canadian French | /v1/account | application/json | L      | CA_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | Nom       | Prénom   | Courriel-Nom-L-ca_self | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 200                  | AVCD-0000              | Successful Response   |

  @ActivateCustomerAccount-Integration-WrongOTP
  Scenario Outline: Activate Customer Account by integrating three API services: Create Customer Account + Send GUID and Get OTP by Test API Service + Send GUID and wrong OTP to Activate Account API Service <scenarioName>
    Given Create Customer Account POST api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When the Tester post the service with json body having guid "<guid>" objectId "<objectId>" customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" password "<password>"
    Then the Status code should be "<creationStatusCode>"
    And must have the ResponseCode "<creationResponseCode>" Description "<creationDescription>"

    Given OTP Generator API is available
    And OTP Generator uses the header GUID which got from the Account Creation POST API Response
    And Tester calls the OTP Generator GET service and store the OTP from response
    And Use the wrong OTP

    Given Activate Customer Account PATCH api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls the PATCH service with json body having OTP and GUID
    Then the Status code should be "<creationStatusCode>"
    Then the Status code should be "<activationStatusCode>"
    And must have the ResponseCode "<activationResponseCode>" Description "<activationDescription>"

    Examples:
      | scenarioName                    | basePath    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email                | phone           | password     | creationStatusCode | creationResponseCode | creationDescription          | activationStatusCode | activationResponseCode | activationDescription   |
      | with Toyota US_SELF - wrong OTP | /v1/account | application/json | T      | US_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-T-us_self | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 400                  | AVCD-0006              | Activation Code Invalid |
      | with Toyota US_SELF - wrong OTP | /v1/account | application/json | L      | CA_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-T-us_self | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 400                  | AVCD-0006              | Activation Code Invalid |


  @ActivateCustomerAccount-Integration-NonNumericOTP
  Scenario Outline: Activate Customer Account by integrating three API services: Create Customer Account + Send GUID and Get OTP by Test API Service + Send GUID and wrong OTP to Activate Account API Service <scenarioName>
    Given Create Customer Account POST api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When the Tester post the service with json body having guid "<guid>" objectId "<objectId>" customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" password "<password>"
    Then the Status code should be "<creationStatusCode>"
    And must have the ResponseCode "<creationResponseCode>" Description "<creationDescription>"

    Given OTP Generator API is available
    And OTP Generator uses the header GUID which got from the Account Creation POST API Response
    And Tester calls the OTP Generator GET service and store the OTP from response
    And Use the NonNumeric OTP

    Given Activate Customer Account PATCH api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls the PATCH service with json body having OTP and GUID
    Then the Status code should be "<creationStatusCode>"
    Then the Status code should be "<activationStatusCode>"
    And must have the ResponseCode "<activationResponseCode>" Description "<activationDescription>"

    Examples:
      | scenarioName                    | basePath    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email                | phone           | password     | creationStatusCode | creationResponseCode | creationDescription          | activationStatusCode | activationResponseCode | activationDescription                       |
      | with Toyota US_SELF - wrong OTP | /v1/account | application/json | T      | US_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-T-us_self | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 400                  | ORCH-0004              | Incorrect/Invalid Request Body Attribute(s) |
      | with Toyota US_SELF - wrong OTP | /v1/account | application/json | L      | CA_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-T-us_self | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 400                  | ORCH-0004              | Incorrect/Invalid Request Body Attribute(s) |

  @ActivateCustomerAccount-Integration-ExpiredOTP
  Scenario Outline: Activate Customer Account by integrating three API services: Create Customer Account + Send GUID and Get OTP by Test API Service + Send GUID and wrong OTP to Activate Account API Service <scenarioName>
    Given Create Customer Account POST api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When the Tester post the service with json body having guid "<guid>" objectId "<objectId>" customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>" password "<password>"
    Then the Status code should be "<creationStatusCode>"
    And must have the ResponseCode "<creationResponseCode>" Description "<creationDescription>"

    Given OTP Generator API is available
    And OTP Generator uses the header GUID which got from the Account Creation POST API Response
    And Tester calls the OTP Generator GET service and store the OTP from response
    And Use the Expired OTP

    Given Activate Customer Account PATCH api is available at "<basePath>"
    And use the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When Tester calls the PATCH service with json body having OTP and GUID
    Then the Status code should be "<creationStatusCode>"
    Then the Status code should be "<activationStatusCode>"
    And must have the ResponseCode "<activationResponseCode>" Description "<activationDescription>"

    Examples:
      | scenarioName                    | basePath    | ContentType      | XBRAND | XCHANNEL | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email                | phone           | password     | creationStatusCode | creationResponseCode | creationDescription          | activationStatusCode | activationResponseCode | activationDescription   |
      | with Toyota US_SELF - wrong OTP | /v1/account | application/json | T      | US_SELF  | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | test.Email-T-us_self | sendThroughCode | Password@123 | 201                | ORCH-0000            | Account Created Successfully | 400                  | AVCD-0006              | Activation Code Invalid |
