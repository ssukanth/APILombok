package com.tmna.ct.telematics.qa.apitesting.common;

public class ApiConstants {

    public static final String DDMMYYYYHHMMSSSSS = "ddMMyyyyHHmmssSSS";
    public static final String PHONE = "MMddHHmmss";
    public static final String MISSINGHEADER = "MissingHeader";
    public static final String MISSINGBODY = "MissingBody";
    public static final String YOPMAIL_DOMAIN = "@yopmail.com";


    /*
     * Request Body Constants
     */
    public static final String CUSTOMER_TYPE_BUSINESS = "BUSINESS";

    /*
     * Header Constants
     */
    public static final String CONTENT_TYPE = "CONTENT-TYPE";
    public static final String X_BRAND = "X-BRAND";
    public static final String X_CHANNEL = "X-CHANNEL";
    public static final String X_CORRELATIONID = "X-CORRELATIONID";
    public static final String AUTHORIZATION = "AUTHORIZATION";

    /*
     * Response descriptions/messages, detailed descriptions
     */
    public static final String REQUEST_EXECUTED_SUCCESSFULLY = "Request Executed Successfully";
    public static final String CUSTOMER_UPDATED_SUCCESSFULLY = "Customer updated Successfully";
    public static final String MANDATORY_HEADER_MISSING_MESSAGE = "Mandatory Header Attribute(s) Missing";
    public static final String MANDATORY_HEADER_INVALID_MESSAGE = "Incorrect/Invalid Header Values";
    public static final String CUSTOMER_FOUND_DETAILED_MESSAGE = "Customer Found";
    public static final String USER_NOT_FOUND_MESSAGE = "User Not Found";
    public static final String CUSTOMER_RECORD_NOT_FOUND_MESSAGE = "No customer found with the criteria";
    public static final String INTERNAL_SERVER_ERROR = "Internal Server Error Occurred";
    public static final String MANDATORY_REQUEST_BODY_ATTR_MISSING_MESSAGE = "Mandatory Request Body Attributes Missing";
    public static final String MANDATORY_REQUEST_BODY_ATTR_INVALID_MESSAGE = "Incorrect/Invalid Request Body Attribute(s)";
    public static final String USER_ALREADY_EXISTS_MESSAGE = "User Already Exists";
    public static final String ORCH_UNAUTHORIZED_REQUEST_MESSAGE = "Unauthorized";

    /*
     * Response codes
     */

    public static final String ORCH_UNAUTHORIZED_REQUEST_CODE = "ORCH-0015";
    public static final String REQUEST_SUCCESSFUL_CODE = "ORCH-0000";
    public static final String MANDATORY_HEADER_MISSING_CODE = "ORCH-0001";
    public static final String MANDATORY_HEADER_INVALID_CODE = "ORCH-0002";
    public static final String INTERNAL_SERVER_ERROR_CODE = "ORCH-0006";
    public static final String USER_NOT_FOUND_CODE = "ORCH-0011";
    public static final String USER_ALREADY_EXISTS_CODE = "ORCH-0010";
    public static final String MANDATORY_REQUEST_BODY_ATTR_MISSING_CODE = "ORCH-0003";
    public static final String MANDATORY_REQUEST_BODY_ATTR_INVALID_CODE = "ORCH-0004";



}
