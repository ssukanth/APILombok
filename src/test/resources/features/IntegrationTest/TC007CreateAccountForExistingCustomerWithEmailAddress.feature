@CreateAccountForExistingCustomerWithEmailAddress
Feature: Dealer via One Portal - Can not create an account for an already existing Customer- Emai Address

 Scenario Outline: Create a new customer account
    Given JIT: Tester calls the Create Customer Account POST api at "<basePath>"
    And JIT: Tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When JIT: Tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>" phone "<phone>"
    Then JIT: The customer account should be successfully created in the Azure and OCPR systems by returning Status code "<statusCode>"

    Examples: 
      | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email              | phone           | statusCode | responseCode | description                  |
      | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | email.T-TMNA_AGENT | sendThroughCode |        201 | ORCH-0000    | Account Created Successfully |
  

  Scenario Outline: Create a new customer account using the exist an already existing Customer- Email Address
    Given JIT: To create an account for an already existing Customer with email address, tester calls the Create Customer Account POST api at "<basePath>"
    And JIT: To create an account with existing email address, tester uses the headers with ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>"
    When JIT: To create an account with existing email address, tester post the service with json body having customerType "<customerType>" firstName "<firstName>" lastName "<lastName>" email "<email>"
    Then JIT: Can not create an account for an already existing Customer with emai address with StatusCode "<statusCode>" ResponseCode "<responseCode>" and Description "<description>"

    Examples: 
      | basePath    | ContentType      | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                            | customerType | firstName | lastName | email           | phone           | statusCode | responseCode | description         |
      | /v1/account | application/json | L      | US_DEALER | sendThroughCode | icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t | PERSON       | TFname    | TLname   | sendThroughCode | sendThroughCode |        400 | ORCH-0010    | User Already Exists |

 