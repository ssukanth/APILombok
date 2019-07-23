package com.tmna.ct.telematics.qa.apitesting.utility;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.restassured.http.Headers;
import lombok.AllArgsConstructor;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;

import io.restassured.http.Header;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HeaderUtil {

	private String contentType;
	private String xBrand;
	private String xChannel;
	private String xCorrelationId;
	private String authorization;
	private String dateTime;
	private String acceptEncoding;
	private String guid;
	private String email;
	private String phone;
	private String asicode;
	private String hwtype;
	private String generation;
	private String region;
	private String xApiKey;
	
	private static final String TEST_ENV = "test.env";
	private static final String CONSTANT_XAPIKEY_STG = "AIzaSyC3Svb8m0sOBwTWTAVw_E-YbAk2T12-RbU";//For stg
	private static final String CONSTANT_XAPIKEY = "AIzaSyBSEJEpDc-HjYnBAtEndq1MfbBR6d6QkI8";//Both for qa and dev
    
    private static ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
    
	/**
	 * Set up headers according to different APIs dynamically
	 * 
	 * @return the headers that'll be sent with the request
	 */
	public Headers setHeaders() {
		List<Header> headerList = new ArrayList<>();
		if (StringUtils.trimToNull(contentType) != null) {
			headerList.add(new Header(Constants.HEADER_CONTENTTYPE, contentType));
		}
		if (StringUtils.trimToNull(guid) != null) {
			headerList.add(new Header(Constants.HEADER_GUID, guid));
		}
		if (StringUtils.trimToNull(xBrand) != null) {
			headerList.add(new Header(Constants.HEADER_XBRAND, xBrand));
		}
		if (StringUtils.trimToNull(xChannel) != null) {
			headerList.add(new Header(Constants.HEADER_XCHANNEL, xChannel));
		}
		if (StringUtils.trimToNull(xCorrelationId) != null) {
			if ("sendThroughCode".equalsIgnoreCase(xCorrelationId)) {
				headerList.add(new Header(Constants.HEADER_XCORRELATIONID, APILibrary.getRandomUUID()));
			} else {
				headerList.add(new Header(Constants.HEADER_XCORRELATIONID, xCorrelationId));
			}
		}
		if (StringUtils.trimToNull(authorization) != null) {
			headerList.add(new Header(Constants.HEADER_AUTHORIZATION, authorization));
		}
		if (StringUtils.trimToNull(dateTime) != null) {
			headerList.add(new Header(Constants.HEADER_DATETIME, dateTime));
		}
		if (StringUtils.trimToNull(acceptEncoding) != null) {
			headerList.add(new Header(Constants.HEADER_ACCEPTENCODING, acceptEncoding));
		}
		if (StringUtils.trimToNull(email) != null) {
			headerList.add(new Header(Constants.HEADER_EMAIL, email));
		}
		if (StringUtils.trimToNull(phone) != null) {
			headerList.add(new Header(Constants.HEADER_PHONE, phone));
		}
		if (StringUtils.trimToNull(asicode) != null) {
			headerList.add(new Header(Constants.HEADER_ASICODE, asicode));
		}
		if (StringUtils.trimToNull(hwtype) != null) {
			headerList.add(new Header(Constants.HEADER_HWTYPE, hwtype));
		}
		if (StringUtils.trimToNull(generation) != null) {
			headerList.add(new Header(Constants.HEADER_GENERATION, generation));
		}
		if (StringUtils.trimToNull(region) != null) {
			headerList.add(new Header(Constants.HEADER_REGION, region));
		}
		if (StringUtils.trimToNull(xApiKey) != null) {
			if ("sendThroughCode".equalsIgnoreCase(xApiKey)) {
				headerList.add(new Header(Constants.HEADER_XAPIKEY, HeaderUtil.getXApiKey()));
			}
		}
		return new Headers(headerList);
	}
	
    public static String getXApiKey() {
    	if (System.getProperty(TEST_ENV) == null) { // Run from Local
    		if (configProps.getProperty("ENVIRONMENT").equalsIgnoreCase(Constants.ENV_STG)){
    			return CONSTANT_XAPIKEY_STG;
    		} else {
    			return CONSTANT_XAPIKEY;
    		}
		} else { // Run from Jenkins
			if (System.getProperty(TEST_ENV).equalsIgnoreCase(Constants.ENV_STG)) {
				return CONSTANT_XAPIKEY_STG;
			}else {
    			return CONSTANT_XAPIKEY;
    		}
		}
    }

}
