package com.ats.ecommerce;

import java.util.Locale;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.ecommerce.common.Constants;

@Controller
@Scope("session")

public class CheckoutController {


	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String viewCart(Locale locale, Model model) {
		model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);
		model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
		return "viewcart"; 
	}

	
}
