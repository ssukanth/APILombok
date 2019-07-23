@GetVehicleAssociation_Regression


Feature: Testing Vehicle_Association_GetVinListAPI service to retrive status of vehicle association details
  User should be able to submit Vehicle_Association_GetVinListAPI service to retrive status of vehicle association details

  @Sub_Smoke @GetVehicleAssociation_Smoke
  Scenario Outline: Verify vehicle-association-postAPI with valid input data <Message>
    Given Tester calls the vehicle-association POST api with basePath
    When The user inputs vehicle-association-postAPI ContentType "<contentType>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    When Tester post the vehicle-association-postAPI service with json body having guid "<guid>" vin "<vin>"  generation "<generation>" region "<region>" brand "<brand>" preferredDealerCode "<preferredDealerCode>" role "<role>" nickName "<nickName>" timeZone "<timeZone>" status "<status>" createDate "<createDate>" createSource "<createSource>"
    Then vehicle-association-postAPI  server returns the "<Status>" status code
    And The vehicle-association-postAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                          | Status | responseCode | description                    | contentType      | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding | vin               | guid                             | region | generation | brand | preferredDealerCode | role               | nickName | timeZone | status   | createDate                   | createSource |
      | CreateVehicleAssociation_Smoke_1 | 200    | VAS-0000     | Request processed successfully | application/json | US_SELF   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1FUJACAS71LG90765 | 3d43b77a30a8454bb1f9f0bb78047f20 | US     | PRE17CY    | T     | 1234                | Primary Subscriber | Test1    |          | ACTIVE   | 2018-03-12T21:44:34.117+0700 | US_SELF      |
      | CreateVehicleAssociation_Smoke_2 | 200    | VAS-0000     | Request processed successfully | application/json | US_DEALER | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 2G2WC55C408294078 | 3d43b77a30a8454bb1f9f0bb78047f45 | CA     | 17CY       | L     | 5678                | Driver             | Test2    |          | INACTIVE | 2018-03-12T21:44:34.117+0701 | LER          |

  @Sub_Smoke @GetVehicleAssociation_Smoke
  Scenario Outline: Verify Get Vin List service with valid input data <Message>
    Given Tester calls the Vehicle Association Get VinList api with basePath
    When The user inputs VehicleAssociation_GETAPI headers GUID "<guid>" ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    Then the VehicleAssociation_GETAPI server returns  "<Status>" status code
    And The VehicleAssociation_GETAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                       | Status | responseCode | description                    | ContentType      | guid                             | XBRAND | XCHANNEL  | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |
      | GetVehicleAssociation_Smoke_1 | 200    | VAS-0000     | Request processed successfully | application/json | 3d43b77a30a8454bb1f9f0bb78047f20 | T      | US_SELF   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_Smoke_2 | 200    | VAS-0000     | Request processed successfully | application/json | 3d43b77a30a8454bb1f9f0bb78047f45 | L      | US_DEALER | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |

