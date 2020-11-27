package com.ats.ecommerce.common;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

public class EncodeDecode {

	
	public static String DecodeKey(String str) {

		String decrypt = new String();
		try {

			Decoder theDecoder = Base64.getDecoder();
			byte[] byteArray = theDecoder.decode(str);
			decrypt = new String(byteArray, StandardCharsets.UTF_8); 

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		return decrypt;

	}
	
	public static String Encrypt(String str) {

		String encrypt = new String();
		try {

			Encoder theEncoder = Base64.getEncoder();
			byte[] theArray = str.getBytes(StandardCharsets.UTF_8);
			encrypt = theEncoder.encodeToString(theArray);

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		return encrypt;

	}
	
}
