/**
 * 
 */
package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;

import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.callDELETERequest;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getConfigAPI;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getEnvironmentName;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getJsonPathResult;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode;
import static com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.responseGUID;
import static io.restassured.RestAssured.baseURI;

import org.assertj.core.api.BDDSoftAssertions;

import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.specification.RequestSpecification;

/**
 * @author 445220
 *
 */
public class DeleteCustomer {
	private Headers headers;
	public RequestSpecification request;
	ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
    BDDSoftAssertions softly=new BDDSoftAssertions();
    public JsonPath result;
	@Given("^The Delete Customer Account DELETE api service \"([^\"]*)\" is up$")
	public void the_Delete_Customer_Account_DELETE_api_service_is_up(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_PUT_PREFIX")+getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = getConfigAPI(basePath);
	}
	
	@Then("^the Customer account should be deleted in OCPR system by returning Status code \"([^\"]*)\"$")
	public void the_Customer_account_should_be_deleted_in_OCPR_system_by_returning_Status_code(int statusCode) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}
	@Then("^the Customer account should not be deleted in OCPR system by returning Status code \"([^\"]*)\"$")
	public void the_Customer_account_should_not_be_deleted_in_OCPR_system_by_returning_Status_code(int statusCode) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}
	@When("^Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" and guid \"([^\"]*)\"$")
	public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_and_guid(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String guid) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
		HeaderUtil headerUtil = HeaderUtil.builder()
                .contentType("null".equals(contentType)? null:contentType)
                .xBrand("null".equals(xBrand)? null:xBrand)
                .xChannel("null".equals(xChannel)? null:xChannel)
                .xCorrelationId("null".equals(xCorrelationId)? null:xCorrelationId)
                .authorization("null".equals(authorization)? null:authorization)
                .guid("null".equals(guid)? null:guid)
                .build();

        headers = headerUtil.setHeaders();
        APILibrary.request.headers(headers);
	}
	

}
