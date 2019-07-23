package com.tmna.ct.telematics.qa.stepDefinitions.integration;

import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import com.tmna.ct.telematics.qa.stepDefinitions.subscriptionStepDefs.util.StepDefUtil;

import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import com.tmna.ct.telematics.qa.validation.Validation;


public class TestBase {
	
	protected static String packageID;
	protected static String productID1;
	protected static String productCode1;
	protected static String term1;
	protected static String termUnit1;
	protected static String productID2;
	protected static String productCode2;
	protected static String term2;
	protected static String termUnit2;
	protected static String zuoraRatePlanID1;
	protected static String zuoraRatePlanID2;
	
	protected RequestSpecification request;
	protected Response response;
	protected JsonPath result;
	protected Headers headers;

	protected ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
	protected Validation validation = new Validation();
	protected StepDefUtil util = new StepDefUtil();
	
	protected final static String CONSTANT_BRAND_TOYOTA = "toyota";
	protected final static String CONSTANT_BRAND_LEXUS = "lexus";
    
	protected static String vin;
}
