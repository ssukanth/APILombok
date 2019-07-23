Feature: To validate DCM Replacement API which would be used from Test harness

@regPostDCMReplacement
  Scenario Outline: Vehicle ADF via POST request with "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/dcm"
      And Tester uses the following details in JSON: vin "<vin>" AND hardwareType "<hardwareType>" AND imei "<imei>"
  
     When Tester wants to replace DCM with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                         | Status | Response  | X-CHANNEL | X-CORRELATIONID                      | vin                | hardwareType | imei             | 
      | All positive Data               | 200    | CVS-0000  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2T3ZK33V59W002314  | 0            | 504983877041002  | 
      | All positive Data               | 200    | CVS-0000  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JTDBE40E090014944  | 1            | 101849519929986  | 
      | All positive Data               | 200    | CVS-0000  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4VD12F7S0004504  | 2            | 103508321754820  | 
      | All positive Data               | 200    | CVS-0000  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 1NXBR32E25Z409847  | 4            | 353122747149990  | 
      | All positive Data               | 200    | CVS-0000  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1BE32K1TU202414  | 6            | 332843589879701  | 
      | All positive Data               | 200    | CVS-0000  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JTEJU9FJ6EK067027  | 7            | 980614246760294  | 
      | All positive Data               | 200    | CVS-0000  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1BF28K91LL96885  | 8            | 012411123159761  | 
      | All positive Data               | 200    | CVS-0000  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JTDKB204167518510  | 9            | 512902127797981  | 
      | missing X-Channel               | 400    | CVS-0017  |           | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | missing X-API-KEY               | 400    | CVS-0010  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | missing X-CORRELATIONID         | 400    | CVS-0008  | EIG       |                                      | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | invalid X-Channel               | 400    | CVS-0016  | XEVO      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | invalid X-API-KEY               | 401    | CVS-0007  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | invalid vin                     | 400    | CVS-0001  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU1140    | 1            | 999999999900224  | 
      | invalid vin more character      | 400    | CVS-0001  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M51007201 | 1            | 999999999900224  | 
      | invalid vin invalid character   | 400    | CVS-0001  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5_00720  | 1            | 999999999900224  | 
      | missing vin                     | 400    | CVS-0011  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |                    | 1            | 999999999900224  | 
      | invalid IMEI                    | 400    | CVS-0009  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 9999999999002AB  | 
      | invalid IMEI less char          | 400    | CVS-0009  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 9999999999002    | 
      | invalid IMEI more char          | 400    | CVS-0009  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 9999999999002244 | 
      | missing IMEI                    | 400    | CVS-0018  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            |                  | 
      | invalid hardware type           | 400    | CVS-0034  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | !            | 999999999900224  | 
      | invalid hardware type           | 400    | CVS-0034  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 3            | 999999999900224  |
      | invalid hardware type           | 400    | CVS-0034  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 5            | 999999999900224  | 
      | invalid hardware type more char | 400    | CVS-0034  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 010          | 999999999900224  | 
      | missing hardwareType            | 400    | CVS-0027  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  |              | 999999999900224  | 
      
      
@smokePostDCMReplacement
  Scenario Outline: Vehicle ADF via POST request with "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/dcm"
      And Tester uses the following details in JSON: vin "<vin>" AND hardwareType "<hardwareType>" AND imei "<imei>"
  
     When Tester wants to replace DCM with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                         | Status | Response  | X-CHANNEL | X-CORRELATIONID                      | vin                | hardwareType | imei             | 
      | All positive Data               | 200    | CVS-0000  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 2T3ZK33V59W002314  | 0            | 504983877041002  | 
      | missing X-Channel               | 400    | CVS-0017  |           | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | missing X-API-KEY               | 400    | CVS-0010  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | missing X-CORRELATIONID         | 400    | CVS-0008  | EIG       |                                      | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | invalid X-Channel               | 400    | CVS-0016  | XEVO      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | invalid X-API-KEY               | 401    | CVS-0007  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 999999999900224  | 
      | invalid vin                     | 400    | CVS-0001  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU1140    | 1            | 999999999900224  | 
      | missing vin                     | 400    | CVS-0011  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |                    | 1            | 999999999900224  | 
      | invalid IMEI                    | 400    | CVS-0009  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            | 9999999999002AB  | 
      | missing IMEI                    | 400    | CVS-0018  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 1            |                  | 
      | invalid hardware type           | 400    | CVS-0034  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | !            | 999999999900224  | 
      | missing hardwareType            | 400    | CVS-0027  | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  |              | 999999999900224  | 