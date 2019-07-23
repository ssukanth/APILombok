Feature: To validate Post RDR API which would be used from Test harness

  @regGetVehRDRPositive
  Scenario Outline: Vehicle RDR via POST request with "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/rdr"
      And Tester uses the following details in JSON :vin "<vin>" AND msgType"<msgType>" AND code "<code>" AND typeOfSale "<typeOfSale>" AND dateTimeOfSale "<dateTimeOfSale>" AND dateTimeOfSubmission "<dateTimeOfSubmission>" AND dateTimeOfProcessing "<dateTimeOfProcessing>" AND usedVehicleStatus "<usedVehicleStatus>" AND usedCertifiedStatus "<usedCertifiedStatus>" AND ind "<ind>" AND type "<type>" AND customerId "<customerId>" AND title "<title>" AND firstName "<firstName>" AND middleInitial "<middleInitial>" AND lastName "<lastName>" AND suffix "<suffix>" AND areaCode "<areaCode>" AND exchange "<exchange>" AND line "<line>" AND extension "<extension>" AND areaCoden "<areaCoden>"AND exchangen "<exchangen>"AND linen "<linen>" AND extensionn "<extensionn>" AND personalEmail "<personalEmail>" AND typen "<typen>"AND street "<street>"AND ancillary "<ancillary>" AND city "<city>" AND stateOrProvince "<stateOrProvince>"AND postCode "<postCode>" AND country "<country>"

     When Tester wants to post vehicle RDR with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"

     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code

    Examples: 
      | Message           | Status | Response | X-CHANNEL | X-CORRELATIONID                      | vin               | msgType | code  | typeOfSale | dateTimeOfSale | dateTimeOfSubmission | dateTimeOfProcessing | usedVehicleStatus | usedCertifiedStatus | ind | type | customerId | title | firstName | middleInitial | lastName | suffix | areaCode | exchange | line     | extension | areaCoden | exchangen | linen    | extensionn | personalEmail          | typen  | street           | ancillary | city  | stateOrProvince | postCode | country |
      | All positive Data |    201 | CVS-0200 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 |         01 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |
      | All positive Data |    201 | CVS-0200 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 |         01 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     | Y   | S    |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |
      | All positive Data |    201 | CVS-0200 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 |         03 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     | Y   | R    |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |
      | All positive Data |    201 | CVS-0200 | TCI       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | U       | 98554 |         03 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |
      | All positive Data |    201 | CVS-0200 | TCI       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | U       | 98554 |         03 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     | Y   | S    |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |
      | All positive Data |    201 | CVS-0200 | TCI       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | U       | 98554 |         01 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     | Y   | R    |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |
      | All positive Data |    201 | CVS-0200 | SERVCO    | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | S       | 98554 |         04 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     | Y   | R    |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |
      | All positive Data |    201 | CVS-0200 | SERVCO    | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | Y       | 98554 |         05 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     | Y   | R    |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |
      | All positive Data |    201 | CVS-0200 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | Z       | 98554 |         06 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     | Y   | R    |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |
      | All positive Data |    201 | CVS-0200 | TEST      | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | Z       | 98554 |         07 | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     | Y   | R    |        787 | Mr.   | Rupak     |               | Das      |        | +1       |      631 | 552-1559 |           | +1        |       631 | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT#G7207 | Allen | Texas           |    75013 | USA     |

