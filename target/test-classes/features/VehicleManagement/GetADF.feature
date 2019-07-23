Feature: Get vehicles API which would be used from Test harness

@regGetADF
  Scenario Outline: Get ADF based on VIN "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/adf/<VIN>"
  
     When Tester wants to get ADF details with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                                              | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN                | 
      | All positive scenario TCI                            | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU001148  | 
      | All positive scenario NVS                            | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | JTJBM7FX9J5205554  | 
      | All positive scenario SERVCO                         | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | 4T1B11HK7JU001856  | 
      | Missing X-CORRELATIONID                              | 400    | CVS-0008 |                                      | TCI       | 4T1B11HK9JU001148  | 
      | Invalid CORRELATIONID                                | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TCI       | 4T1B11HK9JU001148  | 
      | Missing X-CHANNEL                                    | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 4T1B11HK9JU001148  | 
      | Invalid X-CHANNEL                                    | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TSP       | 4T1B11HK9JU001148  | 
      | Missing X-API-KEY                                    | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU001148  | 
      | invalid X-API-KEY                                    | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU001148  | 
      | Vehicle not found                                    | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU001155  | 
      | Invalid VIN                                          | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU00114   | 
      | Invalid VIN                                          | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU0011456 | 
      | Invalid VIN                                          | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 11111111111111111  | 
     #| Missing VIN                                          | 400    | CVS-0011 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       |                    | 
      | Unauthorized vehicle requested by the calling system | 401    | CVS-0037 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | 4T1B11HK9JU001148  | 
  
  @smokeGetADF
  Scenario Outline: Get ADF based on VIN "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/adf/<VIN>"
  
     When Tester wants to get ADF details with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                                              | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN               | 
      | All positive scenario                                | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | 4T1B11HK7JU001856 | 
      | Missing X-CORRELATIONID                              | 400    | CVS-0008 |                                      | TCI       | 4T1B11HK9JU001148 | 
      | Invalid CORRELATIONID                                | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TCI       | 4T1B11HK9JU001148 | 
      | Missing X-CHANNEL                                    | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 4T1B11HK9JU001148 | 
      | Invalid X-CHANNEL                                    | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TSP       | 4T1B11HK9JU001148 | 
      | Missing X-API-KEY                                    | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU001148 | 
      | invalid X-API-KEY                                    | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU001148 | 
      | Vehicle not found                                    | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU001155 | 
      | Invalid VIN                                          | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU00114  | 
     #| Missing VIN                                          | 400    | CVS-0011 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       |                   | 
      | Unauthorized vehicle requested by the calling system | 401    | CVS-0037 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | 4T1B11HK9JU001148 | 
  
