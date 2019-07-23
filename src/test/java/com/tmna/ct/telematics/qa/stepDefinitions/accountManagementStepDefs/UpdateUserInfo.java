package com.tmna.ct.telematics.qa.stepDefinitions.accountManagementStepDefs;

import static com.tmna.ct.telematics.qa.apitesting.common.ApiConstants.MISSINGBODY;
import static com.tmna.ct.telematics.qa.apitesting.common.ApiConstants.MISSINGHEADER;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.generateEmail;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getConfigAPI;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getEnvironmentName;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getJsonPathResult;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.getRandomPhoneNumber;
import static com.tmna.ct.telematics.qa.apitesting.library.APILibrary.verifyStatusCode;
import static io.restassured.RestAssured.baseURI;

import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

import org.assertj.core.api.BDDSoftAssertions;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tmna.ct.telematics.qa.apitesting.library.APILibrary;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.AcmConstants;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.Address;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerAddress;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerAddressUpdate;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerEmail;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerEmailUpdateRequest;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerInfo;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerInfoWithAddress;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerPasswordUpdate;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerPhone;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerPhoneUpdateRequest;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.CustomerUpdatePassword;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.Email;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.PassworUpdate;
import com.tmna.ct.telematics.qa.apitesting.pojoClasses.acmgmt.Phone;
import com.tmna.ct.telematics.qa.apitesting.utility.HeaderUtil;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.specification.RequestSpecification;

public class UpdateUserInfo {

	public String guid, objectId, countryCode;
	public static String customerType, email, phone, password;
	public static String generatedEmail, generatedPhoneNumber, gneratedFname, generatedLname;
	public static Address generatedAddress;
	public static CustomerInfoWithAddress customerInfo;
	public RequestSpecification request;
	public JsonPath result;
	Headers headers;
	private CustomerAddressUpdate requestBody;
	CustomerInfo customerInfoList[] = new CustomerInfo[3];

	CustomerInfoWithAddress customerInfoList1[] = new CustomerInfoWithAddress[3];
	ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
	BDDSoftAssertions softly = new BDDSoftAssertions();

	// Used in @UpdatesEmail_By_Agents-Self-(all scenarios)
	@Given("^The update Customer's Email PUT api service \"([^\"]*)\" is up$")
	public void the_update_Customer_s_Email_PUT_api_service_is_up(String basePath) throws Throwable {
		baseURI = configProps.getProperty("ORCH_PUT_PREFIX") + getEnvironmentName()
				+ configProps.getProperty("BASEURI_SUFFIX");
		request = getConfigAPI(basePath);
		// Reporter.addStepLog("BaseURI is '"+baseURI+"'");
	}

	// Used in @UpdatesEmail_By_Agents-Self-Positive
	@Given("^Tester uses the valid body parameters guid objectId emailType newEmailAddress \"([^\"]*)\" emailVerified verificationDate$")
	public void tester_uses_the_valid_body_parameters_guid_objectId_emailType_newEmailAddress_emailVerified_verificationDate(
			String newEmail) throws Throwable {

		generateBodyForUpdateEmail(customerInfoList[0].getGuid(), customerInfoList[0].getObjectId(),
				customerInfoList[0].getEmailType(), newEmail, customerInfoList[0].getEmailVerified(),
				customerInfoList[0].getEmailVerificationDate());

	}

	// Used in @UpdatesEmail_By_Agents-Self-(Positive, ExistedUser - for the 1st
	// account creation)
	@Then("^the server should return the guid objectId emailType emailAddress emailVerified verificationDate$")
	public void the_server_should_return_the_guid_objectId_emailType_emailAddress_emailVerified_verificationDate()
			throws Throwable {

		CustomerInfo customerInfo = buildCustomerInfoFromResponse();
		customerInfoList[0] = customerInfo;
		addReporterStepLogForEmailUpdate("Response payload has", customerInfo);

	}

	// Used in @UpdatesEmail_By_Agents-Self-ExistedUser (for the 2nd account
	// creation)
	@Then("^the server should return the newGuid newObjectId newEmailType newEmailAddress newEmailVerified newVerificationDate$")
	public void the_server_should_return_the_newGuid_newObjectId_newEmailType_newEmailAddress_newEmailVerified_newVerificationDate()
			throws Throwable {

		CustomerInfo customerInfo = buildCustomerInfoFromResponse();
		customerInfoList[1] = customerInfo;
		addReporterStepLogForEmailUpdate("Response payload has", customerInfo);

	}

	// Used in @UpdatesEmail_By_Agents-Self-ExistedUser
	@When("^Tester uses the body parameters guid objectId emailType emailVerified verificationDate with existedUserEmailAddress$")
	public void tester_uses_the_body_parameters_guid_objectId_emailType_emailVerified_verificationDate_with_existedUserEmailAddress()
			throws Throwable {

		generateBodyForUpdateEmail(customerInfoList[0].getGuid(), customerInfoList[0].getObjectId(),
				customerInfoList[0].getEmailType(), customerInfoList[1].getEmailAddress(),
				customerInfoList[0].getEmailVerified(), customerInfoList[0].getEmailVerificationDate());

	}

