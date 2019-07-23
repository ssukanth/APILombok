package com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt;

import java.util.List;

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
public class CustomerEmail {

	private String guid;

	private String objectId;

    private List<Email> emails;

}
