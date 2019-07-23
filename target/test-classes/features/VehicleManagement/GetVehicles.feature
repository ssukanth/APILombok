Feature: Get vehicles API which would be used from Test harness

@regGetVehiDetails
  Scenario Outline: Get vehicle details based on timestamp "<Message>"
    Given Tester calls the basepath at "/v1/vehicles"
  
     When Tester wants to get vehicles with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>" AND importStartTimestamp "<import-Start-Timestamp>" AND importEndtTimestamp "<import-End-Timestamp>"  
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                  | Status | Response | X-CHANNEL | X-CORRELATIONID                      | import-Start-Timestamp   | import-End-Timestamp     | 
      | All positive scenario    | 200    | CVS-0000 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-07-19T20:08:59.683Z | 2018-07-20T20:08:59.683Z | 
     #| Without end timestamp    | 200    | CVS-0000 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-11-05T21:32:53.782Z |                          | 
      | All positive scenario    | 200    | CVS-0000 | ADMIN     | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-07-19T20:08:59.683Z | 2018-07-20T20:08:59.683Z | 
     #| Without end timestamp    | 200    | CVS-0000 | ADMIN     | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-11-05T21:32:53.782Z |                          | 
      | Missing start timestamp  | 400    | CVS-0023 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |                          | 2018-05-11T17:14:15Z     | 
      | Missing X-CORRELATIONID  | 400    | CVS-0008 | TEST      |                                      | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid CORRELATIONID    | 400    | CVS-0013 | TEST      | 1d8be88b-bdc1-4750-842d-d59859c19    | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Missing X-CHANNEL        | 400    | CVS-0017 |           | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid X-CHANNEL        | 400    | CVS-0016 | TCI       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Missing X-API-KEY        | 400    | CVS-0010 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | invalid X-API-KEY        | 401    | CVS-0007 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Vehicle not found        | 404    | CVS-0002 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2019-05-01T13:14:15Z     | 2019-05-11T17:14:15Z     | 
      | Invalid Start Time Stamp | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-0113:14:15       | 2018-05-11T17:14:15Z     | 
      | Invalid End Time Stamp   | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-1117:14:15       | 
      | Invalid StartTS Month    | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-13-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Month      | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-13-11T17:14:15Z     | 
      | Invalid StartTS Date     | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-35T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Date       | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-35T17:14:15Z     | 
      | Invalid StartTS Hour     | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T25:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Hour       | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T25:14:15Z     | 
      | Invalid StartTS Minute   | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:65:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Minute     | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:65:15Z     | 
      | Invalid StartTS Sec      | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:65Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Sec        | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:65Z     | 
  
  @smokeGetVehiDetails
  Scenario Outline: Get vehicle details based on timestamp "<Message>"
    Given Tester calls the basepath at "/v1/vehicles"
  
     When Tester wants to get vehicles with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>" AND importStartTimestamp "<import-Start-Timestamp>" AND importEndtTimestamp "<import-End-Timestamp>"  
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                  | Status | Response | X-CHANNEL | X-CORRELATIONID                      | import-Start-Timestamp   | import-End-Timestamp     | 
      | All positive scenario    | 200    | CVS-0000 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-07-19T20:08:59.683Z | 2018-07-20T20:08:59.683Z | 
     #| Without end timestamp    | 200    | CVS-0000 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-11-05T21:32:53.782Z |                          | 
      | Missing start timestamp  | 400    | CVS-0023 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 |                          | 2018-11-05T21:33:11.412Z | 
      | Missing X-CORRELATIONID  | 400    | CVS-0008 | TEST      |                                      | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid CORRELATIONID    | 400    | CVS-0013 | TEST      | 1d8be88b-bdc1-4750-842d-d59859c19    | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Missing X-CHANNEL        | 400    | CVS-0017 |           | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid X-CHANNEL        | 400    | CVS-0016 | TCI       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Missing X-API-KEY        | 400    | CVS-0010 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | invalid X-API-KEY        | 401    | CVS-0007 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Vehicle not found        | 404    | CVS-0002 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2019-05-01T13:14:15Z     | 2019-05-11T17:14:15Z     | 
      | Invalid Start Time Stamp | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-0113:14:15       | 2018-05-11T17:14:15Z     | 
      | Invalid End Time Stamp   | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-1117:14:15       | 
      | Invalid StartTS Month    | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-13-01T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Month      | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-13-11T17:14:15Z     | 
      | Invalid StartTS Date     | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-35T13:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Date       | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-35T17:14:15Z     | 
      | Invalid StartTS Hour     | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T25:14:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Hour       | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T25:14:15Z     | 
      | Invalid StartTS Minute   | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:65:15Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Minute     | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:65:15Z     | 
      | Invalid StartTS Sec      | 400    | CVS-0011 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:65Z     | 2018-05-11T17:14:15Z     | 
      | Invalid EndTS Sec        | 400    | CVS-0012 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2018-05-01T13:14:15Z     | 2018-05-11T17:14:65Z     | 
  
  
