package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;

public class AcmConstants {
	public static String generateOtpbasepath="/v1/account/code";
	public static String getVerificationCodePrefix="https://avcd-automation.";
	public static String getOtpbasepath="/account/code";
	public static String contentType="application/json";
	public static String xBRAND="T";
	public static String xCHANNEL="US_SELF_AZURE";
	public static String xCORRELATIONID="123e4567-e89b-12d3-a456-426655440000";
	public static String authorization="icZBMDlw2XOtuTLIZkfeFi1vTE8QXr4lr8tA6b7t";
    public static final boolean EXECUTE_FROM_LOCAL;

    static {
        ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
        EXECUTE_FROM_LOCAL = Boolean.parseBoolean(configProps.getProperty("EXECUTE_FROM_LOCAL")) ;

    }
}
