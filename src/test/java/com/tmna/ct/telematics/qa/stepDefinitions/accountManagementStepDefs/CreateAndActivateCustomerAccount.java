package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;

import com.cucumber.listener.Reporter;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.*;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.apache.commons.lang.StringUtils;
import org.assertj.core.api.BDDSoftAssertions;

import java.util.*;

import static com.tmna.ct.telematics.qa.apitesting.common.ApiConstants.*;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.*;
import static io.restassured.RestAssured.baseURI;


public class CreateAndActivateCustomerAccount {

    public RequestSpecification request;
    public Response response;
    public JsonPath result;
    int statusCode = 0;
    Headers headers;
    public String guid, objectId, phone;
    public static String responseGUID;
    public static String createdEmailAddress,createdPhoneNumber;
    private CustomerAddressUpdate requestBody;


    ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
    BDDSoftAssertions softly=new BDDSoftAssertions();

    @Given("^Tester calls the Create Customer Account POST api at \"([^\"]*)\"$")
    public void tester_calls_the_Create_Customer_Account_POST_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_POST_PREFIX")+getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = getConfigAPI(basePath);
        //Reporter.addStepLog("BaseURI is '"+baseURI+"'");
    }

    @Given("^Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
    public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {

        HeaderUtil headerUtil = HeaderUtil.builder()
                .contentType(MISSINGHEADER.equals(contentType)? null:contentType)
                .xBrand(MISSINGHEADER.equals(xBrand)? null:xBrand)
                .xChannel(MISSINGHEADER.equals(xChannel)? null:xChannel)
                .xCorrelationId(MISSINGHEADER.equals(xCorrelationId)? null:xCorrelationId)
                .authorization(MISSINGHEADER.equals(authorization)? null:authorization)
                .build();

        headers = headerUtil.setHeaders();
        request.headers(headers);

        //Reporter.addStepLog("Used Headers - content-type:'"+ headers.getValue("content-type")+"' x-brand:'"+ headers.getValue("x-brand") + "' x-channel:'"+ headers.getValue("x-channel") + "' x-correlationid:'"+ headers.getValue("x-correlationid") +"' authorization:'"+ headers.getValue("authorization") +"'");

    }

    //Account creation by SELF required guid, objectId and password
    @When("^Tester post the service with json body having guid \"([^\"]*)\" objectId \"([^\"]*)\" customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" email \"([^\"]*)\" phone \"([^\"]*)\" password \"([^\"]*)\"$")
    public void tester_post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(String guid, String objectId, String customerType, String firstName, String lastName, String email, String phone, String password) throws Throwable {
        post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(customerType, firstName, lastName, email, phone, password);
    }

    //Dealers/Agents would not required the guid, objectId and password
    @When("^Tester post the service with json body having customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" email \"([^\"]*)\" phone \"([^\"]*)\"$")
    public void tester_post_the_service_with_json_body_having_customerType_firstName_lastName_email_phone(String customerType, String firstName, String lastName, String email, String phone) throws Throwable {
        post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(customerType, firstName, lastName, email, phone, null);
    }

    @Then("^the customer account should be successfully created in the Azure and OCPR systems by returning Status code \"([^\"]*)\"$")
    public void the_customer_account_should_be_successfully_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(int expectedStatusCode) throws Throwable {

        statusCode = verifyStatusCode(expectedStatusCode);
    }

    @Then("^the server returns ResponseCode \"([^\"]*)\" Description \"([^\"]*)\"$")
    public void the_server_returns_ResponseCode_Description(String responseCode, String description) throws Throwable {
        verifyResponseCodeDescription(responseCode,description);
        softly.assertAll();
    }

    @Then("^the response payload must match with the request payload for customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" email \"([^\"]*)\" phone \"([^\"]*)\" and GUID is not NULL or Empty$")
    public void the_response_payload_must_match_with_the_request_payload_for_customerType_firstName_lastName_email_and_GUID_is_not_NULL_or_Empty(String customerType, String firstName, String lastName, String emailAddress, String phone) throws Throwable {

        if(statusCode==201){
            responseGUID=result.getString("payload.customer.guid");

            String avCustomerType = result.getString("payload.customer.customerType");
            String avFirstName = result.getString("payload.customer.firstName");
            String avLastName = result.getString("payload.customer.lastName");
            createdEmailAddress = result.getString("payload.customer.emails.emailAddress[0]");
            createdPhoneNumber = result.getString("payload.customer.phoneNumbers.phoneNumber[0]");
            String avGUID = result.getString("payload.customer.guid");

            //Reporter.addStepLog("Response payload has the customerType:'"+ avCustomerType + "' FirstName :'" +avFirstName + "' LastName :'" + avLastName + "' E-mailAddress :'" + createdEmailAddress + "' PhoneNumber :'" + createdPhoneNumber + "' guid: '"+ avGUID +"'"  );

            softly.then(responseGUID).isNotEmpty();
            softly.then(responseGUID).isNotBlank();
            softly.then(avCustomerType.equals(customerType));
            softly.then(avFirstName.equals(firstName));
            softly.then(avLastName.equals(lastName));
            softly.then(createdEmailAddress.equals(emailAddress));
            softly.then(createdPhoneNumber.equals(phone));

        }
        softly.assertAll();
    }


    @When("^Tester calls the POST service without body including braces$")
    public void tester_calls_the_POST_service_without_body_including_braces() throws Throwable {
        String jsonBody="";
        request.body(jsonBody);
        callPOSTRequest();
        getJsonPathResult();
    }

    @When("^Tester calls the POST service without body excluding braces$")
    public void tester_calls_the_POST_service_without_body_excluding_braces() throws Throwable {
        String jsonBody="{}";
        request.body(jsonBody);
        callPOSTRequest();
        getJsonPathResult();
    }

    @Then("^the customer account should not be created in the Azure and OCPR systems by returning Status code \"([^\"]*)\"$")
    public void the_customer_account_should_not_be_created_in_the_Azure_and_OCPR_systems_by_returning_Status_code(int statusCode) throws Throwable {

        verifyStatusCode(statusCode);
    }


    @Given("^Tester calls the Activate Customer Account PATCH api at \"([^\"]*)\"$")
    public void tester_calls_the_Activate_Customer_Account_PATCH_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_PATCH_PREFIX")+getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = getConfigAPI(basePath);
        //Reporter.addStepLog("BaseURI is '"+baseURI+"'");
    }

    @When("^Tester calls the PATCH service with json body having OTP \"([^\"]*)\" GUID \"([^\"]*)\"$")
    public void tester_calls_the_PATCH_service_with_json_body_having_OTP_GUID(String otp, String guid) throws Throwable {

        if("sendThroughCode".equalsIgnoreCase(otp) || "".equalsIgnoreCase(otp)){
            Random generator = new Random();
            otp = generator.nextInt(899999) + 100000 + "";

        }else if("Empty".equalsIgnoreCase(otp)){
            otp="";
        }

        if("sendThroughCode".equalsIgnoreCase(guid) || "".equalsIgnoreCase(guid)){
            guid=getRandomUUID();
        }else if("Empty".equalsIgnoreCase(guid)){
            guid="";
        }

        Map<String, String> patchOtpGuid = new HashMap<>();

        if("ExpiredOTP".equalsIgnoreCase(guid)){
            patchOtpGuid.put("otp", "000000");
        }else if(MISSINGBODY.equalsIgnoreCase(otp)){
            patchOtpGuid.put("otp", "");
        }else if(!MISSINGBODY.equalsIgnoreCase(otp)){
            patchOtpGuid.put("otp", otp);
        }

        if("DuplicateGUID".equalsIgnoreCase(guid)){
            patchOtpGuid.put("guid", "17655881-aace-43a2-a58e-2c3e1fd0eb93");
        }else if(MISSINGBODY.equalsIgnoreCase(guid)){
            patchOtpGuid.put("guid", "");
        }else if(!MISSINGBODY.equalsIgnoreCase(guid)){
            patchOtpGuid.put("guid", guid);
        }

        request.body(patchOtpGuid).
                when().
                log().everything().
                patch("/payload/customer");

        callPATCHRequest();
        result = getJsonPathResult();
    }

    @Then("^the customer account should be successfully Activated in the Azure and OCPR systems by returning Status code \"([^\"]*)\"$")
    public void the_customer_account_should_be_successfully_Activated_in_the_Azure_and_OCPR_systems_by_returning_Status_code(int statusCode) throws Throwable {

        verifyStatusCode(statusCode);
    }

    @Then("^the customer account should not be activated in the Azure and OCPR systems by returning Status code \"([^\"]*)\"$")
    public void the_customer_account_should_not_be_activated_in_the_Azure_and_OCPR_systems_by_returning_Status_code(int statusCode) throws Throwable {
        verifyStatusCode(statusCode);
    }

    @When("^Tester post the service with json body having customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" PhoneNumber \"([^\"]*)\" and existedEmailAddress$")
    public void tester_post_the_service_with_json_body_having_customerType_firstName_lastName_PhoneNumber_and_existedEmailAddress(String customerType, String firstName, String lastName, String PhoneNumber) throws Throwable {
        post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(customerType, firstName, lastName, createdEmailAddress, PhoneNumber, null);
    }

    @When("^Tester post the service with json body having customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" EmailAddress \"([^\"]*)\" and existedPhoneNumber$")
    public void tester_post_the_service_with_json_body_having_customerType_firstName_lastName_EmailAddress_and_existedPhoneNumber(String customerType, String firstName, String lastName, String email) throws Throwable {
        post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(customerType, firstName, lastName, email, createdPhoneNumber, null);
    }

    @When("^Tester post the service with json body having customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" existedPhoneNumber and existedPhoneNumber$")
    public void tester_post_the_service_with_json_body_having_customerType_firstName_lastName_existedPhoneNumber_and_existedPhoneNumber(String customerType, String firstName, String lastName) throws Throwable {
        post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(customerType, firstName, lastName, createdEmailAddress, createdPhoneNumber, null);
    }




    public void post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(String customerType, String firstName, String lastName, String email, String phone, String password) throws Throwable {


        if("Empty".equalsIgnoreCase(customerType) || MISSINGBODY.equalsIgnoreCase(customerType)){
            customerType="";
        }

        if(MISSINGBODY.equalsIgnoreCase(firstName)){
            firstName="";
        }

        if(MISSINGBODY.equalsIgnoreCase(lastName)){
            lastName="";
        }

        email = generateEmail(email);

        //Start---------Phone-----------
        if(MISSINGBODY.equalsIgnoreCase(phone)){
            phone="";
        }else if("sendThroughCode".equalsIgnoreCase(phone)){
            Thread.sleep(500);
            phone = getRandomPhoneNumber();
        }

        //End---------Phone-----------

        if(null == password){// This will be useful Dealer and Agent account creation
        }else if("Empty".equalsIgnoreCase(password) || (MISSINGBODY.equalsIgnoreCase(password))){
            password= StringUtils.EMPTY;
        }

        //Reporter.addStepLog("Used body parameters - customerType:'"+ customerType+"' firstName:'"+ firstName + "' lastName:'"+ lastName + "' E-mail:'"+ email +"' Phone Number:'"+ phone + "'");

       // CreateCustomerAcount_ORCH_Pojo jsonBodyObject = new CreateCustomerAcount_ORCH_Pojo(guid, objectId, customerType, firstName, lastName, email, phone, password,null,null,null,null,null,null,null);

        CreateCustomerAcount_ORCH_Pojo jsonBodyObject = CreateCustomerAcount_ORCH_Pojo.builder()
                                                                                    .guid(guid)
                                                                                    .objectId(objectId)
                                                                                    .customerType(customerType)
                                                                                    .firstName(firstName)
                                                                                    .lastName(lastName)
                                                                                    .email(email)
                                                                                    .phoneNumber(phone)
                                                                                    .password(password)
                                                                                    .build();

        ObjectMapper mapper = new ObjectMapper();

        String jsonBody= mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);

        request.body(jsonBody);
        callPOSTRequest();
        result = getJsonPathResult();

    }
    @When("^Tester post the service with json body having customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" email \"([^\"]*)\" phone \"([^\"]*)\" addressType \"([^\"]*)\" address \"([^\"]*)\" city \"([^\"]*)\" state \"([^\"]*)\" zipCode \"([^\"]*)\" country \"([^\"]*)\"$")
	public void tester_post_the_service_with_json_body_having_customerType_firstName_lastName_email_phone_addressType_address_city_state_zipCode_country(
			String customerType, String firstName, String lastName, String email, String phone, 
			String addressType, String address, String city,
			String state, String zipCode, String country) throws Throwable {
		 post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_address(
				 customerType, firstName, lastName, email, phone, 
				 addressType,address,city,state,zipCode,country);
		    
	}
	public void post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_address(String customerType, String firstName, String lastName, String email, String phone, 
			String addressType, String address, String city,
			String state, String zipCode, String country) throws Throwable {


        if("Empty".equalsIgnoreCase(customerType) || MISSINGBODY.equalsIgnoreCase(customerType)){
            customerType="";
        }

        if(MISSINGBODY.equalsIgnoreCase(firstName)){
            firstName="";
        }

        if(MISSINGBODY.equalsIgnoreCase(lastName)){
            lastName="";
        }

        email = generateEmail(email);

        //Start---------Phone-----------
        if(MISSINGBODY.equalsIgnoreCase(phone)){
            phone="";
        }else if("sendThroughCode".equalsIgnoreCase(phone)){
            Thread.sleep(500);
            phone = getRandomPhoneNumber();
        }

        //End---------Phone-----------
        if(MISSINGBODY.equalsIgnoreCase(addressType)){
        	addressType="";
        }

        if(MISSINGBODY.equalsIgnoreCase(address)){
        	address="";
        }
        if(MISSINGBODY.equalsIgnoreCase(city)){
        	city="";
        }

        if(MISSINGBODY.equalsIgnoreCase(state)){
        	state="";
        }
        if(MISSINGBODY.equalsIgnoreCase(zipCode)){
        	zipCode="";
        }

        if(MISSINGBODY.equalsIgnoreCase(country)){
        	country="";
        }

        

        //Reporter.addStepLog("Used body parameters - customerType:'"+ customerType+"' firstName:'"+ firstName + "' lastName:'"+ lastName + "' E-mail:'"+ email +"' Phone Number:'"+ phone + "'");

       // CreateCustomerAcount_ORCH_Pojo jsonBodyObject = new CreateCustomerAcount_ORCH_Pojo(guid, objectId, customerType, firstName, lastName, email, phone, password,null,null,null,null,null,null,null);

        Address address1 =Address.builder().addressType(addressType)
                .address(address)
                .city(city)
                .state(state)
                .zipCode(zipCode)
                .country(country).build();
        CreateCustomerAccountWithAddress jsonBodyObject = CreateCustomerAccountWithAddress.builder()
                                                                                    .guid(guid)
                                                                                    .objectId(objectId)
                                                                                    .customerType(customerType)
                                                                                    .firstName(firstName)
                                                                                    .lastName(lastName)
                                                                                    .email(email)
                                                                                    .phoneNumber(phone)
                                                                                    .addresses(Arrays.asList(address1))
                                                                                    .build();

        ObjectMapper mapper = new ObjectMapper();

        String jsonBody= mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);

        request.body(jsonBody);
        callPOSTRequest();
        result = getJsonPathResult();

    }


}
