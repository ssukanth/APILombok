package com.tmna.ct.telematics.qa.apitesting.utility;


/**
 * This class contains constant variables used for CTP test automation.
 * @author
 * @version 1.0
 */
public class Constants {

    /**
     * Adding a explicit constructor to avoid initialization.
     * Throws a illegal state exception when a object is created.
     */
    private Constants(){
        throw new IllegalStateException("Constants");
    }
    
    
    /**
     * Env Constants
     */
	public static final String ENV_QA = "qa";
	public static final String ENV_DEV = "dev";
	public static final String ENV_STG = "stg";
	

    /**
     * Header Constants
     */
	public static final String HEADER_CONTENTTYPE = "Content-Type";
	public static final String HEADER_XBRAND = "X-BRAND";
	public static final String HEADER_XCHANNEL = "X-CHANNEL";
	public static final String HEADER_XCORRELATIONID = "X-CORRELATIONID";
	public static final String HEADER_AUTHORIZATION = "Authorization";
	public static final String HEADER_DATETIME = "DATETIME";
	public static final String HEADER_ACCEPTENCODING = "Accept-Encoding";
	public static final String HEADER_GUID = "guid";
	public static final String HEADER_EMAIL = "email";
	public static final String HEADER_PHONE = "phone";
	public static final String HEADER_ASICODE = "asi-code";
	public static final String HEADER_HWTYPE = "hw-type";
	public static final String HEADER_GENERATION = "generation";
	public static final String HEADER_REGION = "region";
	public static final String HEADER_XAPIKEY = "x-api-key";
	public static final String HEADER_VIN = "vin";

}
