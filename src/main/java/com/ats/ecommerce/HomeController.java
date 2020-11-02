package com.ats.ecommerce;

import java.io.File;
import java.io.InputStream;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.atss.ecommerce.model.FEDataTraveller;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class HomeController {
	 FEDataTraveller data=new FEDataTraveller();
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String location(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		String returnPage = "location";
		try {
			Cookie[] cookieArray = request.getCookies();
			int isCookieFound = 0;
			if (cookieArray != null)
				for (int a = 0; a < cookieArray.length; a++) {
					// if(cookieArray[a].getName().equalsIgnoreCase("custIdCookie")) {
					if (cookieArray[a].getName().equalsIgnoreCase("custIdCookie")) {
						System.err.println("In If ");
						HttpSession session = request.getSession();
						session.setAttribute("custIdCookie", cookieArray[a].getValue());
						returnPage = "home";
						isCookieFound = 1;
						
						///home/ubuntu/Documents/apache-tomcat-8.51.38/webapps/IMG_UP/
						/*
						 * InputStream inJson = FEDataTraveller.class.getResourceAsStream(
						 * "/home/ubuntu/Documents/apache-tomcat-8.51.38/webapps/IMG_UP/4_.json");
						 * System.err.println("inJson " +inJson); FEDataTraveller sample = new
						 * ObjectMapper().readValue(inJson, FEDataTraveller.class);
						 * System.err.println("sample " +sample.toString());
						 */
						
						 ObjectMapper mapper = new ObjectMapper();
						  data = mapper.readValue(new
						 File("/home/ubuntu/Documents/apache-tomcat-8.51.38/webapps/IMG_UP/4_.json"),
						 FEDataTraveller.class);
						 System.err.println("data " +data.toString());
						break;
					}
				}

			if (isCookieFound == 0) {
				System.err.println("In Else ");

				Cookie custCookie = new Cookie("custIdCookie", "" + 5);
				custCookie.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(custCookie);

				returnPage = "location";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnPage;
		// return "location";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String x = (String) session.getAttribute("custIdCookie");
		System.err.println("Cust Id  " + x);
		System.err.println("Cate List  " + data.getFranchiseCatList().toString());

		return "home";
	}

	@RequestMapping(value = "/landing", method = RequestMethod.GET)
	public String landing(Locale locale, Model model) {
		return "landing";
	}

	@RequestMapping(value = "/productlist", method = RequestMethod.GET)
	public String productList(Locale locale, Model model) {
		return "productlist";
	}

	@RequestMapping(value = "/productdetail", method = RequestMethod.GET)
	public String productDetail(Locale locale, Model model) {
		return "productdetail";
	}

	@RequestMapping(value = "/addresslist", method = RequestMethod.GET)
	public String addressList(Locale locale, Model model) {
		return "addresslist";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Locale locale, Model model) {
		return "profile";
	}

	@RequestMapping(value = "/orderhistory", method = RequestMethod.GET)
	public String orderHistory(Locale locale, Model model) {
		return "orderhistory";
	}

	@RequestMapping(value = "/viewcart", method = RequestMethod.GET)
	public String viewCart(Locale locale, Model model) {
		return "viewcart";
	}

	@RequestMapping(value = "/likeproducts", method = RequestMethod.GET)
	public String likeProducts(Locale locale, Model model) {
		return "likeproducts";
	}

	@RequestMapping(value = "/viewmap", method = RequestMethod.GET)
	public String viewMap(Locale locale, Model model) {
		return "viewmap";
	}

}
