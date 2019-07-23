package com.tmna.ct.telematics.qa.stepDefinitions.integration;

import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import static io.restassured.RestAssured.baseURI;

public class TC004SearchCustomerByPhoneNumber extends TestBase{
	
	/**
     * @author Henry Peng
     * 
     * Feature file: /resources/features/IntegrationTest/TC004SearchCustomerByPhoneNumber.feature
     * 
     * Steps:
     * 1. Create Account
     * 2. Search Customer - By Mobile Phone Number.
     * 
     */

    //Step 1: Create Account is a common scenario, which is located in CommonStepDefs.
	
    //Step 2: Search Customer - By Mobile Phone Number.
	@Given("^JIT: Tester calls the Account Get api for search phone number at \"([^\"]*)\"$")
    public void tester_calls_get_Account_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_GET_PREFIX")+APILibrary.getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = APILibrary.getConfigAPI(basePath);
    }
	


    @When("^JIT: Tester sends the get request with Headers phoneNumber ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
    public void tester_send_the_get_request_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_Phone(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {
        HeaderUtil headerUtil = HeaderUtil.builder()
        		.contentType(contentType)
        		.xBrand(xBrand)
        		.xChannel(xChannel)
        		.xCorrelationId(xCorrelationId)
        		.authorization(authorization)
        		.phone(CommonStepDefs.phoneNumber)
        		.build();
        headers = headerUtil.setHeaders();
        request.headers(headers);
        
        response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
	
    @Then("^JIT: The customer account info is retrieved by searching phoneNumber with StatusCode \"([^\"]*)\" ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_customer_account_info_is_retrieved(int expectedStatusCode, String responseCode, String description) throws Throwable {

    	validation.verifyMobilePhoneNumber(result, CommonStepDefs.phoneNumber);
    	validation.verifyStatusCode(response, expectedStatusCode);
        validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
}
