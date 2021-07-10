package com.ats.ecommerce.controller;

import java.math.BigDecimal;
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

import com.ats.ecommerce.common.CommonUtility;
import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.common.EmailUtility;
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
				session.setAttribute("Pay_Page", "1");

				RazorpayClient razorpay = new RazorpayClient("rzp_live_1xwIfbV7BUaBxt", "95FT7Or1sftfjQEweSpB3Gaq");

				JSONObject orderRequest = new JSONObject();
				//orderRequest.put("amount", orderSaveData.getOrderHeader().getTotalAmt() * 100); // amount in the smallest currency unit
				orderRequest.put("amount", 1 * 100); // amount in the smallest currency unit

				orderRequest.put("currency", "INR");
				orderRequest.put("receipt", "order_rcptid_11");

				Order order = razorpay.Orders.create(orderRequest);
				model.addAttribute("orderId", order.get("id")); 
				model.addAttribute("amount",  order.get("amount"));
				model.addAttribute("payBox",  1);
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
				session.setAttribute("Pay_Page", "2");
				System.err.println("setting pay=2 Pay_Page ");
				
				try {
					session.removeAttribute("orderSaveData");
					session.removeAttribute("orderId");
				} catch (Exception e) {
					session.removeAttribute("orderId");
				}
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
				session.setAttribute("Pay_Page", "0");
			}
			// updateOrderFrontEnd
			try {
				Info info = Constants.getRestTemplate().postForObject(Constants.url + "updateOrderFrontEnd", map,
						Info.class);
			} catch (Exception e) {
				session.setAttribute("successMsg", "Payment Successful");
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
	public static float roundHalfUp(float d, int scale) {
		// return BigDecimal.valueOf(d).setScale(2,
		// BigDecimal.ROUND_HALF_UP).floatValue();
		return BigDecimal.valueOf(d).setScale(scale, BigDecimal.ROUND_HALF_UP).floatValue();
	}
	@RequestMapping(value = "/orderConfirmation", method = RequestMethod.GET)
	public String orderConfirmation(Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		System.err.println("IN inside orderConfirmation " +CommonUtility.getCurrentYMDDateTime());

		try {
			HttpSession session = request.getSession();

			OrderHeaderWithDetail orderSaveData = (OrderHeaderWithDetail) session.getAttribute("orderHeaderWithDetail");
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("prodUplImgUrl", Constants.PROD_UPLOADED_IMG_VIEW_URL);
			
			model.addAttribute("orderSaveData", orderSaveData);
			String payStatus=  (String) session.getAttribute("Pay_Page");
			//int payStatus=  (int) session.getAttribute("Pay_Page");
			System.err.println("payStatus inside orderConfirmation" +payStatus);

			if(String.valueOf(payStatus).equalsIgnoreCase("2")) {
				System.err.println("IN IF" +payStatus);

				model.addAttribute("payStatus", payStatus);
				try {
					session.removeAttribute("orderSaveData");
					session.removeAttribute("orderId");
				} catch (Exception e) {
					session.removeAttribute("orderId");
				}
			}else if(String.valueOf(payStatus).equalsIgnoreCase("1")) {
				//delete order
				System.err.println("Delete Order inside orderConfirmation");
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();

				map.add("orderId", session.getAttribute("orderId"));
				Integer info = Constants.getRestTemplate().postForObject(Constants.url + "deleteOrderSoft", map,
						Integer.class);
				
				System.err.println("Delete Order response orderConfirmation" +info);
				session.removeAttribute("orderId");
				session.removeAttribute("orderSaveData");
				System.err.println("IN ELSE" +payStatus);
			}
			session.setAttribute("Pay_Page","0");

			//EMAIL CODE
			String msg="fjdhjfh" ;
			String logoImgURL="https://pecom.monginis.net/ecom/resources/images/emailer_img/logo.png";
			String shipping_pic_URL="https://pecom.monginis.net/ecom/resources/images/emailer_img/shipping_pic.png";
			
			String fb_icon_URL="https://pecom.monginis.net/ecom/resources/images/emailer_img/fb_icon.jpg";
			String twt_icon_URL="https://pecom.monginis.net/ecom/resources/images/emailer_img/twt_icon.jpg";
			String yt_icon_URL="https://pecom.monginis.net/ecom/resources/images/emailer_img/yt_icon.jpg";
			String insta_icon_URL="https://pecom.monginis.net/ecom/resources/images/emailer_img/insta_icon.jpg";
			String prodImgViewURL=Constants.PROD_IMG_VIEW_URL;
			
			String billAdd=orderSaveData.getBillingAddress().replaceAll("~", "<br>\n");
			String delAdd=orderSaveData.getAddress().replaceAll("~", "<br>\n");
System.err.println("billAdd" +billAdd);
System.err.println("deladd" +delAdd);
String productDiv=new  String();
for(int x=0;x<orderSaveData.getDetailList().size();x++) {
	String qty=null;
	float floatQty=0;
	if(orderSaveData.getDetailList().get(x).getExInt1()==0) {
		qty="Qty : "+orderSaveData.getDetailList().get(x).getQty();
		floatQty=orderSaveData.getDetailList().get(x).getQty();
	}else {
		qty="Weight : "+orderSaveData.getDetailList().get(x).getExFloat3();
		floatQty=orderSaveData.getDetailList().get(x).getExFloat3();
	}
	float tot=floatQty*orderSaveData.getDetailList().get(x).getMrp();
	productDiv=productDiv+"                    <tr>\n" + 
			"                    	<td style=\"padding:15px; border-bottom:1px solid #d9d9d9;\">\n" + 
			"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
			"                              <tr>\n" + 
			"                                <td><img src="+prodImgViewURL+orderSaveData.getDetailList().get(x).getItemPic().trim()+" alt=\"\" width=\"64\" style=\"border:none; max-width:100%; float:left;\"></td>\n" + 
			"                                <td style=\"font-size:13px; line-height:20px; padding:0 0 0 15px;\"><strong style=\"color:#24247e;\">"+orderSaveData.getDetailList().get(x).getItemName()+"</strong> <br>  "+qty+" </td>\n" + 
			"                                <td style=\"text-align:right; font-size:13px; font-weight:bold; color:#ed258f; padding:0 0 0 15px;\">Rate : "+(roundHalfUp(tot,2))+"</td>\n" + 
			"                              </tr>\n" + 
			"                            </table>\n" + 
			"                        </td>\n" + 
			"                    </tr>\n" ;
}

			String msg1="﻿<!doctype html>\n" + 
					"<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
					"<head><style type=\"text/css\">\n" + 
					".btm tbody, .btm tr {\n" + 
					"	width: 100% !important;\n" + 
					"	float: left !important;\n" + 
					"}\n" + 
					".ReadMsgBody {\n" + 
					"	width: 100%;\n" + 
					"	background-color: #ffffff;\n" + 
					"}\n" + 
					".ExternalClass {\n" + 
					"	width: 100%;\n" + 
					"	background-color: #ffffff;\n" + 
					"}\n" + 
					"body {\n" + 
					"	width: 100%;\n" + 
					"	background-color: #ffffff;\n" + 
					"	margin: 0;\n" + 
					"	padding: 0;\n" + 
					"	-webkit-font-smoothing: antialiased;\n" + 
					"	font-family: Arial, sans-serif;\n" + 
					"}\n" + 
					"table {\n" + 
					"	border-collapse: collapse;\n" + 
					"}\n" + 
					"body[yahoo] #tborder {\n" + 
					"	/*border: #f2f2f2 thin solid*/\n" + 
					"}\n" + 
					".valid_till {\n" + 
					"	position: absolute;\n" + 
					"	font-size: 11px;\n" + 
					"	color: #fff;\n" + 
					"	font-weight: bold;\n" + 
					"	font-family: Arial, sans-serif;\n" + 
					"	right: -49px;\n" + 
					"	top: 170px;\n" + 
					"	-ms-transform: rotate(90deg);\n" + 
					"	-webkit-transform: rotate(90deg);\n" + 
					"	transform: rotate(90deg);\n" + 
					"}\n" + 
					"@media handheld, only screen and (max-width: 640px) {\n" + 
					"body[yahoo] .bottommargin {\n" + 
					"	margin-bottom: 10px;\n" + 
					"}\n" + 
					"body[yahoo] .deviceWidth {\n" + 
					"	width: 440px!important;\n" + 
					"	padding: 0;\n" + 
					"}\n" + 
					"body[yahoo] .center {\n" + 
					"	text-align: center!important;\n" + 
					"}\n" + 
					"}\n" + 
					"@media handheld, only screen and (max-width: 479px) {\n" + 
					"body[yahoo] .bottommargin {\n" + 
					"	margin-bottom: 10px;\n" + 
					"}\n" + 
					"body[yahoo] .deviceWidth {\n" + 
					"	width: 280px!important;\n" + 
					"	padding: 0;\n" + 
					"}\n" + 
					"body[yahoo] .center {\n" + 
					"	text-align: center!important;\n" + 
					"}\n" + 
					".bbutton {\n" + 
					"	background-color: #111940 !important;\n" + 
					"	padding-top: 10px;\n" + 
					"	padding-bottom: 10px;\n" + 
					"	padding-right: 30px;\n" + 
					"	text-align: center !important;\n" + 
					"}\n" + 
					"}\n" + 
					"@media handheld, only screen and (min-width:641px) {\n" + 
					"body[yahoo] #tborder {\n" + 
					"	/*border: #f2f2f2 thin solid*/\n" + 
					"}\n" + 
					"body[yahoo] .thumbres {\n" + 
					"	padding-left: 20%;\n" + 
					"	padding-right: 20%;\n" + 
					"}\n" + 
					"body[yahoo] .f-left {\n" + 
					"	display: inline-table !important;\n" + 
					"}\n" + 
					"body[yahoo] .f-right {\n" + 
					"	float: right;\n" + 
					"	display: inline-table !important;\n" + 
					"}\n" + 
					"body[yahoo] .f-center {\n" + 
					"	display: inline-table !important;\n" + 
					"}\n" + 
					"}\n" + 
					"</style>\n" + 
					"\n" + 
					"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n" + 
					"<title>:: Monginis | Emailer ::</title>\n" + 
					"</head>\n" + 
					"<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" yahoo=\"fix\" style=\"font-family:Arial, sans-serif; background:#e3ebef;\">\n" + 
					"<!-- Wrapper -->\n" + 
					"<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\n" + 
					"  <tr>\n" + 
					"    <td width=\"100%\" valign=\"top\" bgcolor=\"#f8208d\">\n" + 
					"    	<!-- Start Header-->\n" + 
					"      <table width=\"700\" id=\"tborder\" class=\"deviceWidth\" bgcolor=\"#FFF\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\"  style=\"position:relative;\">\n" + 
					"        <tr>\n" + 
					"          <td cellspacing=\"0\" cellpadding=\"0\"  style=\" padding:0;\"><table width=\"100%\" id=\"\" class=\"\" cellspacing=\"0\" cellpadding=\"0\"  align=\"center\" background=\"#000\" border=\"0\" style=\"padding:0;\">\n" + 
					"          	  \n" + 
					"              <tr>\n" + 
					"                <td align=\"center\">&nbsp;</td>\n" + 
					"              </tr>\n" + 
					"              <tr>\n" + 
					"                <td align=\"center\">\n" + 
					"                    <img src="+logoImgURL+" alt=\"main_logo\" style=\"border:none; max-width:100%; padding: 0; float:none;\">\n" + 
					"                  </td>\n" + 
					"              </tr>\n" + 
					"              <tr>\n" + 
					"                <td cellspacing=\"0\" cellpadding=\"0\" style=\"position:relative; padding:30px 15px 10px 15px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n" + 
					"                    <tr>\n" + 
					"                      <td style=\"text-align:center; font-size:16px; letter-spacing:0.5px; text-transform:uppercase; padding:0 0 20px 0; color:#24247e;\">\n" + 
					"                      	<strong>Order Confirmation</strong></td>\n" + 
					"                    </tr>\n" + 
					"                    <tr>\n" + 
					"                      <td style=\"text-align:center; padding:0 0 25px 0; font-size:13px; line-height:28px; color:#3a3a3a;\">\n" + 
					"                      	Hi "+orderSaveData.getBillingName()+", <br>\n" + 
					"                        We've got your order! Your world is about to look a whole lot better.<br>\n" + 
					"						We'll drop you another email when your order ships.\n" + 
					"                      </td>\n" + 
					"                    </tr>\n" + 
					"                    \n" + 
					"                    <tr>\n" + 
					"                      <td style=\"text-align:center; padding:0 0 15px 0; font-size:15px; text-transform:uppercase; letter-spacing:0.5px; font-weight:bold; line-height:24px; color:#24247e;\">\n" + 
					"                      	Order No. Monginis-"+orderSaveData.getOrderNo()+" <br>\n" + 
					"						<span style=\"font-size:13px; color:#3a3a3a; font-weight:bold;\">"+orderSaveData.getDeliveryDate()+"</span>\n" + 
					"                      </td>\n" + 
					"                    </tr>\n" + 
					"                    \n" + 
					"                  </table></td>\n" + 
					"              </tr>\n" + 
					"              \n" + 
					"              <tr>\n" + 
					"                <td cellspacing=\"0\" cellpadding=\"0\"  style=\"background: #FFF; position:relative; padding:0 15px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
					"                    <tr>                          \n" + 
					"                      <td style=\"background:#FFF; padding:15px 0; color:#24247e; text-align:left; font-size:13px; font-weight:bold; text-transform:uppercase; border-bottom:1px solid #d9d9d9; letter-spacing:0.5px;\"><strong>Item Order</strong></td>\n" + 
					"                    </tr>\n" + 
					"                    \n" + 
					/*
					 * "                    <!--1-->\n" + "                    <tr>\n" +
					 * "                    	<td style=\"padding:15px; border-bottom:1px solid #d9d9d9;\">\n"
					 * +
					 * "                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"
					 * + "                              <tr>\n" +
					 * "                                <td><img src=\"images/cake_pic.jpg\" alt=\"\" width=\"64\" style=\"border:none; max-width:100%;  float:left;\"></td>\n"
					 * +
					 * "                                <td style=\"font-size:13px; line-height:20px;\"><strong style=\"color:#24247e;\">Premium Black Fores Cake</strong> <br> QTY : 1 </td>\n"
					 * +
					 * "                                <td style=\"text-align:right; font-size:13px; font-weight:bold; color:#ed258f;\">Rate : 250.00</td>\n"
					 * + "                              </tr>\n" +
					 * "                            </table>\n" + "                        </td>\n"
					 * + "                    </tr>\n" + "                    \n" +
					 * "                    <!--2-->\n" + "                    <tr>\n" +
					 * "                    	<td style=\"padding:15px; border-bottom:1px solid #d9d9d9;\">\n"
					 * +
					 * "                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"
					 * + "                              <tr>\n" +
					 * "                                <td><img src=\"images/cake_pic.jpg\" alt=\"\" width=\"64\" style=\"border:none; max-width:100%; float:left;\"></td>\n"
					 * +
					 * "                                <td style=\"font-size:13px; line-height:20px;\"><strong style=\"color:#24247e;\">Premium Black Fores Cake</strong> <br> QTY : 1 </td>\n"
					 * +
					 * "                                <td style=\"text-align:right; font-size:13px; font-weight:bold; color:#ed258f;\">Rate : 250.00</td>\n"
					 * + "                              </tr>\n" +
					 * "                            </table>\n" + "                        </td>\n"
					 * + "                    </tr>\n" +
					 */
					
					""+productDiv+ "\n" + 
					"                    <!--price box-->\n" + 
					"                    <tr>\n" + 
					"                    	<td style=\"padding:20px 0; font-size:13px; font-weight:bold; line-height:28px; color:#3a3a3a;\">\n" + 
					"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
					"                              <tr>\n" + 
					"                                <td style=\"text-align:left; width:75%; max-width:100%; line-height:24px;\">\n" + 
					"                                    Sub Total <br>\n" + 
					"                                    Discount  <br>\n" + 
					"                                    Delivery Charges <br>\n" + 
					"                                    Total\n" + 
					"                                </td>\n" + 
					"                                <td style=\"line-height:24px; float:right; text-align:left; \">\n" + 
					"                                    Rs. "+((orderSaveData.getTotalAmt()+orderSaveData.getDiscAmt())-orderSaveData.getDeliveryCharges())+"<br>\n" +
					"                                    Rs. -"+orderSaveData.getDiscAmt()+"<br>\n" + 
					"                                    Rs. "+orderSaveData.getDeliveryCharges()+"<br>\n" + 
					"                                    Rs. "+orderSaveData.getTotalAmt()+"\n" + 
					"                                </td>\n" + 
					"                              </tr>\n" + 
					"                            </table>\n" + 
					"                        </td>\n" + 
					"                    </tr>\n" + 
					"                    \n" + 
					"                    <!--billing info box-->\n" + 
					"                    <tr>\n" + 
					"                    	<td style=\"padding:20px 0; font-size:13px; color:#3a3a3a; border-top:1px solid #d9d9d9; border-bottom:1px solid #d9d9d9;\">\n" + 
					"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
					"                              <tr>\n" + 
					"                                <td style=\"float:left; width:50%; max-width:100%; text-align:left; line-height:24px;\">\n" + 
					"                                	<span style=\"display:block; padding:0 0 5px 0; font-weight:bold; text-transform:uppercase; color:#24247e;\">Billing Info</span>\n" + 
					"                                    "+orderSaveData.getBillingName()+" <br>\n" +billAdd.trim()+ 
					/*
					 * "                                    1st Floor, Raj Apartment, <br>\n" +
					 * "                                    Rachna Vidyalay Road, <br>\n" +
					 * "                                    Sharanpur Rd, Nashik. <br>\n" +
					 * "                                    India. <br>\n" +
					 */
				
					"                                  <br>\n <a href=\"mailto:"+session.getAttribute("userEmail")+"\">"+session.getAttribute("userEmail")+"</a>\n" + 
					"                                </td>\n" + 
					"                                <td style=\"float:right; max-width:100%; width:50%; line-height:24px; \">\n" + 
					"                                	<span style=\"display:block; padding:0 0 5px 0; font-weight:bold; text-transform:uppercase; color:#24247e;\">Shipping Address</span>\n" + 
					"                                    "+orderSaveData.getExVar4()+" <br>\n" +delAdd.trim()+ 
					/*
					 * "                                    1st Floor, Raj Apartment, <br>\n" +
					 * "                                    Rachna Vidyalay Road, <br>\n" +
					 * "                                    Sharanpur Rd, Nashik. <br>\n" +
					 * "                                    India.\n" +
					 */
					"                               <br>\n </td>\n" + 
					"                              </tr>\n" + 
					"                            </table>\n" + 
					"                        </td>\n" + 
					"                    </tr>\n" + 
					"                    \n" + 
					"                    \n" + 
					"                    <tr>\n" + 
					"                    	<td style=\"border-bottom:1px solid #d9d9d9; padding:25px 0 40px 0; font-size:13px; color:#3a3a3a; text-align:center;\">\n" + 
					"                        	<span style=\"display:block; padding:0 0 25px 0; font-size:13px; text-transform:uppercase; letter-spacing:0.3px; font-weight:bold; color:#24247e;\">Change your mind?</span>\n" + 
					"                            <span style=\"color:#ed258f; font-size:12px; text-transform:uppercase; font-weight:bold; padding:0; line-height:12px;\">Cancelling an order</span>\n" + 
					"                            <p style=\"color:#3a3a3a; padding:0 0 10px 0; display:block;\">we're not able to make changes to your order, but you do have the option to cancel it.</p>\n" + 
					"                            \n" + 
					"                            <p style=\"line-height:20px; padding:0 0 5px 0;\">\n" + 
					"                            	<img src="+shipping_pic_URL+" alt=\"\" style=\"border:none; max-width:100%; vertical-align:top; padding:0 5px 0 0; display:inline-block;\">\n" + 
					"                                <span style=\"display:inline-block; text-align:left;\">\n" + 
					"                                <strong>Standard Delivery</strong> <br>\n" + 
					"								Cancel within one hour</span>\n" + 
					"                            </p>\n" + 
					"                            \n" + 
					"                            <p style=\"font-size:13px; color:#3a3a3a; padding:0 0 25px 0;\">Go to your order from the button below and follow the instructions.</p>\n" + 
					"                            <a href=\"https://pecom.monginis.net/ecom/orderhistory/\" style=\"text-decoration:none; padding:10px 40px; border:1px solid #d9d9d9; color:#3a3a3a; text-transform:uppercase; font-weight:bold; font-size:12px;\">View Order</a>\n" + 
					"                            \n" + 
					"                        </td>\n" + 
					"                    </tr>\n" + 
					"                    \n" + 
					"                    \n" + 
					"                    <tr>\n" + 
					"                    	<td style=\"padding:20px 0; color:#3a3a3a; font-size:13px; border-bottom:1px solid #d9d9d9;\">\n" + 
					"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
					"                              <tr>\n" + 
					"                                <td colspan=\"3\" style=\"text-align:center; padding:0 0 40px 0; line-height:20px; color:#3a3a3a;\">\n" + 
					"                                    If you need help with anything please don't hesitate to drop us an <br>email:care@monginis.com\n" + 
					"                                </td>\n" + 
					"                                </tr>\n" + 
					"                              <tr>\n" + 
					"                                <td colspan=\"3\" >&nbsp;</td>\n" + 
					"                              </tr>\n" + 
					"                              <tr>\n" + 
					"                                <td align=\"center\" style=\"font-size:12px; text-transform:uppercase; font-weight:bold; letter-spacing:0.3px; width:33.333%; max-width:100%;\">\n" + 
					"                                  <a href=\"https://pecom.monginis.net/ecom\" style=\"text-decoration:none; color:#24247e;\">Home</a>\n" + 
					"                                </td>\n" + 
					"                                <td align=\"center\" style=\"font-size:12px; text-transform:uppercase; font-weight:bold; letter-spacing:0.3px; width:33.333%; max-width:100%;\">\n" + 
					"                                  <a href=\"https://pecom.monginis.net/ecom\" style=\"text-decoration:none; color:#24247e;\">About Us</a>\n" + 
					"                                </td>\n" + 
					"                                <td align=\"center\" style=\"font-size:12px; text-transform:uppercase; font-weight:bold; letter-spacing:0.3px; width:33.333%; max-width:100%;\">\n" + 
					"                                  <a href=\"https://pecom.monginis.net/ecom\" style=\"text-decoration:none; color:#24247e;\">Contact Us</a>\n" + 
					"                                </td>\n" + 
					"                              </tr>\n" + 
					"                            </table>\n" + 
					"                        </td>\n" + 
					"                    </tr>\n" + 
					"                    \n" + 
					"                    <tr>\n" + 
					"                    	<td style=\"border-bottom:1px solid #d9d9d9;\">\n" + 
					"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
					"                  <tr>\n" + 
					"                    <td style=\"width:50%; max-width:100%; text-align:center; padding:20px;\">\n" + 
					"                        <span style=\"font-size:13px; padding:0 0 20px 0; display:block; color:#3a3a3a;\">Lets Hang Out?</span>\n" + 
					"                        <a href=\"https://www.facebook.com/monginis/\" target=\"_blank\" style=\"text-decoration:none;\"> \n" + 
					"                            <img src="+fb_icon_URL+" alt=\"\" style=\"border:none; max-width:100%; display:inline-block; margin:0 5px;\">\n" + 
					"                        </a>\n" + 
					"                        <a href=\"https://twitter.com/MonginisIndia\" target=\"_blank\" style=\"text-decoration:none;\"> \n" + 
					"                            <img src="+twt_icon_URL+" alt=\"\" style=\"border:none; max-width:100%; display:inline-block; margin:0 5px;\">\n" + 
					"                        </a>\n" + 
					"                        <a href=\"https://www.youtube.com/channel/UCL2K9zi9D94YBbmU1GJicAA\" target=\"_blank\" style=\"text-decoration:none;\"> \n" + 
					"                            <img src="+yt_icon_URL+" alt=\"\" style=\"border:none; max-width:100%; display:inline-block; margin:0 5px;\">\n" + 
					"                        </a>\n" + 
					"                        <a href=\"https://www.instagram.com/monginiscelebrations/\" target=\"_blank\" style=\"text-decoration:none;\"> \n" + 
					"                            <img src="+insta_icon_URL+" alt=\"\" style=\"border:none; max-width:100%; display:inline-block; margin:0 5px;\">\n" + 
					"                        </a>\n" + 
					"                    </td>\n" + 
					"                    <td style=\"width:50%; max-width:100%; text-align:center; padding:20px; border-left:1px solid #d9d9d9; color:#3a3a3a; font-size:13px;\">\n" + 
					"                    	<span style=\"text-transform:uppercase; font-size:13px; padding:0 0 0px 0; display:block; font-weight:bold;\">Office</span>\n" + 
					"                         <p style=\"font-size:13px; line-height:20px;\">1st Floor, Raj Apartment, <br>\n" + 
					"                            Rachna Vidyalay Road,<br>\n" + 
					"                            Sharanpur Rd, Nashik.<br></p>\n" + 
					"\n" + 
					"						 Copyright &copy; 2021\n" + 
					"                    </td>\n" + 
					"                  </tr>\n" + 
					"</table>\n" + 
					"                        </td>\n" + 
					"                    </tr>\n" + 
					"                    \n" + 
					"                    <tr>\n" + 
					"                    	<td style=\"padding:20px 10px; text-align:center;\">\n" + 
					"                        	<a href=\"https://www.monginis.net/\" target=\"_blank\" style=\"color:#24247e; text-decoration:none; font-size:13px;\">monginis.net</a>\n" + 
					"                        </td>\n" + 
					"                    </tr>\n" + 
					"                  </table></td>\n" + 
					"              </tr>\n" + 
					"            </table>\n" + 
					"            <!--bottom start---> \n" + 
					"            <!--bottom end---></td>\n" + 
					"        </tr>\n" + 
					"      </table>\n" + 
					"      <!--end--></td>\n" + 
					"  </tr>\n" + 
					"</table>\n" + 
					"</body>\n" + 
					"</html>";
			try {
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();

				map.add("recipientEmail", "handgesachin1@gmail.com");
				map.add("mailsubject", "Monginis Order Confirmation-"+orderSaveData.getOrderNo());
				map.add("mailMsg", msg1);
				EmailUtility.sendEmailer(Constants.senderEmail, Constants.senderPassword, ""+session.getAttribute("userEmail")+"", "Monginis Order Confirmation-"+orderSaveData.getOrderNo(), msg1);
			/*	Info info = Constants.getRestTemplate().postForObject(Constants.url + "sendEmail", map,
						Info.class);*/
			//EmailUtility.sendEmail(Constants.senderEmail, Constants.senderPassword, "handgesachin1@gmail.com", "ORDER ", msg);
			}catch (Exception e) {
				return "orderConfirmation";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "orderConfirmation";
	}
}
