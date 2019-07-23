package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;

import com.cucumber.listener.Reporter;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.AcmConstants;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.assertj.core.api.BDDSoftAssertions;

import static com.tmna.ct.telematics.qa.apitesting.common.ApiConstants.*;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.*;
import static com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.AcmConstants.*;
import static io.restassured.RestAssured.baseURI;


public class AccountSearchByDealerAndAgent {

    Headers headers;
    public Response response;
    public RequestSpecification request;
    public JsonPath result;
    public int statusCode=0;



    ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
    private BDDSoftAssertions softly=new BDDSoftAssertions();


    @Given("^The Dealer Search for a Customer Account GET api service \"([^\"]*)\" is up$")
    public void the_Dealer_Search_for_a_Customer_Account_GET_api_service_is_up(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_GET_PREFIX")+getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = getConfigAPI(basePath);
        if(AcmConstants.EXECUTE_FROM_LOCAL) {
            Reporter.addStepLog("BaseURI is '" + baseURI + "'");
        }
   }

    @Given("^The Agent Search for a Customer Account GET api service \"([^\"]*)\" is up$")
    public void the_Agent_Search_for_a_Customer_Account_GET_api_service_is_up(String basePath) throws Throwable {

        baseURI = configProps.getProperty("ORCH_GET_PREFIX")+getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = getConfigAPI(basePath);
        //Reporter.addStepLog("BaseURI is '"+baseURI+"'");
    }

