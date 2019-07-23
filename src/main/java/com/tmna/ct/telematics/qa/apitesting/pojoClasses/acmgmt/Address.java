package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Address {

    private String address;

    private String addressType;

    private String city;

    private String country;

    private String state;

    private String zipCode;

}