#  @CreateVehicleAssociation_Create

  @CreateVehicleAssociation_forGetVehicleAssociation
  Scenario Outline: Verify vehicle-association-postAPI with valid input data <Message>
    Given Tester calls the vehicle-association POST api with basePath
    When The user inputs vehicle-association-postAPI ContentType "<contentType>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" Accept-Encoding "<AcceptEncoding>"
    When Tester post the vehicle-association-postAPI service with json body having guid "<guid>" vin "<vin>"  generation "<generation>" region "<region>" brand "<brand>" preferredDealerCode "<preferredDealerCode>" role "<role>" nickName "<nickName>" timeZone "<timeZone>" status "<status>" createDate "<createDate>" createSource "<createSource>"
    Then vehicle-association-postAPI  server returns the "<Status>" status code
    And The vehicle-association-postAPI body response should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                     | Status | responseCode | description                    | contentType      | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding | vin               | guid                             | region | generation | brand | preferredDealerCode | role               | nickName | timeZone | status   | createDate                   | createSource |
      | CreateVehicleAssociation_1  | 200    | VAS-0000     | Request processed successfully | application/json | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215101 | 3d43b77a30a8454bb1f9f0bb78047f20 | US     | PRE17CY    | T     | 1234                | Primary Subscriber | Test1    |          | ACTIVE   | 2018-03-12T21:44:34.117+0700 | US_SELF      |
      | CreateVehicleAssociation_2  | 200    | VAS-0000     | Request processed successfully | application/json | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215102 | 3d43b77a30a8454bb1f9f0bb78047f20 | CA     | 17CY       | L     | 5678                | Driver             | Test2    |          | INACTIVE | 2018-03-12T21:44:34.117+0701 | LER          |
      | CreateVehicleAssociation_3  | 200    | VAS-0000     | Request processed successfully | application/json | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215103 | 3d43b77a30a8454bb1f9f0bb78047f20 | TDPR   | 17CYPLUS   | T     | 5678                | Remote User        | 1234     |          | ACTIVE   | 2018-03-12T21:44:34.117+0702 | TRC          |
      | CreateVehicleAssociation_4  | 200    | VAS-0000     | Request processed successfully | application/json | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215104 | 3d43b77a30a8454bb1f9f0bb78047f20 | HI     | PRE17CY    | L     | 1234                | Owner              |          |          | INACTIVE | 2018-03-12T21:44:34.117+0703 | US_DEALER    |
      | CreateVehicleAssociation_5  | 200    | VAS-0000     | Request processed successfully | application/json | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215105 | ffb6e4ee367c48d995593776732e3f01 | US     | 17CY       | T     | 1234                | Owner              | ^&&      |          | ACTIVE   | 2018-03-12T21:44:34.117+0704 | TMNA_AGENT   |
      | CreateVehicleAssociation_6  | 200    | VAS-0000     | Request processed successfully | application/json | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215106 | e966d70d27714ac193830e472f5e7302 | CA     | 17CYPLUS   | T     |                     | Driver             |          |          | ACTIVE   | 2018-06-19T08:18:51.100-0700 | TC_AGENT     |
      | CreateVehicleAssociation_7  | 200    | VAS-0000     | Request processed successfully | application/json | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215107 | 18f88483fdd048b89cbcd8a424d5301f | TDPR   | PRE17CY    | T     | 1234                | Primary Subscriber |          |          | INACTIVE | 2018-06-19T08:18:51.100-0700 | CA_SELF      |
      | CreateVehicleAssociation_8  | 200    | VAS-0000     | Request processed successfully | application/json | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215108 | 4b0a5ad9e54b47eda889b0e2ff81418b | HI     | 17CY       | T     | 5678                | Owner              |          |          | ACTIVE   | 2018-06-19T08:18:51.100-0700 | CA_DEALER    |
      | CreateVehicleAssociation_9  | 200    | VAS-0000     | Request processed successfully | application/json | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215109 | c3ed05b513bb4258ae0ac494d1609d39 | US     | 17CYPLUS   | L     | $%^&&*((%$$#123     | Owner              |          |          | ACTIVE   | 2018-06-19T08:18:51.100-0700 | US_SELF      |
      | CreateVehicleAssociation_10 | 200    | VAS-0000     | Request processed successfully | application/json | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215110 | ab4e666be761440fa25d62030d04b912 | CA     | PRE17CY    | T     | 2345                | Driver             |          |          | INACTIVE | 2018-06-19T08:18:51.100-0700 | LER          |
      | CreateVehicleAssociation_11 | 200    | VAS-0000     | Request processed successfully | application/json | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215111 | bfb3835b02644857848a326516e3477y | TDPR   | 17CY       | T     | 1234                | Remote User        |          |          | ACTIVE   | 2018-06-19T08:18:51.100-0700 | TRC          |
      | CreateVehicleAssociation_12 | 200    | VAS-0000     | Request processed successfully | application/json | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215112 | d7e9c002c671415783c48b997fa868we | HI     | 17CYPLUS   | L     | ABCD                | Remote User        |          |          | ACTIVE   | 2018-06-19T08:18:51.100-0700 | US_DEALER    |
      | CreateVehicleAssociation_13 | 200    | VAS-0000     | Request processed successfully | application/json | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215113 | b5fc510f74af4eb28b3e49050a26235t | US     | PRE17CY    | L     | 1234                | Driver             |          |          | INACTIVE | 2018-06-19T08:18:51.100-0700 | TMNA_AGENT   |
      | CreateVehicleAssociation_14 | 200    | VAS-0000     | Request processed successfully | application/json | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215114 | cd5d26194a354f12bc7136f1c54934df | CA     | 17CY       | L     | 2345                | Primary Subscriber |          |          | INACTIVE | 2018-06-19T08:18:51.100-0700 | TC_AGENT     |
      | CreateVehicleAssociation_15 | 200    | VAS-0000     | Request processed successfully | application/json | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215115 | 1018c9641c1=469f8c38/701         | TDPR   | 17CYPLUS   | L     | 12345               | Owner              |          |          | ACTIVE   | 2018-06-19T08:18:51.100-0700 | CA_SELF      |
      | CreateVehicleAssociation_16 | 200    | VAS-0000     | Request processed successfully | application/json | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        | 1HTSBZRK8LH215116 | 6554782901+7450ab3f223fg         | HI     | PRE17CY    | L     |                     | Remote User        |          |          | ACTIVE   | 2018-06-19T08:18:51.100-0700 | CA_DEALER    |



  #200
  @GetVehicleAssociation_PositiveTest
  Scenario Outline: Verify Get Vin List service with valid input data <Message>
    Given Tester calls the Vehicle Association Get VinList api with basePath
    When The user inputs VehicleAssociation_GETAPI headers GUID "<guid>" ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    Then the VehicleAssociation_GETAPI server returns  "<Status>" status code
    And The VehicleAssociation_GETAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                  | Status | responseCode | description                    | ContentType      | guid                             | XBRAND | XCHANNEL   | XCORRELATIONID  | Authorization                 | DATETIME      | AcceptEncoding |
      | GetVehicleAssociation_1  | 200    | VAS-0000     | Request processed successfully | application/json | 3d43b77a30a8454bb1f9f0bb78047f20 | T      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_2  | 200    | VAS-0000     | Request processed successfully | application/json | 3d43b77a30a8454bb1f9f0bb78047f20 | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_3  | 200    | VAS-0000     | Request processed successfully | application/json | ffb6e4ee367c48d995593776732e3f01 | T      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_4  | 200    | VAS-0000     | Request processed successfully | application/json | d2afe4a9649a4b52bfb41f51389b220d | L      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_5  | 200    | VAS-0000     | Request processed successfully | application/json | c3ed05b513bb4258ae0ac494d1609d39 | L      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_6  | 200    | VAS-0000     | Request processed successfully | application/json | bcfef046b10c46ed8aac059fd7fa387e | T      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_7  | 200    | VAS-0000     | Request processed successfully | application/json | 18f88483fdd048b89cbcd8a424d5301f | T      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_8  | 200    | VAS-0000     | Request processed successfully | application/json | c3ed05b513bb4258ae0ac494d1609d39 | L      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_9  | 200    | VAS-0000     | Request processed successfully | application/json | 44fea98f90b542bba83b436097a156f4 | L      | US_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_10 | 200    | VAS-0000     | Request processed successfully | application/json | cd5d26194a354f12bc7136f1c54934df | L      | US_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_11 | 200    | VAS-0000     | Request processed successfully | application/json | 1018c9641c1=469f8c38/701         | L      | TMNA_AGENT | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GetVehicleAssociation_12 | 200    | VAS-0000     | Request processed successfully | application/json | 6554782901+7450ab3f223fg         | L      | TC_AGENT   | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GUID not found_1         | 404    | VAS-0012     | GUID Not Found                 | application/json | 0cc435361a184c45ae9abebb6bb1e7d7 | L      | CA_SELF    | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GUID not found_2         | 404    | VAS-0012     | GUID Not Found                 | application/json | 4da2e126e2c043ec917ffccfaca93f84 | T      | CA_DEALER  | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GUID not found_3         | 404    | VAS-0012     | GUID Not Found                 | application/json | c428d393845f4f2d91d419f96f82fcfc | L      | LER        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | GUID not found_4         | 404    | VAS-0012     | GUID Not Found                 | application/json | a70091ff79cf4453aefe5d274649ea3c | T      | TRC        | sendThroughCode | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |


  #400		Bad Request - request header/body is incorrect or missing mandatory attributes/values. Response codes:- VAS-0001: Mandatory Header Attribute(s) Missing, VAS-0002: Incorrect/Invalid Header Values
  @GetVehicleAssociation_NegativeTest
  Scenario Outline: Verify Get product service with invalid input data as Mandatory Header Attribute(s) Missing <Message>

    Given Tester calls the Vehicle Association Get VinList api with basePath
    When The user inputs VehicleAssociation_GETAPI headers GUID "<guid>" ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    Then the VehicleAssociation_GETAPI server returns  "<Status>" status code
    And The VehicleAssociation_GETAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"

    Examples:

      | Message                        | Status | responseCode | description                           | ContentType      | guid                             | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME      | AcceptEncoding |
      | Header_Missing GUID            | 400    | VAS-0001     | Mandatory Header Attribute(s) Missing | application/json |                                  | T      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-BRAND         | 400    | VAS-0001     | Mandatory Header Attribute(s) Missing | application/json | 44fea98f90b542bba83b436097a156f4 |        | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-CHANNEL       | 400    | VAS-0001     | Mandatory Header Attribute(s) Missing | application/json | 44fea98f90b542bba83b436097a156f4 | L      |            | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing X-CORRELATIONID | 400    | VAS-0001     | Mandatory Header Attribute(s) Missing | application/json | 44fea98f90b542bba83b436097a156f4 | T      | US_DEALER  |                                      | 8923gf7126h44b14d3df08dd9f87a | 1511796583386 | deflate        |
      | Header_Missing Authorization   | 400    | VAS-0001     | Mandatory Header Attribute(s) Missing | application/json | 44fea98f90b542bba83b436097a156f4 | T      | TMNA_AGENT | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 |                               | 1511796583386 | deflate        |
      | Header_Missing DATETIME        | 400    | VAS-0001     | Mandatory Header Attribute(s) Missing | application/json | 44fea98f90b542bba83b436097a156f4 | L      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a |               | deflate        |




  #400		Bad Request - request header/body is incorrect or missing mandatory attributes/values. Response codes:- VAS-0001: Mandatory Header Attribute(s) Missing, VAS-0002: Incorrect/Invalid Header Values
  @GetVehicleAssociation_NegativeTest
  Scenario Outline: Verify Get product service with invalid input data as Incorrect/Invalid Header Values <Message>

    Given Tester calls the Vehicle Association Get VinList api with basePath
    When The user inputs VehicleAssociation_GETAPI headers GUID "<guid>" ContentType "<ContentType>" XBRAND "<XBRAND>" XCHANNEL "<XCHANNEL>" XCORRELATIONID "<XCORRELATIONID>" Authorization "<Authorization>" DATETIME "<DATETIME>" AcceptEncoding "<AcceptEncoding>"
    Then the VehicleAssociation_GETAPI server returns  "<Status>" status code
    And The VehicleAssociation_GETAPI body response content should have the ResponseCode "<responseCode>" and Description "<description>"


    Examples:
      | Message                             | Status | responseCode | description                     | ContentType      | guid                             | XBRAND | XCHANNEL   | XCORRELATIONID                       | Authorization                 | DATETIME                     | AcceptEncoding |
      | Incorrect/Invalid GUID_1            | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | ABCDEFGHIJ                       | L      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid GUID_2            | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 1234567891011                    | T      | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid GUID_3            | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | %^*                              | L      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-BRAND_1         | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | O      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-BRAND_2         | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | 123    | US_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-BRAND_3         | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | %^*    | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CHANNEL_1       | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | T      | tmna_agent | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CHANNEL_2       | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | T      | TMN_123    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CHANNEL_3       | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | T      | CA_6*(     | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CORRELATIONID_1 | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | L      | US_SELF    | 127b2e65e4af4793a126bb9d?            | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CORRELATIONID_2 | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | T      | US_DEALER  | 127b2e65e4af4$%^3d8ed3d326bb9ded     | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid X-CORRELATIONID_3 | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | L      | TMNA_AGENT | 127b2e65e4af4793aqasedTY             | 8923gf7126h44b14d3df08dd9f87a | 1511796583386                | deflate        |
      | Incorrect/Invalid Authorization_1   | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | T      | TC_AGENT   | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08        | 1511796583386                | deflate        |
      | Incorrect/Invalid Authorization_2   | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | T      | CA_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | %^8                           | 1511796583386                | deflate        |
      | Incorrect/Invalid Authorization_3   | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | T      | CA_DEALER  | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 1234tf6759853786908agrt       | 1511796583386                | deflate        |
      | Incorrect/Invalid DATETIME_1        | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | T      | LER        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 5/30/2018                    | deflate        |
      | Incorrect/Invalid DATETIME_2        | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | L      | TRC        | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-03-12T21:44:34.117+0702 | deflate        |
      | Incorrect/Invalid DATETIME_3        | 400    | VAS-0002     | Incorrect/Invalid Header Values | application/json | 44fea98f90b542bba83b436097a156f4 | T      | US_SELF    | c52fdc72-8a0e-4600-92b0-ee9f6d866b22 | 8923gf7126h44b14d3df08dd9f87a | 2018-32-13                   | deflate        |