	// Used in @UpdatesEmail_By_Agents-Self-MissingBody(all negative scenarios)
	@When("^Tester uses the body parameters guid \"([^\"]*)\" objectId \"([^\"]*)\" emailType \"([^\"]*)\" newEmailAddress \"([^\"]*)\" emailVerified \"([^\"]*)\" verificationDate \"([^\"]*)\"$")
	public void tester_uses_the_body_parameters_guid_objectId_emailType_newEmailAddress_emailVerified_verificationDate(
			String guid, String objectId, String emailType, String emailAddress, String emailVerified,
			String verificationDate) throws Throwable {

		generateBodyForUpdateEmail(MISSINGBODY.equals(guid) ? "" : guid, MISSINGBODY.equals(objectId) ? "" : objectId,
				MISSINGBODY.equals(emailType) ? "" : emailType, MISSINGBODY.equals(emailAddress) ? "" : emailAddress,
				MISSINGBODY.equals(emailVerified) ? "" : emailVerified,
				MISSINGBODY.equals(verificationDate) ? "" : verificationDate);

	}

	// Used in @UpdatesEmail_By_Agents-Self-Positive
	@Then("^The Customer account should be updated with latest Email in ORCH and OCPR systems by returning the Status code \"([^\"]*)\"$")
	public void the_Customer_account_should_be_updated_with_latest_Email_in_ORCH_and_OCPR_systems_by_returning_the_Status_code(
			int statusCode) throws Throwable {

		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}

	// Used in @UpdatesEmail_By_Agents-Self-(all negative scenarios)
	@Then("^The Customer account should not be updated with latest Email in ORCH and OCPR systems by returning the Status code \"([^\"]*)\"$")
	public void the_Customer_account_should_not_be_updated_with_latest_Email_in_ORCH_and_OCPR_systems_by_returning_the_Status_code(
			int statusCode) throws Throwable {

		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}

	// Used in @UpdatesEmail_By_Agents-Self-Positive to verify the response when
	// Email is updated
	@Then("^The response must contains the updated email$")
	public void the_response_must_contains_the_updated_email() throws Throwable {

		CustomerInfo customerInfo = buildCustomerInfoFromResponse();
		// Reporter.addStepLog("Response has the New PhoneNumber:'"+
		// customerInfo.getEmailAddress() + "' GUID:'"+ customerInfo.getGuid() + "'
		// ObjectId :'"+ customerInfo.getObjectId()+"'");

		softly.then(customerInfo.getGuid()).isEqualTo(customerInfoList[0].getGuid());
		softly.then(customerInfo.getObjectId()).isEqualTo(customerInfoList[0].getObjectId());
		softly.then(customerInfo.getEmailAddress()).isEqualTo(generatedEmail);
		softly.assertAll();

	}

	// ********************************* Update Phone Number API Realated
	// StepDefs*************************************

	// Used in @UpdatesPhone_By_Agents-Self-(all scenarios)
	@Given("^The update Customer's Phone Number PUT api service \"([^\"]*)\" is up$")
	public void the_update_Customer_s_Phone_Number_PUT_api_service_is_up(String basePath) throws Throwable {
		baseURI = configProps.getProperty("ORCH_PUT_PREFIX") + getEnvironmentName()
				+ configProps.getProperty("BASEURI_SUFFIX");
		request = getConfigAPI(basePath);
		// Reporter.addStepLog("BaseURI is '"+baseURI+"'");
	}

	// Used in @UpdatesPhone_By_Agents-Self-Positive
	@When("^Tester uses the valid body parameters guid objectId phoneType countryCode newPhoneNumber \"([^\"]*)\" phoneVerified verificationDate$")
	public void tester_uses_the_valid_body_parameters_guid_objectId_phoneType_countryCode_newPhoneNumber_phoneVerified_verificationDate(
			String newPhone) throws Throwable {

		generateBodyForUpdatePhoneNumber(customerInfoList[0].getGuid(), customerInfoList[0].getObjectId(),
				customerInfoList[0].getPhoneType(), customerInfoList[0].getCountryCode(), newPhone,
				customerInfoList[0].getPhoneVerified(), customerInfoList[0].getPhoneVerificationDate());

	}

	// Used in @UpdatesPhone_By_Agents-Self-(Positive,ExistedUser - for the 1st
	// account creation)
	@Then("^the server should return the guid objectId phoneType countryCode phoneNumber phoneVerified verificationDate$")
	public void the_server_should_return_the_guid_objectId_phoneType_countryCode_phoneNumber_phoneVerified_verificationDate()
			throws Throwable {

		CustomerInfo customerInfo = buildCustomerInfoFromResponse();
		customerInfoList[0] = customerInfo;

		addReporterStepLogForPhoneNumberUpdate("Response after account creation has", customerInfo);
	}

