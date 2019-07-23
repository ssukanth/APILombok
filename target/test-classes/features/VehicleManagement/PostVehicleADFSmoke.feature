Feature: To validate create vehicle API which would be used from Test harness

@smokePostVehicleADF
  Scenario Outline: Vehicle ADF via POST request with "<Message>"
    Given Tester calls the basepath at "post/v1/vehicle/adf/<vin>"
      And Tester uses the following details in JSON :dcmModelYear "<dcmModelYear>" AND dcmDestination "<dcmDestination>" AND countryCode "<countryCode>" AND dcmSupplier "<dcmSupplier>" AND dcmGrade "<dcmGrade>" AND euiccid "<euiccid>" AND vehicleUnitTerminalNumber "<vehicleUnitTerminalNumber>" AND hardwareType "<hardwareType>"AND imei "<imei>"AND oldImei "<oldImei>"
  
     When Tester wants to post vehicle adf with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                          | Status | Response  | X-CHANNEL | X-CORRELATIONID                      | vin                | dcmModelYear | dcmDestination | countryCode | dcmSupplier | dcmGrade | euiccid                           | vehicleUnitTerminalNumber | hardwareType | imei             | oldImei         | 
      | TCI positive Data                | 200    | ORCH-5000 | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JTDBE40E090014944  | 19           | 1              | 102         | 65          | 1        | 12345678901234567890123456789012  | abcd                      | 010          | 101849519929986  |                 | 
      | missing X-Channel                | 400    | ORCH-5011 |           | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | missing Authorization            | 400    | ORCH-5013 | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | missing X-CORRELATIONID          | 400    | ORCH-5010 | TSC       |                                      | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid X-Channel                | 400    | ORCH-5022 | XEVO      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid Authorization            | 401    | ORCH-5030 | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid vin                      | 400    | CVS-0001  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU1140    | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid vin more character       | 400    | CVS-0001  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M51007201 | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid vin invalid character    | 400    | CVS-0001  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5_00720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | Invalid DCM Model Year           | 400    | CVS-0028  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 17           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | Invalid DCM Model Year more char | 400    | CVS-0028  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 920          | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | Invalid DCM Model Year less char | 400    | CVS-0028  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 9            | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | DCM Model Year missing           | 400    | CVS-0020  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  |              | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | Invalid DCM Destination          | 400    | CVS-0031  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 200            | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | DCM Destination missing          | 400    | CVS-0022  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           |                | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | Invalid Country Code             | 400    | CVS-0029  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 112         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | Invalid Country Code less char   | 400    | CVS-0029  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 11          | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | Invalid Country Code more char   | 400    | CVS-0029  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 1122        | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | missing Country Code             | 400    | CVS-0021  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              |             | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid DCM Supplier             | 400    | CVS-0030  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 00          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid DCM Supplier less char   | 400    | CVS-0030  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 1           | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid DCM Supplier more char   | 400    | CVS-0030  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 111         | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | missing DCM Supplier             | 400    | CVS-0024  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         |             | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid DCM grade more char      | 400    | CVS-0032  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 20       | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid DCM grade                | 400    | CVS-0032  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 4        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | missing DCM grade                | 400    | CVS-0025  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          |          | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid IMEI                     | 400    | CVS-0009  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 9999999999002AB  | 999999999900272 | 
      | invalid IMEI less char           | 400    | CVS-0009  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 9999999999002    | 999999999900272 | 
      | invalid IMEI more char           | 400    | CVS-0009  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 9999999999002244 | 999999999900272 | 
      | missing IMEI                     | 400    | CVS-0018  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          |                  | 999999999900272 | 
      | invalid eUICCID                  | 400    | CVS-0021  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              |             | 65          | 2        | 123456789012345678901234567890AB  | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid eUICCID more char        | 400    | CVS-0021  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              |             | 65          | 2        | 123456789012345678901234567890123 | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid eUICCID less char        | 400    | CVS-0021  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              |             | 65          | 2        | 123456789012345678901234567890    | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | missing eUICCID                  | 400    | CVS-0026  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        |                                   | abcd                      | 010          | 999999999900224  | 999999999900272 | 
      | invalid hardware type            | 400    | CVS-0034  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | !!!          | 999999999900224  | 999999999900272 | 
      | invalid hardware type less char  | 400    | CVS-0034  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 9            | 999999999900224  | 999999999900272 | 
      | invalid hardware type more char  | 400    | CVS-0034  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 0101         | 999999999900224  | 999999999900272 | 
      | missing hardwareType             | 400    | CVS-0027  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      |              | 999999999900224  | 999999999900272 | 
      | invalid oldIMEI                  | 400    | CVS-0035  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 9999999999002_2 | 
      | invalid oldIMEI less char        | 400    | CVS-0035  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 9999999999ABC   | 
      | invalid oldIMEI more char        | 400    | CVS-0035  | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | JT4RN81A7M5100720  | 19           | 2              | 212         | 65          | 2        | 12345678901234567890123456789012  | abcd                      | 010          | 999999999900224  | 999999999900272A| 
  
  
