Feature: To validate vehicle capability API which would be used from Test harness

@regGetVehiCap
  Scenario Outline: Get vehicle capabilities based on VIN "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/capabilities/<vin>"
  
     When Tester wants to get vehicle capabilities with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                 | vin               | Status | Response | X-CHANNEL | X-CORRELATIONID                      | 
      | All positive Data TEST  | 2T2ZK1BA3AC010702 | 200    | CVS-0000 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | All positive Data ADMIN | 1D3MU36C7356BR3RA | 200    | CVS-0000 | ADMIN     | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | All positive Data TCI   | WBAAB5408G9609667 | 200    | CVS-0000 | TCI       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | All positive Data SERVCO| 4T1B21FB4KU002312 | 200    | CVS-0000 | SERVCO    | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | All positive Data TSP   | 4T1B11HK0JU001169 | 200    | CVS-0000 | TSP       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | All positive Data CTP   | JT1BD40KXD3206028 | 200    | CVS-0000 | CTP       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | invalid X-API-KEY       | 2TXBD40K9GC209474 | 401    | CVS-0007 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Non CVS VIN             | 4T1B10HKXJU001857 | 404    | CVS-0002 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | invalid VIN             | 4T1B10HKXJU00185  | 400    | CVS-0001 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | invalid VIN             | 4T1B10HKXJU0018578| 400    | CVS-0001 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | invalid VIN             | 4T1B10HKXJU0018_5 | 400    | CVS-0001 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Missing X-CORRELATIONID | 1GB3G4CG8B1101197 | 400    | CVS-0008 | TEST      |                                      |
      | Missing X-API-KEY       | 1GB3G4CG8B1101197 | 400    | CVS-0010 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
     #| With Missing VIN        |                   | 500    | CVS-0030 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Invalid CORRELATIONID   | 1GB3G4CG8B1101197 | 400    | CVS-0013 | TEST      | 1d8be88b-bdc1-4750-842d-d59859c19    |
      | Invalid X-CHANNEL       | 1GB3G4CG8B1101197 | 400    | CVS-0016 | DEV       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Missing X-Channel       | 1GB3G4CG8B1101197 | 400    | CVS-0017 |           | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Invalid VIN Country     | 2T2ZK1BA3AC010702 | 401    | CVS-0037 | TCI       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      
@smokeGetVehiCap
  Scenario Outline: Get vehicle capabilities based on VIN "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/capabilities/<vin>"
  
     When Tester wants to get vehicle capabilities with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                 | vin               | Status | Response | X-CHANNEL | X-CORRELATIONID                      | 
      | All positive Data TEST  | 2T2ZK1BA3AC010702 | 200    | CVS-0000 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | invalid X-API-KEY       | 1GB3G4CG8B1101197 | 401    | CVS-0007 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Non CVS VIN             | 4T1B10HKXJU001857 | 404    | CVS-0002 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | invalid VIN             | 4T1B10HKXJU00185  | 400    | CVS-0001 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Missing X-CORRELATIONID | 1GB3G4CG8B1101197 | 400    | CVS-0008 | TEST      |                                      |
      | Missing X-API-KEY       | 1GB3G4CG8B1101197 | 400    | CVS-0010 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
     #| With Missing VIN        |                   | 500    | CVS-0030 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Invalid CORRELATIONID   | 1GB3G4CG8B1101197 | 400    | CVS-0013 | TEST      | 1d8be88b-bdc1-4750-842d-d59859c19    |
      | Invalid X-CHANNEL       | 1GB3G4CG8B1101197 | 400    | CVS-0016 | DEV       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Missing X-Channel       | 1GB3G4CG8B1101197 | 400    | CVS-0017 |           | 1d8be88b-bdc1-4750-842d-d598592fdc19 |
      | Invalid VIN Country     | 2T2ZK1BA3AC010702 | 401    | CVS-0037 | TCI       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |      
