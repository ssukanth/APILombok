Feature: Get vehicle API which would be used from Test harness

@regGetVehiDetailIMEI
  Scenario Outline: Get vehicle details based on IMEI "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/"
  
     When Tester wants to get vehicles with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>" AND IMEI "<IMEI>" 
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                                              | Status | Response | X-CORRELATIONID                      | X-CHANNEL | IMEI             | 
      | All positive scenario TEST                           | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 999999999900224  | 
      | All positive scenario ADMIN                          | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ADMIN     | 999999999900224  | 
      | All positive scenario TSP                            | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TSP       | 999999999900224  | 
      | All positive scenario XEVO                           | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | XEVO      | 109604460469579  | 
      | All positive scenario CTP                            | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | 109604460469579  | 
      | All positive scenario EIG                            | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | EIG       | 109604460469579  | 
      | All positive scenario TCI                            | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 353503890612498  | 
      | All positive scenario SERVCO                         | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | 999999999900273  | 
      | Missing X-CORRELATIONID                              | 400    | CVS-0008 |                                      | TEST      | 999999999900224  | 
      | Invalid CORRELATIONID                                | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TEST      | 999999999900224  | 
      | Missing X-CHANNEL                                    | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 999999999900224  | 
      | Invalid X-CHANNEL                                    | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | 999999999900224  | 
      | Invalid X-CHANNEL random                             | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ZZZ       | 999999999900224  | 
      | Missing X-API-KEY                                    | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 999999999900224  | 
      | invalid X-API-KEY                                    | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 999999999900224  | 
      | Vehicle not found                                    | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | XEVO      | 109604460469571  | 
      | Invalid IMEI 13 char                                 | 400    | CVS-0009 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 9999999999002    | 
      | Invalid IMEI 16 char                                 | 400    | CVS-0009 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 9999999999002245 | 
      | Invalid IMEI                                         | 400    | CVS-0009 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 99999999990O224  | 
      | Vehicle not ready for subscription                   | 400    | CVS-0078 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | 358942806967148  | 
      | Unauthorized vehicle requested by the calling system | 401    | CVS-0037 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 999999999900273  | 
      
@smokeGetVehiDetailIMEI
  Scenario Outline: Get vehicle details based on IMEI "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/"
  
     When Tester wants to get vehicles with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>" AND IMEI "<IMEI>" 
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                                              | Status | Response | X-CORRELATIONID                      | X-CHANNEL | IMEI             | 
      | All positive scenario                                | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 999999999900224  | 
      | Missing X-CORRELATIONID                              | 400    | CVS-0008 |                                      | TEST      | 999999999900224  | 
      | Invalid CORRELATIONID                                | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TEST      | 999999999900224  | 
      | Missing X-CHANNEL                                    | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 999999999900224  | 
      | Invalid X-CHANNEL                                    | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | 999999999900224  | 
      | Invalid X-CHANNEL random                             | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ZZZ       | 999999999900224  | 
      | Missing X-API-KEY                                    | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 999999999900224  | 
      | invalid X-API-KEY                                    | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 999999999900224  | 
      | Vehicle not found                                    | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | XEVO      | 109604460469571  | 
      | Invalid IMEI                                         | 400    | CVS-0009 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 99999999990O224  | 
      | Vehicle not ready for subscription                   | 400    | CVS-0078 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | 358942806967148  | 
      | Unauthorized vehicle requested by the calling system | 401    | CVS-0037 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 999999999900273  | 
