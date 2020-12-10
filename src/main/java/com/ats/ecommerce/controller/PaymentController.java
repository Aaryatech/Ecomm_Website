package com.ats.ecommerce.controller;

import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Scope("session")
public class PaymentController {

	
	@RequestMapping(value = "/goToPay", method = RequestMethod.GET)
	public String goToPay(Model model, HttpServletRequest request, HttpServletResponse response) {
		System.err.println("goToPay ");
		model.addAttribute("orderId", RandomUtils.nextLong());
		System.err.println("goToPay " + RandomUtils.nextLong());
		return "init_pay";
	}
	
	@RequestMapping(value = "/payResponse", method = RequestMethod.POST)
	public String payResponse(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		System.err.println("payResponse ");
		HttpSession session = request.getSession();
		System.err.println("razorpay_payment_id " + request.getParameter("razorpay_payment_id"));
		System.err.println("razorpay_order_id " + request.getParameter("razorpay_order_id"));

		System.err.println("razorpay_signature " + request.getParameter("razorpay_signature"));

		return "redirect:/home";
	}
}
