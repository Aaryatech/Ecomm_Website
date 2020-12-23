package com.ats.ecommerce.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.model.CateFilterConfig;
import com.ats.ecommerce.model.FEDataTraveller;
import com.ats.ecommerce.model.FEProductHeader;
import com.ats.ecommerce.model.FilterTypes;
import com.ats.ecommerce.model.GetFlavorTagStatusList;
import com.ats.ecommerce.model.MFilter;
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

		HttpSession session = request.getSession();

		try {

			ObjectMapper mapper = new ObjectMapper();
			data = mapper.readValue(new File(Constants.JSON_FILES_PATH + "13_.json"), FEDataTraveller.class);

			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

			model.addAttribute("prodHeaderList", data.getFeProductHeadList());
			model.addAttribute("flavTagStatusList", data.getFlavorTagStatusList());

			List<GetFlavorTagStatusList> tagList = new ArrayList<>();

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

			// ALL MENU CATEGORY LIST
			try {

				List<CateFilterConfig> catMenuList = new ArrayList<>();

				for (CateFilterConfig cat : data.getCatFilterConfig()) {

					// List<Integer> typeIdList =
					// Stream.of(cat.getFilterIds().split(",")).map(Integer::parseInt).collect(Collectors.toList());

					List<Integer> typeIdList = new ArrayList<>();
					typeIdList.add(4);
					typeIdList.add(12);

					cat.setTypeIdList(typeIdList);

					catMenuList.add(cat);
				}

				data.setCatFilterConfig(catMenuList);

			} catch (Exception e) {
			}

			// ALL FILTER LIST
			List<MFilter> allFilterList = new ArrayList<>();
			try {

				int compId = (Integer) session.getAttribute("companyId");

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("compId", compId);

//				MFilter[] filterArr = Constants.getRestTemplate().postForObject(Constants.url + "getAllFilter", map,
//						MFilter[].class);
//				allFilterList = new ArrayList<MFilter>(Arrays.asList(filterArr));

			} catch (Exception e) {
			}

			// ALL FILTER TYPE LIST
			List<FilterTypes> allFilterTypeList = new ArrayList<>();
			try {

				int compId = (Integer) session.getAttribute("companyId");

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("compId", compId);

//				FilterTypes[] filterArr = Constants.getRestTemplate()
//						.postForObject(Constants.url + "getActiveFilterTypes", map, FilterTypes[].class);
//				allFilterTypeList = new ArrayList<FilterTypes>(Arrays.asList(filterArr));

			} catch (Exception e) {
			}

			model.addAttribute("tagsJson", jsonStr);
			model.addAttribute("statusId", statusId);
			model.addAttribute("allListFilter", 1);
			model.addAttribute("allData", data);
			model.addAttribute("allFilterList", allFilterList);
			model.addAttribute("allFilterTypeList", allFilterTypeList);

		} catch (Exception e) {
			return returnPage;
		}
		return returnPage;
	}
}
