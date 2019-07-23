package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;

import static com.tmna.ct.telematics.qa.apitesting.common.ApiConstants.MISSINGHEADER;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getConfigAPI;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getEnvironmentName;
import static io.restassured.RestAssured.baseURI;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.AcmConstants;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerPasswordUpdate;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import io.restassured.http.Headers;
import io.restassured.specification.RequestSpecification;

public class VerificationCode {
	static String guid;
	static String objectId;
	public RequestSpecification request;
	public static CustomerPasswordUpdate customer1;
	Headers headers;
	ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");

	@Given("^Tester calls the Generate OTP API$")
	public void tester_calls_the_Generate_OTP_API() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		baseURI = configProps.getProperty("VERIFICATION_CODE_PREFIX") + getEnvironmentName()
				+ configProps.getProperty("BASEURI_SUFFIX");
		request = getConfigAPI(AcmConstants.generateOtpbasepath);
	}

	@When("^The Tester uses the valid headers to Generate OTP API$")
	public void the_Tester_uses_the_valid_headers_to_Generate_OTP_API() throws Throwable {
		HeaderUtil headerUtil = HeaderUtil.builder()
				.contentType(MISSINGHEADER.equals(AcmConstants.contentType) ? null : AcmConstants.contentType)
				.xBrand(MISSINGHEADER.equals(AcmConstants.xBRAND) ? null : AcmConstants.xBRAND)
				.xChannel(MISSINGHEADER.equals(AcmConstants.xCHANNEL) ? null : AcmConstants.xCHANNEL)
				.xCorrelationId(MISSINGHEADER.equals(AcmConstants.xCORRELATIONID) ? null : AcmConstants.xCORRELATIONID)
				.authorization(MISSINGHEADER.equals(AcmConstants.authorization) ? null : AcmConstants.authorization)
				.build();

		headers = headerUtil.setHeaders();
		request.headers(headers);

	}

	@When("^Tester uses the valid body parameter to Generate OTP API$")
	public CustomerPasswordUpdate tester_uses_the_valid_body_parameter_to_Generate_OTP_API() throws Throwable {

		customer1 = CustomerPasswordUpdate.builder().guid(APILibrary.result.getString("payload.customer.guid"))
				.objectId(APILibrary.result.getString("payload.customer.objectId"))
				.purpose("null".equals("ACCOUNT_ACTIVATION") ? null : "ACCOUNT_ACTIVATION").build();
		ObjectMapper mapper = new ObjectMapper();
		String jsonBody = mapper.writeValueAsString(customer1);
		request.body(jsonBody);
		guid = customer1.getGuid();
		objectId = customer1.getObjectId();
		return customer1;
	}

	@Given("^Tester calls the Get OTP API$")
	public void tester_calls_the_Get_OTP_API() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		baseURI = AcmConstants.getVerificationCodePrefix + getEnvironmentName()
				+ configProps.getProperty("BASEURI_SUFFIX");
		request = getConfigAPI(AcmConstants.getOtpbasepath);

	}

	@When("^The Tester uses the valid headers to Get OTP API$")
	public void the_Tester_uses_the_valid_headers_to_Get_OTP_API() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		HeaderUtil headerUtil = HeaderUtil.builder()
				.guid("null".equals(guid) ? null : guid)
				.build();
		headers = headerUtil.setHeaders();
		request.headers(headers);
	}

}
