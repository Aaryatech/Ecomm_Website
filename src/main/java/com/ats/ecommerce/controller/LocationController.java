package com.ats.ecommerce.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Scanner;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.atss.ecommerce.model.CityData;
import com.atss.ecommerce.model.FEDataTraveller;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class LocationController {

	FEDataTraveller data = new FEDataTraveller();

	@RequestMapping(value = "/a", method = RequestMethod.GET)
	public String location(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		String returnPage = "location";
		try {
			Cookie[] cookieArray = request.getCookies();
			int isCookieFound = 0;
			/*
			 * if (cookieArray != null) for (int a = 0; a < cookieArray.length; a++) { //
			 * if(cookieArray[a].getName().equalsIgnoreCase("custIdCookie")) { if
			 * (cookieArray[a].getName().equalsIgnoreCase("custIdCookie")) {
			 * System.err.println("In If "); HttpSession session = request.getSession();
			 * session.setAttribute("custIdCookie", cookieArray[a].getValue()); returnPage =
			 * "redirect:/home"; isCookieFound = 1;
			 * 
			 * ObjectMapper mapper = new ObjectMapper(); data = mapper.readValue(new
			 * File("/home/ubuntu/Documents/apache-tomcat-8.51.38/webapps/IMG_UP/4_.json"),
			 * FEDataTraveller.class); System.err.println("data " +data.toString()); break;
			 * } }
			 */

			if (isCookieFound == 0) {
				System.err.println("In Else ");
				ObjectMapper mapper = new ObjectMapper();
				CityData[] city = mapper.readValue(new File("/home/lenovo/Documents/pdf/" + "AllCityData_.json"),
						CityData[].class);
				List<CityData> cityList = new ArrayList<>(Arrays.asList(city));
				// System.out.println(cityList);
				String frData = new Scanner(new File("/home/lenovo/Documents/pdf/AllFrData_.json")).useDelimiter("\\Z").next();
 
				model.addAttribute("cityList", cityList);
				model.addAttribute("frData", frData);
				returnPage = "location";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnPage;
		// return "location";
	}
}