	// Used in @UpdatesPhone_By_Agents-Self-ExistedUser (for the 2nd account
	// creation)
	@Then("^the server should return the newGuid newObjectId newPhoneType newCountryCode newPhoneNumber newPhoneVerified newVerificationDate$")
	public void the_server_should_return_the_newGuid_newObjectId_newPhoneType_newCountryCode_newPhoneNumber_newPhoneVerified_newVerificationDate()
			throws Throwable {

		CustomerInfo customerInfo = buildCustomerInfoFromResponse();
		customerInfoList[1] = customerInfo;
		addReporterStepLogForPhoneNumberUpdate("Response after account creation has", customerInfo);

	}

	// Used in @UpdatesPhone_By_Agents-Self-ExistedUser
	@When("^Tester uses the body parameters guid objectId phoneType countryCode phoneVerified verificationDate with existedUserPhoneNumber$")
	public void tester_uses_the_body_parameters_guid_objectId_phoneType_countryCode_phoneVerified_verificationDate_with_existedUserPhoneNumber()
			throws Throwable {

		generateBodyForUpdatePhoneNumber(customerInfoList[0].getGuid(), customerInfoList[0].getObjectId(),
				customerInfoList[0].getPhoneType(), customerInfoList[0].getCountryCode(),
				customerInfoList[1].getPhoneNumber(), customerInfoList[0].getPhoneVerified(),
				customerInfoList[0].getPhoneVerificationDate());

	}

	// Used in @UpdatesPhone_By_Agents-Self-Positive
	@Then("^The Customer account should be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code \"([^\"]*)\"$")
	public void the_Customer_account_should_be_updated_with_latest_phoneNumber_in_ORCH_and_OCPR_systems_by_returning_the_Status_code(
			int statusCode) throws Throwable {

		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}

	// Used in @UpdatesPhone_By_Agents-Self_(all negative scenarios)
	@When("^Tester uses the body parameters guid \"([^\"]*)\" objectId \"([^\"]*)\" phoneType \"([^\"]*)\" countryCode \"([^\"]*)\" newPhoneNumber \"([^\"]*)\" phoneVerified \"([^\"]*)\" verificationDate \"([^\"]*)\"$")
	public void tester_uses_the_body_parameters_guid_objectId_phoneType_countryCode_newPhoneNumber_phoneVerified_verificationDate(
			String guid, String objectId, String phoneType, String countryCode, String phoneNumber,
			String phoneVerified, String verificationDate) throws Throwable {

		generateBodyForUpdatePhoneNumber(MISSINGBODY.equals(guid) ? "" : guid,
				MISSINGBODY.equals(objectId) ? "" : objectId, MISSINGBODY.equals(phoneType) ? "" : phoneType,
				MISSINGBODY.equals(countryCode) ? "" : countryCode, MISSINGBODY.equals(phoneNumber) ? "" : phoneNumber,
				MISSINGBODY.equals(phoneVerified) ? "" : phoneVerified,
				MISSINGBODY.equals(verificationDate) ? "" : verificationDate);

	}

	// Used in @UpdatesPhone_By_Agents-Self_(all negative scenarios)
	@Then("^The Customer account should not be updated with latest phoneNumber in ORCH and OCPR systems by returning the Status code \"([^\"]*)\"$")
	public void the_Customer_account_should_not_be_updated_with_latest_phoneNumber_in_ORCH_and_OCPR_systems_by_returning_the_Status_code(
			int statusCode) throws Throwable {

		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}

	// Used in @UpdatesPhone_By_Agents-Self-Positive to Verify the response when
	// phoneNumber is updated
	@Then("^The response must contains the updated Phone Number$")
	public void the_response_must_contains_the_updated_Phone_Number() throws Exception {

		CustomerInfo customerInfo = buildCustomerInfoFromResponse();

		// Reporter.addStepLog("Response has the New PhoneNumber:'"+
		// customerInfo.getPhoneNumber() + "' GUID:'"+ customerInfo.getGuid() + "'
		// ObjectId :'"+ customerInfo.getObjectId()+"'");

		softly.then(customerInfo.getGuid()).isEqualTo(customerInfoList[0].getGuid());
		softly.then(customerInfo.getObjectId()).isEqualTo(customerInfoList[0].getObjectId());
		softly.then(customerInfo.getPhoneNumber()).isEqualTo(generatedPhoneNumber);
		softly.assertAll();

	}

	// ********Start - Update Customer Address API Step Defs*********************

	@Given("^The update Customer's information PUT api service \"([^\"]*)\" is up$")
	public void the_update_Customer_s_information_PUT_api_service_is_up(String basePath) throws Throwable {
		baseURI = configProps.getProperty("ORCH_PUT_PREFIX") + getEnvironmentName()
				+ configProps.getProperty("BASEURI_SUFFIX");
		request = getConfigAPI(basePath);
		// Reporter.addStepLog("BaseURI is '"+baseURI+"'");
	}

