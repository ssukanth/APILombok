//package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;
//
//import com.cucumber.listener.Reporter;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
//import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.*;
//import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
//import cucumber.api.java.en.Given;
//import cucumber.api.java.en.Then;
//import cucumber.api.java.en.When;
//import io.restassured.http.Headers;
//import io.restassured.path.json.JsonPath;
//import io.restassured.response.Response;
//import io.restassured.specification.RequestSpecification;
//import org.apache.commons.lang.StringUtils;
//import org.assertj.core.api.BDDSoftAssertions;
//
//import static com.tmna.ct.telematics.qa.apitesting.common.ApiConstants.*;
//import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.*;
//import static io.restassured.RestAssured.baseURI;
//
//
//public class ActivateCustomerAccount_Integration {
//    public RequestSpecification request;
//    public Response response;
//    public JsonPath result;
//    Headers headers;
//    public String createdGUID,guid, objectId;
//    public String OTP;
//
//
//    ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
//    BDDSoftAssertions softly = new BDDSoftAssertions();
//
//
//    //CreateAndActivateCustomerAccount objCreateAccount =new CreateAndActivateCustomerAccount();
//
//
//    @Given("^Create Customer Account POST api is available at \"([^\"]*)\"$")
//    public void create_Customer_Account_POST_api_is_available_at(String basePath) throws Throwable {
//
//        baseURI = configProps.getProperty("ORCH_PATCH_PREFIX")+ getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
//        request = getConfigAPI(basePath);
//        //Reporter.addStepLog("BaseURI is '"+baseURI+"'");
//    }
//
//    @Given("^use the headers with ContentType \"([^\"]*)\" XBRAND \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" Authorization \"([^\"]*)\"$")
//    public void use_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String contentType, String xBrand, String xChannel, String xCorrelationId, String authorization) throws Throwable {
//
//        HeaderUtil headerUtil = new HeaderUtil(contentType, xBrand, xChannel, xCorrelationId, authorization, null, null, null, null, null,null,null,null,null,null);
//        headers = headerUtil.setHeaders();
//        request.headers(headers);
//
//    }
//
//    @When("^the Tester post the service with json body having guid \"([^\"]*)\" objectId \"([^\"]*)\" customerType \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" email \"([^\"]*)\" phone \"([^\"]*)\" password \"([^\"]*)\"$")
//    public void the_Tester_post_the_service_with_json_body_having_guid_objectId_customerType_firstName_lastName_email_phone_password(String guid, String objectId, String customerType, String firstName, String lastName, String email, String phone, String password) throws Throwable {
//
//        if("Empty".equalsIgnoreCase(customerType) || MISSINGBODY.equalsIgnoreCase(customerType)){
//            customerType="";
//        }
//
//        if(MISSINGBODY.equalsIgnoreCase(firstName)){
//            firstName="";
//        }
//
//        if(MISSINGBODY.equalsIgnoreCase(lastName)){
//            lastName="";
//        }
//
//        email = generateEmail(email);
//
//        if(MISSINGBODY.equalsIgnoreCase(phone)){
//            phone="";
//        }else if("sendThroughCode".equalsIgnoreCase(phone)){
//            phone = getRandomPhoneNumber();
//        }
//
//        if(null == password){// This will be useful Dealer and Agent account creation
//        }else if("Empty".equalsIgnoreCase(password) || (MISSINGBODY.equalsIgnoreCase(password))){
//            password= StringUtils.EMPTY;
//        }
//
//        objectId = getRandomUUID();
//        guid = objectId.replace("-","");
//
//        CreateCustomerAcount_ORCH_Pojo jsonBodyObject = new CreateCustomerAcount_ORCH_Pojo(guid, objectId,customerType, firstName, lastName, email, null, password,null,null,null,null,null,null,null);
//
//        ObjectMapper mapper = new ObjectMapper();
//
//        String jsonBody= mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);
//
//        request.body(jsonBody);
//        response = request.log().everything().post();
//        result = response.then().log().everything().extract().body().jsonPath();
//
//     }
//
//    @Then("^the Status code should be \"([^\"]*)\"$")
//    public void the_Status_code_should_be(int statusCode) throws Throwable {
//        int sCode=response.getStatusCode();
//        System.out.println("##Status Code is : "+ sCode +"\n");
//        softly.then(sCode).isEqualTo(sCode);
//        softly.assertAll();
//    }
//
//    @Then("^must have the ResponseCode \"([^\"]*)\" Description \"([^\"]*)\"$")
//    public void must_have_the_ResponseCode_Description(String responseCode, String desc) throws Throwable {
//
//        String respCode = result.getString("status.messages.responseCode[0]");
//        String respDesc = result.getString("status.messages.description[0]");
//        createdGUID = result.getString("payload.customer.guid");
//
//        System.out.println("##ResponseCode is : "+respCode);
//        System.out.println("##Description is : "+respDesc);
//        System.out.println("##GUID is : "+createdGUID + "\n");
//
//        softly.then(respCode).isEqualTo(responseCode);
//        softly.then(respDesc).isEqualToIgnoringCase(desc);
//        softly.assertAll();
//    }
//
//
//    @Given("^OTP Generator API is available$")
//    public void otp_Generator_API_is_available() throws Throwable {
//        baseURI = "https://avcd-automation.dev.domain.com/account/code";
//        request = getConfigAPI("");
//        //Reporter.addStepLog("BaseURI is '"+baseURI+"'");
//    }
//
//    @Given("^OTP Generator uses the header GUID which got from the Account Creation POST API Response$")
//    public void otp_Generator_uses_the_header_GUID_which_got_from_the_Account_Creation_POST_API_Response() throws Throwable {
//
//        request.header("guid",createdGUID);
//    }
//
//    @Given("^Tester calls the OTP Generator GET service and store the OTP from response$")
//    public void tester_calls_the_OTP_Generator_GET_service() throws Throwable {
//        response = request.log().everything().get();
//        result = response.then().log().everything().extract().body().jsonPath();
//
//        OTP = result.getString("verificationCode");
//        System.out.println("##Generated OTP is : "+ OTP);
//
//        softly.then(OTP).isNotNull();
//    }
//    @Given("^Use the wrong OTP$")
//    public void use_the_wrong_OTP() throws Throwable {
//        OTP = Integer.parseInt(OTP) +1+"";
//    }
//    @Given("^Use the Expired OTP$")
//    public void use_the_Expired_OTP() throws Throwable {
//        Thread.sleep(121000);
//    }
//
//    @Given("^Use the NonNumeric OTP$")
//    public void use_the_NonNumeric_OTP() throws Throwable {
//        OTP ="ABCDEF";
//
//    }
//
//    @Given("^Activate Customer Account PATCH api is available at \"([^\"]*)\"$")
//    public void activate_Customer_Account_PATCH_api_is_available_at(String basePath) throws Throwable {
//        baseURI = configProps.getProperty("ORCH_PATCH_PREFIX")+getEnvironmentName()+configProps.getProperty("BASEURI_SUFFIX");
//        request = getConfigAPI(basePath);
//        //Reporter.addStepLog("BaseURI is '"+baseURI+"'");
//
//    }
//
//    @When("^Tester calls the PATCH service with json body having OTP and GUID$")
//    public void tester_calls_the_PATCH_service_with_json_body_having_OTP_and_GUID() throws Throwable {
//
//        String jsonBody="{\n" +
//                "  \"verificationCode\": "+ OTP +",\n" +
//                "  \"guid\": \""+ createdGUID +"\"\n" +
//                "}";
//
//        request.body(jsonBody);
//        response = request.log().everything().patch();
//        result = response.then().log().everything().extract().body().jsonPath();
//
//    }
//
//}
