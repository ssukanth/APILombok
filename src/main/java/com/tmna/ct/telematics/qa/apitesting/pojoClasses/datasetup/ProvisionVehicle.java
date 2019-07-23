package com.tmna.ct.telematics.qa.apitesting.pojoClasses.datasetup;

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
public class ProvisionVehicle {
    public String brand;
    public String headUnit;
    public String asiCode;
    public String dcmType;
    public int quantity;
    public String katashikiCode;
    public List<String> systems;
}
