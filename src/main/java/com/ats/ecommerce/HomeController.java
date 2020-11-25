package com.ats.ecommerce;

import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ats.ecommerce.common.CommonUtility;
import com.ats.ecommerce.common.Constants;
import com.atss.ecommerce.model.FEDataTraveller;
import com.atss.ecommerce.model.FEProductHeader;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")

public class HomeController {

	FEDataTraveller data = new FEDataTraveller();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String location(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		String returnPage = "location";
		try {
			HttpSession session = request.getSession();
			Cookie[] cookieArray = request.getCookies();
			int isCookieFound = 0;
			if (cookieArray != null)
				for (int a = 0; a < cookieArray.length; a++) {
					// if(cookieArray[a].getName().equalsIgnoreCase("custIdCookie")) {
					if (cookieArray[a].getName().equalsIgnoreCase("custIdCookie")) {
						System.err.println("In If ");
						session.setAttribute("custIdCookie", cookieArray[a].getValue());
						returnPage = "redirect:/home";
						isCookieFound = 1;

						ObjectMapper mapper = new ObjectMapper();
						data = mapper.readValue(new File(Constants.JSON_FILES_PATH + "27_.json"),
								FEDataTraveller.class);
						System.err.println("data " + data.toString());

						String dataList = new Scanner(new File(Constants.JSON_FILES_PATH + "27_.json"))
								.useDelimiter("\\Z").next();
						// System.err.println(" dataList " +dataList);
						session.setAttribute("dataList", dataList);

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
			// session.setAttribute("curDateTime", CommonUtility.getCurrentYMDDateTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnPage;
		// return "location";
	}

	// Modified By -Sachin
	// Modific Date -03-11-2020
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String x = (String) session.getAttribute("custIdCookie");
		session.setAttribute("custId", 1);
		session.setAttribute("companyId", 1);
		// System.err.println("Cate List " + data.getFranchiseCatList().toString());

		model.addAttribute("frCatList", data.getFranchiseCatList());

		model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);
		model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

		model.addAttribute("prodHeaderList", data.getFeProductHeadList());
		model.addAttribute("flavTagStatusList", data.getFlavorTagStatusList());
		model.addAttribute("festiveEventList", data.getFestEventList());
		
		model.addAttribute("festiveEventList", data.getFestEventList());
		model.addAttribute("festEventImgUrl", Constants.FEST_IMG_VIEW_URL);
		
		 System.err.println("Fest Event "+data.getFestEventList());
		 
		 
		 model.addAttribute("testMonialList", data.getTestimonialList());
			model.addAttribute("TestimonialImgUrl", Constants.TESTMON_IMG_VIEW_URL);
			
			
		return "home";
	}

	// Modified By -Sachin
	// Modific Date -11-11-2020
	@RequestMapping(value = "/showProdDetail/{index}", method = RequestMethod.GET)
	public String showProdDetailIndex(@PathVariable int index, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		System.err.println("In Show Prod Detail");
		try {
			model.addAttribute("frCatList", data.getFranchiseCatList());

			model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("prodHeaderList", data.getFeProductHeadList());
			model.addAttribute("flavTagStatusList", data.getFlavorTagStatusList());

			FEProductHeader prodHeader = data.getFeProductHeadList().get(index);
			model.addAttribute("prodHeader", prodHeader);

		} catch (Exception e) {

		}
		return "productdetail";
	}
	
	
	@RequestMapping(value = "/getAllFrWiseData", method = RequestMethod.POST)
	@ResponseBody
	public FEDataTraveller getAllFrWiseData(HttpServletRequest request, HttpServletResponse response, Model model) {
		return data;
	}
	
	//Sachin 25-11-2020
	//showEventBasedCakes
	@RequestMapping(value = "/showEventBasedCakes/{index}", method = RequestMethod.GET)
	public String showEventBasedCakesIndex(@PathVariable int index, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String returnPage = "productlist";
		try {
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

			model.addAttribute("prodHeaderList", data.getFeProductHeadList());
		
			model.addAttribute("festiveEvent", data.getFestEventList().get(index));
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return returnPage;
		
		
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

//	@RequestMapping(value = "/profile", method = RequestMethod.GET)
//	public String profile(Locale locale, Model model) {
//		return "profile";
//	}

//	@RequestMapping(value = "/orderhistory", method = RequestMethod.GET)
//	public String orderHistory(Locale locale, Model model) {
//		return "orderhistory";
//	}

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
