package com.tmna.ct.telematics.qa.stepDefinitions.integration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.subscriptionmanagement.OrchSubCreate.DataConsent;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.subscriptionmanagement.OrchSubCreate.OrchSubCreate;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.subscriptionmanagement.OrchSubCreate.Subscription;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.subscriptionmanagement.OrchVehAssocCreate.OrchVehAssocCreate;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.subscriptionmanagement.OrchVehAssocCreate.Vehicle;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import com.tmna.ct.telematics.qa.stepDefinitions.dataSetup.Datasetup;
import static io.restassured.RestAssured.baseURI;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import com.tmna.ct.telematics.qa.stepDefinitions.integration.CommonStepDefs;

public class TC002CreateAccountAddVehicleCreateSubscription extends TestBase{
    /**
     * @author Henry Peng
     * 
     * Feature file: /resources/features/IntegrationTest/TC002CreateAccountAddVehicleCreateSubscription.feature
     * 
     * Steps:
     * 1. Data set up, provision and create two new lexus vehicles. 
     * 2. Create a new customer account
     * 3. Add vehicle association
     * 4. Create Subscription
     * 5. After subscription created, back to search customer page, search customer by email address
     * 6. Find vehicles, verify vehicleStatus should be SUBSCRIBED.
     * 
     * Feature file tags @DataSetUp pair with @CreateAccountAddVehicleCreateSubscription in IntegrationTestRunner.
     */

	
	private static List<String> temp1LexusVinList = Datasetup.lexusVinList.stream().map(item -> item ).collect(Collectors.toList());
	private static List<String> temp2LexusVinList = Datasetup.lexusVinList.stream().map(item -> item ).collect(Collectors.toList());
	private static List<String> temp3LexusVinList = Datasetup.lexusVinList.stream().map(item -> item ).collect(Collectors.toList());
	
    //Step 1: Data set up, which is located in stepDefinitions.dataSetup.

    //Step 2: Create Account is a common scenario, which is located in CommonStepDefs.
	
	//Step 3: Search valid vin that generate from data setup
   @Given("^JIT: Tester calls the GET request with Brand \"([^\"]*)\" vin at \"(.*?)\"$")
    public void tester_calls_the_get_api_with_basePath_vin(String brand, String path) throws Throwable {
    	baseURI = configProps.getProperty("CVS_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUFFIX_CVS");

		vin = temp1LexusVinList.stream().findFirst().get();
		temp1LexusVinList.remove(vin);
    	request = APILibrary.getConfigAPI(path + vin);
    }
    
   @And("^JIT: Tester set the headers with ContentType \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" xapikey \"([^\"]*)\"$")
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
    
