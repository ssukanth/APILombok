Feature: Get vehicles Image API which would be used from Test harness

@regGetVehImage
  Scenario Outline: Get Vehicle Image "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/image"
  
     When Tester wants to get Vehicle Image details with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND XAPIKEY "<X-API-KEY>" AND XBRAND "<X-BRAND>" AND MODELYEAR "<MODEL-YEAR>" AND MODELCODE "<MODEL-CODE>" AND COLORCODE "<COLOR-CODE>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                                           | Status | Response | X-CORRELATIONID                      | X-API-KEY                               | X-CHANNEL | X-BRAND | MODEL-YEAR | MODEL-CODE | COLOR-CODE | 
      | All positive scenario TCI                         | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | All positive scenario NVS                         | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | NVS       | TOY     | 2017       | 900M       | 08X5       | 
      | All positive scenario TEST                        | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TEST      | LEX     | 2017       | 900M       | 08X5       | 
      | All positive scenario ADMIN                       | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | ADMIN     | LEX     | 2019       | 900M       | 08X5       | 
      | All positive scenario ONEAPP                      | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | ONEAPP    |         | 2019       | 900M       | 08X5       | 
      | Missing X-CORRELATIONID                           | 400    | CVS-0008 |                                      | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | Invalid CORRELATIONID                             | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | Missing X-CHANNEL                                 | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 |           | TOY     | 2017       | 900M       | 08X5       | 
      | Invalid X-CHANNEL                                 | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TSP       | TOY     | 2017       | 900M       | 08X5       | 
      | Invalid X-CHANNEL SERVCO                          | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | SERVCO    | TOY     | 2017       | 900M       | 08X5       | 
      | Invalid X-CHANNEL TSC                             | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TSC       | TOY     | 2017       | 900M       | 08X5       | 
      | Missing X-API-KEY                                 | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |                                         | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | invalid X-API-KEY                                 | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-                         | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | ModelYear ModelCode and ColorCode cannot be empty | 400    | CVS-0006 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     |            |            |            | 
      | Missing Color Code                                | 400    | CVS-0039 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       | 900M       |            | 
      | Missing Model Year                                | 400    | CVS-0045 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     |            | 900M       | 08X5       | 
      | Missing Model Code                                | 400    | CVS-0047 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       |            | 08X5       | 
  
  
@smokeGetVehImage
  Scenario Outline: Get Vehicle Image "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/image"
  
     When Tester wants to get Vehicle Image details with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND XAPIKEY "<X-API-KEY>" AND XBRAND "<X-BRAND>" AND MODELYEAR "<MODEL-YEAR>" AND MODELCODE "<MODEL-CODE>" AND COLORCODE "<COLOR-CODE>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                                           | Status | Response | X-CORRELATIONID                      | X-API-KEY                               | X-CHANNEL | X-BRAND | MODEL-YEAR | MODEL-CODE | COLOR-CODE | 
      | All positive scenario TCI                         | 200    | CVS-0000 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | Missing X-CORRELATIONID                           | 400    | CVS-0008 |                                      | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | Invalid CORRELATIONID                             | 400    | CVS-0013 | 1d8be88b-bdc1-4750-842d-d59859c19    | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | Missing X-CHANNEL                                 | 400    | CVS-0017 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 |           | TOY     | 2017       | 900M       | 08X5       | 
      | Invalid X-CHANNEL                                 | 400    | CVS-0016 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TSP       | TOY     | 2017       | 900M       | 08X5       | 
      | Missing X-API-KEY                                 | 400    | CVS-0010 | 1d8be88b-bdc1-4750-842d-d598592fdc19 |                                         | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | invalid X-API-KEY                                 | 401    | CVS-0007 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-                         | TCI       | TOY     | 2017       | 900M       | 08X5       | 
      | ModelYear ModelCode and ColorCode cannot be empty | 400    | CVS-0006 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     |            |            |            | 
      | Missing Color Code                                | 400    | CVS-0039 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       | 900M       |            | 
      | Missing Model Year                                | 400    | CVS-0045 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     |            | 900M       | 08X5       | 
      | Missing Model Code                                | 400    | CVS-0047 | 1d8be88b-bdc1-4750-842d-d598592fdc19 | AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8 | TCI       | TOY     | 2017       |            | 08X5       | 
