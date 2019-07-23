package com.tmna.ct.telematics.qa.stepDefinitions.integration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CreateCustomerAcount_ORCH_Pojo;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import static io.restassured.RestAssured.baseURI;

public class TC007CreateAccountForExistingCustomerWithEmailAddress extends TestBase{
	/**
     * @author Henry Peng
     * 
     * Feature file: /resources/features/IntegrationTest/TC007CreateAccountForExistingCustomerWithEmailAddress.feature
     * 
     * Steps:
     * 1. Create an account
     * 2. Continue creating an account for an already existing customer with email address
     * 
     */

    //Step 1: Create Account is a common scenario, which is located in CommonStepDefs.
	
	//Step 2: Create an account for an already existing customer with email address
	@Given("^JIT: To create an account for an already existing Customer with email address, tester calls the Create Customer Account POST api at \"([^\"]*)\"$")
    public void tester_calls_the_Create_Customer_Account_POST_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_POST_PREFIX")+APILibrary.getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = APILibrary.getConfigAPI(basePath);
    }
    
    @Given("^JIT: To create an account with existing email address, tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
    public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {
        HeaderUtil headerUtil = HeaderUtil.builder()
        		.contentType(contentType)
        		.xBrand(xBrand)
        		.xChannel(xChannel)
        		.xCorrelationId(xCorrelationId)
        		.authorization(authorization)
        		.build();
        headers = headerUtil.setHeaders();
        request.headers(headers);
    }
	
    @When("^JIT: To create an account with existing email address, tester post the service with json body having customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" email \"([^\"]*)\"$")
    public void tester_post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(String customerType, String firstName, String lastName, String email) throws Throwable {
    	CreateCustomerAcount_ORCH_Pojo jsonBodyObject = CreateCustomerAcount_ORCH_Pojo.builder()
         		.customerType(customerType)
         		.firstName(firstName)
         		.lastName(lastName)
         		.email(CommonStepDefs.accountEmail)
         		.phoneNumber(APILibrary.getRandomPhoneNumber())
         		.build();

         ObjectMapper mapper = new ObjectMapper();

         String jsonBody= mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);
         request.body(jsonBody);

         response = APILibrary.callPOSTRequest();
         result = APILibrary.getJsonPathResult();
    }

    @Then("^JIT: Can not create an account for an already existing Customer with emai address with StatusCode \"([^\"]*)\" ResponseCode \"([^\"]*)\" and Description \"([^\"]*)\"$")
    public void the_customer_account_cannot_be_created_in_the_Azure_and_OCPR_systems_by_using_existing_phone_number(int expectedStatusCode, String responseCode, String description) throws Throwable {

        validation.verifyStatusCode(response, expectedStatusCode);
        validation.verifyResponseCodeDescription(result, responseCode, description);
    }
    
}
