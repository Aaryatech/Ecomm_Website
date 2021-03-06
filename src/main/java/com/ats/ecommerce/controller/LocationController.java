package com.ats.ecommerce.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Random;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.common.EncodeDecode;
import com.ats.ecommerce.common.SMSUtility;
import com.ats.ecommerce.model.CategoryList;
import com.ats.ecommerce.model.CityData;
import com.ats.ecommerce.model.CompanyTestomonials;
import com.ats.ecommerce.model.FEDataTraveller;
import com.ats.ecommerce.model.FETestimonial;
import com.ats.ecommerce.model.Info;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class LocationController {

	FEDataTraveller data = new FEDataTraveller();
	@RequestMapping(value = "/ShowAddNewAdd", method = RequestMethod.GET)
	public String addNewAdd(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		String returnPage = "landing";
		
		try {
			model.addAttribute("isAddNewAdd", 1);
			System.err.println("In  returnPage = landing ShowAddNewAdd ");
			ObjectMapper mapper = new ObjectMapper();
			CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
					CityData[].class);
			List<CityData> cityList = new ArrayList<>(Arrays.asList(city));
			String frData = new Scanner(new File(Constants.JSON_FILES_PATH + "AllFrData_.json")).useDelimiter("\\Z")
					.next();
			
			//System.err.println("FR --------------> "+frData);
			
			model.addAttribute("cityList", cityList);
			model.addAttribute("frData", frData);
			model.addAttribute("userType", 3);
			
			CategoryList[] catArray = mapper.readValue(
					new File(Constants.JSON_FILES_PATH + "MasterCategoryData_.json"), CategoryList[].class);
			List<CategoryList> catList = new ArrayList<>(Arrays.asList(catArray));
			model.addAttribute("catList", catList);
			model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);

			CompanyTestomonials[] testMonArray = mapper.readValue(
					new File(Constants.JSON_FILES_PATH + "MasterTestimonialData_.json"), CompanyTestomonials[].class);
			List<CompanyTestomonials> testMonialList = new ArrayList<>(Arrays.asList(testMonArray));
			model.addAttribute("testMonialList", testMonialList);
			model.addAttribute("TestimonialImgUrl", Constants.TESTMON_IMG_VIEW_URL);
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return returnPage;
		
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String location(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		String returnPage = "landing";
		System.err.println("In landing");
		try {

			HttpSession session = request.getSession();
			try {
				int custId=(int) session.getAttribute("custId");
				System.err.println("custId In /" +custId);
				if(custId>0) {
					System.err.println("If");
					session.setAttribute("isAddressPopup", 0);
				}else {
					System.err.println("Else");
					session.setAttribute("isAddressPopup", 1);
				}
			}catch (Exception e) {
				System.err.println("Catch");
				session.setAttribute("isAddressPopup", 1);
			}
			Cookie[] cookieArray = request.getCookies();
			int isCookieFound = 0;
			if (cookieArray != null)
				for (int a = 0; a < cookieArray.length; a++) {
					if (cookieArray[a].getName().equalsIgnoreCase("custIdCookie")) {
						System.out.println("custIdCookie " +cookieArray[a].getName());
						session.setAttribute("custId",
								Integer.parseInt(EncodeDecode.DecodeKey(cookieArray[a].getValue())));
						int custId=(int) session.getAttribute("custId");
						System.err.println("custId In cookie found and set /" +custId);
						returnPage = "redirect:/home";
						isCookieFound = 1;
						break;
					}
				}
			if (cookieArray != null) {
				try {
					for (int a = 0; a < cookieArray.length; a++) {
						if (cookieArray[a].getName().equalsIgnoreCase("frIdCookie")) {
							session.setAttribute("frId",
									Integer.parseInt(EncodeDecode.DecodeKey(cookieArray[a].getValue())));
							int frId = Integer.parseInt(EncodeDecode.DecodeKey(cookieArray[a].getValue()));

							ObjectMapper mapper = new ObjectMapper();
							data = mapper.readValue(new File(Constants.JSON_FILES_PATH + frId + "_.json"),
									FEDataTraveller.class);
							//System.err.println("data " + data.toString());

							String dataList = new Scanner(new File(Constants.JSON_FILES_PATH + frId + "_.json"))
									.useDelimiter("\\Z").next();
							session.setAttribute("dataList", dataList);
							break;
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			if (cookieArray != null) {
				try {
					for (int a = 0; a < cookieArray.length; a++) {
						if (cookieArray[a].getName().equalsIgnoreCase("landMarkCookie")) {
							session.setAttribute("landMark",
								EncodeDecode.DecodeKey(cookieArray[a].getValue()));
							
						}
						
						if (cookieArray[a].getName().equalsIgnoreCase("frKmCookie")) {
							session.setAttribute("frKm",
								EncodeDecode.DecodeKey(cookieArray[a].getValue()));
						}
						
						if (cookieArray[a].getName().equalsIgnoreCase("delAddIdCookie")) {
							session.setAttribute("delAddId",
									Integer.parseInt(EncodeDecode.DecodeKey(cookieArray[a].getValue())));
						}
						
					}
				} catch (Exception e) {
					
				}
			}
			
			if (isCookieFound == 0) {
				System.err.println("In Else part of / Mapping ");
				ObjectMapper mapper = new ObjectMapper();
				CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
						CityData[].class);
				List<CityData> cityList = new ArrayList<>(Arrays.asList(city));
				String frData = new Scanner(new File(Constants.JSON_FILES_PATH + "AllFrData_.json")).useDelimiter("\\Z")
						.next();
				
				//System.err.println("FR --------------> "+frData);

				model.addAttribute("cityList", cityList);
				model.addAttribute("frData", frData);
 
				CategoryList[] catArray = mapper.readValue(
						new File(Constants.JSON_FILES_PATH + "MasterCategoryData_.json"), CategoryList[].class);
				List<CategoryList> catList = new ArrayList<>(Arrays.asList(catArray));
				model.addAttribute("catList", catList);
				model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);

				CompanyTestomonials[] testMonArray = mapper.readValue(
						new File(Constants.JSON_FILES_PATH + "MasterTestimonialData_.json"), CompanyTestomonials[].class);
				List<CompanyTestomonials> testMonialList = new ArrayList<>(Arrays.asList(testMonArray));
				model.addAttribute("testMonialList", testMonialList);
				model.addAttribute("TestimonialImgUrl", Constants.TESTMON_IMG_VIEW_URL);
				model.addAttribute("isAddNewAdd", 0);
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
				CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
						CityData[].class);
				List<CityData> cityList = new ArrayList<>(Arrays.asList(city));
				// System.out.println(cityList);
				String frData = new Scanner(new File(Constants.JSON_FILES_PATH + "AllFrData_.json")).useDelimiter("\\Z")
						.next();

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

	// moreCakeStatusWise

	// product.html
	@RequestMapping(value = "/moreCakeStatusWise/{statusId}", method = RequestMethod.GET)
	public String moreCakeStatusWise(Model model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable int statusId) {
		String returnPage = "productlist";
		try {
			HttpSession session = request.getSession();

			int frId = (int) session.getAttribute("frId");
			ObjectMapper mapper = new ObjectMapper();
			data = mapper.readValue(new File(Constants.JSON_FILES_PATH + frId + "_.json"), FEDataTraveller.class);

			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

			model.addAttribute("prodHeaderList", data.getFeProductHeadList());
			model.addAttribute("flavTagStatusList", data.getFlavorTagStatusList());

			model.addAttribute("statusId", statusId);
			model.addAttribute("isEvent", 0);
			model.addAttribute("allListFilter", 0);
			
		} catch (Exception e) {
			return returnPage;
		}

		return returnPage;
	}

	//Sachin 04-01-2021
	
	
	
	@RequestMapping(value = "/setAddressDetail", method = RequestMethod.POST)
	public @ResponseBody Object setAddressDetail(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			
			//#1
			int frId = Integer.parseInt(request.getParameter("frId"));
			
			session.setAttribute("frId",frId);

			Cookie frIdCookie = new Cookie("frIdCookie", EncodeDecode.Encrypt("" + frId));
			frIdCookie.setMaxAge(60 * 60 * 24 * 15);
			response.addCookie(frIdCookie);
			
			//#2
			String landMark=request.getParameter("landMark");
			
			session.setAttribute("landMark", landMark);
			
			Cookie landMarkCookie = new Cookie("landMarkCookie", EncodeDecode.Encrypt(landMark));
			landMarkCookie.setMaxAge(60 * 60 * 24 * 15);
			response.addCookie(landMarkCookie);
			
			//#3
			float frKm = Float.parseFloat(request.getParameter("frKm"));
			
			session.setAttribute("frKm",frKm);
			
			Cookie frKmCookie = new Cookie("frKmCookie", EncodeDecode.Encrypt("" + frKm));
			frKmCookie.setMaxAge(60 * 60 * 24 * 15);
			response.addCookie(frKmCookie);
			
			//#4
			int adDetailId= Integer.parseInt(request.getParameter("custDetailId"));
			
			session.setAttribute("delAddId",adDetailId);
			
			Cookie delAddIdCookie = new Cookie("delAddIdCookie", EncodeDecode.Encrypt("" +adDetailId));
			delAddIdCookie.setMaxAge(60 * 60 * 24 * 15);
			response.addCookie(delAddIdCookie);
			
			
			System.err.println("In setAddressDetail");
		}catch (Exception e) {
			System.err.println("In setAddressDetail exc " +e.getMessage());

		}
		return 1;
}
	//sendOTP Sachin 05-01-2020
	@RequestMapping(value = "/sendOTP", method = RequestMethod.POST)
	public @ResponseBody Info sendOTP(Model model, HttpServletRequest request, HttpServletResponse response) {
		String otp="";
		Info info=new Info();
		try {
			HttpSession session = request.getSession();
			String mobNo=request.getParameter("mobNo");
			System.err.println("Mob no  " +mobNo);
			Random random = new Random();

			otp= String.format("%05d", random.nextInt(100003));
			System.err.println("Mob no  " +mobNo +"otp  " + otp);
			//info=SMSUtility.sendSMS(mobNo, "Your OTP for Monginis Login is " +otp);
			info.setMsg(otp);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	
}
