package com.tmna.ct.telematics.qa.stepDefinitions.integration;

import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import static io.restassured.RestAssured.baseURI;

public class TC001CreateAccountAddVehicleWithVinNotInSystem extends TestBase{
    
    /**
     * @author Henry Peng
     * 
     * Feature file: /resources/features/IntegrationTest/TC001CreateAccountAddVehicleWithVinNotInSystem.feature
     * Steps:
     * 1.Create Customer Account 
     * 2.Add vehicle with the VIN that not exist in system
     */
    
    //Step of Create Account is a common scenario, which is located in CommonStepDefs.
    
    @Given("^JIT: Tester calls the GET request at \"(.*?)\"$")
    public void tester_calls_the_get_api_with_basePath(String path) throws Throwable {

    	baseURI = configProps.getProperty("CVS_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUFFIX_CVS");
    	request = APILibrary.getConfigAPI(path + util.getVin(null));
    	
    }
    
    @Given("^JIT: Tester uses the headers with ContentType \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" xapikey \"([^\"]*)\"$")
    public void test_uses_the_headers_with_ContentType_XCHANNEL_XCORRELATIONID_XAPIKEY(String contentType, String xChannel, String xCorrelationId, String xApiKey) throws Throwable {
        HeaderUtil headerUtil = HeaderUtil.builder()
        		.contentType(contentType)
        		.xChannel(xChannel)
        		.xCorrelationId(xCorrelationId)
        		.xApiKey(xApiKey)
        		.build();
        headers = headerUtil.setHeaders();
        request.headers(headers);
    }
    
    @When("^JIT: Tester send a GET request$")
    public void tester_calls_the_GET_service() throws Throwable {
    	response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
    
    @Then("^JIT: The vehicle is unable to add to system by returning Status code \"([^\"]*)\"$")
    public void the_invalid_vin_code_cannot_get_result_by_returning_status_code(int expectedStatusCode) throws Throwable {
    	validation.verifyStatusCode(response, expectedStatusCode);
    }
    
    @Then("^JIT: The server returns the ResponseCode \"([^\"]*)\" Description \"([^\"]*)\"$")
    public void the_server_returns_the_invalid_vin_code_ResponseCode_Description(String responseCode, String description) throws Throwable {
    	validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
}
