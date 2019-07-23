package com.tmna.ct.telematics.qa.stepDefinitions.integration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CreateCustomerAcount_ORCH_Pojo;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import static io.restassured.RestAssured.baseURI;

public class CommonStepDefs extends TestBase{
	public static String accountEmail;
    public static String guid; //This guid will pass into create subscription api request payload
    public static String phoneNumber;
    

    @Given("^JIT: Tester calls the Create Customer Account POST api at \"([^\"]*)\"$")
    public void tester_calls_the_Create_Customer_Account_POST_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_POST_PREFIX")+APILibrary.getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = APILibrary.getConfigAPI(basePath);
    }
    
    @Given("^JIT: Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
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
    

    @When("^JIT: Tester post the service with json body having customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" email \"([^\"]*)\" phone \"([^\"]*)\"$")
    public void tester_post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(String customerType, String firstName, String lastName, String email, String phone) throws Throwable {
        post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(customerType, firstName, lastName, email, phone, null);
    }

    @Then("^JIT: Tester get guid from response body which will pass into create subscription api request payload$")
    public void tester_get_vin_from_response_body() throws Throwable {

    	guid = result.getString("payload.customer.guid");
    }
    
    @Then("^JIT: The customer account should be successfully created in the Azure and OCPR systems by returning Status code \"([^\"]*)\"$")
    public void the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(int expectedStatusCode) throws Throwable {

        validation.verifyStatusCode(response, expectedStatusCode);
        validation.verifyCustomerEmail(result, accountEmail);
    }
    
    
    public void post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(String customerType, String firstName, String lastName, String email, String phone, String password) throws Throwable {
    	accountEmail = APILibrary.generateEmail(email);
        if("sendThroughCode".equalsIgnoreCase(phone)){
        	phoneNumber = APILibrary.getRandomPhoneNumber();
        }

        CreateCustomerAcount_ORCH_Pojo jsonBodyObject = CreateCustomerAcount_ORCH_Pojo.builder()
        		.customerType(customerType)
        		.firstName(firstName)
        		.lastName(lastName)
        		.email(accountEmail)
        		.phoneNumber(phoneNumber)
        		.build();

        ObjectMapper mapper = new ObjectMapper();

        String jsonBody= mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);
        request.body(jsonBody);

        response = APILibrary.callPOSTRequest();
        result = APILibrary.getJsonPathResult();
    }

}
