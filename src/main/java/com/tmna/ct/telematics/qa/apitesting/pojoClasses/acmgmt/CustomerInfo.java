package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CustomerInfo {

    private String guid;
    private String objectId;
    private String emailType;
    private String emailAddress;
    private String emailVerified;
    private String emailVerificationDate;
    private String phoneType;
    private String countryCode;
    private String phoneNumber;
    private String phoneVerified;
    private String phoneVerificationDate;
    private String verificationDate;

}
