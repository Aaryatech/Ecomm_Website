package com.ats.ecommerce;

import java.util.Locale;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Scope("session")
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String location(Locale locale, Model model) {
		return "location";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
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
