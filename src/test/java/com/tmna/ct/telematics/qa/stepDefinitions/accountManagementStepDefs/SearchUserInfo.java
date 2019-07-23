package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;

import com.cucumber.listener.Reporter;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.specification.RequestSpecification;
import org.assertj.core.api.BDDSoftAssertions;

import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.*;
import static com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs.CreateAndActivateCustomerAccount.responseGUID;
import static io.restassured.RestAssured.baseURI;

public class SearchUserInfo {
    public RequestSpecification request;
    public JsonPath result;
    private Headers headers;

    ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
    BDDSoftAssertions softly=new BDDSoftAssertions();


    @Given("^The fetch customer details GET api service \"([^\"]*)\" is up$")
    public void the_fetch_customer_details_GET_api_service_is_up(String basePath) throws Throwable {
        baseURI = configProps.getProperty("ORCH_GET_PREFIX")+ APILibrary.getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
        request = getConfigAPI(basePath);
        //Reporter.addStepLog("BaseURI is '"+baseURI+"'");
    }

    @When("^Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" and guid$")
    public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_and_guid(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {
        HeaderUtil headerUtil = HeaderUtil.builder()
                .contentType("null".equals(contentType)? null:contentType)
                .xBrand("null".equals(xBrand)? null:xBrand)
                .xChannel("null".equals(xChannel)? null:xChannel)
                .xCorrelationId("null".equals(xCorrelationId)? null:xCorrelationId)
                .authorization("null".equals(authorization)? null:authorization)
                .guid("null".equals(responseGUID)? null:responseGUID)
                .build();

        headers = headerUtil.setHeaders();
        APILibrary.request.headers(headers);

        //Reporter.addStepLog("Used Headers - content-type:'"+ headers.getValue("content-type")+"' x-brand:'"+ headers.getValue("x-brand") + "' x-channel:'"+ headers.getValue("x-channel") + "' x-correlationid:'"+ headers.getValue("x-correlationid") +"' authorization:'"+ headers.getValue("authorization") +"' guid:'"+ headers.getValue("guid") +"'");


    }
    @When("^Tester uses the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\" guid \"([^\"]*)\"$")
    public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization_guid(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization, String guid) throws Throwable {

        HeaderUtil headerUtil = HeaderUtil.builder()
                .contentType("null".equals(contentType)? null:contentType)
                .xBrand("null".equals(xBrand)? null:xBrand)
                .xChannel("null".equals(xChannel)? null:xChannel)
                .xCorrelationId("null".equals(xCorrelationId)? null:xCorrelationId)
                .authorization("null".equals(authorization)? null:authorization)
                .guid("null".equals(guid)? null:guid)
                .build();

        headers = headerUtil.setHeaders();
        APILibrary.request.headers(headers);

        //Reporter.addStepLog("Used Headers - content-type:'"+ headers.getValue("content-type")+"' x-brand:'"+ headers.getValue("x-brand") + "' x-channel:'"+ headers.getValue("x-channel") + "' x-correlationid:'"+ headers.getValue("x-correlationid") +"' authorization:'"+ headers.getValue("authorization") +"' guid:'"+ headers.getValue("guid") +"'");

    }

    @Then("^the server returns the results for the searched guid \"([^\"]*)\" and Fname and Lname details without null values for Customer type is PERSON$")
    public void the_server_returns_the_results_for_the_searched_guid_and_Fname_and_Lname_details_without_null_values_for_Customer_type_is_PERSON(String guid) throws Throwable {

        String avGuid = APILibrary.result.getString("payload.customer.guid");
        String avFirstName = APILibrary.result.getString("payload.customer.firstName");
        String avLastName = APILibrary.result.getString("payload.customer.lastName");
        String avEmail = APILibrary.result.getString("payload.customer.emails.emailAddress[0]");
        String avPhone = APILibrary.result.getString("payload.customer.phoneNumbers.phoneNumber[0]");

        //Reporter.addStepLog("Response has the GUID :'"+ avGuid +"' , FirstName :'" + avFirstName +"' , LastName :'"+ avLastName +"' E-mail: '"+ avEmail +"' Phone Number: '"+ avPhone +"'" );

        softly.then(avGuid).isEqualToIgnoringCase(responseGUID);
        softly.then(avFirstName).isNotEmpty();
        softly.then(avLastName).isNotEmpty();
        softly.assertAll();
    }
}
