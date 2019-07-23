Feature: Get vehicle history API which would be used from Test harness

@regGetVehiDetailHist
  Scenario Outline: Get vehicle detail history based on VIN or IMEI "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/history/<VIN>"
  
     When Tester wants to get vehicles with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                            | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN                | 
      | All positive scenario TEST         | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1HTSLAAM4YH207014  | 
      | All positive scenario ADMIN        | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ADMIN     | 1HTSLAAM4YH207014  | 
      | Missing X-CORRELATIONID            | 400    | CVS-0008 |                                      | TEST      | 1HTSLAAM4YH207014  | 
      | Invalid CORRELATIONID              | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TEST      | 1HTSLAAM4YH207014  | 
      | Missing X-CHANNEL                  | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 1HTSLAAM4YH207014  | 
      | Invalid X-CHANNEL                  | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | 1HTSLAAM4YH207014  | 
      | Invalid X-CHANNEL random           | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | ZZZ       | 1HTSLAAM4YH207014  | 
      | Missing X-API-KEY                  | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1HTSLAAM4YH207014  | 
      | invalid X-API-KEY                  | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1HTSLAAM4YH207014  | 
      | Vehicle not found                  | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001149  | 
      | Invalid VIN less char              | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU00114   | 
      | Invalid VIN more char              | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU0011490 | 
      | Invalid VIN invalid char           | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU0011_4  | 
     #| Vehicle not ready for subscription | 400    | CVS-0039 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | 4T1B11HK9JU001148  | 


      
@smokeGetVehiDetailHist
  Scenario Outline: Get vehicle detail history based on VIN or IMEI "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/history/<VIN>"
  
     When Tester wants to get vehicles with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                            | Status | Response | X-CORRELATIONID                      | X-CHANNEL | VIN                | 
      | All positive scenario TEST         | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1HTSLAAM4YH207014  | 
      | Missing X-CORRELATIONID            | 400    | CVS-0008 |                                      | TEST      | 1HTSLAAM4YH207014  | 
      | Invalid CORRELATIONID              | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | TEST      | 1HTSLAAM4YH207014  | 
      | Missing X-CHANNEL                  | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |           | 1HTSLAAM4YH207014  | 
      | Invalid X-CHANNEL                  | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | NVS       | 1HTSLAAM4YH207014  |
      | Missing X-API-KEY                  | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1HTSLAAM4YH207014  | 
      | invalid X-API-KEY                  | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 1HTSLAAM4YH207014  | 
      | Vehicle not found                  | 404    | CVS-0002 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU001149  | 
      | Invalid VIN                        | 400    | CVS-0001 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | TEST      | 4T1B11HK9JU00114   |
     #| Vehicle not ready for subscription | 400    | CVS-0039 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | CTP       | 4T1B11HK9JU001148  | 
