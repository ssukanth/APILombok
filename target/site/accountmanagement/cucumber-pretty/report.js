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
  "duration": 1738996559,
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
  "duration": 79683965,
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
  "duration": 4018846084,
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
  "duration": 1027754152,
  "error_message": "org.assertj.core.api.SoftAssertionError: \r\nThe following assertion failed:\r\n1) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\nat APILibrary.verifyStatusCode(APILibrary.java:100) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\n\r\n\tat org.assertj.core.api.BDDSoftAssertions.assertAll(BDDSoftAssertions.java:114)\r\n\tat com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode(APILibrary.java:101)\r\n\tat com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(CreateAndActivateCustomerAccount.java:82)\r\n\tat ✽.Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"(AccountManagement/AccountCreationByAgent_ORCH_POST.feature:11)\r\n",
  "status": "failed"
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
  "status": "skipped"
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
  "status": "skipped"
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
  "duration": 4883327,
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
  "duration": 1148651,
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
  "duration": 2013636547,
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
  "duration": 1195953,
  "error_message": "org.assertj.core.api.SoftAssertionError: \r\nThe following assertion failed:\r\n1) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\nat APILibrary.verifyStatusCode(APILibrary.java:100) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\n\r\n\tat org.assertj.core.api.BDDSoftAssertions.assertAll(BDDSoftAssertions.java:114)\r\n\tat com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode(APILibrary.java:101)\r\n\tat com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(CreateAndActivateCustomerAccount.java:82)\r\n\tat ✽.Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"(AccountManagement/AccountCreationByAgent_ORCH_POST.feature:11)\r\n",
  "status": "failed"
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
  "status": "skipped"
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
  "status": "skipped"
});
formatter.uri("AccountManagement/AccountCreationByDealer_ORCH_POST.feature");
formatter.feature({
  "line": 2,
  "name": "Testing Create Account by Dealer - Orchestration Micro Services",
  "description": "As a tester, I should be able to Create Customer\u0027s Account by Dealer using Account Creation Micro service exposed from the Orchestration layer.\r\ni.e. Identity in Azure and profile in OCPR.",
  "id": "testing-create-account-by-dealer---orchestration-micro-services",
  "keyword": "Feature",
  "tags": [
    {
      "line": 1,
      "name": "@AcmOrchPost_Regression"
    },
    {
      "line": 1,
      "name": "@AcCreateByDealer"
    }
  ]
});
formatter.scenarioOutline({
  "line": 7,
  "name": "Create a new Customer\u0027s Account by Dealer using Account Creation API exposed from Orchestration layer using valid input parameters (headers + body) and expect status code 201 OK and appropriate response payload \u003cscenarioName\u003e",
  "description": "",
  "id": "testing-create-account-by-dealer---orchestration-micro-services;create-a-new-customer\u0027s-account-by-dealer-using-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e",
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
      "name": "@AcCreateByDealer-Smoke"
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
  "id": "testing-create-account-by-dealer---orchestration-micro-services;create-a-new-customer\u0027s-account-by-dealer-using-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;",
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
      "id": "testing-create-account-by-dealer---orchestration-micro-services;create-a-new-customer\u0027s-account-by-dealer-using-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;1"
    },
    {
      "cells": [
        "with T - US_DEALER",
        "/v1/account",
        "application/json",
        "T",
        "US_DEALER",
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
      "id": "testing-create-account-by-dealer---orchestration-micro-services;create-a-new-customer\u0027s-account-by-dealer-using-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;2"
    },
    {
      "cells": [
        "with L - CA_DEALER",
        "/v1/account",
        "application/json",
        "L",
        "CA_DEALER",
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
      "id": "testing-create-account-by-dealer---orchestration-micro-services;create-a-new-customer\u0027s-account-by-dealer-using-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;3"
    }
  ],
  "keyword": "Examples"
});
formatter.scenario({
  "line": 17,
  "name": "Create a new Customer\u0027s Account by Dealer using Account Creation API exposed from Orchestration layer using valid input parameters (headers + body) and expect status code 201 OK and appropriate response payload with T - US_DEALER",
  "description": "",
  "id": "testing-create-account-by-dealer---orchestration-micro-services;create-a-new-customer\u0027s-account-by-dealer-using-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;2",
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
      "name": "@AcCreateByDealer"
    },
    {
      "line": 6,
      "name": "@AcCreateByDealer-Smoke"
    },
    {
      "line": 1,
      "name": "@AcmOrchPost_Regression"
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
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"T\" XCHANNEL \"US_DEALER\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\"",
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
  "duration": 2599860,
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
      "val": "US_DEALER",
      "offset": 81
    },
    {
      "val": "sendThroughCode",
      "offset": 108
    },
    {
      "val": "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t",
      "offset": 140
    }
  ],
  "location": "CreateAndActivateCustomerAccount.tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String,String,String,String,String)"
});
formatter.result({
  "duration": 1166947,
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
  "duration": 2035385494,
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
  "duration": 3180879,
  "error_message": "org.assertj.core.api.SoftAssertionError: \r\nThe following assertion failed:\r\n1) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\nat APILibrary.verifyStatusCode(APILibrary.java:100) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\n\r\n\tat org.assertj.core.api.BDDSoftAssertions.assertAll(BDDSoftAssertions.java:114)\r\n\tat com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode(APILibrary.java:101)\r\n\tat com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(CreateAndActivateCustomerAccount.java:82)\r\n\tat ✽.Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"(AccountManagement/AccountCreationByDealer_ORCH_POST.feature:11)\r\n",
  "status": "failed"
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
  "status": "skipped"
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
  "status": "skipped"
});
formatter.scenario({
  "line": 18,
  "name": "Create a new Customer\u0027s Account by Dealer using Account Creation API exposed from Orchestration layer using valid input parameters (headers + body) and expect status code 201 OK and appropriate response payload with L - CA_DEALER",
  "description": "",
  "id": "testing-create-account-by-dealer---orchestration-micro-services;create-a-new-customer\u0027s-account-by-dealer-using-account-creation-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers-+-body)-and-expect-status-code-201-ok-and-appropriate-response-payload-\u003cscenarioname\u003e;;3",
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
      "name": "@AcCreateByDealer"
    },
    {
      "line": 6,
      "name": "@AcCreateByDealer-Smoke"
    },
    {
      "line": 1,
      "name": "@AcmOrchPost_Regression"
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
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"L\" XCHANNEL \"CA_DEALER\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\"",
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
  "duration": 8676463,
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
      "val": "CA_DEALER",
      "offset": 81
    },
    {
      "val": "sendThroughCode",
      "offset": 108
    },
    {
      "val": "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t",
      "offset": 140
    }
  ],
  "location": "CreateAndActivateCustomerAccount.tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String,String,String,String,String)"
});
formatter.result({
  "duration": 1129908,
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
  "duration": 2029498548,
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
  "duration": 2082208,
  "error_message": "org.assertj.core.api.SoftAssertionError: \r\nThe following assertion failed:\r\n1) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\nat APILibrary.verifyStatusCode(APILibrary.java:100) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\n\r\n\tat org.assertj.core.api.BDDSoftAssertions.assertAll(BDDSoftAssertions.java:114)\r\n\tat com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode(APILibrary.java:101)\r\n\tat com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(CreateAndActivateCustomerAccount.java:82)\r\n\tat ✽.Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"(AccountManagement/AccountCreationByDealer_ORCH_POST.feature:11)\r\n",
  "status": "failed"
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
  "status": "skipped"
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
  "status": "skipped"
});
formatter.uri("AccountManagement/AccountSearchByAgentDealerSelfUsingGUID_ORCH_PUT.feature");
formatter.feature({
  "line": 2,
  "name": "Testing Account Search by Agent,Dealer \u0026 SELF using guid - Orchestration Micro Services",
  "description": "As a tester, I should be able to search for a customer by guid as a Agent,Dealer,SELF using Account Search Micro service exposed from the Orchestration layer.\r\nSearches for a customer based on guid and returns minimum required customer information.",
  "id": "testing-account-search-by-agent,dealer-\u0026-self-using-guid---orchestration-micro-services",
  "keyword": "Feature",
  "tags": [
    {
      "line": 1,
      "name": "@AcmDetails_Regression"
    },
    {
      "line": 1,
      "name": "@AcSearchByGuid"
    }
  ]
});
formatter.scenarioOutline({
  "line": 7,
  "name": "Agent/Dealer/SELF Search for a Customer\u0027s Account by guid using Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK \u003cscenarioName\u003e",
  "description": "",
  "id": "testing-account-search-by-agent,dealer-\u0026-self-using-guid---orchestration-micro-services;agent/dealer/self-search-for-a-customer\u0027s-account-by-guid-using-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e",
  "type": "scenario_outline",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 6,
      "name": "@AcmDetails_smoke"
    },
    {
      "line": 6,
      "name": "@AcSearchByGuid_smoke"
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
  "name": "the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"\u003cCreateStatusCode\u003e\"",
  "keyword": "Then "
});
formatter.step({
  "line": 12,
  "name": "the server returns ResponseCode \"\u003cCreateResponseCode\u003e\" Description \"\u003cCreateDescription\u003e\"",
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "the response payload must match with the request payload for customerType \"\u003ccustomerType\u003e\" firstName \"\u003cfirstName\u003e\" lastName \"\u003clastName\u003e\" email \"\u003cemail\u003e\" phone \"\u003cphone\u003e\" and GUID is not NULL or Empty",
  "keyword": "And "
});
formatter.step({
  "line": 15,
  "name": "The fetch customer details GET api service \"\u003cbasePath\u003e\" is up",
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "Tester uses the headers with ContentType \"\u003cContentType\u003e\" XBRAND \"\u003cXBRAND\u003e\" XCHANNEL \"\u003cXCHANNEL\u003e\" XCORRELATIONID \"\u003cXCORRELATIONID\u003e\" Authorization \"\u003cAuthorization\u003e\" and guid",
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "Tester calls the GET service",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the Customer account details should be searched in OCPR system by returning Status code \"\u003cSearchStatusCode\u003e\"",
  "keyword": "Then "
});
formatter.step({
  "line": 19,
  "name": "the server must returns the ResponseCode \"\u003cSearchResponseCode\u003e\" and Description \"\u003cSearchDescription\u003e\"",
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "the server returns the results for the searched guid \"\u003cguid\u003e\" and Fname and Lname details without null values for Customer type is PERSON",
  "keyword": "And "
});
formatter.examples({
  "line": 22,
  "name": "",
  "description": "",
  "id": "testing-account-search-by-agent,dealer-\u0026-self-using-guid---orchestration-micro-services;agent/dealer/self-search-for-a-customer\u0027s-account-by-guid-using-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;",
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
        "CreateStatusCode",
        "CreateResponseCode",
        "CreateDescription",
        "SearchStatusCode",
        "SearchResponseCode",
        "SearchDescription"
      ],
      "line": 23,
      "id": "testing-account-search-by-agent,dealer-\u0026-self-using-guid---orchestration-micro-services;agent/dealer/self-search-for-a-customer\u0027s-account-by-guid-using-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;1"
    },
    {
      "cells": [
        "with T - TMNA_AGENT",
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
        "Account Created Successfully",
        "200",
        "OCPR-0000",
        "Request Executed Successfully"
      ],
      "line": 24,
      "id": "testing-account-search-by-agent,dealer-\u0026-self-using-guid---orchestration-micro-services;agent/dealer/self-search-for-a-customer\u0027s-account-by-guid-using-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;2"
    },
    {
      "cells": [
        "with L - CA_DEALER",
        "/v1/account",
        "application/json",
        "L",
        "CA_DEALER",
        "sendThroughCode",
        "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t",
        "PERSON",
        "TFname",
        "TLname",
        "sendThroughCode",
        "sendThroughCode",
        "201",
        "ORCH-0000",
        "Account Created Successfully",
        "200",
        "OCPR-0000",
        "Request Executed Successfully"
      ],
      "line": 25,
      "id": "testing-account-search-by-agent,dealer-\u0026-self-using-guid---orchestration-micro-services;agent/dealer/self-search-for-a-customer\u0027s-account-by-guid-using-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;3"
    }
  ],
  "keyword": "Examples"
});
formatter.scenario({
  "line": 24,
  "name": "Agent/Dealer/SELF Search for a Customer\u0027s Account by guid using Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK with T - TMNA_AGENT",
  "description": "",
  "id": "testing-account-search-by-agent,dealer-\u0026-self-using-guid---orchestration-micro-services;agent/dealer/self-search-for-a-customer\u0027s-account-by-guid-using-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;2",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 1,
      "name": "@AcmDetails_Regression"
    },
    {
      "line": 1,
      "name": "@AcSearchByGuid"
    },
    {
      "line": 6,
      "name": "@AcmDetails_smoke"
    },
    {
      "line": 6,
      "name": "@AcSearchByGuid_smoke"
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
formatter.step({
  "line": 15,
  "name": "The fetch customer details GET api service \"/v1/account\" is up",
  "matchedColumns": [
    1
  ],
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"T\" XCHANNEL \"TMNA_AGENT\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\" and guid",
  "matchedColumns": [
    2,
    3,
    4,
    5,
    6
  ],
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "Tester calls the GET service",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the Customer account details should be searched in OCPR system by returning Status code \"200\"",
  "matchedColumns": [
    15
  ],
  "keyword": "Then "
});
formatter.step({
  "line": 19,
  "name": "the server must returns the ResponseCode \"OCPR-0000\" and Description \"Request Executed Successfully\"",
  "matchedColumns": [
    16,
    17
  ],
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "the server returns the results for the searched guid \"\u003cguid\u003e\" and Fname and Lname details without null values for Customer type is PERSON",
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
  "duration": 3952448,
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
  "duration": 431525,
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
  "duration": 2020708289,
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
  "duration": 2101843,
  "error_message": "org.assertj.core.api.SoftAssertionError: \r\nThe following assertion failed:\r\n1) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\nat APILibrary.verifyStatusCode(APILibrary.java:100) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\n\r\n\tat org.assertj.core.api.BDDSoftAssertions.assertAll(BDDSoftAssertions.java:114)\r\n\tat com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode(APILibrary.java:101)\r\n\tat com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(CreateAndActivateCustomerAccount.java:82)\r\n\tat ✽.Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"(AccountManagement/AccountSearchByAgentDealerSelfUsingGUID_ORCH_PUT.feature:11)\r\n",
  "status": "failed"
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
  "status": "skipped"
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
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "/v1/account",
      "offset": 44
    }
  ],
  "location": "SearchUserInfo.the_fetch_customer_details_GET_api_service_is_up(String)"
});
formatter.result({
  "status": "skipped"
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
  "location": "SearchUserInfo.tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_and_guid(String,String,String,String,String)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "AccountSearchByDealerAndAgent.tester_calls_the_GET_service()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "200",
      "offset": 89
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_Customer_account_details_should_be_searched_in_OCPR_system_by_returning_Status_code(int)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "OCPR-0000",
      "offset": 42
    },
    {
      "val": "Request Executed Successfully",
      "offset": 70
    }
  ],
  "location": "CommonStepDefs.the_server_must_returns_the_ResponseCode_and_Description(String,String)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "\u003cguid\u003e",
      "offset": 54
    }
  ],
  "location": "SearchUserInfo.the_server_returns_the_results_for_the_searched_guid_and_Fname_and_Lname_details_without_null_values_for_Customer_type_is_PERSON(String)"
});
formatter.result({
  "status": "skipped"
});
formatter.scenario({
  "line": 25,
  "name": "Agent/Dealer/SELF Search for a Customer\u0027s Account by guid using Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK with L - CA_DEALER",
  "description": "",
  "id": "testing-account-search-by-agent,dealer-\u0026-self-using-guid---orchestration-micro-services;agent/dealer/self-search-for-a-customer\u0027s-account-by-guid-using-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;3",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 1,
      "name": "@AcmDetails_Regression"
    },
    {
      "line": 1,
      "name": "@AcSearchByGuid"
    },
    {
      "line": 6,
      "name": "@AcmDetails_smoke"
    },
    {
      "line": 6,
      "name": "@AcSearchByGuid_smoke"
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
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"L\" XCHANNEL \"CA_DEALER\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\"",
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
formatter.step({
  "line": 15,
  "name": "The fetch customer details GET api service \"/v1/account\" is up",
  "matchedColumns": [
    1
  ],
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"L\" XCHANNEL \"CA_DEALER\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\" and guid",
  "matchedColumns": [
    2,
    3,
    4,
    5,
    6
  ],
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "Tester calls the GET service",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the Customer account details should be searched in OCPR system by returning Status code \"200\"",
  "matchedColumns": [
    15
  ],
  "keyword": "Then "
});
formatter.step({
  "line": 19,
  "name": "the server must returns the ResponseCode \"OCPR-0000\" and Description \"Request Executed Successfully\"",
  "matchedColumns": [
    16,
    17
  ],
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "the server returns the results for the searched guid \"\u003cguid\u003e\" and Fname and Lname details without null values for Customer type is PERSON",
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
  "duration": 2304888,
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
      "val": "CA_DEALER",
      "offset": 81
    },
    {
      "val": "sendThroughCode",
      "offset": 108
    },
    {
      "val": "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t",
      "offset": 140
    }
  ],
  "location": "CreateAndActivateCustomerAccount.tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String,String,String,String,String)"
});
formatter.result({
  "duration": 329780,
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
  "duration": 1996800378,
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
  "duration": 2749354,
  "error_message": "org.assertj.core.api.SoftAssertionError: \r\nThe following assertion failed:\r\n1) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\nat APILibrary.verifyStatusCode(APILibrary.java:100) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\n\r\n\tat org.assertj.core.api.BDDSoftAssertions.assertAll(BDDSoftAssertions.java:114)\r\n\tat com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode(APILibrary.java:101)\r\n\tat com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(CreateAndActivateCustomerAccount.java:82)\r\n\tat ✽.Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"(AccountManagement/AccountSearchByAgentDealerSelfUsingGUID_ORCH_PUT.feature:11)\r\n",
  "status": "failed"
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
  "status": "skipped"
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
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "/v1/account",
      "offset": 44
    }
  ],
  "location": "SearchUserInfo.the_fetch_customer_details_GET_api_service_is_up(String)"
});
formatter.result({
  "status": "skipped"
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
      "val": "CA_DEALER",
      "offset": 81
    },
    {
      "val": "sendThroughCode",
      "offset": 108
    },
    {
      "val": "icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t",
      "offset": 140
    }
  ],
  "location": "SearchUserInfo.tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_and_guid(String,String,String,String,String)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "AccountSearchByDealerAndAgent.tester_calls_the_GET_service()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "200",
      "offset": 89
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_Customer_account_details_should_be_searched_in_OCPR_system_by_returning_Status_code(int)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "OCPR-0000",
      "offset": 42
    },
    {
      "val": "Request Executed Successfully",
      "offset": 70
    }
  ],
  "location": "CommonStepDefs.the_server_must_returns_the_ResponseCode_and_Description(String,String)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "\u003cguid\u003e",
      "offset": 54
    }
  ],
  "location": "SearchUserInfo.the_server_returns_the_results_for_the_searched_guid_and_Fname_and_Lname_details_without_null_values_for_Customer_type_is_PERSON(String)"
});
formatter.result({
  "status": "skipped"
});
formatter.uri("AccountManagement/AccountSearchByAgentUsingEmail_ORCH_GET.feature");
formatter.feature({
  "line": 2,
  "name": "Testing Account Search by Agent using Email - Orchestration Micro Services",
  "description": "As a tester, I should be able to search for a customer by Email as a Agent(TMNA_AGENT,TC_AGENT,SERVCO_AGENT,CA_AGENT) using Account Search by Agent Micro service exposed from the Orchestration layer.\r\nSearches for a customer based on Email and returns minimum required customer information.",
  "id": "testing-account-search-by-agent-using-email---orchestration-micro-services",
  "keyword": "Feature",
  "tags": [
    {
      "line": 1,
      "name": "@AcmDetails_Regression"
    },
    {
      "line": 1,
      "name": "@AcSearchByAgentUsingEmail"
    }
  ]
});
formatter.scenarioOutline({
  "line": 7,
  "name": "Agent Search for a Customer\u0027s Account by Email using Agent Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK \u003cscenarioName\u003e",
  "description": "",
  "id": "testing-account-search-by-agent-using-email---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-email-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e",
  "type": "scenario_outline",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 6,
      "name": "@AcmDetails_smoke"
    },
    {
      "line": 6,
      "name": "@AcSearchByAgentUsingEmail-Smoke"
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
  "name": "the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"\u003ccreateStatusCode\u003e\"",
  "keyword": "Then "
});
formatter.step({
  "line": 12,
  "name": "the server returns ResponseCode \"\u003ccreateResponseCode\u003e\" Description \"\u003ccreateDescription\u003e\"",
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "the response payload must match with the request payload for customerType \"\u003ccustomerType\u003e\" firstName \"\u003cfirstName\u003e\" lastName \"\u003clastName\u003e\" email \"\u003cemail\u003e\" phone \"\u003cphone\u003e\" and GUID is not NULL or Empty",
  "keyword": "And "
});
formatter.step({
  "line": 15,
  "name": "The Agent Search for a Customer Account GET api service \"\u003cbasePath\u003e\" is up",
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "Tester uses the headers with ContentType \"\u003cContentType\u003e\" XBRAND \"\u003cXBRAND\u003e\" XCHANNEL \"\u003cXCHANNEL\u003e\" XCORRELATIONID \"\u003cXCORRELATIONID\u003e\" Authorization \"\u003cAuthorization\u003e\" and existedUserEmailAddress",
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "Tester calls the GET service",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the Customer account details should be searched in OCPR system by returning Status code \"\u003csearchStatusCode\u003e\"",
  "keyword": "Then "
});
formatter.step({
  "line": 19,
  "name": "the server returns the ResponseCode \"\u003csearchResponseCode\u003e\" Description \"\u003csearchDescription\u003e\"",
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "the server returns the results for the searched email \"\u003cemail\u003e\" and Fname and Lname details without null values for Customer type is PERSON",
  "keyword": "And "
});
formatter.examples({
  "line": 21,
  "name": "",
  "description": "",
  "id": "testing-account-search-by-agent-using-email---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-email-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;",
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
        "createStatusCode",
        "createResponseCode",
        "createDescription",
        "searchStatusCode",
        "searchResponseCode",
        "searchDescription"
      ],
      "line": 22,
      "id": "testing-account-search-by-agent-using-email---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-email-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;1"
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
        "Account Created Successfully",
        "200",
        "OCPR-0000",
        "Request Executed Successfully"
      ],
      "line": 23,
      "id": "testing-account-search-by-agent-using-email---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-email-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;2"
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
        "Account Created Successfully",
        "200",
        "OCPR-0000",
        "Request Executed Successfully"
      ],
      "line": 24,
      "id": "testing-account-search-by-agent-using-email---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-email-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;3"
    }
  ],
  "keyword": "Examples"
});
formatter.scenario({
  "line": 23,
  "name": "Agent Search for a Customer\u0027s Account by Email using Agent Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK with Toyota TMNA_AGENT",
  "description": "",
  "id": "testing-account-search-by-agent-using-email---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-email-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;2",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 1,
      "name": "@AcmDetails_Regression"
    },
    {
      "line": 6,
      "name": "@AcmDetails_smoke"
    },
    {
      "line": 1,
      "name": "@AcSearchByAgentUsingEmail"
    },
    {
      "line": 6,
      "name": "@AcSearchByAgentUsingEmail-Smoke"
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
formatter.step({
  "line": 15,
  "name": "The Agent Search for a Customer Account GET api service \"/v1/account\" is up",
  "matchedColumns": [
    1
  ],
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"T\" XCHANNEL \"TMNA_AGENT\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\" and existedUserEmailAddress",
  "matchedColumns": [
    2,
    3,
    4,
    5,
    6
  ],
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "Tester calls the GET service",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the Customer account details should be searched in OCPR system by returning Status code \"200\"",
  "matchedColumns": [
    15
  ],
  "keyword": "Then "
});
formatter.step({
  "line": 19,
  "name": "the server returns the ResponseCode \"OCPR-0000\" Description \"Request Executed Successfully\"",
  "matchedColumns": [
    16,
    17
  ],
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "the server returns the results for the searched email \"sendThroughCode\" and Fname and Lname details without null values for Customer type is PERSON",
  "matchedColumns": [
    10
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
  "duration": 2636452,
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
  "duration": 357893,
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
  "duration": 1963247192,
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
  "duration": 3467818,
  "error_message": "org.assertj.core.api.SoftAssertionError: \r\nThe following assertion failed:\r\n1) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\nat APILibrary.verifyStatusCode(APILibrary.java:100) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\n\r\n\tat org.assertj.core.api.BDDSoftAssertions.assertAll(BDDSoftAssertions.java:114)\r\n\tat com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode(APILibrary.java:101)\r\n\tat com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(CreateAndActivateCustomerAccount.java:82)\r\n\tat ✽.Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"(AccountManagement/AccountSearchByAgentUsingEmail_ORCH_GET.feature:11)\r\n",
  "status": "failed"
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
  "status": "skipped"
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
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "/v1/account",
      "offset": 57
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_Agent_Search_for_a_Customer_Account_GET_api_service_is_up(String)"
});
formatter.result({
  "status": "skipped"
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
  "location": "AccountSearchByDealerAndAgent.tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_and_existedUserEmailAddress(String,String,String,String,String)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "AccountSearchByDealerAndAgent.tester_calls_the_GET_service()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "200",
      "offset": 89
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_Customer_account_details_should_be_searched_in_OCPR_system_by_returning_Status_code(int)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "OCPR-0000",
      "offset": 37
    },
    {
      "val": "Request Executed Successfully",
      "offset": 61
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_server_returns_the_ResponseCode_Description(String,String)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "sendThroughCode",
      "offset": 55
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_server_returns_the_results_for_the_searched_email_and_Fname_and_Lname_details_without_null_values_for_Customer_type_is_PERSON(String)"
});
formatter.result({
  "status": "skipped"
});
formatter.scenario({
  "line": 24,
  "name": "Agent Search for a Customer\u0027s Account by Email using Agent Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK with Lexus CA_AGENT",
  "description": "",
  "id": "testing-account-search-by-agent-using-email---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-email-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;3",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 1,
      "name": "@AcmDetails_Regression"
    },
    {
      "line": 6,
      "name": "@AcmDetails_smoke"
    },
    {
      "line": 1,
      "name": "@AcSearchByAgentUsingEmail"
    },
    {
      "line": 6,
      "name": "@AcSearchByAgentUsingEmail-Smoke"
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
formatter.step({
  "line": 15,
  "name": "The Agent Search for a Customer Account GET api service \"/v1/account\" is up",
  "matchedColumns": [
    1
  ],
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"L\" XCHANNEL \"CA_AGENT\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\" and existedUserEmailAddress",
  "matchedColumns": [
    2,
    3,
    4,
    5,
    6
  ],
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "Tester calls the GET service",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the Customer account details should be searched in OCPR system by returning Status code \"200\"",
  "matchedColumns": [
    15
  ],
  "keyword": "Then "
});
formatter.step({
  "line": 19,
  "name": "the server returns the ResponseCode \"OCPR-0000\" Description \"Request Executed Successfully\"",
  "matchedColumns": [
    16,
    17
  ],
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "the server returns the results for the searched email \"sendThroughCode\" and Fname and Lname details without null values for Customer type is PERSON",
  "matchedColumns": [
    10
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
  "duration": 3047896,
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
  "duration": 356555,
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
  "duration": 2039084471,
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
  "duration": 3573580,
  "error_message": "org.assertj.core.api.SoftAssertionError: \r\nThe following assertion failed:\r\n1) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\nat APILibrary.verifyStatusCode(APILibrary.java:100) expected:\u003c[201]\u003e but was:\u003c[404]\u003e\r\n\r\n\tat org.assertj.core.api.BDDSoftAssertions.assertAll(BDDSoftAssertions.java:114)\r\n\tat com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode(APILibrary.java:101)\r\n\tat com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(CreateAndActivateCustomerAccount.java:82)\r\n\tat ✽.Then the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"201\"(AccountManagement/AccountSearchByAgentUsingEmail_ORCH_GET.feature:11)\r\n",
  "status": "failed"
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
  "status": "skipped"
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
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "/v1/account",
      "offset": 57
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_Agent_Search_for_a_Customer_Account_GET_api_service_is_up(String)"
});
formatter.result({
  "status": "skipped"
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
  "location": "AccountSearchByDealerAndAgent.tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_and_existedUserEmailAddress(String,String,String,String,String)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "AccountSearchByDealerAndAgent.tester_calls_the_GET_service()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "200",
      "offset": 89
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_Customer_account_details_should_be_searched_in_OCPR_system_by_returning_Status_code(int)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "OCPR-0000",
      "offset": 37
    },
    {
      "val": "Request Executed Successfully",
      "offset": 61
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_server_returns_the_ResponseCode_Description(String,String)"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "arguments": [
    {
      "val": "sendThroughCode",
      "offset": 55
    }
  ],
  "location": "AccountSearchByDealerAndAgent.the_server_returns_the_results_for_the_searched_email_and_Fname_and_Lname_details_without_null_values_for_Customer_type_is_PERSON(String)"
});
formatter.result({
  "status": "skipped"
});
formatter.uri("AccountManagement/AccountSearchByAgentUsingPhone_ORCH_GET.feature");
formatter.feature({
  "line": 2,
  "name": "Testing Account Search by Agent using Phone Number - Orchestration Micro Services",
  "description": "As a tester, I should be able to search for a customer by Phone number as a Dealer(US_DEALER,CA_DEALER) by using Account Search by Agent Micro service exposed from the Orchestration layer.\r\nSearches for a customer based on Phone number and returns minimum required customer information.",
  "id": "testing-account-search-by-agent-using-phone-number---orchestration-micro-services",
  "keyword": "Feature",
  "tags": [
    {
      "line": 1,
      "name": "@AcmDetails_Regression"
    },
    {
      "line": 1,
      "name": "@AcSearchByAgentUsingPhone"
    }
  ]
});
formatter.scenarioOutline({
  "line": 7,
  "name": "Agent Search for a Customer\u0027s Account by Phone number using Agent Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK \u003cscenarioName\u003e",
  "description": "",
  "id": "testing-account-search-by-agent-using-phone-number---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-phone-number-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e",
  "type": "scenario_outline",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 6,
      "name": "@AcmDetails_smoke"
    },
    {
      "line": 6,
      "name": "@AcSearchByAgentUsingPhone-Smoke"
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
  "name": "the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"\u003ccreateStatusCode\u003e\"",
  "keyword": "Then "
});
formatter.step({
  "line": 12,
  "name": "the server returns ResponseCode \"\u003ccreateResponseCode\u003e\" Description \"\u003ccreateDescription\u003e\"",
  "keyword": "And "
});
formatter.step({
  "line": 13,
  "name": "the response payload must match with the request payload for customerType \"\u003ccustomerType\u003e\" firstName \"\u003cfirstName\u003e\" lastName \"\u003clastName\u003e\" email \"\u003cemail\u003e\" phone \"\u003cphone\u003e\" and GUID is not NULL or Empty",
  "keyword": "And "
});
formatter.step({
  "line": 15,
  "name": "The Agent Search for a Customer Account GET api service \"\u003cbasePath\u003e\" is up",
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "Tester uses the headers with ContentType \"\u003cContentType\u003e\" XBRAND \"\u003cXBRAND\u003e\" XCHANNEL \"\u003cXCHANNEL\u003e\" XCORRELATIONID \"\u003cXCORRELATIONID\u003e\" Authorization \"\u003cAuthorization\u003e\" and existedUserPhoneNumber",
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "Tester calls the GET service",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the Customer account details should be searched in OCPR system by returning Status code \"\u003csearchStatusCode\u003e\"",
  "keyword": "Then "
});
formatter.step({
  "line": 19,
  "name": "the server returns the ResponseCode \"\u003csearchResponseCode\u003e\" Description \"\u003csearchDescription\u003e\"",
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "the server returns the results for the searched phone \"\u003cphone\u003e\" and Fname and Lname details without null values for Customer type is PERSON",
  "keyword": "And "
});
formatter.examples({
  "line": 21,
  "name": "",
  "description": "",
  "id": "testing-account-search-by-agent-using-phone-number---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-phone-number-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;",
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
        "createStatusCode",
        "createResponseCode",
        "createDescription",
        "searchStatusCode",
        "searchResponseCode",
        "searchDescription"
      ],
      "line": 22,
      "id": "testing-account-search-by-agent-using-phone-number---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-phone-number-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;1"
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
        "Account Created Successfully",
        "200",
        "OCPR-0000",
        "Request Executed Successfully"
      ],
      "line": 23,
      "id": "testing-account-search-by-agent-using-phone-number---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-phone-number-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;2"
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
        "Account Created Successfully",
        "200",
        "OCPR-0000",
        "Request Executed Successfully"
      ],
      "line": 24,
      "id": "testing-account-search-by-agent-using-phone-number---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-phone-number-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;3"
    }
  ],
  "keyword": "Examples"
});
formatter.scenario({
  "line": 23,
  "name": "Agent Search for a Customer\u0027s Account by Phone number using Agent Search API exposed from Orchestration layer using valid input parameters (headers) and expect status code 200 OK with Toyota TMNA_AGENT",
  "description": "",
  "id": "testing-account-search-by-agent-using-phone-number---orchestration-micro-services;agent-search-for-a-customer\u0027s-account-by-phone-number-using-agent-search-api-exposed-from-orchestration-layer-using-valid-input-parameters-(headers)-and-expect-status-code-200-ok-\u003cscenarioname\u003e;;2",
  "type": "scenario",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "line": 6,
      "name": "@acm_smoke"
    },
    {
      "line": 1,
      "name": "@AcmDetails_Regression"
    },
    {
      "line": 6,
      "name": "@AcmDetails_smoke"
    },
    {
      "line": 1,
      "name": "@AcSearchByAgentUsingPhone"
    },
    {
      "line": 6,
      "name": "@AcSearchByAgentUsingPhone-Smoke"
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
formatter.step({
  "line": 15,
  "name": "The Agent Search for a Customer Account GET api service \"/v1/account\" is up",
  "matchedColumns": [
    1
  ],
  "keyword": "Given "
});
formatter.step({
  "line": 16,
  "name": "Tester uses the headers with ContentType \"application/json\" XBRAND \"T\" XCHANNEL \"TMNA_AGENT\" XCORRELATIONID \"sendThroughCode\" Authorization \"icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t\" and existedUserPhoneNumber",
  "matchedColumns": [
    2,
    3,
    4,
    5,
    6
  ],
  "keyword": "When "
});
formatter.step({
  "line": 17,
  "name": "Tester calls the GET service",
  "keyword": "And "
});
formatter.step({
  "line": 18,
  "name": "the Customer account details should be searched in OCPR system by returning Status code \"200\"",
  "matchedColumns": [
    15
  ],
  "keyword": "Then "
});
formatter.step({
  "line": 19,
  "name": "the server returns the ResponseCode \"OCPR-0000\" Description \"Request Executed Successfully\"",
  "matchedColumns": [
    16,
    17
  ],
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "the server returns the results for the searched phone \"sendThroughCode\" and Fname and Lname details without null values for Customer type is PERSON",
  "matchedColumns": [
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
  "duration": 2415558,
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
  "duration": 500247,
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
