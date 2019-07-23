
package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Email {

    private String emailAddress;

    private String emailType;

    private String emailVerified;

    private String verificationDate;
    private String emailVerificationDate;

}
