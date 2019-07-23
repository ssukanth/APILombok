package com.tmna.ct.telematics.qa.apitesting.library;

import com.tmna.ct.telematics.qa.apitesting.common.ApiConstants;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.assertj.core.api.BDDSoftAssertions;

import java.text.SimpleDateFormat;
import java.util.*;

import static com.tmna.ct.telematics.qa.apitesting.common.ApiConstants.*;
import static io.restassured.RestAssured.basePath;
import static io.restassured.RestAssured.config;
import static io.restassured.config.DecoderConfig.decoderConfig;
import static io.restassured.config.EncoderConfig.encoderConfig;

public class APILibrary {

    public static RequestSpecification request;
    public static Response response;
    public static JsonPath result;
    public static String testProxy;
    public static String env;
    public static final String TEST_ENV = "test.env";
    public static final String STATUS_MESSAGE_RESPONSE_CODE = "status.messages.responseCode[0]";
    public static final String STATUS_MESSAGE_RESPONSE_DESC = "status.messages.description[0]";

    public static Set<String> phoneSet = new HashSet<String>();
    public static List<String> duplicatePhoneList = new ArrayList<>();

    static ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
    static BDDSoftAssertions softly = new BDDSoftAssertions();


    public static String getProxy() {
        if (System.getProperty("test.proxy") == null) {
            testProxy = configProps.getProperty("PROXY");
        } else {
            testProxy = System.getProperty(TEST_ENV);
        }
        return testProxy;
    }

    public static String getEnvironmentName() {
        if (System.getProperty(TEST_ENV) == null) {
            env = configProps.getProperty("ENVIRONMENT");
        } else {
            env = System.getProperty(TEST_ENV);
        }
        return env;
    }

    public static RequestSpecification getConfigAPI(String bPath) {
        /**
         * for Header: Content-Type to not to append "application/json; charset=UTF-8"
         * for Header: Accept-Encoding to remove the default values of GZIP and deflate
         */
        config = config().encoderConfig(encoderConfig().appendDefaultContentCharsetToContentTypeIfUndefined(false)); 
        config = config().decoderConfig(decoderConfig().noContentDecoders());
        basePath = bPath;

        RestAssured.useRelaxedHTTPSValidation();
        request = RestAssured.given();
        return request;
    }

    public static Response callGETRequest(){ //getResponseForGETService
        response = request.log().everything().get();
        return response;
    }

    public static Response callPOSTRequest(){
        response = request.log().everything().post();
        return response;
    }
    public static Response callDELETERequest(){
        response = request.log().everything().delete();
        return response;
    }
    
    public static Response callPUTRequest(){
        response = request.log().everything().put();
        return response;
    }

    public static Response callPATCHRequest(){
        response = request.log().everything().patch();
        return response;
    }
    public static JsonPath getJsonPathResult(){
        result = response.then().log().everything().extract().body().jsonPath();
        return result;
    }

    public static int verifyStatusCode(int expectedStatusCode){
        BDDSoftAssertions softly = new BDDSoftAssertions();
        int statusCode=response.getStatusCode();
        softly.then(response.getStatusCode()).isEqualTo(expectedStatusCode);
        softly.assertAll();
        return statusCode;
    }


    public static void verifyResponseCodeDescriptionDetailedDescription(String responseCode, String description){
        System.out.println("##ResponseCode is: " + result.getString(STATUS_MESSAGE_RESPONSE_CODE));
        System.out.println("##Description is: " + result.getString(STATUS_MESSAGE_RESPONSE_CODE));

        softly.then(result.getString(STATUS_MESSAGE_RESPONSE_CODE)).isEqualTo(responseCode);
        softly.then(result.getString(STATUS_MESSAGE_RESPONSE_CODE)).isEqualTo(description);

        softly.assertAll();
    }

    public static void verifyResponseCodeDescription(String responseCode, String description){

        System.out.println("##ResponseCode is: " + result.getString(STATUS_MESSAGE_RESPONSE_CODE));
        System.out.println("##Description is: " + result.getString(STATUS_MESSAGE_RESPONSE_DESC));

        softly.then(result.getString(STATUS_MESSAGE_RESPONSE_CODE)).isEqualTo(responseCode);
        softly.then(result.getString(STATUS_MESSAGE_RESPONSE_DESC)).isEqualToIgnoringCase(description);

        softly.assertAll();
    }

    public static int verifyStatusCode(int expectedStatusCode, BDDSoftAssertions softAssert){

        softAssert.then(response.getStatusCode()).isEqualTo(expectedStatusCode);
        softAssert.assertAll();
        return response.getStatusCode();

    }

    public static void verifyResponseCodeDescription(String responseCode, String description, BDDSoftAssertions softAssert){

        softAssert.then(result.getString(STATUS_MESSAGE_RESPONSE_CODE)).isEqualTo(responseCode);
        softAssert.then(result.getString(STATUS_MESSAGE_RESPONSE_DESC)).isEqualToIgnoringCase(description);
        softAssert.assertAll();
    }

    public static String getRandomUUID(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }
    public static String getRandomPhoneNumber_old(){
        String phone = getDateTime(ApiConstants.PHONE);

        if (phone.charAt(0) == '0') {
            phone = phone.replaceFirst("0", "9");
        }
        return phone;
    }


    public static String getRandomPhoneNumber() throws Exception{
        String randomPhone;
        Thread.sleep(1001);
        while(true){
            randomPhone = Long.toString(Calendar.getInstance(TimeZone.getTimeZone("UTC")).getTimeInMillis()).substring(0,10);
                if(!phoneSet.contains(randomPhone)){
                    phoneSet.add(randomPhone);
                    break;
                }else{
                    duplicatePhoneList.add(randomPhone);
                    System.out.println("##Duplicate Phone number generated :"+randomPhone+"##");
                }
            }

        return randomPhone;
    }

    //To generate a random email
    public static String generateEmail(String email) {
        if ("sendThroughCode".equalsIgnoreCase(email)) {
            email = "test_" + getDateTime(DDMMYYYYHHMMSSSSS) + YOPMAIL_DOMAIN;
        } else if( ("MissingBody".equalsIgnoreCase(email)) || ("".equalsIgnoreCase(email))){
            email = "";
            // email contains @ symbol but not at the starting position - for validating the domain in email
        } else if (email.indexOf("domain@") == 0) {
            email = "test-" + getDateTime(DDMMYYYYHHMMSSSSS) + "_" + email;
        } else if ("NumbersOnly".equalsIgnoreCase(email)) {
            email = "0123456789";
        } else if ("SymbolsOnly".equalsIgnoreCase(email)) {
            email = "!@#$%^&*()";
        } else if ("endwith@".equalsIgnoreCase(email)) {
            email = "test.email_" + getDateTime(DDMMYYYYHHMMSSSSS) + "_endwith@";
        } else if (!email.contains(YOPMAIL_DOMAIN)) {
            email = email + "_" + getDateTime(DDMMYYYYHHMMSSSSS) + YOPMAIL_DOMAIN;
        }
        return email;
    }

    public static String getDateTime(String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date());
    }


}
