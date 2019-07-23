package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreateCustomerAcount_ORCH_Pojo {
    public String guid;
    public String objectId;
    public String customerType;
    public String firstName;
    public String lastName;
    public String email;
    public String phoneNumber;
    public String password;
    public String emailType;
    public String emailAddress;
    public String emailVerified;
    public String verificationDate;
    public String phoneType;
    public String countryCode;
    public String phoneVerified;


}