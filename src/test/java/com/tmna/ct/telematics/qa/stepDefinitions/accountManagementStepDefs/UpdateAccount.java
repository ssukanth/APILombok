package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;

import static com.tmna.ct.telematics.qa.apitesting.common.ApiConstants.MISSINGBODY;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.callPOSTRequest;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.generateEmail;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getConfigAPI;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getEnvironmentName;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getJsonPathResult;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getRandomPhoneNumber;
import static io.restassured.RestAssured.baseURI;

import org.apache.commons.lang.StringUtils;
import org.assertj.core.api.BDDSoftAssertions;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CreateCustomerAcount_ORCH_Pojo;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerInfo;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerInfoWithAddress;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;

import cucumber.api.java.en.Then;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class UpdateAccount {
	Headers headers;
	public RequestSpecification request;
	public Response response;
	public JsonPath result;
	public String guid, objectId, phone;
	public CreateAndActivateCustomerAccount account = new CreateAndActivateCustomerAccount();
	ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
	BDDSoftAssertions softly = new BDDSoftAssertions();

	public void tester_calls_the_Create_Customer_Account_POST_api_at(String basePath) throws Throwable {

		baseURI = configProps.getProperty("ORCH_POST_PREFIX") + getEnvironmentName()
				+ configProps.getProperty("BASEURI_SUFFIX");
		request = getConfigAPI(basePath);
		// Reporter.addStepLog("BaseURI is '"+baseURI+"'");
	}

	public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(
			String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization)
			throws Throwable {

		/*
		 * if("MissingHeader".equalsIgnoreCase(contentType)){ contentType=null; }
		 * if("MissingHeader".equalsIgnoreCase(xBrand)){ xBrand=null; }
		 * if("MissingHeader".equalsIgnoreCase(xChannel)){ xChannel=null; }
		 * if("MissingHeader".equalsIgnoreCase(xCorrelationId)){ xCorrelationId=null; }
		 * if("MissingHeader".equalsIgnoreCase(authorization)){ authorization=null; }
		 * 
		 * HeaderUtil headerUtil = new HeaderUtil(contentType, xBrand, xChannel,
		 * xCorrelationId, authorization, null, null, null, null,
		 * null,null,null,null,null,null); headers = headerUtil.setHeaders();
		 * request.headers(headers);
		 */

		HeaderUtil headerUtil = HeaderUtil.builder()
				.contentType("MissingHeader".equals(contentType) ? null : contentType)
				.xBrand("MissingHeader".equals(xBrand) ? null : xBrand)
				.xChannel("MissingHeader".equals(xChannel) ? null : xChannel)
				.xCorrelationId("MissingHeader".equals(xCorrelationId) ? null : xCorrelationId)
				.authorization("MissingHeader".equals(authorization) ? null : authorization).build();

		headers = headerUtil.setHeaders();
		request.headers(headers);

		// Reporter.addStepLog("Used Headers - content-type:'"+
		// headers.getValue("content-type")+"' x-brand:'"+ headers.getValue("x-brand") +
		// "' x-channel:'"+ headers.getValue("x-channel") + "' x-correlationid:'"+
		// headers.getValue("x-correlationid") +"' authorization:'"+
		// headers.getValue("authorization") +"'");

	}

	public void tester_post_the_service_with_json_body_having_customerType_firstName_lastName_email_phone(
			String customerType, String firstName, String lastName, String email, String phone) throws Throwable {
		post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(
				customerType, firstName, lastName, email, phone, null);
	}

	public void post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(
			String customerType, String firstName, String lastName, String email, String phone, String password)
			throws Throwable {

		if ("Empty".equalsIgnoreCase(customerType) || MISSINGBODY.equalsIgnoreCase(customerType)) {
			customerType = "";
		}

		if (MISSINGBODY.equalsIgnoreCase(firstName)) {
			firstName = "";
		}

		if (MISSINGBODY.equalsIgnoreCase(lastName)) {
			lastName = "";
		}

		email = generateEmail(email);

		// Start---------Phone-----------
		if (MISSINGBODY.equalsIgnoreCase(phone)) {
			phone = "";
		} else if ("sendThroughCode".equalsIgnoreCase(phone)) {
			Thread.sleep(500);
			phone = getRandomPhoneNumber();
		}

		// End---------Phone-----------

		if (null == password) {// This will be useful Dealer and Agent account creation
		} else if ("Empty".equalsIgnoreCase(password) || (MISSINGBODY.equalsIgnoreCase(password))) {
			password = StringUtils.EMPTY;
		}

		// Reporter.addStepLog("Used body parameters - customerType:'"+ customerType+"'
		// firstName:'"+ firstName + "' lastName:'"+ lastName + "' E-mail:'"+ email +"'
		// Phone Number:'"+ phone + "'");

		// CreateCustomerAcount_ORCH_Pojo jsonBodyObject = new
		// CreateCustomerAcount_ORCH_Pojo(guid, objectId, customerType, firstName,
		// lastName, email, phone, password,null,null,null,null,null,null,null);

		CreateCustomerAcount_ORCH_Pojo jsonBodyObject = CreateCustomerAcount_ORCH_Pojo.builder().guid(guid)
				.objectId(objectId).customerType(customerType).firstName(firstName).lastName(lastName).email(email)
				.phoneNumber(phone).password(password).build();

		ObjectMapper mapper = new ObjectMapper();

		String jsonBody = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);

		request.body(jsonBody);
		callPOSTRequest();
		result = getJsonPathResult();

	}
	
}
