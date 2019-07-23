package com.tmna.ct.telematics.qa.runner;

import java.io.File;

import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import org.junit.AfterClass;
import org.junit.runner.RunWith;

import com.cucumber.listener.Reporter;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(  features = { "src/test/resources/features" },
					glue = {"com.tmna.ct.telematics.qa.stepDefinitions" },
					strict = true, // will fail execution if there are undefined or																		// pending steps.
					dryRun = false, // checks if all the steps have the Step Definition.
					format = { "pretty", "html:target/site/accountmanagement/cucumber-pretty",
							   "json:target/reports/accountmanagement/cucumber.json" },
					monochrome = true, // display the console output																							// in much readable way
					plugin = { "pretty:STDOUT", "html:C:\\Workspace\\test-automation-framework\\Reports\\cucumber-pretty",
							   "json:C:\\Workspace\\test-automation-framework\\Reports\\cucumber-json\\cucumber.json",
							   "com.cucumber.listener.ExtentCucumberFormatter:C:\\Workspace\\test-automation-framework\\Reports\\cucumber-extent\\acm_Report.html" },
					tags = {
//                          "@acm_smoke"
//			                "@AcmOrchPost_smoke,@AcmDetails_smoke,@AcmUpdate_smoke,@session_smoke"
//			                "@AcmOrchPost_Regression,@AcmDetails_Regression,@AcmUpdate_Regression,@session_regression"
//           				"@AcCreateByAgent,@AcCreateByDealer,@AcSearchByGuid,@AcSearchByAgentUsingEmail,@AcSearchByAgentUsingPhone,@AcSearchByDealerUsingEmail,@AcSearchByDealerUsingPhone,@UpdatesEmail_By_Agents-Self,@UpdatesPhone_By_Agents-Self,@updateAddress_Regression,@logout_Regression,@resetPassword_regression"
      						"@AcCreateByAgent-Smoke"})

public class AccountMgmtRunner {

	@AfterClass
	public static void generateReport() {
		ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
		Reporter.loadXMLConfig(new File("Reports/extent-config.xml"));
		Reporter.setSystemInfo("User", System.getProperty("user.name"));
		Reporter.setSystemInfo("Environment", configProps.getProperty("ENVIRONMENT").toUpperCase());
		Reporter.setSystemInfo("OS", System.getProperty("os.name"));
		Reporter.setSystemInfo("Time Zone", System.getProperty("user.timezone"));
		Reporter.setTestRunnerOutput("Account Management Automation Tests");
		Reporter.assignAuthor("Rambabu Setticherla");
	}

	

}