    @When("^Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" and existedUserEmailAddress$")
    public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_and_existedUserEmailAddress(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {

        setHeaders(contentType, xBrand, xChannel, xCorrelationId, authorization,CreateAndActivateCustomerAccount.createdEmailAddress , null);
    }

    @When("^Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" and existedUserPhoneNumber$")
    public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_and_existedUserPhoneNumber(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {
        setHeaders(contentType, xBrand, xChannel, xCorrelationId, authorization, null,CreateAndActivateCustomerAccount.createdPhoneNumber );
    }

    @When("^Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" email \"([^\"]*)\"$")
    public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_email(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String email) throws Throwable {

/*        if(!(MISSINGHEADER.equalsIgnoreCase(email) || "".equals(email))){
            email =CreateAndActivateCustomerAccount.createdEmailAddress;
        }*/
        setHeaders(contentType, xBrand, xChannel, xCorrelationId, authorization,email , null);
    }


    @When("^Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" phone \"([^\"]*)\"$")
    public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_phone(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String phone) throws Throwable {

/*        if(!(MISSINGHEADER.equalsIgnoreCase(phone) || "".equals(phone))){
            phone =CreateAndActivateCustomerAccount.createdPhoneNumber;
        }*/
        setHeaders(contentType, xBrand, xChannel, xCorrelationId, authorization, null,phone );
    }

    @When("^Tester calls the GET service$")
    public void tester_calls_the_GET_service() throws Throwable {
        callGETRequest();
        result = getJsonPathResult();
    }

    @Then("^the Customer account details should be searched in OCPR system by returning Status code \"([^\"]*)\"$")
    public void the_Customer_account_details_should_be_searched_in_OCPR_system_by_returning_Status_code(int statusCode) throws Throwable {
        verifyStatusCode(statusCode);
    }


    @Then("^the server returns the ResponseCode \"([^\"]*)\" Description \"([^\"]*)\"$")
    public void the_server_returns_the_ResponseCode_Description(String responseCode, String description) throws Throwable {
        verifyResponseCodeDescription(responseCode,description);
    }


    @Then("^the server returns the results for the searched email \"([^\"]*)\" and Fname and Lname details without null values for Customer type is PERSON$")
    public void the_server_returns_the_results_for_the_searched_email_and_Fname_and_Lname_details_without_null_values_for_Customer_type_is_PERSON(String email) throws Throwable {

        String avEmail = result.getString("payload.customer.emails.emailAddress[0]");
        String avFirstName = result.getString("payload.customer.firstName[0]");
        String avLastName = result.getString("payload.customer.lastName[0]");

        //Reporter.addStepLog("Response has the E-mail :'"+avEmail+"' , FirstName :'" + avFirstName +"' , LastName :'"+ avLastName +"'" );

        softly.then(avEmail).isEqualToIgnoringCase(CreateAndActivateCustomerAccount.createdEmailAddress);
        softly.then(avFirstName).isNotEmpty();
        softly.then(avLastName).isNotEmpty();
        softly.assertAll();
    }

    @Then("^the server returns the results for the searched phone \"([^\"]*)\" and Fname and Lname details without null values for Customer type is PERSON$")
    public void the_server_returns_the_results_for_the_searched_phone_and_Fname_and_Lname_details_without_null_values_for_Customer_type_is_PERSON(String phone) throws Throwable {
        String avPhone = result.getString("payload.customer.phoneNumbers.phoneNumber[0]");
        String avFirstName = result.getString("payload.customer.firstName[0]");
        String avLastName = result.getString("payload.customer.lastName[0]");

        //Reporter.addStepLog("Response has the Phone Number :'"+ avPhone+"' , FirstName :'" + avFirstName +"' , LastName :'"+ avLastName +"'" );

        softly.then(avPhone).isEqualToIgnoringCase(CreateAndActivateCustomerAccount.createdPhoneNumber);
        softly.then(avFirstName).isNotEmpty();
        softly.then(avLastName).isNotEmpty();
        softly.assertAll();

    }


    @Given("^The Dealer Search for a Customer Account GET api service \"([^\"]*)\" is down$")
    public void the_Dealer_Search_for_a_Customer_Account_GET_api_service_is_down(String basePath) throws Throwable {
        baseURI = configProps.getProperty("ORCH_GET_PREFIX")+getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = getConfigAPI(basePath);
        //Reporter.addStepLog("BaseURI is '"+baseURI+"'");
    }

    @Given("^The Agent Search for a Customer Account GET api service \"([^\"]*)\" is down$")
    public void the_Agent_Search_for_a_Customer_Account_GET_api_service_is_down(String basePath) throws Throwable {
        baseURI = configProps.getProperty("ORCH_GET_PREFIX")+getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = getConfigAPI(basePath);
        //Reporter.addStepLog("BaseURI is '"+baseURI+"'");
    }

    @Then("^the Customer account details can not be searched in ORCH and OCPR system by returning Status code \"([^\"]*)\"$")
    public void the_Customer_account_details_can_not_be_searched_in_ORCH_and_OCPR_system_by_returning_Status_code(int statusCode) throws Throwable {
        verifyStatusCode(statusCode);
    }

    public void setHeaders(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String email, String phone){

        HeaderUtil headerUtil = HeaderUtil.builder()
                                            .contentType(MISSINGHEADER.equals(contentType)? null:contentType)
                                            .xBrand(MISSINGHEADER.equals(xBrand)? null:xBrand)
                                            .xChannel(MISSINGHEADER.equals(xChannel)? null:xChannel)
                                            .xCorrelationId(MISSINGHEADER.equals(xCorrelationId)? null:xCorrelationId)
                                            .authorization(MISSINGHEADER.equals(authorization)? null:authorization)
                                            .email(MISSINGHEADER.equals(email)? null:email)
                                            .phone(MISSINGHEADER.equals(phone)? null:phone)
                                            .build();

        headers = headerUtil.setHeaders();
        request.headers(headers);

        //Reporter.addStepLog("Used Headers - content-type:'"+ headers.getValue("content-type")+"' x-brand:'"+ headers.getValue("x-brand") + "' x-channel:'"+ headers.getValue("x-channel") + "' x-correlationid:'"+ headers.getValue("x-correlationid") +"' authorization:'"+ headers.getValue("authorization") +"' E-mail Address:'"+ headers.getValue("email") +"' Phone Number:'"+ headers.getValue("phone") +"'");

    }

}
