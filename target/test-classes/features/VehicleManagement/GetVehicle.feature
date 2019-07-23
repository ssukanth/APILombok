Feature: Get vehicles API which would be used from Test harness

@regGetVehiDetail
  Scenario Outline: Get vehicle details based on VIN or IMEI "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/<VIN>"
  
     When Tester wants to get vehicles with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>" AND IMEI "<IMEI>" 
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                            | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN               | IMEI            | 
      | All positive scenario TEST         | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | All positive scenario ADMIN        | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ADMIN     | 1LNHM86S44Y629195 | A10000041021B5  | 
      | All positive scenario NO IMEI      | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ADMIN     | 1LNHM86S44Y629195 |                 | 
      | All positive scenario TSP          | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TSP       | 1LNHM86S44Y629195 | A10000041021B5  | 
      | All positive scenario XEVO         | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | XEVO      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | All positive scenario CTP          | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | 1LNHM86S44Y629195 | A10000041021B5  | 
      | All positive scenario EIG          | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | EIG       | 1LNHM86S44Y629195 | A10000041021B5  | 
      | All positive scenario TCI          | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TCI       | WBAAB5408G9609667 | 357325674600905 | 
      | All positive scenario SERVCO       | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | JT1BD40KXD3206028 | 109000000032508 | 
      | Missing X-CORRELATIONID            | 400    | CVS-0008 |                                      | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | Invalid CORRELATIONID              | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | Missing X-CHANNEL                  | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 1LNHM86S44Y629195 | A10000041021B5  | 
      | Invalid X-CHANNEL                  | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | 1LNHM86S44Y629195 | A10000041021B5  |
      | Invalid X-CHANNEL random           | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ZZZ       | 1LNHM86S44Y629195 | A10000041021B5  |  
      | Missing X-API-KEY                  | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | invalid X-API-KEY                  | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | Vehicle not found                  | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001149 | A10000041021B5  |
      | Vehicle not found                  | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | XEVO      | 4T1B11HK9JU001148 | A10000041021B5  |
     #| Vehicle not found                  | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001148 | A10000041021B5  | 
      | Invalid VIN                        | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU00114  | A10000041021B5  | 
      | Invalid VIN                        | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU0011490| A10000041021B5  |
      | Invalid VIN                        | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU0011@4 |                 |
      | Invalid IMEI 13 char               | 400    | CVS-0009 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1LNHM86S44Y629195 | 9999999999002   |
      | Invalid IMEI 16 char               | 400    | CVS-0009 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1LNHM86S44Y629195 | 9999999999002245|
      | Invalid IMEI                       | 400    | CVS-0009 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1LNHM86S44Y629195 | 99999999990O224 |   
      | Vehicle not ready for subscription | 400    | CVS-0078 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | SAJWJ0EF3E8U27235 | 358942806967148 |
      | invalid VIN Country                | 401    | CVS-0037 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | 1LNHM86S44Y629195 | A10000041021B5  | 

      
@smokeGetVehiDetail
  Scenario Outline: Get vehicle details based on VIN or IMEI "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/<VIN>"
  
     When Tester wants to get vehicles with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>" AND IMEI "<IMEI>" 
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                            | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN               | IMEI            | 
      | All positive scenario              | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | Missing X-CORRELATIONID            | 400    | CVS-0008 |                                      | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | Invalid CORRELATIONID              | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | Missing X-CHANNEL                  | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 1LNHM86S44Y629195 | A10000041021B5  | 
      | Invalid X-CHANNEL                  | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | 1LNHM86S44Y629195 | A10000041021B5  |  
      | Missing X-API-KEY                  | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | invalid X-API-KEY                  | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1LNHM86S44Y629195 | A10000041021B5  | 
      | Vehicle not found                  | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001149 | A10000041021B5  | 
      | Invalid VIN                        | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU0011@4 |                 |
      | Invalid IMEI                       | 400    | CVS-0009 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 2T2ZK1BA3AC010702 | 9999999999002   | 
      | Vehicle not ready for subscription | 400    | CVS-0078 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | SAJWJ0EF3E8U27235 | 358942806967148 |
      | invalid VIN Country                | 401    | CVS-0037 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | SERVCO    | 1LNHM86S44Y629195 | A10000041021B5  | 
