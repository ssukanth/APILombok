package com.tmna.ct.telematics.qa.runner;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;
/**
 * 
 * @author Henry Peng
 * 
 * To Run the JIT Automated tests, please set ENVIRONMENT = stg in the file /test-automation-framework/config.properties
 *
 */

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"src/test/resources/features"}
        ,glue = {"com.tmna.ct.telematics.qa.stepDefinitions"}
        ,strict = false // will fail execution if there are undefined or pending steps.
        ,dryRun = false //checks if all the steps have the Step Definition.
        ,plugin = { "pretty", "html:target/site/integration/cucumber-pretty","json:target/reports/integration/cucumber.json" }
        ,monochrome = false // display the console output in much readable way
        ,tags = {" @DataSetUp,"
        		+ "@CreateAccountAddVehicleCreateSubscription,"
        		+ "@RemoveMultipleSubscribedVehicles,"
        		+ "@CreateAccountAddVehicleWithVinNotInSystem,"
        		+ "@SearchAccountByPhoneNumber,"
        		+ "@SearchAccountByEmail,"
        		+ "@CreateAccountForExistingCustomerWithPhoneNumber,"
        		+ "@CreateAccountForExistingCustomerWithEmailAddress,"
        		+ "@AddLexusVinToToyotaPortal,"
        		+ "@AddToyotaVinToLexusPortal,"
        		+ "@CreateAccountAddVehicleCreateSuccessfulSubscriptionWithoutDataConsent,"
        		+ "@CreateAccountAddVehicleCreateSubscriptionWaiveMyFreeTrial"}
)

public class IntegrationTestRunner {}
