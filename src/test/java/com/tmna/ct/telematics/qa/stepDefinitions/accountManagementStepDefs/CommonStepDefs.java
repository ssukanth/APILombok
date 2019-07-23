package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;

import com.cucumber.listener.Reporter;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerAccountLogout;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import org.assertj.core.api.BDDSoftAssertions;

import static com.tmna.ct.telematics.qa.apitesting.common.ApiConstants.MISSINGHEADER;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.*;

public class CommonStepDefs {
    private Headers headers;
    public JsonPath result;
    public BDDSoftAssertions softly = new BDDSoftAssertions();

    @When("^Tester calls the post service$")
    public void tester_calls_the_post_service() throws Throwable {
        callPUTRequest();
        result = getJsonPathResult();
    }

    @When("^Tester calls the PUT service$")
    public void tester_calls_the_PUT_service() throws Throwable {
        callPUTRequest();
        result = getJsonPathResult();
    }

    @Then("^The server returns the Status code \"([^\"]*)\"$")
    public void the_server_returns_the_Status_code(int statusCode) throws Throwable {
        verifyStatusCode(statusCode);
    }

    @Then("^the server must returns the ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_server_must_returns_the_ResponseCode_and_Description(String responseCode, String description) throws Throwable {

        verifyResponseCodeDescription(responseCode,description,softly);
    }
    @When("^Tester calls the DELETE service$")
	public void tester_calls_the_DELETE_service() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
		callDELETERequest();
	}

    @When("^Tester calls the PUT service without body including braces$")
    public void tester_calls_the_PUT_service_without_body_including_braces() throws Throwable {
        String jsonBody="";
        request.body(jsonBody);
        callPUTRequest();
        getJsonPathResult();
    }

    @When("^Tester calls the PUT service without body excluding braces$")
    public void tester_calls_the_PUT_service_without_body_excluding_braces() throws Throwable {
        String jsonBody="{}";
        request.body(jsonBody);
        callPUTRequest();
        getJsonPathResult();
    }

    @When("^The Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
    public void the_Tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {

        HeaderUtil headerUtil = HeaderUtil.builder()
                                        .contentType(MISSINGHEADER.equals(contentType)? null:contentType)
                                        .xBrand(MISSINGHEADER.equals(xBrand)? null:xBrand)
                                        .xChannel(MISSINGHEADER.equals(xChannel)? null:xChannel)
                                        .xCorrelationId(MISSINGHEADER.equals(xCorrelationId)? null:xCorrelationId)
                                        .authorization(MISSINGHEADER.equals(authorization)? null:authorization)
                                        .build();

        headers = headerUtil.setHeaders();
        APILibrary.request.headers(headers);

         //Reporter.addStepLog("Used Headers - content-type:'"+ headers.getValue("content-type")+"' x-brand:'"+ headers.getValue("x-brand") + "' x-channel:'"+ headers.getValue("x-channel") + "' x-correlationid:'"+ headers.getValue("x-correlationid") +"' authorization:'"+ headers.getValue("authorization") +"'");


    }
    
    @When("^Tester uses the valid body parameter guid and objectId$")
	public void tester_uses_the_valid_body_parameter_guid_and_objectId() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		CustomerAccountLogout customer = CustomerAccountLogout.builder()
				.guid(APILibrary.result.getString("payload.customer.guid"))
				.objectId(APILibrary.result.getString("payload.customer.objectId")).build();
		ObjectMapper mapper = new ObjectMapper();
		request.body(mapper.writeValueAsString(customer));

	}
    @When("^Tester uses the body parameters guid \"([^\"]*)\" and objectId \"([^\"]*)\"$")
	public void tester_uses_the_body_parameters_guid_and_objectId(String guid, String objectId) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		CustomerAccountLogout customer = CustomerAccountLogout.builder().guid("null".equals(guid) ? null : guid)
				.objectId("null".equals(objectId) ? null : objectId).build();
		ObjectMapper mapper = new ObjectMapper();
		 request.body(mapper.writeValueAsString(customer));
	}

	@When("^Tester calls the logout POST service without body including braces$")
	public void tester_calls_the_logout_POST_service_without_body_including_braces() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		String jsonBody = "";
		ObjectMapper mapper = new ObjectMapper();
		request.body(mapper.writeValueAsString(jsonBody));
		callPOSTRequest();
		getJsonPathResult();
	}

	@When("^Tester calls the logoutPOST service without body excluding braces$")
	public void tester_calls_the_logoutPOST_service_without_body_excluding_braces() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
		   String jsonBody="{}";
	        request.body(jsonBody);
	        callPOSTRequest();
	        getJsonPathResult();
	}

}
