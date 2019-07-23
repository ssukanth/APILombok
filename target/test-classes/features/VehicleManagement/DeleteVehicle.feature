Feature: Delete vehicle API which would be used from Test harness

@regDeleteVeh
  Scenario Outline: Delete Vehicle based on VIN "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/<VIN>"
  
     When Tester wants to delete vehicles details with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                      | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN               |
     #| All positive scenario TEST   | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 5TDYZRFH1JS236827 | 
     #| All positive scenario ADMIN  | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ADMIN     | 2T2BZMCA9GC026071 | 
      | Missing X-CORRELATIONID      | 400    | CVS-0008 |                                      | TEST      | 4T1B11HK9JU001148 | 
      | Invalid CORRELATIONID        | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TEST      | 4T1B11HK9JU001148 | 
      | Missing X-CHANNEL            | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 4T1B11HK9JU001148 | 
      | Invalid X-CHANNEL TSP        | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TSP       | 4T1B11HK9JU001148 | 
      | Invalid X-CHANNEL TCI        | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU001148 | 
      | Invalid X-CHANNEL SERVCO     | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | 4T1B11HK9JU001148 | 
      | Invalid X-CHANNEL NVS        | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | 4T1B11HK9JU001148 |
      | Invalid X-CHANNEL CTP        | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | 4T1B11HK9JU001148 | 
      | Invalid X-CHANNEL EIG        | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | EIG       | 4T1B11HK9JU001148 | 
      | Invalid X-CHANNEL XEVO       | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | XEVO      | 4T1B11HK9JU001148 |  
      | Invalid X-CHANNEL Random     | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ZZZ       | 4T1B11HK9JU001148 |
      | Missing X-API-KEY            | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001148 | 
      | invalid X-API-KEY            | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001148 | 
      | Vehicle not found            | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001155 | 
      | Invalid VIN                  | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU00114  | 
      | Invalid VIN more characters  | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU0011456|
      | Invalid VIN type             | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 11111111111111111 |  
      
@smokeDeleteVeh
  Scenario Outline: Delete Vehicle based on VIN "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/<VIN>"
  
     When Tester wants to delete vehicles details with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                      | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN               |
     #| All positive scenario TEST   | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 5TDYZRFH1JS236827 | 
      | Missing X-CORRELATIONID      | 400    | CVS-0008 |                                      | TEST      | 4T1B11HK9JU001148 | 
      | Invalid CORRELATIONID        | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TEST      | 4T1B11HK9JU001148 | 
      | Missing X-CHANNEL            | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 4T1B11HK9JU001148 | 
      | Invalid X-CHANNEL            | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ZZZ       | 4T1B11HK9JU001148 | 
      | Missing X-API-KEY            | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001148 | 
      | invalid X-API-KEY            | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001148 | 
      | Vehicle not found            | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001155 | 
      | Invalid VIN                  | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU00114  |  

