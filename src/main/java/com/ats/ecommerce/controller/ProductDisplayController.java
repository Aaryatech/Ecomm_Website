package com.ats.ecommerce.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.ecommerce.common.Constants;
import com.atss.ecommerce.model.FEDataTraveller;
import com.atss.ecommerce.model.GetFlavorTagStatusList;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class ProductDisplayController {

	FEDataTraveller data = new FEDataTraveller();

	// product.html
	@RequestMapping(value = "/products/{statusId}", method = RequestMethod.GET)
	public String moreCakeStatusWise(Model model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable int statusId) {
		String returnPage = "allProductFilter";
		try {

			ObjectMapper mapper = new ObjectMapper();
			data = mapper.readValue(new File(Constants.JSON_FILES_PATH + "27_.json"), FEDataTraveller.class);

			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

			model.addAttribute("prodHeaderList", data.getFeProductHeadList());
			model.addAttribute("flavTagStatusList", data.getFlavorTagStatusList());
			model.addAttribute("allData", data);

			List<GetFlavorTagStatusList> tagList=new ArrayList<>();
			
			try {
				for(GetFlavorTagStatusList tag : data.getFlavorTagStatusList()) {
					if(tag.getFilterTypeId()==7) {
						tagList.add(tag);
					}
				}
			}catch(Exception e) {
				
			}
			
			ObjectMapper Obj = new ObjectMapper();
			String jsonStr = "";
			try {
				jsonStr = Obj.writeValueAsString(tagList);
			} catch (Exception e) {
			}
			model.addAttribute("tagsJson", jsonStr);

			model.addAttribute("statusId", statusId);

			model.addAttribute("allListFilter", 1);

		} catch (Exception e) {
			return returnPage;
		}
		return returnPage;
	}
}
