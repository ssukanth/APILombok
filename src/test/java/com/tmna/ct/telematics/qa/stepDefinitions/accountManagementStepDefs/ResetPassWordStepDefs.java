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

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.path.json.JsonPath;
import io.restassured.specification.RequestSpecification;

public class ResetPassWordStepDefs {
	ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
	public static RequestSpecification request;
	public JsonPath result;

	@Given("^Tester calls the Reset Password POST api at \"([^\"]*)\"$")
	public void tester_calls_the_Reset_Password_POST_api_at(String basePath) throws Throwable {
		baseURI = configProps.getProperty("ORCH_SESSIONS_POST_PREFIX") + getEnvironmentName()
				+ configProps.getProperty("BASEURI_SUFFIX");
		request = getConfigAPI(basePath);
	}

	@Then("^The Customer's Password should be ready to reset by returning Status code \"([^\"]*)\"$")
	public void the_Customer_s_Password_should_be_ready_to_reset_by_returning_Status_code(int statusCode)
			throws Throwable {

		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}

	@Then("^The Customer's Password should not be ready to reset by returning Status code \"([^\"]*)\"$")
	public void the_Customer_s_Password_should_not_be_ready_to_reset_by_returning_Status_code(int statusCode)
			throws Throwable {

		verifyStatusCode(statusCode);
		result = getJsonPathResult();

	}
	
}
