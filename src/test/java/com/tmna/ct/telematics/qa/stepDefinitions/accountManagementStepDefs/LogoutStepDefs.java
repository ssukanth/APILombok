package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;

import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.callPOSTRequest;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getConfigAPI;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getEnvironmentName;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getJsonPathResult;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode;
import static io.restassured.RestAssured.baseURI;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerAccountLogout;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerAccountLogoutRequest;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerInfoNoAddress;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.path.json.JsonPath;
import io.restassured.specification.RequestSpecification;

public class LogoutStepDefs {
	ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
	public static RequestSpecification request;
	public JsonPath result;
	public static CustomerInfoNoAddress customerInfo;
	CustomerInfoNoAddress customerInfoList[] = new CustomerInfoNoAddress[3];

	@Given("^Tester calls the logout POST api at \"([^\"]*)\"$")
	public void tester_calls_the_logout_POST_api_at(String basePath) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		baseURI = configProps.getProperty("ORCH_SESSIONS_POST_PREFIX") + getEnvironmentName()
				+ configProps.getProperty("BASEURI_SUFFIX");
		request = getConfigAPI(basePath);
	}
	
	@When("^Tester calls the POST service$")
	public void tester_calls_the_POST_service() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		callPOSTRequest();
		result = getJsonPathResult();
	}

	@Then("^all sessions of customer should be successfully cleared by returning Status code \"([^\"]*)\"$")
	public void all_sessions_of_customer_should_be_successfully_cleared_by_returning_Status_code(int statusCode)
			throws Throwable {
		// Write code here that turns the phrase above into concrete actions

		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}

	@Then("^the sessions of customer should not be cleared by returning Status code \"([^\"]*)\"$")
	public void the_sessions_of_customer_should_not_be_cleared_by_returning_Status_code(int statusCode) throws Throwable {
		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}

}
