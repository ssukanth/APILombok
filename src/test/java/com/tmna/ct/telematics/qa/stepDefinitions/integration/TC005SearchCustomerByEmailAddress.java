package com.tmna.ct.telematics.qa.stepDefinitions.integration;

import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import static io.restassured.RestAssured.baseURI;

public class TC005SearchCustomerByEmailAddress extends TestBase{
	/**
     * @author Henry Peng
     * 
     * Feature file: /resources/features/IntegrationTest/TC005SearchCustomerByEmailAddress.feature
     * 
     * Steps:
     * 1. Create Account
     * 2. Search Customer - By Email Address.
     * 
     */

    //Step 1: Create Account is a common scenario, which is located in CommonStepDefs.
	
    //Step 2: Search Customer - By Email Address.
	@Given("^JIT: Tester calls the Account Get api for search email address at \"([^\"]*)\"$")
    public void tester_calls_get_Account_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_GET_PREFIX")+APILibrary.getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = APILibrary.getConfigAPI(basePath);
    }
    
    @When("^JIT: Tester sends the get request with Headers Email ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
    public void tester_send_the_get_request_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_email(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {
        HeaderUtil headerUtil = HeaderUtil.builder()
        		.contentType(contentType)
        		.xBrand(xBrand)
        		.xChannel(xChannel)
        		.xCorrelationId(xCorrelationId)
        		.authorization(authorization)
        		.email(CommonStepDefs.accountEmail)
        		.build();
        headers = headerUtil.setHeaders();
        request.headers(headers);
        
        response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
	
    @Then("^JIT: The customer account info is retrieved by searching email address with StatusCode \"([^\"]*)\" ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_customer_account_info_is_retrieved(int expectedStatusCode, String responseCode, String description) throws Throwable {

    	validation.verifyCustomerEmail(result, CommonStepDefs.accountEmail);
    	validation.verifyStatusCode(response, expectedStatusCode);
        validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
}
