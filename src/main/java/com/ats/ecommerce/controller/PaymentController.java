package com.ats.ecommerce.controller;

import java.util.Locale;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.text.CharacterPredicates;
import org.apache.commons.text.RandomStringGenerator;
import org.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.ecommerce.common.Constants;
import com.atss.ecommerce.model.Info;
import com.atss.ecommerce.model.order.OrderSaveData;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

@Controller
@Scope("session")
public class PaymentController {

	
	@RequestMapping(value = "/goToPay", method = RequestMethod.GET)
	public String goToPay(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
		System.err.println("goToPay ");
		//Long orderRefId=RandomUtils.nextLong();
       // String orderRefId = UUID.randomUUID().toString();
		
			/*
			 * RandomStringGenerator randomStringGenerator = new
			 * RandomStringGenerator.Builder() .withinRange('0', 'z')
			 * .filteredBy(CharacterPredicates.LETTERS, CharacterPredicates.DIGITS)
			 * .build(); String randomString=randomStringGenerator.generate(12); //
			 * toUpperCase() if you want
		* System.err.println("goToPay Page " + randomString);*/
		try {
			RazorpayClient razorpay = new RazorpayClient("rzp_test_1eXaKykckwM8kP", "V03Z05bFj27PTZEs8G4RJQJB");
			  
			//  String sign=Signature.calculateRFC2104HMAC(data, secret);
				//HttpSession session = request.getSession();
				//OrderSaveData orderSaveData=(OrderSaveData) session.getAttribute("orderSaveData");
			  //orderRequest.put("amount", orderSaveData.getOrderHeader().getTotalAmt()*100); // amount in the smallest currency unit
			    JSONObject orderRequest = new JSONObject();
				orderRequest.put("amount", 100);
			  orderRequest.put("currency", "INR");
			  orderRequest.put("receipt", "Okaa");

			  Order order = razorpay.Orders.create(orderRequest);
			  System.err.println("Order " +order.get("id"));
			model.addAttribute("orderId", order.get("id"));
			model.addAttribute("amount", order.get("amount"));
			HttpSession session = request.getSession();
			
			model.addAttribute("landMark",session.getAttribute("landMark"));
			} catch (RazorpayException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "init_pay";
	}
	
	@RequestMapping(value = "/payResponse", method = RequestMethod.POST)
	public String payResponse(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		try {
		System.err.println("payResponse razorpay_payment_id " + request.getParameter("razorpay_payment_id"));
		System.err.println(" payResponse razorpay_order_id " + request.getParameter("razorpay_order_id"));
		//System.err.println(" razorpay_signature " + request.getParameter("razorpay_signature"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
		
		map.add("orderId", session.getAttribute("orderId"));
		
		if(!request.getParameter("razorpay_payment_id").equalsIgnoreCase(null)) {
			//System.err.println("razorpay_payment_id not  null");
				/*
				 * OrderSaveData orderSaveData=(OrderSaveData)
				 * session.getAttribute("orderSaveData");
				 * orderSaveData.getOrderHeader().setUuidNo(request.getParameter(
				 * "razorpay_payment_id"));
				 * orderSaveData.getOrderHeader().setPaymentRemark(request.getParameter(
				 * "razorpay_order_id")); orderSaveData.getOrderHeader().setPaidStatus(1);
				 */
			map.add("uniqNo", request.getParameter("razorpay_payment_id"));
			map.add("paidStatus", 1);
			map.add("payRemark", request.getParameter("razorpay_order_id"));
			map.add("orderStatus", -100);
			
		}else {
			System.err.println("razorpay_payment_id  null");
			//OrderSaveData orderSaveData=(OrderSaveData) session.getAttribute("orderSaveData");
				/*
				 * orderSaveData.getOrderHeader().setPaymentRemark("Payment failed "
				 * +request.getParameter("razorpay_order_id"));
				 * orderSaveData.getOrderHeader().setPaidStatus(0);
				 * orderSaveData.getOrderHeader().setOrderStatus(9);
				 */
			map.add("uniqNo", "na");
			map.add("paidStatus", 0);
			map.add("payRemark", request.getParameter("razorpay_order_id"));
			map.add("orderStatus", 9);
		}
		//updateOrderFrontEnd
		
		Info info = Constants.getRestTemplate().postForObject(Constants.url + "updateOrderFrontEnd", map,
				Info.class);
		try {
		session.removeAttribute("orderSaveData");
		session.removeAttribute("orderId");
		}catch (Exception e) {
			session.removeAttribute("orderId"); 
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/home";
	}
}
