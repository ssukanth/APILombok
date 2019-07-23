package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.Address;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Customer {

	 private String firstName;

	   private String guid;

	   private String objectId;

	   private String lastName;

	   private String middleInitial;

	   private String organizationName;

	   private String preferredLanguage;

	   private String createSource;

	   private String lastUpdateSource;

	   private List<String> affiliateIdentifier;

	   private List<Address> addresses;

	   private Long lastUpdateDate;

	   private Long createDate;

//	    private List<Phone> phoneNumbers;
	//
//	    private List<Email> emails;

//    private List<Phone> phoneNumbers;
//
//    private List<Email> emails;

}