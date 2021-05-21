package com.ats.ecommerce.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
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
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.model.Franchise;
import com.ats.ecommerce.model.Info;
import com.ats.ecommerce.model.OrderHeaderWithDetail;
import com.ats.ecommerce.model.order.OrderSaveData;
import com.ats.ecommerce.model.payment.GenOrder;
import com.ats.ecommerce.model.payment.OrderRes;
import com.ats.ecommerce.model.payment.Transfer;
import com.ats.ecommerce.model.payment.TransferRes;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

@Controller
@Scope("session")
public class PaymentController {

	@RequestMapping(value = "/goToPay1", method = RequestMethod.GET)
	public String goToPay1(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			System.err.println("goToPay ");
			// Long orderRefId=RandomUtils.nextLong();
			// String orderRefId = UUID.randomUUID().toString();

			/*
			 * RandomStringGenerator randomStringGenerator = new
			 * RandomStringGenerator.Builder() .withinRange('0', 'z')
			 * .filteredBy(CharacterPredicates.LETTERS, CharacterPredicates.DIGITS)
			 * .build(); String randomString=randomStringGenerator.generate(12); //
			 * toUpperCase() if you want System.err.println("goToPay Page " + randomString);
			 */
			HttpSession session = request.getSession();
			OrderSaveData orderSaveData = (OrderSaveData) session.getAttribute("orderSaveData");
			// try {

			// String sign=Signature.calculateRFC2104HMAC(data, secret);

			// amount in the smallest currency unit
			JSONObject orderRequest = new JSONObject();
			// orderRequest.put("amount", 100);
			orderRequest.put("amount", orderSaveData.getOrderHeader().getTotalAmt() * 100);
			orderRequest.put("currency", "INR");
			orderRequest.put("receipt", "Okaa");
			// RazorpayClient razorpay = new RazorpayClient("rzp_test_1eXaKykckwM8kP",
			// "V03Z05bFj27PTZEs8G4RJQJB");

			// Order order = razorpay.Orders.create(orderRequest);
			// System.err.println("Order " +order.get("id"));
			/*
			 * model.addAttribute("orderId", order.get("id")); model.addAttribute("amount",
			 * order.get("amount"));
			 */

			model.addAttribute("landMark", session.getAttribute("landMark"));
			/*
			 * } catch (RazorpayException e) { System.out.println(e.getMessage());
			 * e.printStackTrace(); }
			 */

			// 22-12-2020

			HttpHeaders httpHeaders = new HttpHeaders();
			httpHeaders.set("Content-Type", "application/json");
			// httpHeaders.set("rzp_live_1xwIfbV7BUaBxt", "95FT7Or1sftfjQEweSpB3Gaq");
			httpHeaders.setContentType(MediaType.APPLICATION_JSON);

			// String plainCreds = "rzp_test_1eXaKykckwM8kP:V03Z05bFj27PTZEs8G4RJQJB";
			String plainCreds = "rzp_live_1xwIfbV7BUaBxt:95FT7Or1sftfjQEweSpB3Gaq";
			byte[] plainCredsBytes = plainCreds.getBytes();
			byte[] base64CredsBytes = Base64.getEncoder().encode(plainCredsBytes);
			String base64Creds = new String(base64CredsBytes);

			httpHeaders.add("Authorization", "Basic " + base64Creds);

			GenOrder order = new GenOrder();

			// order.setAmount((int)orderSaveData.getOrderHeader().getTotalAmt()*100);
			order.setAmount(100);

			order.setCurrency("INR");

			Transfer transfer = new Transfer();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();

			map.add("frId", request.getSession().getAttribute("frId"));
			try {
				Franchise frData = Constants.getRestTemplate().postForObject(Constants.url + "getFranchiseById", map,
						Franchise.class);
			} catch (Exception e) {
				// TODO: handle exception
			}

			// transfer.setAccount("acc_GG4Qoe8oK4muer");//Sumit HDFC/Sachin Uni
			// transfer.setAccount(frData.getPaymentGetwayLink());
			transfer.setAccount("acc_GG4Qoe8oK4muer");

			// transfer.setAmount((int)orderSaveData.getOrderHeader().getTotalAmt()*100);
			transfer.setAmount(100);
			transfer.setCurrency("INR");
			/*
			 * transfer.setOnHold(1); transfer.setOnHoldUntil(1);
			 */

			List<Transfer> transfers = new ArrayList<Transfer>();

			transfers.add(transfer);

			order.setTransfers(transfers);

			ObjectMapper mapper = new ObjectMapper();

			String jsonInString = mapper.writeValueAsString(order);

			System.out.println("All  Data" + jsonInString.toString());

			HttpEntity<String> httpEntity = new HttpEntity<String>(jsonInString.toString(), httpHeaders);
			OrderRes makeOrderResp = null;
			RestTemplate restTemplate = new RestTemplate();
			try {
				/*
				 * makeOrderResp =
				 * restTemplate.postForObject("https://api.razorpay.com/v1/orders" , httpEntity,
				 * OrderRes.class);
				 */

				ResponseEntity<OrderRes> response1 = restTemplate.exchange("https://api.razorpay.com/v1/orders/",
						HttpMethod.POST, httpEntity, OrderRes.class);
				makeOrderResp = response1.getBody();

				/*
				 * }catch (RestClientException httpClientExce) {
				 * System.err.println("httpClientExce " +httpClientExce.toString()); }
				 */
			} catch (HttpClientErrorException httpClientExce) {
				System.err.println("httpClientExce " + httpClientExce.getResponseBodyAsString());
			}

			System.err.println("makeOrderResp Id " + makeOrderResp.getId());
			System.err.println("makeOrderResp " + makeOrderResp.toString());

			model.addAttribute("orderId", makeOrderResp.getId());
			model.addAttribute("amount", makeOrderResp.getAmount());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "init_pay";
	}

	
	@RequestMapping(value = "/goToPay", method = RequestMethod.GET)
	public String goToPay(Model model, HttpServletRequest request, HttpServletResponse response) {
		
			HttpSession session = request.getSession();
			OrderSaveData orderSaveData = (OrderSaveData) session.getAttribute("orderSaveData");
			
			try {
				RazorpayClient razorpay = new RazorpayClient("rzp_live_1xwIfbV7BUaBxt", "95FT7Or1sftfjQEweSpB3Gaq");

				JSONObject orderRequest = new JSONObject();
				orderRequest.put("amount", orderSaveData.getOrderHeader().getTotalAmt() * 100); // amount in the smallest currency unit
				//orderRequest.put("amount", 1 * 100); // amount in the smallest currency unit

				orderRequest.put("currency", "INR");
				orderRequest.put("receipt", "order_rcptid_11");

				Order order = razorpay.Orders.create(orderRequest);
				model.addAttribute("orderId", order.get("id")); 
				model.addAttribute("amount",  order.get("amount"));
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
				System.err.println("goToPay ");
			if(1==2) {
				//Other M
				
			// try {

			// String sign=Signature.calculateRFC2104HMAC(data, secret);

			// amount in the smallest currency unit
			JSONObject orderRequest = new JSONObject();
			// orderRequest.put("amount", 100);
			orderRequest.put("amount", orderSaveData.getOrderHeader().getTotalAmt() * 100);
			orderRequest.put("currency", "INR");
			orderRequest.put("receipt", "Okaa");
			// RazorpayClient razorpay = new RazorpayClient("rzp_test_1eXaKykckwM8kP",
			// "V03Z05bFj27PTZEs8G4RJQJB");

			// Order order = razorpay.Orders.create(orderRequest);
			// System.err.println("Order " +order.get("id"));
			/*
			 * model.addAttribute("orderId", order.get("id")); model.addAttribute("amount",
			 * order.get("amount"));
			 */

			model.addAttribute("landMark", session.getAttribute("landMark"));
			/*
			 * } catch (RazorpayException e) { System.out.println(e.getMessage());
			 * e.printStackTrace(); }
			 */

			// 22-12-2020

			HttpHeaders httpHeaders = new HttpHeaders();
			httpHeaders.set("Content-Type", "application/json");
			// httpHeaders.set("rzp_live_1xwIfbV7BUaBxt", "95FT7Or1sftfjQEweSpB3Gaq");
			httpHeaders.setContentType(MediaType.APPLICATION_JSON);

			// String plainCreds = "rzp_test_1eXaKykckwM8kP:V03Z05bFj27PTZEs8G4RJQJB";
			String plainCreds = "rzp_live_1xwIfbV7BUaBxt:95FT7Or1sftfjQEweSpB3Gaq";
			byte[] plainCredsBytes = plainCreds.getBytes();
			byte[] base64CredsBytes = Base64.getEncoder().encode(plainCredsBytes);
			String base64Creds = new String(base64CredsBytes);

			httpHeaders.add("Authorization", "Basic " + base64Creds);

			GenOrder order = new GenOrder();

			// order.setAmount((int)orderSaveData.getOrderHeader().getTotalAmt()*100);
			order.setAmount(100);

			order.setCurrency("INR");

			Transfer transfer = new Transfer();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();

			map.add("frId", request.getSession().getAttribute("frId"));
			try {
				Franchise frData = Constants.getRestTemplate().postForObject(Constants.url + "getFranchiseById", map,
						Franchise.class);
			} catch (Exception e) {
				// TODO: handle exception
			}

			// transfer.setAccount("acc_GG4Qoe8oK4muer");//Sumit HDFC/Sachin Uni
			// transfer.setAccount(frData.getPaymentGetwayLink());
			transfer.setAccount("acc_GG4Qoe8oK4muer");

			// transfer.setAmount((int)orderSaveData.getOrderHeader().getTotalAmt()*100);
			transfer.setAmount(100);
			transfer.setCurrency("INR");
			/*
			 * transfer.setOnHold(1); transfer.setOnHoldUntil(1);
			 */

			List<Transfer> transfers = new ArrayList<Transfer>();

			transfers.add(transfer);

			order.setTransfers(transfers);

			ObjectMapper mapper = new ObjectMapper();

			String jsonInString = mapper.writeValueAsString(order);

			System.out.println("All  Data" + jsonInString.toString());

			HttpEntity<String> httpEntity = new HttpEntity<String>(jsonInString.toString(), httpHeaders);
			OrderRes makeOrderResp = null;
			RestTemplate restTemplate = new RestTemplate();
			try {
				/*
				 * makeOrderResp =
				 * restTemplate.postForObject("https://api.razorpay.com/v1/orders" , httpEntity,
				 * OrderRes.class);
				 */

				ResponseEntity<OrderRes> response1 = restTemplate.exchange("https://api.razorpay.com/v1/orders/",
						HttpMethod.POST, httpEntity, OrderRes.class);
				makeOrderResp = response1.getBody();

				/*
				 * }catch (RestClientException httpClientExce) {
				 * System.err.println("httpClientExce " +httpClientExce.toString()); }
				 */
			} catch (HttpClientErrorException httpClientExce) {
				System.err.println("httpClientExce " + httpClientExce.getResponseBodyAsString());
			}

			System.err.println("makeOrderResp Id " + makeOrderResp.getId());
			System.err.println("makeOrderResp " + makeOrderResp.toString());

			model.addAttribute("orderId", makeOrderResp.getId());
			model.addAttribute("amount", makeOrderResp.getAmount());
			}
		} catch (Exception e) {
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
			// System.err.println(" razorpay_signature " +
			// request.getParameter("razorpay_signature"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();

			map.add("orderId", session.getAttribute("orderId"));

			if (!request.getParameter("razorpay_payment_id").equalsIgnoreCase(null)) {
				// System.err.println("razorpay_payment_id not null");
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
				session.setAttribute("successMsg", "Payment Successful");

			} else {
				System.err.println("razorpay_payment_id  null");
				// OrderSaveData orderSaveData=(OrderSaveData)
				// session.getAttribute("orderSaveData");
				/*
				 * orderSaveData.getOrderHeader().setPaymentRemark("Payment failed "
				 * +request.getParameter("razorpay_order_id"));
				 * orderSaveData.getOrderHeader().setPaidStatus(0);
				 * orderSaveData.getOrderHeader().setOrderStatus(9);
				 */
				session.setAttribute("successMsg", "Payment Failed");
				map.add("uniqNo", "na");
				map.add("paidStatus", 0);
				map.add("payRemark", request.getParameter("razorpay_order_id"));
				map.add("orderStatus", 9);
			}
			// updateOrderFrontEnd
			try {
				Info info = Constants.getRestTemplate().postForObject(Constants.url + "updateOrderFrontEnd", map,
						Info.class);
			} catch (Exception e) {
				session.setAttribute("successMsg", "Payment Successful");
			}

			try {
				session.removeAttribute("orderSaveData");
				session.removeAttribute("orderId");
			} catch (Exception e) {
				session.removeAttribute("orderId");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/orderConfirmation";
	}

	
	@RequestMapping(value = "/payResponse_OLD", method = RequestMethod.POST)
	public String payResponse_OLD(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		try {
			System.err.println("payResponse razorpay_payment_id " + request.getParameter("razorpay_payment_id"));
			System.err.println(" payResponse razorpay_order_id " + request.getParameter("razorpay_order_id"));
			// System.err.println(" razorpay_signature " +
			// request.getParameter("razorpay_signature"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();

			map.add("orderId", session.getAttribute("orderId"));

			if (!request.getParameter("razorpay_payment_id").equalsIgnoreCase(null)) {
				// System.err.println("razorpay_payment_id not null");
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
				session.setAttribute("successMsg", "Payment Successful");

			} else {
				System.err.println("razorpay_payment_id  null");
				// OrderSaveData orderSaveData=(OrderSaveData)
				// session.getAttribute("orderSaveData");
				/*
				 * orderSaveData.getOrderHeader().setPaymentRemark("Payment failed "
				 * +request.getParameter("razorpay_order_id"));
				 * orderSaveData.getOrderHeader().setPaidStatus(0);
				 * orderSaveData.getOrderHeader().setOrderStatus(9);
				 */
				session.setAttribute("successMsg", "Payment Failed");
				map.add("uniqNo", "na");
				map.add("paidStatus", 0);
				map.add("payRemark", request.getParameter("razorpay_order_id"));
				map.add("orderStatus", 9);
			}
			// updateOrderFrontEnd
			try {
				Info info = Constants.getRestTemplate().postForObject(Constants.url + "updateOrderFrontEnd", map,
						Info.class);
			} catch (Exception e) {
				session.setAttribute("successMsg", "Payment Successful");
			}

			try {
				session.removeAttribute("orderSaveData");
				session.removeAttribute("orderId");
			} catch (Exception e) {
				session.removeAttribute("orderId");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/orderConfirmation";
	}

	@RequestMapping(value = "/orderConfirmation", method = RequestMethod.GET)
	public String orderConfirmation(Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();

			OrderHeaderWithDetail orderSaveData = (OrderHeaderWithDetail) session.getAttribute("orderHeaderWithDetail");
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("prodUplImgUrl", Constants.PROD_UPLOADED_IMG_VIEW_URL);
			
			model.addAttribute("orderSaveData", orderSaveData);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "orderConfirmation";
	}
}
