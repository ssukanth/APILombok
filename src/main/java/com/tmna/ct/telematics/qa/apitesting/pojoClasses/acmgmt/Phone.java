
package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Phone {

    private String countryCode;
    
    private String phoneVerified;

    private String phoneNumber;

    private String phoneType;

    private String verificationDate;
    private String phoneVerificationDate;

}
