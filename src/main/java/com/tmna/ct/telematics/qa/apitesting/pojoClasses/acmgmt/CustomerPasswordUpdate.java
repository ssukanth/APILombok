package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomerPasswordUpdate {
	private String guid;

	private String objectId;
	private String purpose;
	}
