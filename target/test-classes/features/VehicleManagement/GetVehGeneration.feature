Feature: Get Vehicle Generation API which would be used from Test harness

@regGetVehGen
  Scenario Outline: Get Vehicle Generation based on VIN "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/generation/<VIN>"
  
     When Tester wants to get Vehicle Generation details with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                      | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN               | 
      | All positive scenario TCI    | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | WBAAB5408G9609667 | 
      | All positive scenario EIG    | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | EIG       | 5TKBD30E8GX401619 | 
      | All positive scenario SERVCO | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | 4T1BZ1FB7KU006446 |
      | All positive scenario CTP    | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | 4T1BZ1FB7KU006446 |
      | All positive scenario XEVO   | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | XEVO      | 4T1BZ1FB7KU006446 |
      | All positive scenario TSP    | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TSP       | 4T1BZ1FB7KU006446 |
      | All positive scenario TEST   | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1BZ1FB7KU006446 | 
      | All positive scenario ADMIN  | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ADMIN     | 4T1BZ1FB7KU006446 |
      | Missing X-CORRELATIONID      | 400    | CVS-0008 |                                      | TCI       | WBAAB5408G9609667 | 
      | Invalid CORRELATIONID        | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TCI       | WBAAB5408G9609667 | 
      | Missing X-CHANNEL            | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | WBAAB5408G9609667 | 
      | Invalid X-CHANNEL            | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | WBAAB5408G9609667 | 
      | Invalid X-CHANNEL random     | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ZZZ       | WBAAB5408G9609667 | 
      | Missing X-API-KEY            | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | WBAAB5408G9609667 | 
      | invalid X-API-KEY            | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | WBAAB5408G9609667 | 
      | Vehicle not found            | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | WBAAB5408G9609668 | 
      | Invalid VIN                  | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU00114  |
      | Invalid VIN                  | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU0011456|
      | Invalid VIN                  | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU0011_5 |   
     #| Missing VIN                  | 400    | CVS-0011 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       |                   | 
      | invalid VIN Country          | 401    | CVS-0037 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | WBAAB5408G9609667 | 

      
@smokeGetVehGen
  Scenario Outline: Get Vehicle Generation based on VIN "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/generation/<VIN>"
  
     When Tester wants to get Vehicle Generation details with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                      | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN               | 
      | All positive scenario        | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ADMIN     | 4T1BZ1FB7KU006446 |
      | Missing X-CORRELATIONID      | 400    | CVS-0008 |                                      | TCI       | WBAAB5408G9609667 | 
      | Invalid CORRELATIONID        | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TCI       | WBAAB5408G9609667 | 
      | Missing X-CHANNEL            | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | WBAAB5408G9609667 | 
      | Invalid X-CHANNEL            | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | WBAAB5408G9609667 |  
      | Missing X-API-KEY            | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | WBAAB5408G9609667 | 
      | invalid X-API-KEY            | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | WBAAB5408G9609667 | 
      | Vehicle not found            | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | WBAAB5408G9609668 | 
      | Invalid VIN                  | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | 4T1B11HK9JU00114  |   
     #| Missing VIN                  | 400    | CVS-0011 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       |                   | 
      | invalid VIN Country          | 401    | CVS-0037 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | WBAAB5408G9609667 | 