	@Then("^The Customer account should be updated with latest information in ORCH and OCPR systems by returning the Status code \"([^\"]*)\"$")
	public void the_Customer_account_should_be_updated_with_latest_information_in_ORCH_and_OCPR_systems_by_returning_the_Status_code(
			int statusCode) throws Throwable {
		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}

	// ********Start - Update Customer Address API Step Defs*********************

	private CustomerInfo buildCustomerInfoFromResponse() {
		return CustomerInfo.builder().guid(APILibrary.result.getString("payload.customer.guid"))
				.objectId(APILibrary.result.getString("payload.customer.objectId"))
				.emailType(APILibrary.result.getString("payload.customer.emails.emailType[0]"))
				.emailAddress(APILibrary.result.getString("payload.customer.emails.emailAddress[0]"))
				.emailVerified(APILibrary.result.getString("payload.customer.emails.emailVerified[0]"))
				.emailVerificationDate(APILibrary.result.getString("payload.customer.emails.verificationDate[0]"))
				.phoneType(APILibrary.result.getString("payload.customer.phoneNumbers.phoneType[0]"))
				.countryCode(APILibrary.result.getString("payload.customer.phoneNumbers.countryCode[0]"))
				.phoneNumber(APILibrary.result.getString("payload.customer.phoneNumbers.phoneNumber[0]"))
				.phoneVerified(APILibrary.result.getString("payload.customer.phoneNumbers.phoneVerified[0]"))
				.phoneVerificationDate(APILibrary.result.getString("payload.customer.phoneNumbers.verificationDate[0]"))
				.build();
	}

	private void generateBodyForUpdateEmail(String guid, String objectId, String emailType, String emailAddress,
			String emailVerified, String verificationDate) throws Exception {

		if ("sendThroughCode".equalsIgnoreCase(emailAddress)) {
			emailAddress = generateEmail(emailAddress);
		} else if ("null".equalsIgnoreCase(emailAddress)) {
			emailAddress = null;
		}

		CustomerEmailUpdateRequest requestBody = new CustomerEmailUpdateRequest();

		Email email = Email.builder().emailType("null".equals(emailType) ? null : emailType)
				.emailAddress("null".equals(emailAddress) ? null : emailAddress)
				.emailVerified("null".equals(emailVerified) ? null : emailVerified)
				.verificationDate("null".equals(verificationDate) ? null : verificationDate).build();

		CustomerEmail customer = CustomerEmail.builder().guid("null".equals(guid) ? null : guid)
				.objectId("null".equals(objectId) ? null : objectId).emails(Arrays.asList(email)).build();
		requestBody.setCustomer(customer);
		ObjectMapper mapper = new ObjectMapper();
		request.body(mapper.writeValueAsString(requestBody));

		generatedEmail = emailAddress;

	}

	public void generateBodyForUpdatePhoneNumber(String guid, String objectId, String phoneType, String countryCode,
			String phoneNumber, String phoneVerified, String verificationDate) throws Exception {

		if ("sendThroughCode".equalsIgnoreCase(phoneNumber)) {
			phoneNumber = getRandomPhoneNumber();
		} else if ("null".equalsIgnoreCase(phoneNumber)) {
			phoneNumber = null;
		}

		CustomerPhoneUpdateRequest requestBody = new CustomerPhoneUpdateRequest();
		Phone phone = Phone.builder().phoneNumber("null".equals(phoneNumber) ? null : phoneNumber)
				.phoneType("null".equals(phoneType) ? null : phoneType)
				.countryCode("null".equals(countryCode) ? null : countryCode)
				.phoneVerified("null".equals(phoneVerified) ? null : phoneVerified)
				.verificationDate("null".equals(verificationDate) ? null : verificationDate).build();
		CustomerPhone customer = CustomerPhone.builder().guid("null".equals(guid) ? null : guid)
				.objectId("null".equals(objectId) ? null : objectId).phoneNumbers(Arrays.asList(phone)).build();

		requestBody.setCustomer(customer);
		ObjectMapper mapper = new ObjectMapper();
		request.body(mapper.writeValueAsString(requestBody));
		generatedPhoneNumber = phoneNumber;

	}

	private void addReporterStepLogForEmailUpdate(String prefixMsg, CustomerInfo customerInfo) {
		/*
		 * Reporter.addStepLog( prefixMsg + " - guid:'"+ customerInfo.getGuid() +
		 * "' objectId:'"+ customerInfo.getObjectId() + "' emailType:'"+
		 * customerInfo.getEmailType()+ "' EmailAddress:'"+
		 * customerInfo.getEmailAddress()+ "' emailVerified:'"+
		 * customerInfo.getEmailVerified()+ "' verificationDate:'"+
		 * customerInfo.getEmailVerificationDate()+ "'" );
		 */
	}

