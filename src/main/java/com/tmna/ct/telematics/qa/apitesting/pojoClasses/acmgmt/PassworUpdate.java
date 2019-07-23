package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PassworUpdate {
	private String guid;

	private String objectId;
	private String password; 
	private String verificationCode; 

}
