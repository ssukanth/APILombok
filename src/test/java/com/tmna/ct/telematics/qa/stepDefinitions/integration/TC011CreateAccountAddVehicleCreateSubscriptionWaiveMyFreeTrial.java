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
import com.tmna.ct.telematics.qa.stepDefinitions.integration.CommonStepDefs;

public class TC011CreateAccountAddVehicleCreateSubscriptionWaiveMyFreeTrial extends TestBase{
    /**
     * @author Henry Peng
     * 
     * Feature file: /resources/features/IntegrationTest/TC011CreateAccountAddVehicleCreateSubscriptionWaiveMyFreeTrial.feature
     * 
     * Steps:
     * 1. Get the lexus vin that already generated from Data setup.
     * 2. Create a new customer account
     * 3. Add vehicle association
     * 4. Waive My Free Trial
     * 5. After subscription created, back to search customer page, search customer by email address
     * 6. Find vehicles, verify vehicleStatus should be WAVIED.
     * 
     * Feature file tags @CreateAccountAddVehicleCreateSubscriptionWaiveMyFreeTrial pair with @DataSetUp in IntegrationTestRunner.
     */

    //Step 1: Data set up, which is located in stepDefinitions.dataSetup.

    //Step 2: Create Account is a common scenario, which is located in CommonStepDefs.
	
	//Step 3: Search valid vin that generate from data setup
   @Given("^JIT: Tester calls the GET request with Brand of toyota \"([^\"]*)\" vin at \"(.*?)\"$")
    public void call_the_get_api_request_with_basePath_with_valid_vin(String brand, String path) throws Throwable {
    	baseURI = configProps.getProperty("CVS_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUFFIX_CVS");

    	request = APILibrary.getConfigAPI(path + Datasetup.toyotaVin);
    }
    
   @And("^JIT: Tester set the headers for toyota brand with ContentType \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" xapikey \"([^\"]*)\"$")
    public void tester_set_the_headers_for_toyota_with_ContentType_XCHANNEL_XCORRELATIONID_XAPIKEY(String contentType, String xChannel, String xCorrelationId, String xApiKey) throws Throwable {
        HeaderUtil headerUtil = HeaderUtil.builder()
        		.contentType(contentType)
        		.xChannel(xChannel)
        		.xCorrelationId(xCorrelationId)
        		.xApiKey(xApiKey)
        		.build();
        headers = headerUtil.setHeaders();
        request.headers(headers);
    }
    
