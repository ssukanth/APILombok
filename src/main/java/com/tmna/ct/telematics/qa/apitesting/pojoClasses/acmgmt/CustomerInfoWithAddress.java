package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import java.util.List;

import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerInfo.CustomerInfoBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CustomerInfoWithAddress {
	

    private String guid;
    private String objectId;
    private String firstName;
    private String lastName;
    private List<Address> addresses;
}
