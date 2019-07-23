$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("AccountManagement/AccountCreationByAgent_ORCH_POST.feature");
formatter.feature({
  "line": 2,
  "name": "Testing Create Account by Agent - Orchestration Micro Services",
  "description": "As a tester, I should be able to Create Customer\u0027s Account by Dealer using Account Creation Micro service exposed from the Orchestration layer.\r\ni.e. Identity in Azure and profile in OCPR.",
  "id": "testing-create-account-by-agent---orchestration-micro-services",
  "keyword": "Feature",
  "tags": [
    {
      "line": 1,
      "name": "@AcmOrchPost_Regression"
    },
    {
      "line": 1,
      "name": "@AcCreateByAgent"
    }
  ]
});
formatter.scenarioOutline({
  "line": 7,
  "name": "Create a new Customer\u0027s Account by Agent with Account Creation API exposed from Orchestration layer using valid input parameters (headers + body) and expect status code 201 OK and appropriate response payload \u003cscenarioName\u003e",
  "description": "",
  "id": "testing-create-account-by-agent---orchestration-micro-services;create-a-new-customer\u0027s-account-by-agent-with-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e",
  "type": "scenario_outline",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 6,
      "name": "@AcmOrchPost_smoke"
    },
    {
      "line": 6,
      "name": "@AcCreateByAgent-Smoke"
    }
  ]
});
formatter.step({
  "line": 8,
  "name": "Tester calls the Create Customer Account POST api at \"\u003cbasePath\u003e\"",
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "Tester uses the headers with ContentType \"\u003cContentType\u003e\" XBRAND \"\u003cXBRAND\u003e\" XCHANNEL \"\u003cXCHANNEL\u003e\" XCORRELATIONID \"\u003cXCORRELATIONID\u003e\" Authorization \"\u003cAuthorization\u003e\"",
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "Tester post the service with json body having customerType \"\u003ccustomerType\u003e\" firstName \"\u003cfirstName\u003e\" lastName \"\u003clastName\u003e\" email \"\u003cemail\u003e\" phone \"\u003cphone\u003e\"",
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"\u003cstatusCode\u003e\"",
  "keyword": "Then "
});
formatter.step({
  "line": 12,
  "name": "the server returns ResponseCode \"\u003cresponseCode\u003e\" Description \"\u003cdescription\u003e\"",
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "the response payload must match with the request payload for customerType \"\u003ccustomerType\u003e\" firstName \"\u003cfirstName\u003e\" lastName \"\u003clastName\u003e\" email \"\u003cemail\u003e\" phone \"\u003cphone\u003e\" and GUID is not NULL or Empty",
  "keyword": "And "
});
formatter.examples({
  "line": 15,
  "name": "",
  "description": "",
  "id": "testing-create-account-by-agent---orchestration-micro-services;create-a-new-customer\u0027s-account-by-agent-with-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;",
  "rows": [
    {
      "cells": [
        "scenarioName",
        "basePath",
        "ContentType",
        "XBRAND",
        "XCHANNEL",
        "XCORRELATIONID",
        "Authorization",
        "customerType",
        "firstName",
        "lastName",
        "email",
        "phone",
        "statusCode",
        "responseCode",
        "description"
      ],
      "line": 16,
      "id": "testing-create-account-by-agent---orchestration-micro-services;create-a-new-customer\u0027s-account-by-agent-with-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;1"
    },
    {
      "cells": [
        "with Toyota TMNA_AGENT",
        "/v1/account",
        "application/json",
        "T",
        "TMNA_AGENT",
        "sendThroughCode",
        "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t",
        "PERSON",
        "TFname",
        "TLname",
        "sendThroughCode",
        "sendThroughCode",
        "201",
        "ORCH-0000",
        "Account Created Successfully"
      ],
      "line": 17,
      "id": "testing-create-account-by-agent---orchestration-micro-services;create-a-new-customer\u0027s-account-by-agent-with-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;2"
    },
    {
      "cells": [
        "with Lexus CA_AGENT",
        "/v1/account",
        "application/json",
        "L",
        "CA_AGENT",
        "sendThroughCode",
        "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t",
        "PERSON",
        "TFname",
        "TLname",
        "sendThroughCode",
        "sendThroughCode",
        "201",
        "ORCH-0000",
        "Account Created Successfully"
      ],
      "line": 18,
      "id": "testing-create-account-by-agent---orchestration-micro-services;create-a-new-customer\u0027s-account-by-agent-with-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;3"
    }
  ],
  "keyword": "Examples"
});
formatter.scenario({
  "line": 17,
  "name": "Create a new Customer\u0027s Account by Agent with Account Creation API exposed from Orchestration layer using valid input parameters (headers + body) and expect status code 201 OK and appropriate response payload with Toyota TMNA_AGENT",
  "description": "",
  "id": "testing-create-account-by-agent---orchestration-micro-services;create-a-new-customer\u0027s-account-by-agent-with-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;2",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 6,
      "name": "@AcmOrchPost_smoke"
    },
    {
      "line": 1,
      "name": "@AcmOrchPost_Regression"
    },
    {
      "line": 1,
      "name": "@AcCreateByAgent"
    },
    {
      "line": 6,
      "name": "@AcCreateByAgent-Smoke"
    }
  ]
});
formatter.step({
  "line": 8,
  "name": "Tester calls the Create Customer Account POST api at \"/v1/account\"",
  "matchedColumns": [
    1
  ],
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"T\" XCHANNEL \"TMNA_AGENT\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\"",
  "matchedColumns": [
    2,
    3,
    4,
    5,
    6
  ],
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "Tester post the service with json body having customerType \"PERSON\" firstName \"TFname\" lastName \"TLname\" email \"sendThroughCode\" phone \"sendThroughCode\"",
  "matchedColumns": [
    7,
    8,
    9,
    10,
    11
  ],
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"",
  "matchedColumns": [
    12
  ],
  "keyword": "Then "
});
formatter.step({
  "line": 12,
  "name": "the server returns ResponseCode \"ORCH-0000\" Description \"Account Created Successfully\"",
  "matchedColumns": [
    13,
    14
  ],
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "the response payload must match with the request payload for customerType \"PERSON\" firstName \"TFname\" lastName \"TLname\" email \"sendThroughCode\" phone \"sendThroughCode\" and GUID is not NULL or Empty",
  "matchedColumns": [
    7,
    8,
    9,
    10,
    11
  ],
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "/v1/account",
      "offset": 54
    }
  ],
  "location": "CreateAndActivateCustomerAccount.tester_calls_the_Create_Customer_Account_POST_api_at(String)"
});
formatter.result({
  "duration": 1901793484,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "application/json",
      "offset": 42
    },
    {
      "val": "T",
      "offset": 68
    },
    {
      "val": "TMNA_AGENT",
      "offset": 81
    },
    {
      "val": "sendThroughCode",
      "offset": 109
    },
    {
      "val": "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t",
      "offset": 141
    }
  ],
  "location": "CreateAndActivateCustomerAccount.tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String,String,String,String,String)"
});
formatter.result({
  "duration": 70988759,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "PERSON",
      "offset": 60
    },
    {
      "val": "TFname",
      "offset": 79
    },
    {
      "val": "TLname",
      "offset": 97
    },
    {
      "val": "sendThroughCode",
      "offset": 112
    },
    {
      "val": "sendThroughCode",
      "offset": 136
    }
  ],
  "location": "CreateAndActivateCustomerAccount.tester_post_the_service_with_json_body_having_customerType_firstName_lastName_email_phone(String,String,String,String,String)"
});
formatter.result({
  "duration": 5262179759,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "201",
      "offset": 108
    }
  ],
  "location": "CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(int)"
});
formatter.result({
  "duration": 984740884,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "ORCH-0000",
      "offset": 33
    },
    {
      "val": "Account Created Successfully",
      "offset": 57
    }
  ],
  "location": "CreateAndActivateCustomerAccount.the_server_returns_ResponseCode_Description(String,String)"
});
formatter.result({
  "duration": 1098720152,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "PERSON",
      "offset": 75
    },
    {
      "val": "TFname",
      "offset": 94
    },
    {
      "val": "TLname",
      "offset": 112
    },
    {
      "val": "sendThroughCode",
      "offset": 127
    },
    {
      "val": "sendThroughCode",
      "offset": 151
    }
  ],
  "location": "CreateAndActivateCustomerAccount.the_response_payload_must_match_with_the_request_payload_for_customerType_firstName_lastName_email_and_GUID_is_not_NULL_or_Empty(String,String,String,String,String)"
});
formatter.result({
  "duration": 315251083,
  "status": "passed"
});
formatter.scenario({
  "line": 18,
  "name": "Create a new Customer\u0027s Account by Agent with Account Creation API exposed from Orchestration layer using valid input parameters (headers + body) and expect status code 201 OK and appropriate response payload with Lexus CA_AGENT",
  "description": "",
  "id": "testing-create-account-by-agent---orchestration-micro-services;create-a-new-customer\u0027s-account-by-agent-with-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;3",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 6,
      "name": "@AcmOrchPost_smoke"
    },
    {
      "line": 1,
      "name": "@AcmOrchPost_Regression"
    },
    {
      "line": 1,
      "name": "@AcCreateByAgent"
    },
    {
      "line": 6,
      "name": "@AcCreateByAgent-Smoke"
    }
  ]
});
formatter.step({
  "line": 8,
  "name": "Tester calls the Create Customer Account POST api at \"/v1/account\"",
  "matchedColumns": [
    1
  ],
  "keyword": "Given "
});
formatter.step({
  "line": 9,
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"L\" XCHANNEL \"CA_AGENT\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\"",
  "matchedColumns": [
    2,
    3,
    4,
    5,
    6
  ],
  "keyword": "And "
});
formatter.step({
  "line": 10,
  "name": "Tester post the service with json body having customerType \"PERSON\" firstName \"TFname\" lastName \"TLname\" email \"sendThroughCode\" phone \"sendThroughCode\"",
  "matchedColumns": [
    7,
    8,
    9,
    10,
    11
  ],
  "keyword": "When "
});
formatter.step({
  "line": 11,
  "name": "the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"",
  "matchedColumns": [
    12
  ],
  "keyword": "Then "
});
formatter.step({
  "line": 12,
  "name": "the server returns ResponseCode \"ORCH-0000\" Description \"Account Created Successfully\"",
  "matchedColumns": [
    13,
    14
  ],
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "the response payload must match with the request payload for customerType \"PERSON\" firstName \"TFname\" lastName \"TLname\" email \"sendThroughCode\" phone \"sendThroughCode\" and GUID is not NULL or Empty",
  "matchedColumns": [
    7,
    8,
    9,
    10,
    11
  ],
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "/v1/account",
      "offset": 54
    }
  ],
  "location": "CreateAndActivateCustomerAccount.tester_calls_the_Create_Customer_Account_POST_api_at(String)"
});
formatter.result({
  "duration": 6150681,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "application/json",
      "offset": 42
    },
    {
      "val": "L",
      "offset": 68
    },
    {
      "val": "CA_AGENT",
      "offset": 81
    },
    {
      "val": "sendThroughCode",
      "offset": 107
    },
    {
      "val": "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t",
      "offset": 139
    }
  ],
  "location": "CreateAndActivateCustomerAccount.tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String,String,String,String,String)"
});
formatter.result({
  "duration": 782725,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "PERSON",
      "offset": 60
    },
    {
      "val": "TFname",
      "offset": 79
    },
    {
      "val": "TLname",
      "offset": 97
    },
    {
      "val": "sendThroughCode",
      "offset": 112
    },
    {
      "val": "sendThroughCode",
      "offset": 136
    }
  ],
  "location": "CreateAndActivateCustomerAccount.tester_post_the_service_with_json_body_having_customerType_firstName_lastName_email_phone(String,String,String,String,String)"
});
formatter.result({
  "duration": 2874988955,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "201",
      "offset": 108
    }
  ],
  "location": "CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(int)"
});
formatter.result({
  "duration": 1731009,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "ORCH-0000",
      "offset": 33
    },
    {
      "val": "Account Created Successfully",
      "offset": 57
    }
  ],
  "location": "CreateAndActivateCustomerAccount.the_server_returns_ResponseCode_Description(String,String)"
});
formatter.result({
  "duration": 100108439,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "PERSON",
      "offset": 75
    },
    {
      "val": "TFname",
      "offset": 94
    },
    {
      "val": "TLname",
      "offset": 112
    },
    {
      "val": "sendThroughCode",
      "offset": 127
    },
    {
      "val": "sendThroughCode",
      "offset": 151
    }
  ],
  "location": "CreateAndActivateCustomerAccount.the_response_payload_must_match_with_the_request_payload_for_customerType_firstName_lastName_email_and_GUID_is_not_NULL_or_Empty(String,String,String,String,String)"
});
formatter.result({
  "duration": 92773853,
  "status": "passed"
});
});