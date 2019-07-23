package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import java.util.List;

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
public class CreateCustomerAccountWithAddress {
	 public String guid;
	    public String objectId;
	    public String customerType;
	    public String firstName;
	    public String lastName;
	    public String email;
	    public String phoneNumber;
	   private List<Address> addresses;
}
