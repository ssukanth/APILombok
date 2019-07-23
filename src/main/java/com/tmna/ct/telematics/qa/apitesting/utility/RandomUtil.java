package com.tmna.ct.telematics.qa.apitesting.utility;

import static io.restassured.RestAssured.*;
import org.apache.commons.lang.StringUtils;

import java.util.Random;


public class RandomUtil {

	public static final String randomVin = "http://www.randomvin.com/getvin.php?type=fake";
	public static final Random random = new Random();

	public String getRandomVin() {
		try {
			String vin = get(randomVin).asString();
			return (StringUtils.trimToNull(vin) == null) ? "1G3NL14U0MM0" + this.randomNums(5) : vin;
		} catch (Exception e) {
			return "1G3NL14U0MM0" + this.randomNums(5);
		}
	}
	
	public String getRandomSubscriberGuid(int length) {
		String subscriberGuid = "";
		for (int i = 0; i < length; i++) {
			String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
			if ("char".equalsIgnoreCase(charOrNum)) {
				subscriberGuid += (char) (random.nextInt(26) + 97); //a ~ z 
			} else if ("num".equalsIgnoreCase(charOrNum)) {
				subscriberGuid += String.valueOf(random.nextInt(10)); // 0 ~ 9
			}
		}
		return subscriberGuid;
	}
	
	public String getRandomSubscriptionID(int length) {

		return "ESEL1R3KLMJ9N9999-" + randomNums(length);
	
	}

	private String randomNums(int length) {
		String randomNums = "";
		for (int i = 0; i < length; i++) {
			int num = random.nextInt(10);
			randomNums += Integer.toString(num);
		}
		return randomNums;
	}

}
