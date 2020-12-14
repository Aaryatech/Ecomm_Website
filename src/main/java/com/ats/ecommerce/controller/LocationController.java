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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.common.EncodeDecode;
import com.atss.ecommerce.model.CategoryList;
import com.atss.ecommerce.model.CityData;
import com.atss.ecommerce.model.FEDataTraveller;
import com.atss.ecommerce.model.FETestimonial;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class LocationController {

	FEDataTraveller data = new FEDataTraveller();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String location(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		String returnPage = "landing";
		try {
			HttpSession session = request.getSession();
			Cookie[] cookieArray = request.getCookies();
			int isCookieFound = 0;
			if (cookieArray != null)
				for (int a = 0; a < cookieArray.length; a++) {
					if (cookieArray[a].getName().equalsIgnoreCase("custIdCookie")) {
						session.setAttribute("custId", Integer.parseInt(EncodeDecode.DecodeKey(cookieArray[a].getValue())));
						returnPage = "redirect:/home";
						isCookieFound = 1;
						break;
					}
				}
			if (cookieArray != null)
			for (int a = 0; a < cookieArray.length; a++) {
				if (cookieArray[a].getName().equalsIgnoreCase("frIdCookie")) {
					session.setAttribute("frId", Integer.parseInt(EncodeDecode.DecodeKey(cookieArray[a].getValue())));
					int frId=Integer.parseInt(EncodeDecode.DecodeKey(cookieArray[a].getValue()));

					ObjectMapper mapper = new ObjectMapper();
					data = mapper.readValue(new File(Constants.JSON_FILES_PATH +frId+"_.json"),
							FEDataTraveller.class);
					System.err.println("data " + data.toString());

					String dataList = new Scanner(new File(Constants.JSON_FILES_PATH+frId+"_.json"))
							.useDelimiter("\\Z").next();
					session.setAttribute("dataList", dataList);
					break;
				}
			}
			

			if (isCookieFound == 0) {
				System.err.println("In Else part of / Mapping ");
				ObjectMapper mapper = new ObjectMapper();
				CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH+"AllCityData_.json"),
						CityData[].class);
				List<CityData> cityList = new ArrayList<>(Arrays.asList(city));
				String frData = new Scanner(new File(Constants.JSON_FILES_PATH+"AllFrData_.json")).useDelimiter("\\Z").next();
 
				model.addAttribute("cityList", cityList);
				model.addAttribute("frData", frData);
				
				
				CategoryList[] catArray = mapper.readValue(new File(Constants.JSON_FILES_PATH+"MasterCategoryData_.json"),
						CategoryList[].class);
				List<CategoryList> catList = new ArrayList<>(Arrays.asList(catArray));
				model.addAttribute("catList", catList);
				model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);
				
				FETestimonial[] testMonArray = mapper.readValue(new File(Constants.JSON_FILES_PATH+"MasterTestimonialData_.json"),
						FETestimonial[].class);
				List<FETestimonial> testMonialList = new ArrayList<>(Arrays.asList(testMonArray));
				model.addAttribute("testMonialList", testMonialList);
				model.addAttribute("TestimonialImgUrl", Constants.TESTMON_IMG_VIEW_URL);
				returnPage = "landing";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnPage;
	}
	
	@RequestMapping(value = "/ak", method = RequestMethod.GET)
	public String ak(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		String returnPage = "location";
		try {
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
				CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH+"AllCityData_.json"),
						CityData[].class);
				List<CityData> cityList = new ArrayList<>(Arrays.asList(city));
				// System.out.println(cityList);
				String frData = new Scanner(new File(Constants.JSON_FILES_PATH+"AllFrData_.json")).useDelimiter("\\Z").next();
 
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
	
	//moreCakeStatusWise
	
	//product.html
	@RequestMapping(value = "/moreCakeStatusWise/{statusId}", method = RequestMethod.GET)
	public String moreCakeStatusWise(Model model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable int statusId) {
		String returnPage = "productlist";
		try {
			HttpSession session=request.getSession();
			
			int frId=(int) session.getAttribute("frId");
			ObjectMapper mapper = new ObjectMapper();
			data = mapper.readValue(new File(Constants.JSON_FILES_PATH +frId+"_.json"),
					FEDataTraveller.class);
			
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

			model.addAttribute("prodHeaderList", data.getFeProductHeadList());
			model.addAttribute("flavTagStatusList", data.getFlavorTagStatusList());

			model.addAttribute("statusId", statusId);
			 
		}catch (Exception e) {
			return returnPage;
		}
		
		return returnPage;
	}
	
}