   @When("^JIT: Tester sends the GET API request for toyota$")
    public void tester_calls_the_GET_api_service() throws Throwable {
    	response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
    
   @Then("^JIT: The toyota vehicle is retrieved with Status Code \"([^\"]*)\"$")
    public void the_valid_toyota_vin_code_can_get_result_by_returning_status_code(int expectedStatusCode) throws Throwable {
    	validation.verifyStatusCode(response, expectedStatusCode);
    }
    
    @And("^JIT: The server returns the valid toyota vin code ResponseCode \"([^\"]*)\" Description \"([^\"]*)\"$")
    public void the_server_returns_valid_toyota_vin_code_ResponseCode_Description(String responseCode, String description) throws Throwable {
    	validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
    
	//Step 4: Get package products info, will pass into create subscription post request
    @Given("^JIT: Tester calls the package product GET API request for brand of toyota$")
    public void tester_call_the_pakage_get_request_for_brand_of_toyota() throws Throwable {
    	baseURI = configProps.getProperty("PRODUCT_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUB_SUFFIX");
    	request = APILibrary.getConfigAPI("products/" + configProps.getProperty("GetPackages"));
    }
    
    @And("^JIT: Tester set the toyota package headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" DATETIME \"([^\"]*)\" asicode \"([^\"]*)\" hwtype \"([^\"]*)\" generation \"([^\"]*)\" region \"([^\"]*)\"$")
    public void the_tester_sets_toyota_package_product_GET_api_headers_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_DATETIME_AcceptEncoding_asicode_hwtype_generation_region(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String dateTime, String asicode, String hwtype, String generation, String region) throws Throwable {
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
    
    @When("^JIT: Tester sends toyota product package request$")
    public void test_send_toyota_product_package_request() throws Throwable {
    	response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
    
    @Then("^JIT: The products GET api server returns \"([^\"]*)\" status code$")
    public void the_products_GET_api_server_returns_status_code(int expectedStatusCode) throws Throwable {
    	validation.verifyStatusCode(response, expectedStatusCode);
    }
    
    @And("^JIT: Get package products from response and it will pass into create subscription post request$")
    public void get_packageproduct_from_response_and_it_will_pass_into_create_subscription_post_request() throws Throwable {
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
    @Given("^JIT: Tester calls the Orch Vehicle Association POST api")
    public void tester_calls_the_Orch_Vehicle_Association_POST_api_with() throws Throwable {
        baseURI = configProps.getProperty("VEH_ASSOC_ORCH_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUB_SUFFIX");
        request = APILibrary.getConfigAPI(configProps.getProperty("Orch_CreateVehicleAssociation"));
    }
    
    @And("^JIT: Tester set the headers with Guid, ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" DATETIME \"([^\"]*)\"$")
    public void the_user_input_Orchestration_Vehicle_Association_POST_api_GUID_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_DATETIME_AcceptEncoding(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String dateTime) throws Throwable {
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

    @When("^JIT: Tester set ORCH Vehicle Association POST api service with payload resource having generation \"([^\"]*)\" region \"([^\"]*)\" preferredDealerCode \"([^\"]*)\" role \"([^\"]*)\" nickName \"([^\"]*)\" status \"([^\"]*)\" createDate \"([^\"]*)\" createSource \"([^\"]*)\"$")
    public void tester_set_Orchestration_Vehicle_Association_POST_api_service_with_payload_body_having_vin_generation_region_preferredDealerCode_role_nickName_status_createDate_createSource(String generation, String region, String preferredDealerCode, String role, String nickName, String status, String createDate, String createSource) throws Throwable {
		
    	Vehicle vehicle = new Vehicle(Datasetup.toyotaVin, generation, region, preferredDealerCode, role, nickName, status, createDate, createSource);
        OrchVehAssocCreate jsonBodyObject = new OrchVehAssocCreate(vehicle);

        ObjectMapper mapper = new ObjectMapper();
        String jsonBody = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);

        request.body(jsonBody);
        response = APILibrary.callPOSTRequest();
        result = APILibrary.getJsonPathResult();
    }
    
    @Then("^JIT: ORCH Vehicle Association POST api request returns \"([^\"]*)\" status code$")
    public void the_Orchestration_Vehicle_Association_POST_api_request_returns_status_code(int statusCode) throws Throwable {

    	validation.verifyStatusCode(response, statusCode);
    }

    @And("^JIT: ORCH Vehicle Association POST api body response body content should have the ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_Orchestration_Vehicle_Association_POST_api_response_body_content_should_have_the_ResponseCode_and_Description(String responseCode, String description) throws Throwable {

    	validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
    
    //Step 6: Create subscription - pass vin, guid and package products info from upstream steps into create subscription post request payload
    @Given("^JIT: Tester calls subscription create api request$")
    public void tester_calls_subscription_create_api_request() {
        baseURI = configProps.getProperty("ORCH_SUB_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUB_SUFFIX");
        request = APILibrary.getConfigAPI(configProps.getProperty("Orch_CreateSubscription"));
    }

    @And("^JIT: Tester set the headers for create subscription with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" DATETIME \"([^\"]*)\"$")
    public void the_user_sets_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_DATETIME(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String dateTime) throws Throwable {
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
    
    @When("^JIT: Tester set the service with payload body having vin subscriberGuid region \"([^\"]*)\" generation \"([^\"]*)\" waiver \"([^\"]*)\" remoteUserGuid \"([^\"]*)\" packageID productID type ratePlanID term termUnit subscriptionStartDate can \"([^\"]*)\" serviceConnect \"([^\"]*)\" dealerContact \"([^\"]*)\" ubi \"([^\"]*)\" createDate \"([^\"]*)\" createSource \"([^\"]*)\" termsAcceptanceDate \"([^\"]*)\"$")
    public void tester_set_the_service_with_payload_body_having_vin_subscriberGuid_region_generation_waiver_remoteUserGuid_packageID_productID_type_ratePlanID_term_termUnit_subscriptionStartDate_can_serviceConnect_dealerContact_ubi_createDate_createSource_termsAcceptanceDate(String region, String generation, Boolean waiver, String remoteUserGuid, String can, String serviceConnect, String dealerContact, String ubi, String createDate, String createSource, String termsAcceptanceDate ) throws Throwable {

    	Subscription subscription1 = new Subscription(packageID, productID1, productCode1, "Trial", zuoraRatePlanID1, Integer.parseInt(term1), termUnit1, null);
    	Subscription subscription2 = new Subscription(packageID, productID2, productCode2, "Trial", zuoraRatePlanID2, Integer.parseInt(term2), termUnit2, null);
        List<Subscription> listSubscriptions = new ArrayList<Subscription>();
        listSubscriptions.add(subscription1);
        listSubscriptions.add(subscription2);
        
        DataConsent dataConsentParams = new DataConsent(can, serviceConnect, dealerContact, ubi);
        OrchSubCreate jsonBodyObject = OrchSubCreate.builder()
        		.vin(Datasetup.toyotaVin)
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

    @Then("^JIT: the Orchestration - Subscription POST API request result returns the \"([^\"]*)\" status code$")
    public void the_request_result_returns_the_status_code(int expectedStatusCode) {
    	
    	validation.verifyStatusCode(response, expectedStatusCode);
    }

    @And("^JIT: The Orchestration - Subscription POST API request response body should have the ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_body_response_should_have_the_ResponseCode_and_Description(String responseCode, String description) {

    	validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
    
  //Step 7: After subscription created, back to search customer page, find Customer - By Email Address.
  	@Given("^JIT: Tester calls Account Get API request for search customer email address at \"([^\"]*)\"$")
      public void tester_calls_get_Account_emial_address_api_request_at(String basePath) throws Throwable {

          baseURI = configProps.getProperty("ORCH_GET_PREFIX")+APILibrary.getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
          request = APILibrary.getConfigAPI(basePath);
      }
      
      @When("^JIT: Tester sends the GET API request with Headers Email ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
      public void tester_sends_the_get_api_request_with_header_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_email(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {
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
  	
      @Then("^JIT: The customer account info is retrieved by searching customer email address with StatusCode \"([^\"]*)\" ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
      public void the_customer_account_info_is_retrieved_by_searching_emial(int expectedStatusCode, String responseCode, String description) throws Throwable {

      	validation.verifyCustomerEmail(result, CommonStepDefs.accountEmail);
      	validation.verifyStatusCode(response, expectedStatusCode);
        validation.verifyResponseCodeDescription(result, responseCode, description);
      }
    
    //Step 8: After find customer by email address,  find vehile, vehicle Status should be WAIVED.
    @Given("^JIT: Tester calls the ORCH Subscription GET API request$")
    public void tester_calls_the_ORCH_subscription_get_request_at_path() {
        baseURI = configProps.getProperty("ORCH_SUB_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUB_SUFFIX");
        request = APILibrary.getConfigAPI(configProps.getProperty("OrchGetDetailsSubscription") + Datasetup.toyotaVin);
    }
    
    @And("^JIT: Tester should have request headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" DATETIME \"([^\"]*)\"$")
    public void test_put_request_header_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_DATETIME(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String dateTime) throws Throwable {
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
    
    @When("^JIT: Tester sends the ORCH Subscription GET API request$")
    public void test_send_the_orch_subscription_get_api_request() throws Throwable {
    	response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
    
    @Then("^JIT: Tester verify response body vehicleStatus should be \"([^\"]*)\" vehicleStatus$")
    public void test_test_verify_reponse_body_vehiclestatus_should_be_subscribed_status(String expectedVehicleStatus) {
    	
    	validation.verifySubscriptionVehicleStatus(result, expectedVehicleStatus);
    }
}
