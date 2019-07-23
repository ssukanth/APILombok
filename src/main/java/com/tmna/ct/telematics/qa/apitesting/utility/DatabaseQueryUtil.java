package com.tmna.ct.telematics.qa.apitesting.utility;

import lombok.AllArgsConstructor;
import com.mongodb.BasicDBObject;

@AllArgsConstructor
public class DatabaseQueryUtil {


	protected String vin;
	protected String modelCode;
	protected String subscriptionID;
	protected String emailAddress;
	protected String vehiclesVin;

	/**
	 * @author Henry Peng
	 * @param dbName 		database name
	 * @param collection    collection name
	 * @return the dynamic queries that will send to database for query
	 */
	public BasicDBObject setQueries(String dbName, String collection) {
		BasicDBObject query = new BasicDBObject();
		
		switch (dbName) {
		case "subscription-management":
			if (collection.equalsIgnoreCase("subscription") || collection.equalsIgnoreCase("historySubscription")) {
				if (vin != null) {
					query.put("vin", vin);
				}
				if (subscriptionID != null) {
					query.put("subscriptions.subscriptionID", subscriptionID);
				}
			}
			break;
		case "OCPR":
			if (collection.equalsIgnoreCase("customer")) {
				if (emailAddress != null)
					query.put("emails.emailAddress", emailAddress);

			}
			break;
		case "vehicle-association":
			if (collection.equalsIgnoreCase("vehicle-association")) {
				if (vehiclesVin != null)
					query.put("vehicles.vin", vehiclesVin);

			}

			break;
			
		case "consolidated-vehicle-store":
			if (collection.equalsIgnoreCase("vehicle")) {
				if (vin != null) {
					query.put("vehicle.vin", vin);
				}
			}
			if (collection.equalsIgnoreCase("model-codes")) {
				if (modelCode != null) {
					query.put("model-codes.modelCode", modelCode);
				}
			}

			break;
			
		default:
			break;
		}

		return query;
	}
}