@regGetVehRDRNegative
  Scenario Outline: Vehicle RDR via POST request with "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/rdr"
      And Tester uses the following details in JSON :vin "<vin>" AND msgType"<msgType>" AND code "<code>" AND typeOfSale "<typeOfSale>" AND dateTimeOfSale "<dateTimeOfSale>" AND dateTimeOfSubmission "<dateTimeOfSubmission>" AND dateTimeOfProcessing "<dateTimeOfProcessing>" AND usedVehicleStatus "<usedVehicleStatus>" AND usedCertifiedStatus "<usedCertifiedStatus>" AND ind "<ind>" AND type "<type>" AND customerId "<customerId>" AND title "<title>" AND firstName "<firstName>" AND middleInitial "<middleInitial>" AND lastName "<lastName>" AND suffix "<suffix>" AND areaCode "<areaCode>" AND exchange "<exchange>" AND line "<line>" AND extension "<extension>" AND areaCoden "<areaCoden>"AND exchangen "<exchangen>"AND linen "<linen>" AND extensionn "<extensionn>" AND personalEmail "<personalEmail>" AND typen "<typen>"AND street "<street>"AND ancillary "<ancillary>" AND city "<city>" AND stateOrProvince "<stateOrProvince>"AND postCode "<postCode>" AND country "<country>"
  
     When Tester wants to post vehicle RDR with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                        | Status | Response | X-CHANNEL | X-CORRELATIONID                      | vin                | msgType | code  | typeOfSale | dateTimeOfSale | dateTimeOfSubmission | dateTimeOfProcessing | usedVehicleStatus | usedCertifiedStatus | ind | type | customerId | title | firstName | middleInitial | lastName | suffix | areaCode | exchange | line     | extension | areaCoden | exchangen | linen    | extensionn | personalEmail          | typen  | street           | ancillary | city  | stateOrProvince | postCode | country | 
      | Invalid VIN less char          | 400    | CVS-0001 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU00110   | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid VIN more char          | 400    | CVS-0001 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU0011011 | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing VIN                    | 400    | CVS-0014 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |                    | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing X-CORRELATIONID        | 400    | CVS-0008 | EIG       |                                      | 4T1B11HK9JU001140  | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid X-CORRELATIONID        | 400    | CVS-0013 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fd    | 4T1B11HK9JU001140  | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing X-Channel              | 400    | CVS-0017 |           | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid X-Channel              | 400    | CVS-0016 | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid X-Channel unknown      | 400    | CVS-0016 | XXX       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing X-API-KEY              | 400    | CVS-0010 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid X-API-KEY              | 401    | CVS-0007 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing Dealer Info Code       | 400    | CVS-0062 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       |       | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing Type of Sale           | 400    | CVS-0063 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       | 98554 |            | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing DateTime of Sale       | 400    | CVS-0064 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       | 98554 | 01         |                | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid DateTime of Sale date  | 400    | CVS-0065 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       | 98554 | 01         | 2017-09-32     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid DateTime of Sale month | 400    | CVS-0065 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | R       | 98554 | 01         | 2017-13-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing Message Type           | 400    | CVS-0072 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  |         | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid Message Type           | 400    | CVS-0073 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | A       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid Message Type more char | 400    | CVS-0073 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140  | RU      | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
  
  @smokeGetVehRDR
  Scenario Outline: Vehicle RDR via POST request with "<Message>"
    Given Tester calls the basepath at "/v1/vehicle/rdr"
      And Tester uses the following details in JSON :vin "<vin>" AND msgType"<msgType>" AND code "<code>" AND typeOfSale "<typeOfSale>" AND dateTimeOfSale "<dateTimeOfSale>" AND dateTimeOfSubmission "<dateTimeOfSubmission>" AND dateTimeOfProcessing "<dateTimeOfProcessing>" AND usedVehicleStatus "<usedVehicleStatus>" AND usedCertifiedStatus "<usedCertifiedStatus>" AND ind "<ind>" AND type "<type>" AND customerId "<customerId>" AND title "<title>" AND firstName "<firstName>" AND middleInitial "<middleInitial>" AND lastName "<lastName>" AND suffix "<suffix>" AND areaCode "<areaCode>" AND exchange "<exchange>" AND line "<line>" AND extension "<extension>" AND areaCoden "<areaCoden>"AND exchangen "<exchangen>"AND linen "<linen>" AND extensionn "<extensionn>" AND personalEmail "<personalEmail>" AND typen "<typen>"AND street "<street>"AND ancillary "<ancillary>" AND city "<city>" AND stateOrProvince "<stateOrProvince>"AND postCode "<postCode>" AND country "<country>"
  
     When Tester wants to post vehicle RDR with XCHANNEL "<X-CHANNEL>" AND XCORRELATIONID "<X-CORRELATIONID>" AND Message "<Message>"
  
     Then the server returns "<Status>" status code
     Then the server returns "<Response>" response code
  
    Examples: 
      | Message                        | Status | Response | X-CHANNEL | X-CORRELATIONID                      | vin               | msgType | code  | typeOfSale | dateTimeOfSale | dateTimeOfSubmission | dateTimeOfProcessing | usedVehicleStatus | usedCertifiedStatus | ind | type | customerId | title | firstName | middleInitial | lastName | suffix | areaCode | exchange | line     | extension | areaCoden | exchangen | linen    | extensionn | personalEmail          | typen  | street           | ancillary | city  | stateOrProvince | postCode | country | 
      | All positive Data              | 201    | CVS-0200 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid VIN less char          | 400    | CVS-0001 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU00110  | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing VIN                    | 400    | CVS-0014 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 |                   | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing X-CORRELATIONID        | 400    | CVS-0008 | EIG       |                                      | 4T1B11HK9JU001140 | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid X-CORRELATIONID        | 400    | CVS-0013 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fd    | 4T1B11HK9JU001140 | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing X-Channel              | 400    | CVS-0017 |           | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid X-Channel              | 400    | CVS-0016 | TSC       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing X-API-KEY              | 400    | CVS-0010 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid X-API-KEY              | 401    | CVS-0007 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing Dealer Info Code       | 400    | CVS-0062 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       |       | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing Type of Sale           | 400    | CVS-0063 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 |            | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing DateTime of Sale       | 400    | CVS-0064 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 | 01         |                | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid DateTime of Sale date  | 400    | CVS-0065 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 | 01         | 2017-09-32     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid DateTime of Sale month | 400    | CVS-0065 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | R       | 98554 | 01         | 2017-13-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Missing Message Type           | 400    | CVS-0072 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 |         | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
      | Invalid Message Type           | 400    | CVS-0073 | EIG       | 1d8be88b-bdc1-4750-842d-d598592fdc19 | 4T1B11HK9JU001140 | A       | 98554 | 01         | 2017-09-07     | 2017-09-07           | 2017-09-07           |                   |                     |     |      | 787        | Mr.   | Rupak     |               | Das      |        | +1       | 631      | 552-1559 |           | +1        | 631       | 552-1559 |            | rupakdasatos@gmail.com | Rental | 1300 N Custer RD | APT G7207 | Allen | Texas           | 75013    | USA     | 
  