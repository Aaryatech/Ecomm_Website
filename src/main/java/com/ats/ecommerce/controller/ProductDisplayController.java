package com.ats.ecommerce.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.model.CateFilterConfig;
import com.ats.ecommerce.model.FEDataTraveller;
import com.ats.ecommerce.model.FEProductHeader;
import com.ats.ecommerce.model.FilterTypes;
import com.ats.ecommerce.model.GetFlavorTagStatusList;
import com.ats.ecommerce.model.Info;
import com.ats.ecommerce.model.MFilter;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

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
			// data = mapper.readValue(new File(Constants.JSON_FILES_PATH + "13_.json"),
			// FEDataTraveller.class);

			Gson gson = new Gson();
			data = gson.fromJson(session.getAttribute("allDataJson").toString(), FEDataTraveller.class);

			//System.err.println("SESSION ------------ " + data);

			// data =
			// mapper.readValue(session.getAttribute("allDataJson"),FEDataTraveller.class);

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

					List<Integer> typeIdList = Stream.of(cat.getFilterIds().split(",")).map(Integer::parseInt)
							.collect(Collectors.toList());

					// List<Integer> typeIdList = new ArrayList<>();
					// typeIdList.add(4);
					// typeIdList.add(12);

					cat.setTypeIdList(typeIdList);
					cat.setExInt2(typeIdList.size()+1);
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

				MFilter[] filterArr = Constants.getRestTemplate().postForObject(Constants.url + "getAllFilter", map,
						MFilter[].class);
				allFilterList = new ArrayList<MFilter>(Arrays.asList(filterArr));

			} catch (Exception e) {
			}

			// ALL FILTER TYPE LIST
			List<FilterTypes> allFilterTypeList = new ArrayList<>();
			try {

				int compId = (Integer) session.getAttribute("companyId");

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("compId", compId);

				FilterTypes[] filterArr = Constants.getRestTemplate()
						.postForObject(Constants.url + "getActiveFilterTypes", map, FilterTypes[].class);
				allFilterTypeList = new ArrayList<FilterTypes>(Arrays.asList(filterArr));

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

	@RequestMapping(value = "/showProductListCategory/{catId}", method = RequestMethod.GET)
	public String showProductListCategory(Model model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable int catId) {
		String returnPage = "productListCategory";
		try {

			HttpSession session = request.getSession();

			int frId = (int) session.getAttribute("frId");
			ObjectMapper mapper = new ObjectMapper();
			// data = mapper.readValue(new File(Constants.JSON_FILES_PATH + frId +
			// "_.json"), FEDataTraveller.class);

			Gson gson = new Gson();
			data = gson.fromJson(session.getAttribute("allDataJson").toString(), FEDataTraveller.class);
			
			//System.err.println("DATA ---------- "+data.getFrSubCatList());

			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

			model.addAttribute("allData", data);

			model.addAttribute("catId", catId);

			model.addAttribute("subCatImgUrl", Constants.CAT_IMG_VIEW_URL);
			
			
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

			model.addAttribute("tagsJson", jsonStr);

		} catch (Exception e) {
			return returnPage;
		}

		return returnPage;
	}
	@RequestMapping(value = "/setLikeOrDislike", method = RequestMethod.GET)
	public @ResponseBody Info setLikeOrDislike(HttpServletRequest request, HttpServletResponse response) {
		Info info = new Info();
		HttpSession session = request.getSession();
		try {

			int prodId = Integer.parseInt(request.getParameter("prodId"));

			Gson gson = new Gson();
			data = gson.fromJson(session.getAttribute("allDataJson").toString(), FEDataTraveller.class);

			int status=0;
			int likeCount=0; 
			try {
				likeCount=(int) session.getAttribute("likeCount");
			}catch (Exception e) {
				likeCount=0;
			}
			if (data != null) {

				for (FEProductHeader prod : data.getFeProductHeadList()) {

					if (prod.getProductId() == prodId) {

						if(prod.getIsLike()==0) {
							prod.setIsLike(1);
							status=1;
							likeCount=likeCount+1;
						}else {
							prod.setIsLike(0);
							status=0;
							if(likeCount>0)
							likeCount=likeCount-1;
						}
						break;
						
					}

				}

			}
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(data);
			session.setAttribute("allDataJson", jsonStr);
			
			info.setError(false);
			info.setMsg(""+status);
			info.setStatusText(jsonStr);
			session.setAttribute("likeCount", likeCount);
		} catch (Exception e) {
			info.setError(true);
			info.setMsg("0");
		}

		return info;
	}
	
	
	

	@RequestMapping(value = "/likeproducts", method = RequestMethod.GET)
	public String showLikedProducts(Model model, HttpServletRequest request, HttpServletResponse response) {
		String returnPage = "likeproducts";
		try {

			HttpSession session = request.getSession();

			int frId = (int) session.getAttribute("frId");

			Gson gson = new Gson();
			data = gson.fromJson(session.getAttribute("allDataJson").toString(), FEDataTraveller.class);

			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("allData", data);

		} catch (Exception e) {
			return returnPage;
		}

		return returnPage;
	}
	
	
	
	
	
	
	

}
