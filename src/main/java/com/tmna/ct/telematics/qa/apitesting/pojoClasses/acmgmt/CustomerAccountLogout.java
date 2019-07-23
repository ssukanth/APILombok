package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CustomerAccountLogout {
	private String guid;
	private String objectId;

}
