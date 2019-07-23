package com.tmna.ct.telematics.qa.stepDefinitions.dataSetup;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import com.tmna.ct.telematics.qa.validation.Validation;


public class TestBase {
	
	protected static String authorization;
	
	public static String vin;
	public static String lexusVin;
	public static String toyotaVin;
	protected static String manufacturedDate;
	protected static String colorCode;
	protected static String marketingColor;
	protected static String processedDate;
	protected static String modelYear;
	protected static String modelCode;
	protected static String modelDescription;
	protected static String brandCode;
	protected static String asiCode;
	protected static String regionCode;
	protected static String katashikiCode;
	//dcm
	protected static String dcmModelYear;
	protected static String dcmDestination;
	protected static String countryCode;
	protected static String dcmSupplier;
	protected static String dcmGrade;
	protected static String euiccid;
	protected static String vehicleUnitTerminalNumber;
	protected static String hardwareType;
	protected static String imei;
	protected static String oldImei;
	//headUnit
	protected static String mpcCode;
	protected static String huDescription;
	
	
	protected RequestSpecification request;
	protected Response response;
	protected JsonPath result;
	protected Headers headers;

	protected ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
	protected Validation validation = new Validation();

	protected static final String VEHICLE_TYPE = "TEST VEHICLE";
	protected static final String CONSTANT_DATASETUP_ENV = "qa";
	protected static final String CONSTANT_DATASETUP_USERNAME = "username";
	protected static final String CONSTANT_DATASETUP_PASSWORD = "password";
	protected static final List<String> CONSTANT_DATASETUP_SYSTEM = Arrays.asList("tmna", "tsc", "tsp");
	

	public static List<String> lexusVinList = new ArrayList<String>();
	public static List<String> toyotaVinList = new ArrayList<String>();
    
}