	private void addReporterStepLogForPhoneNumberUpdate(String prefixMsg, CustomerInfo customerInfo) {
		/*
		 * Reporter.addStepLog( prefixMsg + " - guid:'"+ customerInfo.getGuid() +
		 * "' ObjectId:'"+ customerInfo.getObjectId() + "' PhoneType:'"+
		 * customerInfo.getPhoneType()+ "' CountryCode:'"+
		 * customerInfo.getCountryCode()+ "' PhoneNumber:'"+
		 * customerInfo.getPhoneNumber()+ "' PhoneVerified:'"+
		 * customerInfo.getPhoneVerified()+ "' verificationDate:'"+
		 * customerInfo.getPhoneVerificationDate()+ "'" );
		 */
	}

	@Then("^the server should return the guid objectId FirstName lastName EmailAddress PhoneNumber and no address$")
	public void the_server_should_return_the_guid_objectId_FirstName_lastName_EmailAddress_PhoneNumber_and_no_address()
			throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		customerInfo = buildCustomerInfoFromResponseForAddressupdate();
		customerInfoList1[0] = customerInfo;
		addReporterStepLogForAddressUpdate("Response payload has", customerInfo);

	}

	@Then("^the server should return the guid objectId FirstName lastName EmailAddress PhoneNumber and HOME address$")
	public void the_server_should_return_the_guid_objectId_FirstName_lastName_EmailAddress_PhoneNumber_and_HOME_address()
			throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		customerInfo = buildCustomerInfoFromResponseForAddressupdate();
		customerInfoList1[0] = customerInfo;
		addReporterStepLogForAddressUpdate("Response payload has", customerInfo);
	}

	private void addReporterStepLogForAddressUpdate(String prefixMsg, CustomerInfoWithAddress customerInfo) {
		/*
		 * Reporter.addStepLog( prefixMsg + " - guid:'"+ customerInfo.getGuid() +
		 * "' objectId:'"+ customerInfo.getObjectId() + "' emailType:'"+
		 * customerInfo.getEmailType()+ "' EmailAddress:'"+
		 * customerInfo.getEmailAddress()+ "' emailVerified:'"+
		 * customerInfo.getEmailVerified()+ "' verificationDate:'"+
		 * customerInfo.getEmailVerificationDate()+ "'" );
		 */
	}

	private CustomerInfoWithAddress buildCustomerInfoFromResponseForAddressupdate() {
		Address address = Address.builder()
				.addressType(APILibrary.result.getString("payload.customer.addresses.addressType[0]"))
				.address(APILibrary.result.getString("payload.customer.addresses.address[0]"))
				.city(APILibrary.result.getString("payload.customer.addresses.city[0]"))
				.country(APILibrary.result.getString("payload.customer.addresses.country[0]"))
				.state(APILibrary.result.getString("payload.customer.addresses.state[0]"))
				.zipCode(APILibrary.result.getString("payload.customer.addresses.zipCode[0]")).build();
		CustomerInfoWithAddress build = CustomerInfoWithAddress.builder()
				.guid(APILibrary.result.getString("payload.customer.guid"))
				.objectId(APILibrary.result.getString("payload.customer.objectId"))
				.firstName(APILibrary.result.getString("payload.customer.firstName"))
				.lastName(APILibrary.result.getString("payload.customer.lastName")).addresses(Arrays.asList(address))
				.build();
		return build;
	}

	private void generateBodyForUpdateAddress(String guid2, String objectId2, String fname, String lname,
			String addressType, String address, String city, String state, String country, String Zip)
			throws JsonProcessingException {
		// TODO Auto-generated method stub
		String firstName, lastName;
		CustomerAddressUpdate requestBody = new CustomerAddressUpdate();
		if (fname.equals("")) {
			firstName = customerInfo.getFirstName();
		} else {
			firstName = fname;
		}

		if (lname.equals("")) {
			lastName = customerInfo.getLastName();
		}

		else {
			lastName = lname;
		}
		Address add = null;

		CustomerAddress customer1 = null;
		if (addressType.equals("")) {

			add = Address.builder()
					.addressType(APILibrary.result.getString("payload.customer.addresses.addressType[0]"))
					.address(APILibrary.result.getString("payload.customer.addresses.address[0]"))
					.city(APILibrary.result.getString("payload.customer.addresses.city[0]"))
					.country(APILibrary.result.getString("payload.customer.addresses.country[0]"))
					.state(APILibrary.result.getString("payload.customer.addresses.state[0]"))
					.zipCode(APILibrary.result.getString("payload.customer.addresses.zipCode[0]")).build();

			customer1 = CustomerAddress.builder().guid("null".equals(guid2) ? null : guid2)
					.objectId("null".equals(objectId2) ? null : objectId2)
					.firstName("null".equals(firstName) ? null : firstName)
					.lastName("null".equals(lastName) ? null : lastName).addresses(Arrays.asList(add)).build();
		} else {
			add = Address.builder().addressType("null".equals(addressType) ? null : addressType)
					.address("null".equals(address) ? null : address).city("null".equals(city) ? null : city)
					.state("null".equals(state) ? null : state).zipCode("null".equals(Zip) ? null : Zip)
					.country("null".equals(country) ? null : country).build();
			customer1 = CustomerAddress.builder().guid("null".equals(guid2) ? null : guid2)
					.objectId("null".equals(objectId2) ? null : objectId2)
					.firstName("null".equals(firstName) ? null : firstName)
					.lastName("null".equals(lastName) ? null : lastName).addresses(Arrays.asList(add)).build();
		}
		requestBody.setCustomer(customer1);
		ObjectMapper mapper = new ObjectMapper();
		String jsonBody = mapper.writeValueAsString(requestBody);
		request.body(jsonBody);
		generatedAddress = add;
		gneratedFname = firstName;
		generatedLname = lastName;

	}

	@Then("^The response must contains the updated address information FirstName and LastName$")
	public void the_response_must_contains_the_updated_address_information_FirstName_and_LastName() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		CustomerInfoWithAddress customerInfo1 = buildCustomerInfoFromResponseForAddressupdate();
		// Reporter.addStepLog("Response has the New PhoneNumber:'"+
		// customerInfo.getEmailAddress() + "' GUID:'"+ customerInfo.getGuid() + "'
		// ObjectId :'"+ customerInfo.getObjectId()+"'");
		softly.then(customerInfo1.getGuid()).isEqualTo(customerInfoList1[0].getGuid());
		softly.then(customerInfo1.getObjectId()).isEqualTo(customerInfoList1[0].getObjectId());
		softly.then(customerInfo1.getFirstName()).isEqualTo(gneratedFname);
		softly.then(customerInfo1.getLastName()).isEqualTo(generatedLname);
		softly.then(customerInfo1.getAddresses().get(0).getAddress()).isEqualTo(generatedAddress.getAddress());
		softly.then(customerInfo1.getAddresses().get(0).getAddressType()).isEqualTo(generatedAddress.getAddressType());
		softly.then(customerInfo1.getAddresses().get(0).getCity()).isEqualTo(generatedAddress.getCity());
		softly.then(customerInfo1.getAddresses().get(0).getState()).isEqualTo(generatedAddress.getState());
		softly.then(customerInfo1.getAddresses().get(0).getCountry()).isEqualTo(generatedAddress.getCountry());
		softly.then(customerInfo1.getAddresses().get(0).getZipCode()).isEqualTo(generatedAddress.getZipCode());
		softly.assertAll();
	}

	@When("^Tester uses the body parameters guid \"([^\"]*)\" objectId \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" addressType \"([^\"]*)\" address \"([^\"]*)\" city \"([^\"]*)\" state \"([^\"]*)\" zipCode \"([^\"]*)\" country \"([^\"]*)\"$")
	public void tester_uses_the_body_parameters_guid_objectId_firstName_lastName_addressType_address_city_state_zipCode_country(
			String guid, String objectId, String firstName, String lastName, String addressType, String address,
			String city, String state, String zipCode, String country) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		generateBodyForUpdateAddress(guid, objectId, firstName, lastName, addressType, address, city, state, zipCode,
				country);
		/*
		 * generateBodyForUpdateAddress(MISSINGBODY.equals(guid) ? "" : guid,
		 * MISSINGBODY.equals(objectId) ? "" : objectId, MISSINGBODY.equals(firstName) ?
		 * "" : firstName, MISSINGBODY.equals(lastName) ? "" : lastName,
		 * MISSINGBODY.equals(addressType) ? "" : addressType,
		 * MISSINGBODY.equals(address) ? "" : address, MISSINGBODY.equals(city) ? "" :
		 * city, MISSINGBODY.equals(state) ? "" : state, MISSINGBODY.equals(zipCode) ?
		 * "" : zipCode, MISSINGBODY.equals(country) ? "" : country);
		 */

	}

	@Then("^The Customer account should not be updated with latest information in ORCH and OCPR systems by returning the Status code \"([^\"]*)\"$")
	public void the_Customer_account_should_not_be_updated_with_latest_information_in_ORCH_and_OCPR_systems_by_returning_the_Status_code(
			int statusCode) throws Throwable {
		// Write code here that turns the phrase above into concrete actions

		verifyStatusCode(statusCode);
		result = getJsonPathResult();
	}

	@When("^Tester uses the body parameter guid \"([^\"]*)\" objectId \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" addressType \"([^\"]*)\" address \"([^\"]*)\" city \"([^\"]*)\" state \"([^\"]*)\" zipCode \"([^\"]*)\" country \"([^\"]*)\"$")
	public void tester_uses_the_body_parameter_guid_objectId_firstName_lastName_addressType_address_city_state_zipCode_country(
			String guid, String objectId, String firstName, String lastName, String addressType, String address,
			String city, String state, String zipCode, String country) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		generateBodyForUpdateAddress(guid, objectId, firstName, lastName, addressType, address, city, state, country,
				zipCode);
	}

	@When("^Tester uses the valid body parameters guid objectId firstName \"([^\"]*)\" lastName \"([^\"]*)\" addressType \"([^\"]*)\" address \"([^\"]*)\" city \"([^\"]*)\" state \"([^\"]*)\" zipCode \"([^\"]*)\" country \"([^\"]*)\"$")
	public void tester_uses_the_valid_body_parameters_guid_objectId_firstName_lastName_addressType_address_city_state_zipCode_country(
			String firstName, String lastName, String addressType, String address, String city, String state,
			String zipCode, String country) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		generateBodyForUpdateAddress(customerInfoList1[0].getGuid(), customerInfoList1[0].getObjectId(), firstName,
				lastName, addressType, address, city, state, country, zipCode);
	}

	@Then("^The response must contains the WORK Address FirstName LastName along with HOME address$")
	public void the_response_must_contains_the_WORK_Address_FirstName_LastName_along_with_HOME_address()
			throws Throwable {
		CustomerInfoWithAddress customerInfo1 = buildCustomerInfoFromResponseForAddressupdate1();
		// Write code here that turns the phrase above into concrete actions
		softly.then(customerInfo1.getGuid()).isEqualTo(customerInfoList1[0].getGuid());
		softly.then(customerInfo1.getObjectId()).isEqualTo(customerInfoList1[0].getObjectId());
		softly.then(customerInfo1.getFirstName()).isEqualTo(gneratedFname);
		softly.then(customerInfo1.getLastName()).isEqualTo(generatedLname);
		softly.assertAll();
		if (customerInfo.getAddresses().get(0).getAddressType().equals(generatedAddress.getAddressType())) {
			softly.then(customerInfo.getAddresses().get(0).getAddress()).isEqualTo(generatedAddress.getAddress());
			softly.then(customerInfo.getAddresses().get(0).getAddressType())
					.isEqualTo(generatedAddress.getAddressType());
			softly.then(customerInfo.getAddresses().get(0).getCity()).isEqualTo(generatedAddress.getCity());
			softly.then(customerInfo.getAddresses().get(0).getState()).isEqualTo(generatedAddress.getState());
			softly.then(customerInfo.getAddresses().get(0).getCountry()).isEqualTo(generatedAddress.getCountry());
			softly.then(customerInfo.getAddresses().get(0).getZipCode()).isEqualTo(generatedAddress.getZipCode());
			softly.assertAll();
		} else if (customerInfo1.getAddresses().get(0).getAddressType().equals("")) {
			softly.then(customerInfo.getAddresses().get(0).getAddress()).isEqualTo(generatedAddress.getAddress());
			softly.then(customerInfo.getAddresses().get(0).getAddressType())
					.isEqualTo(generatedAddress.getAddressType());
			softly.then(customerInfo.getAddresses().get(0).getCity()).isEqualTo(generatedAddress.getCity());
			softly.then(customerInfo.getAddresses().get(0).getState()).isEqualTo(generatedAddress.getState());
			softly.then(customerInfo.getAddresses().get(0).getCountry()).isEqualTo(generatedAddress.getCountry());
			softly.then(customerInfo.getAddresses().get(0).getZipCode()).isEqualTo(generatedAddress.getZipCode());
			softly.assertAll();
		} else {
			softly.then(customerInfo1.getAddresses().get(0).getAddress()).isEqualTo(generatedAddress.getAddress());
			softly.then(customerInfo1.getAddresses().get(0).getAddressType())
					.isEqualTo(generatedAddress.getAddressType());
			softly.then(customerInfo1.getAddresses().get(0).getCity()).isEqualTo(generatedAddress.getCity());
			softly.then(customerInfo1.getAddresses().get(0).getState()).isEqualTo(generatedAddress.getState());
			softly.then(customerInfo1.getAddresses().get(0).getCountry()).isEqualTo(generatedAddress.getCountry());
			softly.then(customerInfo1.getAddresses().get(0).getZipCode()).isEqualTo(generatedAddress.getZipCode());
			softly.assertAll();
		}
	}

	private CustomerInfoWithAddress buildCustomerInfoFromResponseForAddressupdate1() {
		// TODO Auto-generated method stub
		Address address = Address.builder()
				.addressType(APILibrary.result.getString("payload.customer.addresses[1].addressType"))
				.address(APILibrary.result.getString("payload.customer.addresses[1].address"))
				.city(APILibrary.result.getString("payload.customer.addresses[1].city"))
				.country(APILibrary.result.getString("payload.customer.addresses[1].country"))
				.state(APILibrary.result.getString("payload.customer.addresses[1].state"))
				.zipCode(APILibrary.result.getString("payload.customer.addresses[1].zipCode")).build();
		CustomerInfoWithAddress build = CustomerInfoWithAddress.builder()
				.guid(APILibrary.result.getString("payload.customer.guid"))
				.objectId(APILibrary.result.getString("payload.customer.objectId"))
				.firstName(APILibrary.result.getString("payload.customer.firstName"))
				.lastName(APILibrary.result.getString("payload.customer.lastName")).addresses(Arrays.asList(address))
				.build();
		return build;
	}

	@When("^Testers uses the body parameter guid \"([^\"]*)\" objectId \"([^\"]*)\" firstName \"([^\"]*)\" lastName \"([^\"]*)\" addressType \"([^\"]*)\" address \"([^\"]*)\" city \"([^\"]*)\" state \"([^\"]*)\" zipCode \"([^\"]*)\" country \"([^\"]*)\"$")
	public void testers_uses_the_body_parameter_guid_objectId_firstName_lastName_addressType_address_city_state_zipCode_country(
			String guid, String objectId, String firstName, String lastName, String addressType, String address,
			String city, String state, String zipCode, String country) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		generateBodyForUpdateAddress1(guid, objectId, firstName, lastName, addressType, address, city, state, country,
				zipCode);
	}

	private void generateBodyForUpdateAddress1(String guid2, String objectId2, String fname, String lname,
			String addressType, String address, String city, String state, String country, String Zip)
			throws JsonProcessingException {
		// TODO Auto-generated method stub
		CustomerAddressUpdate requestBody = new CustomerAddressUpdate();
		Address add = Address.builder().addressType("null".equals(addressType) ? null : addressType)
				.address("null".equals(address) ? null : address).city("null".equals(city) ? null : city)
				.state("null".equals(state) ? null : state).zipCode("null".equals(Zip) ? null : Zip)
				.country("null".equals(country) ? null : country).build();
		CustomerAddress customer1 = CustomerAddress.builder().guid("null".equals(guid2) ? null : guid2)
				.objectId("null".equals(objectId2) ? null : objectId2).firstName("null".equals(fname) ? null : fname)
				.lastName("null".equals(lname) ? null : lname).addresses(Arrays.asList(add)).build();
		requestBody.setCustomer(customer1);
		ObjectMapper mapper = new ObjectMapper();
		String jsonBody = mapper.writeValueAsString(requestBody);
		request.body(jsonBody);
		generatedAddress = add;

	}

	
	

	@Given("^Tester calls the update Password POST api at \"([^\"]*)\"$")
	public void tester_calls_the_update_Password_POST_api_at(String basePath) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		baseURI = configProps.getProperty("ORCH_PUT_PREFIX") + getEnvironmentName()
				+ configProps.getProperty("BASEURI_SUFFIX");
		request = getConfigAPI(basePath);

	}

	@When("^Tester uses the valid body parameter guid objectId verificationCode and password \"([^\"]*)\"$")
	public void tester_uses_the_valid_body_parameter_guid_objectId_verificationCode_and_password(String password)
			throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		PassworUpdate build = PassworUpdate.builder().guid("null".equals(VerificationCode.guid) ? null : VerificationCode.guid)
				.objectId("null".equals(VerificationCode.objectId) ? null : VerificationCode.objectId)
				.verificationCode(APILibrary.result.getString("verificationCode")).password("null".equals(password) ? null : password).build();
		CustomerUpdatePassword req = new CustomerUpdatePassword();
		req.setCustomer(build);
		ObjectMapper mapper = new ObjectMapper();
		String jsonBody = mapper.writeValueAsString(req);
		request.body(jsonBody);

	}

	@When("^Tester uses the body parameters guid \"([^\"]*)\" and objectId \"([^\"]*)\" verificationCode \"([^\"]*)\" newPassword \"([^\"]*)\"$")
	public void tester_uses_the_body_parameters_guid_and_objectId_verificationCode_newPassword(String guid, String objectId,
			 String verificationCode, String password) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		PassworUpdate updatedCustomer = PassworUpdate.builder().guid("null".equals(guid) ? null : guid).objectId("null".equals(objectId) ? null : objectId).password("null".equals(password) ? null : password)
															   .verificationCode("null".equals(verificationCode) ? null : verificationCode).build();
		CustomerUpdatePassword req = new CustomerUpdatePassword();
		req.setCustomer(updatedCustomer);
		ObjectMapper mapper = new ObjectMapper();
		String jsonBody = mapper.writeValueAsString(req);
		request.body(jsonBody);
	}
	@When("^Tester uses the body parameters guid \"([^\"]*)\" objectId \"([^\"]*)\" newPassword \"([^\"]*)\" and verificationCode \"([^\"]*)\"$")
	public void tester_uses_the_body_parameters_guid_objectId_newPassword_and_verificationCode(String guid, String objectId, String password, String verificationCode) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
		
		PassworUpdate updatedCustomer = PassworUpdate.builder().guid("null".equals(guid) ? null : guid)
				.objectId("null".equals(objectId) ? null : objectId)
				.password("null".equals(password) ? null : password)
				.verificationCode("null".equals(verificationCode) ? null : verificationCode).build();
		CustomerUpdatePassword req = new CustomerUpdatePassword();
		req.setCustomer(updatedCustomer);
		ObjectMapper mapper = new ObjectMapper();
		String jsonBody = mapper.writeValueAsString(req);
		request.body(jsonBody);
	}


}
