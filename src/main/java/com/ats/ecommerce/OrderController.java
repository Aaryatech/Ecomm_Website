package com.ats.ecommerce;

import java.io.File;
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
import com.ats.ecommerce.model.FEDataTraveller;
import com.ats.ecommerce.model.GetFlavorTagStatusList;
import com.ats.ecommerce.model.order.GetOrderHeaderDisplay;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class OrderController {

	@RequestMapping(value = "/orderhistory", method = RequestMethod.GET)
	public String orderHistory(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<GetOrderHeaderDisplay> orderList = new ArrayList<>();
		FEDataTraveller data = new FEDataTraveller();
		int custId = 0;
		try {
			HttpSession session = request.getSession();

			int compId = (int) session.getAttribute("companyId");
			custId = (Integer) session.getAttribute("custId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("compId", compId);
			map.add("custId", custId);
			System.err.println("Map " + map);
			if (custId > 0) {
				GetOrderHeaderDisplay[] orderRepArr = Constants.getRestTemplate().postForObject(
						Constants.url + "/getOrderHistoryListByCustId", map, GetOrderHeaderDisplay[].class);

				orderList = new ArrayList<GetOrderHeaderDisplay>(Arrays.asList(orderRepArr));
				model.addAttribute("orders", orderList);
				model.addAttribute("imgPath", Constants.PROD_IMG_VIEW_URL);
				int frId = 0;
				try {
					frId = (int) session.getAttribute("frId");
				} catch (Exception e) {
					e.printStackTrace();
				}
				ObjectMapper mapper = new ObjectMapper();

				List<GetFlavorTagStatusList> tagList = new ArrayList<>();
				data = mapper.readValue(new File(Constants.JSON_FILES_PATH + frId + "_.json"), FEDataTraveller.class);

				try {
					for (GetFlavorTagStatusList tag : data.getFlavorTagStatusList()) {
						if (tag.getFilterTypeId() == 7) {
							tagList.add(tag);
						}
					}
				} catch (Exception e) {

				}

				ObjectMapper Obj = new ObjectMapper();
				String jsonStr = "";
				try {
					jsonStr = Obj.writeValueAsString(tagList);
				} catch (Exception e) {
				}

				model.addAttribute("tagsJson", jsonStr);
			}
		} catch (Exception e) {
			return "redirect:/";
		}
		if (custId == 0) {
			return "redirect:/";
		}
		return "orderhistory";
	}
}
