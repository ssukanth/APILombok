package com.tmna.ct.telematics.qa.stepDefinitions.dataSetup;

import static io.restassured.RestAssured.baseURI;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import cucumber.api.java.en.Then;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.datasetup.Login;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.datasetup.ProvisionVehicle;
//import com.tmna.ct.telematics.qa.apitesting.pojoClasses.vehManamgement.Vehicle;
//import com.tmna.ct.telematics.qa.apitesting.pojoClasses.vehManamgement.Dcm;
//import com.tmna.ct.telematics.qa.apitesting.pojoClasses.vehManamgement.HeadUnit;

public class Datasetup extends TestBase{
	/**
	 * @author Henry Peng
	 * 
	 * This Data setup is going to provision and create a new toyota/lexus vehicle
	 * 1. Sign in data setup tool http://datasetup.qa.doman.com.
	 * (Currently only qa env is available for data setup. But that's fine, we provision vehicle to get vehicle info, then pass vehicle info into create vehicle api service to create vehicle in system; Support different env.)
	 * 2. Provision a new toyota/lexus vehicle in data set up, get vehicle info.
	 * 3. Pass vehicle info into CVS create vehicle POST api service.
	 * 4. Send vehicle POST api service to create vehicle in system. Vehicle Created Successfully.
	 * 
	 */

	// Step 1:  Sign in data setup tool 
    @Given("^Tester login data setup tool using POST api at \"([^\"]*)\"$")
    public void tester_calls_the_Create_Customer_Account_POST_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("DATASETUP_PREFIX") + CONSTANT_DATASETUP_ENV + configProps.getProperty("BASEURI_SUFFIX");
        request = APILibrary.getConfigAPI(basePath);
    }
    
    @When("^Tester send a POST request to get response headers$")
    public void tester_send_a_POST_request() throws Throwable {
    	Login jsonBodyObject = Login.builder()
    			.userName(CONSTANT_DATASETUP_USERNAME)
    			.pwd(CONSTANT_DATASETUP_PASSWORD)
    			.build();

        ObjectMapper mapper = new ObjectMapper();
        String jsonBody= mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);
        request.body(jsonBody);
      
    	response = APILibrary.callPOSTRequest();
    }
    
    @Then("^Tester get authorization from response headers$")
    public void tester_get_authorization_from_response_headers() throws Throwable {

    	authorization = response.getHeader("Authorization");
    }
    
    // Step 2. Provision a new toyota/lexus vehicle, get vehicle info.
    @Given("^Tester calls the provision vehicle POST api at \"([^\"]*)\"$")
    public void tester_calls_the_provision_vehicle_POST_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("DATASETUP_PREFIX") + CONSTANT_DATASETUP_ENV + configProps.getProperty("BASEURI_SUFFIX");
        request = APILibrary.getConfigAPI(basePath);
    }
    
    @And("^Tester pass the authorization from login response into provision request header with ContentType \"([^\"]*)\"$")
    public void tester_pass_the_authorization_from_login_response_into_provision_request_header_with_contentType(String contentType) throws Throwable {
        HeaderUtil headerUtil = HeaderUtil.builder()
        		.contentType(contentType)
        		.authorization(authorization)
        		.build();
        headers = headerUtil.setHeaders();
        request.headers(headers);
    }
    
    
    @When("^Tester post provision vehicle POST api service with json body having brand \"([^\"]*)\" headUnit \"([^\"]*)\" asiCode \"([^\"]*)\" dcmType \"([^\"]*)\" quantity \"([^\"]*)\" katashikiCode \"([^\"]*)\"$")
    public void tester_post_provision_vehicle_post_api_service_with_jsonbody_having_band_headUnit_asicode_dcmtype_quantity(String brand, String headUnit, String asiCode, String dcmType, String quantity, String katashikiCode) throws Throwable {

    	ProvisionVehicle jsonBodyObject = ProvisionVehicle.builder()
    			.brand(brand)
    			.headUnit(headUnit)
    			.asiCode(asiCode)
    			.dcmType(dcmType)
    			.quantity(Integer.parseInt(quantity))
    			.katashikiCode(katashikiCode)
    			.systems(CONSTANT_DATASETUP_SYSTEM)
    			.build();
        ObjectMapper mapper = new ObjectMapper();

        String jsonBody= mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);
        request.body(jsonBody);
    	response = APILibrary.callPOSTRequest();
        result = APILibrary.getJsonPathResult();
        
        if (brand.equalsIgnoreCase("Lexus")) {
			lexusVin = result.getString("vin[0]");
			//logUtils.logMessage("Lexus Vin is "+ lexusVin);
			lexusVinList.add(lexusVin);
		} else if (brand.equalsIgnoreCase("Toyota")) {
			toyotaVin = result.getString("vin[0]");
			toyotaVinList.add(toyotaVin);
			//logUtils.logMessage("Toyota Vin is "+ toyotaVin);
		}
    }
    
    @Then("^Tester get vin from response body$")
    public void tester_get_vin_from_response_body() throws Throwable {

    	vin = (lexusVin != null)? lexusVin : toyotaVin;
    }
    
    @Given("^Tester pass the vin into vehicle GET api then calls GET api at \"([^\"]*)\"$")
    public void tester_calls_the_vehicle_GET_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("DATASETUP_PREFIX") + CONSTANT_DATASETUP_ENV + configProps.getProperty("BASEURI_SUFFIX");
        request = APILibrary.getConfigAPI(basePath + vin);
    }
    
    @And("^Tester pass the authorization from login response into get vehicle request header with ContentType \"([^\"]*)\"$")
    public void tester_pass_the_authorization_from_login_response_into_get_vehicle_request_header_with_contentType(String contentType) throws Throwable {
        HeaderUtil headerUtil = HeaderUtil.builder()
        		.contentType(contentType)
        		.authorization(authorization)
        		.build();
        headers = headerUtil.setHeaders();
        request.headers(headers);
    }
    
    @When("^Tester calls vehicle GET api service$")
    public void tester_calls_vehicle_get_api_service() throws Throwable {

    	response = APILibrary.callGETRequest();
        result = APILibrary.getJsonPathResult();
    }
    
    @Then("^Tester get vehicle info from response body$")
    public void tester_get_imei_from_response_body() throws Throwable {

    	manufacturedDate = result.getString("manufacturedDate");
    	colorCode = result.getString("colorCode");
    	marketingColor = result.getString("marketingColor");
    	processedDate = result.getString("processedDate");
    	modelYear = result.getString("modelYear");
    	modelCode = result.getString("modelCode");
    	modelDescription = result.getString("modelDescription");
    	brandCode = result.getString("brandCode");
    	asiCode = result.getString("asiCode");
    	regionCode = result.getString("regionCode");
    	katashikiCode = result.getString("katashikiCode");
    	imei = result.getString("dcm.imei");
    	dcmModelYear = result.getString("dcm.dcmModelYear");
    	dcmDestination = result.getString("dcm.dcmDestination");
    	countryCode = result.getString("dcm.countryCode");
    	dcmSupplier = result.getString("dcm.dcmSupplier");
    	dcmGrade = result.getString("dcm.dcmGrade");
    	euiccid = result.getString("dcm.euiccid");
    	vehicleUnitTerminalNumber = result.getString("dcm.vehicleUnitTerminalNumber");
    	if (brandCode.equalsIgnoreCase("TOY")) {
    		hardwareType = "010"; // hardwareType is '011' from data setup tool for Toyota which it's incorrect, should be '010'
    	} else {
    		hardwareType = result.getString("dcm.hardwareType");
		}
    	oldImei = result.getString("dcm.oldImei");
    	mpcCode = result.getString("headUnit.mpcCode");
    	huDescription = result.getString("headUnit.huDescription");
    }
    
    // Step 3. Pass vehicle info into create vehicle POST api service, send POST request to create vehicle in system
    @Given("^Tester calls the create vehicle api at \"([^\"]*)\"$")
    public void tester_calls_the_fdf_POST_api_at(String basePath) throws Throwable {

        baseURI = configProps.getProperty("CREATE_VEHICLE_PREFIX") + APILibrary.getEnvironmentName() + configProps.getProperty("BASEURI_SUFFIX_CVS");
        request = APILibrary.getConfigAPI(basePath);
    }
    
    @And("^Tester uses the headers with ContentType \"([^\"]*)\" XCHANNEL \"([^\"]*)\" XCORRELATIONID \"([^\"]*)\" XAPIKEY \"([^\"]*)\"$")
    public void tester_uses_the_headers_with_ContentType_XBRAND_XCHANNEL_XCORRELATIONID_Authorization(String contentType, String xChannel, String xCorrelationId, String xApiKey) throws Throwable {
        HeaderUtil headerUtil = HeaderUtil.builder()
        		.contentType(contentType)
        		.xChannel(xChannel)
        		.xCorrelationId(xCorrelationId)
        		.xApiKey(xApiKey)
        		.build();
        headers = headerUtil.setHeaders();
        request.headers(headers);
    }
    
