package com.tmna.ct.telematics.qa.apitesting.utility;

import org.bson.Document;

import com.google.gson.JsonObject;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
//import com.tmna.ct.logging.ILogService;
//import com.tmna.ct.logging.LogFactory;
import com.tmna.ct.telematics.qa.apitesting.library.ConfiguratorSupport;


public class DatabaseUtil {

    private static ConfiguratorSupport configProps = new ConfiguratorSupport("config.properties");
    private static String dbHost;
    
    
    /**
     * @author Henry Peng
     * @return DB Host base on the DB environment
     */
    public String getDbHost() {
    	if (configProps.getProperty("ENVIRONMENT").equalsIgnoreCase(Constants.ENV_QA)) {
    		dbHost = configProps.getProperty("DB_HOST_QA");
    	} else if (configProps.getProperty("ENVIRONMENT").equalsIgnoreCase(Constants.ENV_DEV)) {
    		dbHost = configProps.getProperty("DB_HOST_DEV");
    	}
		return dbHost;
    }
    
    /**
     * @author Henry Peng
     * @return mongoClent base on the DB environment
     */
    public MongoClient getMongoClient() {
    	MongoClientURI uri = new MongoClientURI("mongodb://" + 
 				configProps.getProperty("DB_USERNAME") + ":" +
 				configProps.getProperty("DB_PASSWORD") + "@" +
 				this.getDbHost() + ":" +
 				configProps.getProperty("DB_PORT") + "/?ssl=true");
    	MongoClient mongoClient = new MongoClient(uri);
 		return mongoClient;
    }
    
    /**
     * @author Henry Peng
     * @param dbName			database name
     * @param collectionName	collection name
     * @param query				query
     * @return the ducument json object 
     */
    public JsonObject getDBQueryResult(String dbName, String collectionName, BasicDBObject query) {
    	MongoClient mongoClient = this.getMongoClient();

 		MongoDatabase database = mongoClient.getDatabase(dbName);
 		MongoCollection<Document> collection = database.getCollection(collectionName);
 		//The query result should be unique
 		FindIterable<Document> document = collection.find(query);
 		JsonObject queryResult = null;;
 		try {
 	 		//queryResult = CommonUtils.stringToJson(document.first().toJson());
		} catch (Exception e) {
			//logUtils.logErrorInfo("Trying to get the first DB document but get error!");
		} finally {
	 		mongoClient.close();
		}
 		return queryResult;
     }
    
    /**
     * @author Henry Peng
     * @param dbName			database name
     * @param collectionName	collection name
     * @param query				query
     */
    public void removeDBDocument(String dbName, String collectionName, BasicDBObject query) {
    	MongoClient mongoClient = this.getMongoClient();
    	
 		MongoDatabase database = mongoClient.getDatabase(dbName);
 		MongoCollection<Document> collection = database.getCollection(collectionName);
 		
 		//The query result should be unique
 		FindIterable<Document> document = collection.find(query);
 		try {
 	 		collection.findOneAndDelete(document.first());
		} catch (Exception e) {
			//logUtils.logErrorInfo("Trying to delete DB document but get error!");
		} finally {
			mongoClient.close();
		}
    }

}
