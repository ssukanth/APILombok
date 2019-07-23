package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import java.util.List;


import lombok.Builder;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomerPhone {

	private String guid;

    private String objectId;

    private List<Phone> phoneNumbers;

}
