package com.tmna.ct.telematics.qa.validation;

import io.restassured.response.Response;
import io.restassured.path.json.JsonPath;

//import com.tmna.ct.logging.ILogService;
//import com.tmna.ct.logging.LogFactory;
//import com.tmna.ct.telematics.qa.apitesting.utility.LogUtils;
import static org.junit.Assert.assertThat;
import static org.hamcrest.Matchers.*;


public class Validation {

//
//    private static final ILogService logger = LogFactory.getLogger(Validation.class);
//    public static LogUtils logUtils = new LogUtils(logger);

    public void verifyStatusCode(Response response, int expectedStatusCode){
        int statusCode = response.getStatusCode();
        //logUtils.logMessage("Status Code is : "+ statusCode);
        assertThat(statusCode, is(expectedStatusCode));
    }
    
    public void verifyResponseCodeDescription(JsonPath result, String responseCode, String description){
//    	logUtils.logMessage("ResponseCode is: "+result.getString("status.messages.responseCode[0]"));
//    	logUtils.logMessage("Description is: "+result.getString("status.messages.description[0]"));
        
        assertThat(result.getString("status.messages.responseCode[0]"), is(responseCode));
        assertThat(result.getString("status.messages.description[0]"), is(description));
    }
    
    public void verifyCustomerEmail(JsonPath result, String email){
        String customerEmail = result.getString("payload.customer.emails.emailAddress[0]");
        //logUtils.logMessage("Email is : "+ customerEmail);
        assertThat(customerEmail, is(email));
    }
    
    public void verifyMobilePhoneNumber(JsonPath result, String phone){
        String phoneNumber = result.getString("payload.customer.phoneNumbers.phoneNumber[0]");
        //logUtils.logMessage("PhoneNumber is : "+ phoneNumber);
        assertThat(phoneNumber, is(phone));
    }
    
    public void verifySubscriptionVehicleStatus(JsonPath result, String expectedVehicleStatus){
        String vehicleStatus = result.getString("payload.subscription.vehicleStatus");
        //logUtils.logMessage("vehicleStatus is : "+ vehicleStatus);
        assertThat(vehicleStatus, is(expectedVehicleStatus));
    }


}
