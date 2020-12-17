package com.ats.ecommerce.common;

import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

//Sachin 03-11-2020
//Desc - Constants fields

public class Constants {
	/*
	 * Tril Store Server Path public static final String
	 * JSON_FILES_PATH="/opt/apache-tomcat-8.5.39/webapps/PROD_IMG_UP/"; public
	 * static final String
	 * CAT_IMG_VIEW_URL="http://198.12.156.31:8080/PROD_IMG_UP/"; public static
	 * final String PROD_IMG_VIEW_URL="http://198.12.156.31:8080/PROD_IMG_UP/";
	 */

	// Sachin Local Path
	/*
	 * private final static String
	 * BASEPATH_URL="/home/ubuntu/Documents/apache-tomcat-8.51.38/webapps/"; private
	 * final static String IP_URL ="http://192.168.2.14:8080/";
	 */
	
	
	private final static String BASEPATH_URL="/opt/apache-tomcat-8.5.39/webapps/";
	private final static String IP_URL ="http://198.12.156.31:8080/";

	
	public static final String JSON_FILES_PATH = BASEPATH_URL+"IMG_UP/";

	public static final String CAT_IMG_VIEW_URL = IP_URL+"OFFER_IMG_UP/";
	public static final String PROD_IMG_VIEW_URL = IP_URL+"PROD_IMG_UP/";
	public static final String TESTMON_IMG_VIEW_URL = IP_URL+"IMG_UP/";

	public static final String UPLOAD_URL = BASEPATH_URL+"IMG_UP/";

	public static final String PROD_IMG_UPLOAD_URL = BASEPATH_URL+"IMG_UP/";

	public static final String FEST_IMG_VIEW_URL = IP_URL+"IMG_UP/";

	public static final String PROFILE_IMG_VIEW_URL = IP_URL+"IMG_UP/";

	public static RestTemplate rest = new RestTemplate();

	//public static String url="http://localhost:8094/";
	 public static final String url ="http://198.12.156.31:8080/EcomAPI/";


	public static String[] imageFileExtensions={"jpg","jpeg","png"};

	public static RestTemplate getRestTemplate() {
		rest = new RestTemplate();
		rest.getInterceptors().add(new BasicAuthorizationInterceptor("aaryatech", "Aaryatech@1cr"));
		return rest;

	}
}