   @When("^JIT: Tester send the GET request$")
    public void tester_calls_the_GET_service() throws Throwable {
    	response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
    
   @Then("^JIT: The vehicle is able to add to system by returning Status code \"([^\"]*)\"$")
    public void the_invalid_vin_code_cannot_get_result_by_returning_status_code(int expectedStatusCode) throws Throwable {
    	validation.verifyStatusCode(response, expectedStatusCode);
    }
    
    @And("^JIT: The server returns the valid vin code ResponseCode \"([^\"]*)\" Description \"([^\"]*)\"$")
    public void the_server_returns_valid_vin_code_ResponseCode_Description(String responseCode, String description) throws Throwable {
    	validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
    
	//Step 4: Get package products info, will pass into create subscription post request
    @Given("^JIT: Tester calls the product GET API request")
    public void tester_call_the_pakage_get_request() throws Throwable {
    	baseURI = configProps.getProperty("PRODUCT_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUB_SUFFIX");
    	request = APILibrary.getConfigAPI("products/" + configProps.getProperty("GetPackages"));
    }
    
    @And("^JIT: Tester set the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" DATETIME \"([^\"]*)\" asicode \"([^\"]*)\" hwtype \"([^\"]*)\" generation \"([^\"]*)\" region \"([^\"]*)\"$")
    public void the_user_inputs_product_GET_api_headers_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_DATETIME_AcceptEncoding_asicode_hwtype_generation_region(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String dateTime, String asicode, String hwtype, String generation, String region) throws Throwable {
    	 HeaderUtil headerUtil = HeaderUtil.builder()
         		.contentType(contentType)
         		.xBrand(xBrand)
         		.xChannel(xChannel)
         		.xCorrelationId(xCorrelationId)
         		.authorization(authorization)
         		.dateTime(dateTime)
         		.asicode(asicode)
         		.hwtype(hwtype)
         		.generation(generation)
         		.region(region)
         		.build();
         headers = headerUtil.setHeaders();
         request.headers(headers);
    }
    
    @When("^JIT: Tester send product package request$")
    public void test_send_product_package_request() throws Throwable {
    	response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
    
    @Then("^JIT: The product GET api server returns \"([^\"]*)\" status code$")
    public void the_product_GET_api_server_returns_status_code(int expectedStatusCode) throws Throwable {
    	validation.verifyStatusCode(response, expectedStatusCode);
    }
    
    @And("^JIT: Get package products from response and will pass into create subscription post request$")
    public void get_packageproduct_from_response_and_will_pass_into_create_subscription_post_request() throws Throwable {
     	packageID = result.getString("payload.packages.packageID[0]");
     	productID1 = result.getString("payload.packages.products[0].productID[0]");
        productCode1 = result.getString("payload.packages.products[0].code[0]");
     	zuoraRatePlanID1 = result.getString("payload.packages.products[0].zuoraRatePlanID[0]");
     	term1 = result.getString("payload.packages.products[0].term[0]");
     	termUnit1 = result.getString("payload.packages.products[0].termUnit[0]");
     	productID2 = result.getString("payload.packages.products[0].productID[1]");
        productCode2 = result.getString("payload.packages.products[0].code[1]");
     	zuoraRatePlanID2 = result.getString("payload.packages.products[0].zuoraRatePlanID[1]");
     	term2 = result.getString("payload.packages.products[0].term[1]");
     	termUnit2 = result.getString("payload.packages.products[0].termUnit[1]");
    }
    
    
    //Step 5: Create vehicle-association
    @Given("^JIT: Tester calls the Orchestration Vehicle Association POST api")
    public void tester_calls_the_Orchestration_Vehicle_Association_POST_api_with() throws Throwable {
        baseURI = configProps.getProperty("VEH_ASSOC_ORCH_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUB_SUFFIX");
        request = APILibrary.getConfigAPI(configProps.getProperty("Orch_CreateVehicleAssociation"));
    }
    
    @And("^JIT: Tester set the headers with Guid ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" DATETIME \"([^\"]*)\"$")
    public void the_user_inputs_Orchestration_Vehicle_Association_POST_api_GUID_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_DATETIME_AcceptEncoding(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String dateTime) throws Throwable {
    	 HeaderUtil headerUtil = HeaderUtil.builder()
    			.guid(CommonStepDefs.guid)
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

    @When("^JIT: Tester post ORCH Vehicle Association POST api service with json body having generation \"([^\"]*)\" region \"([^\"]*)\" preferredDealerCode \"([^\"]*)\" role \"([^\"]*)\" nickName \"([^\"]*)\" status \"([^\"]*)\" createDate \"([^\"]*)\" createSource \"([^\"]*)\"$")
    public void tester_post_Orchestration_Vehicle_Association_POST_api_service_with_json_body_having_vin_generation_region_preferredDealerCode_role_nickName_status_createDate_createSource(String generation, String region, String preferredDealerCode, String role, String nickName, String status, String createDate, String createSource) throws Throwable {
		vin = temp2LexusVinList.stream().findFirst().get();
		temp2LexusVinList.remove(vin);
		
    	Vehicle vehicle = new Vehicle(vin, generation, region, preferredDealerCode, role, nickName, status, createDate, createSource);
        OrchVehAssocCreate jsonBodyObject = new OrchVehAssocCreate(vehicle);

        ObjectMapper mapper = new ObjectMapper();
        String jsonBody = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);

        request.body(jsonBody);
        response = APILibrary.callPOSTRequest();
        result = APILibrary.getJsonPathResult();
    }
    
    @Then("^JIT: ORCH Vehicle Association POST api server returns \"([^\"]*)\" status code$")
    public void the_Orchestration_Vehicle_Association_POST_api_server_returns_status_code(int statusCode) throws Throwable {

    	validation.verifyStatusCode(response, statusCode);
    }

    @And("^JIT: ORCH Vehicle Association POST api body response content should have the ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_Orchestration_Vehicle_Association_POST_api_body_response_content_should_have_the_ResponseCode_and_Description(String responseCode, String description) throws Throwable {

    	validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
    
    //Step 6: Create subscription - pass vin, guid and package products info from upstream steps into create subscription post request payload
    @Given("^JIT: Tester calls subscription create api$")
    public void tester_calls_subscription_create_api() {
        baseURI = configProps.getProperty("ORCH_SUB_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUB_SUFFIX");
        request = APILibrary.getConfigAPI(configProps.getProperty("Orch_CreateSubscription"));
    }

    @And("^JIT: Tester set the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" DATETIME \"([^\"]*)\"$")
    public void the_user_inputs_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_DATETIME(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String dateTime) throws Throwable {
    	 HeaderUtil headerUtil = HeaderUtil.builder()
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
    
    @When("^JIT: Tester post the service with json body having vin subscriberGuid region \"([^\"]*)\" generation \"([^\"]*)\" waiver \"([^\"]*)\" remoteUserGuid \"([^\"]*)\" packageID productID type ratePlanID term termUnit subscriptionStartDate can \"([^\"]*)\" serviceConnect \"([^\"]*)\" dealerContact \"([^\"]*)\" ubi \"([^\"]*)\" createDate \"([^\"]*)\" createSource \"([^\"]*)\" termsAcceptanceDate \"([^\"]*)\"$")
    public void tester_post_the_service_with_json_body_having_vin_subscriberGuid_region_generation_waiver_remoteUserGuid_packageID_productID_type_ratePlanID_term_termUnit_subscriptionStartDate_can_serviceConnect_dealerContact_ubi_createDate_createSource_termsAcceptanceDate(String region, String generation, Boolean waiver, String remoteUserGuid, String can, String serviceConnect, String dealerContact, String ubi, String createDate, String createSource, String termsAcceptanceDate ) throws Throwable {

		vin = temp3LexusVinList.stream().findFirst().get();
		temp3LexusVinList.remove(vin);
		
    	Subscription subscription1 = new Subscription(packageID, productID1, productCode1, "Trial", zuoraRatePlanID1, Integer.parseInt(term1), termUnit1, null);
    	Subscription subscription2 = new Subscription(packageID, productID2, productCode2, "Trial", zuoraRatePlanID2, Integer.parseInt(term2), termUnit2, null);
        List<Subscription> listSubscriptions = new ArrayList<Subscription>();
        listSubscriptions.add(subscription1);
        listSubscriptions.add(subscription2);
        
        DataConsent dataConsentParams = new DataConsent(can, serviceConnect, dealerContact, ubi);
        OrchSubCreate jsonBodyObject = OrchSubCreate.builder()
        		.vin(vin)
        		.subscriberGuid(CommonStepDefs.guid)
        		.region(region)
        		.generation(generation)
        		.waiver(waiver)
        		.subscriptions(listSubscriptions)
        		.dataConsent(dataConsentParams)
        		.createDate(createDate)
        		.createSource(createSource)
        		.termsAcceptanceDate(termsAcceptanceDate)
        		.build();
        
        ObjectMapper mapper = new ObjectMapper();

        String jsonBody = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);
        request.body(jsonBody);
        response = APILibrary.callPOSTRequest();
        result = APILibrary.getJsonPathResult();
    }

    @Then("^JIT: the Orchestration - Subscription POST API returns the \"([^\"]*)\" status code$")
    public void the_server_returns_the_status_code(int expectedStatusCode) {
    	
    	validation.verifyStatusCode(response, expectedStatusCode);
    }

    @And("^JIT: The Orchestration - Subscription POST API body response should have the ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_body_response_should_have_the_ResponseCode_and_Description(String responseCode, String description) {

    	validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
    
    //Step 7: After subscription created, back to search customer page, find customer by mobile phone number.
    @Given("^JIT: After subscription created, tester calls the Account Get api for search email address at \"([^\"]*)\"$")
    public void tester_calls_get_Account_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_GET_PREFIX")+APILibrary.getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = APILibrary.getConfigAPI(basePath);
    }
    
    @When("^JIT: After subscription created, tester sends the get request with Headers PhoneNumber ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
    public void tester_send_the_get_request_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_phone(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {
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
	
    @Then("^JIT: After subscription created, the customer account info is retrieved by searching phone number with StatusCode \"([^\"]*)\" ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_customer_account_info_is_retrieved(int expectedStatusCode, String responseCode, String description) throws Throwable {

    	validation.verifyMobilePhoneNumber(result, CommonStepDefs.phoneNumber);
    	validation.verifyStatusCode(response, expectedStatusCode);
        validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
    //Step 8: After find customer by email address,  find vehile, vehicle Status should be SUBSCRIBED.
    @Given("^JIT: Tester calls the ORCH Subscription GET request$")
    public void tester_calls_the_ORCH_subscription_get_request_at() {
        baseURI = configProps.getProperty("ORCH_SUB_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUB_SUFFIX");
        request = APILibrary.getConfigAPI(configProps.getProperty("OrchGetDetailsSubscription") + vin);
    }
    
    @And("^JIT: Tester having headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" DATETIME \"([^\"]*)\"$")
    public void test_set_header_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_DATETIME(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String dateTime) throws Throwable {
    	 HeaderUtil headerUtil = HeaderUtil.builder()
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
    
    @When("^JIT: Tester send the ORCH Subscription GET request$")
    public void test_send_the_orch_subscription_get_request() throws Throwable {
    	response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
    
    @Then("^JIT: Tester verify vehicleStatus should be \"([^\"]*)\" vehicleStatus$")
    public void test_test_verify_vehiclestatus_should_be_subscribed_status(String expectedVehicleStatus) {
    	
    	validation.verifySubscriptionVehicleStatus(result, expectedVehicleStatus);
    }
}
