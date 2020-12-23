package com.ats.ecommerce;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.ecommerce.common.CommonUtility;
import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.model.order.GetOrderHeaderDisplay;

@Controller
@Scope("session")
public class OrderController {

	@RequestMapping(value = "/orderhistory", method = RequestMethod.GET)
	public String orderHistory(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<GetOrderHeaderDisplay> orderList = new ArrayList<>();
		try {
			HttpSession session = request.getSession();

			int compId = (int) session.getAttribute("companyId");
			int custId = (Integer) session.getAttribute("custId");			

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("compId", compId);
			map.add("custId", custId);

			GetOrderHeaderDisplay[] orderRepArr = Constants.getRestTemplate()
					.postForObject(Constants.url + "/getOrderHistoryListByCustId", map, GetOrderHeaderDisplay[].class);

			orderList = new ArrayList<GetOrderHeaderDisplay>(Arrays.asList(orderRepArr));
			model.addAttribute("orders", orderList);
			model.addAttribute("imgPath", Constants.PROD_IMG_VIEW_URL);
		} catch (Exception e) {
			System.out.println("Exception in /orderhistory : " + e.getMessage());
			e.printStackTrace();
		}

		return "orderhistory";
	}
}
