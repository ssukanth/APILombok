package com.tmna.ct.telematics.qa.stepDefinitions.integration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.subscriptionmanagement.OrchVehAssocUpdate.OrchVehAssocUpdate;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import com.tmna.ct.telematics.qa.stepDefinitions.dataSetup.Datasetup;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import static io.restassured.RestAssured.baseURI;
import java.util.List;
import java.util.stream.Collectors;

public class TC003RemoveMultipleSubscribedVehicles extends TestBase{

	/**
     * @author Henry Peng
     * 
     * Feature file: /resources/features/IntegrationTest/TC003RemoveMultipleSubscribedVehicles.feature
     * 
     * Steps:
     * 1. Base on the TC002CreateAccountAddVehicleCreateSubscription, multiple subscribed vehicles have been added.
     * 2. Search Customer - by Email Address which created in step 1
     * 3. Find Multiple Subscribed Vehicles which were subscribed in step 1 and Remove Vehicles
     * 
     * Feature file tag @RemoveMultipleSubscribedVehicles pair with @DataSetUp and @CreateAccountAddVehicleCreateSubscription in IntegrationTestRunner.
     */

	private static List<String> temp1LexusVinList = Datasetup.lexusVinList.stream().map(item -> item ).collect(Collectors.toList());
	
    @Given("^JIT: Tester calls the Account Get api to search email address at \"([^\"]*)\"$")
    public void tester_calls_get_Account_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_GET_PREFIX")+APILibrary.getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = APILibrary.getConfigAPI(basePath);
    }
    
    @When("^JIT: Tester sends the get request with Headers customer Email ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
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
	
    @Then("^JIT: Customer account info is retrieved by searching email address with StatusCode \"([^\"]*)\" ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void customer_account_info_is_retrieved(int expectedStatusCode, String responseCode, String description) throws Throwable {

    	validation.verifyCustomerEmail(result, CommonStepDefs.accountEmail);
    	validation.verifyStatusCode(response, expectedStatusCode);
        validation.verifyResponseCodeDescription(result, responseCode, description);
    }

    @Given("^JIT: Tester calls the Orchestration Vehicle Association PUT api with basePath$")
    public void tester_calls_the_Orchestration_Vehicle_Association_PUT_api_with_basePath() throws Throwable {
    	baseURI = configProps.getProperty("VEH_ASSOC_ORCH_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUB_SUFFIX");
        request = APILibrary.getConfigAPI(configProps.getProperty("Orch_UpdateVehicleAssociationStatus"));
    }

    @When("^JIT: The user inputs Orchestration Vehicle Association PUT api ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" DATETIME \"([^\"]*)\"$")
    public void the_user_inputs_Orchestration_Vehicle_Association_PUT_api_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_DATETIME_AcceptEncoding(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String dateTime) throws Throwable {
    	
    	HeaderUtil headerUtil=HeaderUtil.builder()
    			.contentType(contentType)
    			.xBrand(xBrand)
    			.xChannel(xChannel)
    			.xCorrelationId(xCorrelationId)
    			.authorization(authorization)
    			.dateTime(dateTime)
    			.build();
		headers = headerUtil.setHeaders();
		request.headers(headers);
    }

    @When("^JIT: Tester post Orchestration Vehicle Association PUT api service with json body having vin \"([^\"]*)\" guid \"([^\"]*)\" status \"([^\"]*)\"$")
    public void tester_post_Orchestration_Vehicle_Association_PUT_api_service_with_json_body_having_vin_guid_status(String vin, String guid, String status) throws Throwable {
    	vin = temp1LexusVinList.stream().findFirst().get();
    	temp1LexusVinList.remove(vin);
		OrchVehAssocUpdate jsonBodyObject = OrchVehAssocUpdate.builder()
        		.vin(vin)
        		.guid(CommonStepDefs.guid)
        		.status(status)
        		.build();
        String jsonBody= new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);
        request.body(jsonBody);
        response = APILibrary.callPUTRequest();
        result = APILibrary.getJsonPathResult();
    }

    @Then("^JIT: The Orchestration Vehicle Association PUT api server returns \"([^\"]*)\" status code$")
    public void the_Orchestration_Vehicle_Association_PUT_api_server_returns_status_code(int statusCode) throws Throwable {
    	
    	validation.verifyStatusCode(response, statusCode);
    }

    @And("^JIT: The Orchestration Vehicle Association PUT api body response content should have the ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_Orchestration_Vehicle_Association_PUT_api_body_response_content_should_have_the_ResponseCode_and_Description(String responseCode, String description) throws Throwable {
    	
    	validation.verifyResponseCodeDescription(result, responseCode, description);
    }

}