//    @When("^Tester pass the vehicle info from data setup tool into create vehicle POST api service$")
//    public void tester_post_adf_post_api_service_with_jsonbody_having_hardwareType_manufacturedDate_colorCode_marketingColor_processedDate_modelYear_dcmModelYear_modelCode_modelDescription_regionCode_asiCode_brandCode_countryCode_katashikiCode() throws Throwable {
//
//    	Dcm dcm = Dcm.builder()
//    			.dcmModelYear(dcmModelYear)
//    			.dcmDestination(dcmDestination)
//    			.countryCode(countryCode)
//    			.dcmSupplier(dcmSupplier)
//    			.dcmGrade(dcmGrade)
//    			.euiccid(euiccid)
//    			.vehicleUnitTerminalNumber(vehicleUnitTerminalNumber)
//    			.hardwareType(hardwareType)
//    			.imei(imei)
//    			.oldImei(oldImei)
//    			.build();
//
//    	HeadUnit headUnit = HeadUnit.builder()
//    			.huDescription(huDescription)
//    			.build();
//
//    	Vehicle jsonBodyObject = Vehicle.builder()
//    			.vin(vin)
//    			.manufacturedDate(manufacturedDate)
//    			.colorCode(colorCode)
//    			.marketingColor(marketingColor)
//    			.processedDate(processedDate)
//    			.modelYear(modelYear)
//    			.modelCode(modelCode)
//    			.modelDescription(modelDescription)
//    			.regionCode(regionCode)
//    			.asiCode(asiCode)
//    			.brandCode(brandCode)
//    			.katashikiCode(katashikiCode)
//    			.vehicleType(VEHICLE_TYPE)
//    			.headUnit(headUnit)
//    			.dcm(dcm)
//    			.build();
//
//        ObjectMapper mapper = new ObjectMapper();
//
//        String jsonBody= mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonBodyObject);
//        request.body(jsonBody);
//    	response = APILibrary.callPOSTRequest();
//        result = APILibrary.getJsonPathResult();
//    }
    
    @Then("^The server returns the ResponseCode \"([^\"]*)\" Description \"([^\"]*)\"$")
    public void the_server_returns_the_invalid_vin_code_ResponseCode_Description(String responseCode, String description) throws Throwable {

        assertThat(result.getString("status.messages.responseCode[1]"), is(responseCode));
        assertThat(result.getString("status.messages.description[1]"), is(description));
    }
    
    
}
