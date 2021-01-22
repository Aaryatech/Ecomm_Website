package com.ats.ecommerce;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Scanner;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ats.ecommerce.common.CommonUtility;
import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.common.EncodeDecode;
import com.ats.ecommerce.model.CateFilterConfig;
import com.ats.ecommerce.model.CategoryList;
import com.ats.ecommerce.model.CityData;
import com.ats.ecommerce.model.CompanyTestomonials;
import com.ats.ecommerce.model.Customer;
import com.ats.ecommerce.model.CustomerAddDetail;
import com.ats.ecommerce.model.FEDataTraveller;
import com.ats.ecommerce.model.FEProductHeader;
import com.ats.ecommerce.model.FilterTypes;
import com.ats.ecommerce.model.GetFlavorTagStatusList;
import com.ats.ecommerce.model.Info;
import com.ats.ecommerce.model.MFilter;
import com.ats.ecommerce.model.TempImageHolder;
import com.ats.ecommerce.model.cms.ContactUs;
import com.ats.ecommerce.model.offer.SiteVisitor;
import com.ats.ecommerce.model.order.OrderDetail;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@Scope("session")

public class HomeController {

	FEDataTraveller data = new FEDataTraveller();

	// Modified By -Sachin
	// Modific Date -03-11-2020
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		System.err.println("In  home ");
		HttpSession session = request.getSession();
		String strFrId = "0";
		int frId = 0;
		try {
			frId = (int) session.getAttribute("frId");

			System.err.println("Fr Id " + frId);
		} catch (Exception e) {
			System.err.println("In Home catch");
		}

		ObjectMapper mapper = new ObjectMapper();
		try {
			if (frId > 0)
				data = mapper.readValue(new File(Constants.JSON_FILES_PATH + frId + "_.json"), FEDataTraveller.class);
			// System.err.println("data " + data.toString());

			try {

				Gson gson = new Gson();
				FEDataTraveller old = gson.fromJson(session.getAttribute("allDataJson").toString(),
						FEDataTraveller.class);

				if (old != null) {

					for (FEProductHeader prod : data.getFeProductHeadList()) {

						for (FEProductHeader oldProd : old.getFeProductHeadList()) {

							if (oldProd.getProductId() == prod.getProductId()) {

								prod.setIsLike(oldProd.getIsLike());
								break;

							}

						}

					}

				}

				String jsonStr = mapper.writeValueAsString(data);
				session.setAttribute("allDataJson", jsonStr);

			} catch (Exception e) {
				String jsonStr = mapper.writeValueAsString(data);
				session.setAttribute("allDataJson", jsonStr);
			}
			try {

			} catch (Exception e) {
				// TODO: handle exception
			}

			try {
				if (frId > 0)
					session.setAttribute("companyId", data.getFranchiseCatList().get(0).getCompanyId());
			} catch (Exception e) {
				session.setAttribute("companyId", 0);
			}
			String dataList = new String();
			if (frId > 0) {
				dataList = new Scanner(new File(Constants.JSON_FILES_PATH + frId + "_.json")).useDelimiter("\\Z")
						.next();
				session.setAttribute("dataList", dataList);

				model.addAttribute("frCatList", data.getFranchiseCatList());
				model.addAttribute("bannerList", data.getCompanyBannerList());

				model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);
				model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
				model.addAttribute("offerImgUrl", Constants.OFFER_IMG_VIEW_URL);

				model.addAttribute("prodHeaderList", data.getFeProductHeadList());
				model.addAttribute("flavTagStatusList", data.getFlavorTagStatusList());
				model.addAttribute("festiveEventList", data.getFestEventList());

				model.addAttribute("festiveEventList", data.getFestEventList());
				model.addAttribute("festEventImgUrl", Constants.FEST_IMG_VIEW_URL);

				model.addAttribute("testMonialList", data.getTestimonialList());
				model.addAttribute("TestimonialImgUrl", Constants.TESTMON_IMG_VIEW_URL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			int custId = (int) session.getAttribute("custId");
			System.err.println("custId dsdsdsd" + custId);

			if (custId > 0) {
				System.err.println("custId >0 " + custId);
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("custId", custId);
				Customer cust = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
						Customer.class);
				session.setAttribute("userName", cust.getCustName());
				session.setAttribute("userEmail", cust.getEmailId());
				session.setAttribute("userMobile", cust.getCustMobileNo());
				session.setAttribute("userAddress", cust.getExVar3());
				session.setAttribute("profileImg", Constants.PROFILE_IMG_VIEW_URL + cust.getProfilePic());
				//session.setAttribute("mobNo", cust.getCustMobileNo());
			} else {
				System.err.println("custId <1 " + custId);
				session.removeAttribute("userName");
				session.removeAttribute("userEmail");
				session.removeAttribute("userMobile");
				session.removeAttribute("userAddress");
				session.removeAttribute("profileImg");
				//session.removeAttribute("mobNo");
			}
		} catch (Exception e) {
			System.err.println("In Home catch");
			// e.printStackTrace();
		}

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
		try {
		
			int likeCount= (int) session.getAttribute("likeCount");
			
		}catch (Exception e) {
			System.err.println("In catch");
			session.setAttribute("likeCount",0);
		}
		model.addAttribute("tagsJson", jsonStr);

		if (frId > 0) {
			System.err.println("A");
			return "home";
		} else {
			System.err.println("B");
			return "redirect:/";
		}
	}

//preHome preHomeOld Mapping
	@RequestMapping(value = "/preHomeOld", method = RequestMethod.POST)
	public String preHomeOld(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		System.err.println("in Pre Home");
		HttpSession session = request.getSession();
		int custId = 0;
		try {
			custId = (int) session.getAttribute("custId");
		} catch (Exception e) {
			session.setAttribute("custId", custId);
		}

		int frId = 0;
		float frKm = 0;
		try {
			frId = Integer.parseInt(request.getParameter("selectShop"));
			frKm = Float.parseFloat(request.getParameter("frKm"));

			System.err.println("FrId " + frId + " frKm " + frKm);
			session.setAttribute("frId", frId);
			session.setAttribute("frKm", frKm);
			Cookie frKmCookie = new Cookie("frKmCookie", EncodeDecode.Encrypt("" + frKm));
			frKmCookie.setMaxAge(60 * 60 * 24 * 15);
			response.addCookie(frKmCookie);
			try {
				String landMark = request.getParameter("txtPlaces");
				session.setAttribute("landMark", landMark);
				System.err.println("landMark " + landMark);
				Cookie landMarkCookie = new Cookie("landMarkCookie", EncodeDecode.Encrypt(landMark));
				landMarkCookie.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(landMarkCookie);

			} catch (Exception em) {
				System.err.println("In Landmark Catch");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("In Catch frId " + frId);
		
		}

		Cookie frIdCookie = new Cookie("frIdCookie", EncodeDecode.Encrypt("" + frId));
		frIdCookie.setMaxAge(60 * 60 * 24 * 15);
		response.addCookie(frIdCookie);

		// 24-12-2020
		Cookie frKmCookie = new Cookie("frKmCookie", EncodeDecode.Encrypt("" + frKm));
		frKmCookie.setMaxAge(60 * 60 * 24 * 15);
		response.addCookie(frKmCookie);

		// 4-01-2021
		Cookie delAddIdCookie = new Cookie("delAddIdCookie", EncodeDecode.Encrypt("" + 0));
		delAddIdCookie.setMaxAge(60 * 60 * 24 * 15);
		response.addCookie(delAddIdCookie);
		session.setAttribute("delAddId", 0);

		session.setAttribute("userId", 0);
		return "redirect:/home";
	}

	@RequestMapping(value = "/preHome", method = RequestMethod.POST)
	public @ResponseBody Object preHome(Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		System.err.println("in Pre Home new");
		int retPage = 0;
		HttpSession session = request.getSession();
		int custId = 0;
		try {
			custId = (int) session.getAttribute("custId");
		} catch (Exception e) {
			session.setAttribute("custId", custId);
		}
		String landMark = null;
		Cookie landMarkCookie, frIdCookie, frKmCookie, delAddIdCookie;
		int frId = 0;
		float frKm = 0;
		System.err.println("Here " +request.getParameter("user_type"));
		int userType = Integer.parseInt(request.getParameter("user_type"));
		
		frId = Integer.parseInt(request.getParameter("selectShop"));
		session.setAttribute("frId", frId);

		frKm = Float.parseFloat(request.getParameter("frKm"));
		session.setAttribute("frKm", frKm);

		landMark = request.getParameter("txtPlaces");
		session.setAttribute("landMark", landMark);
		System.err.println("frId " + frId + " frKm " + frKm + "landMark " + landMark);
		landMarkCookie = new Cookie("landMarkCookie", EncodeDecode.Encrypt(landMark));
		landMarkCookie.setMaxAge(60 * 60 * 24 * 15);
		response.addCookie(landMarkCookie);

		frIdCookie = new Cookie("frIdCookie", EncodeDecode.Encrypt("" + frId));
		frIdCookie.setMaxAge(60 * 60 * 24 * 15);
		response.addCookie(frIdCookie);

		// 24-12-2020
		frKmCookie = new Cookie("frKmCookie", EncodeDecode.Encrypt("" + frKm));
		frKmCookie.setMaxAge(60 * 60 * 24 * 15);
		response.addCookie(frKmCookie);
		
		if (userType == 3) {
			try {
				

				// 4-01-2021
				delAddIdCookie = new Cookie("delAddIdCookie", EncodeDecode.Encrypt("" + 0));
				delAddIdCookie.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(delAddIdCookie);
				session.setAttribute("delAddId", 0);
				
				session.setAttribute("userId", 0);
				retPage = 3;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			// 06-01-2020
			try {
				String mobNo = request.getParameter("mobNo");
				String otp = request.getParameter("otp");

				LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				// getCustomerByMobNo
				map = new LinkedMultiValueMap<>();
				map.add("mobNo", mobNo);
				CustomerAddDetail custAddDetail = Constants.getRestTemplate()
						.postForObject(Constants.url + "getCustomerByMobNo", map, CustomerAddDetail.class);

				if (userType == 1 && custAddDetail == null) {
					// Save to Db and goto home
					System.err.println("Ok If 1 and null ");
					SiteVisitor visitor = new SiteVisitor();
					visitor.setFrId(frId);
					visitor.setLandMark(landMark);
					visitor.setMobNo(mobNo);
					visitor.setVisitDttime(CommonUtility.getCurrentYMDDateTime());

					SiteVisitor siteVisitorSaveRes = Constants.getRestTemplate()
							.postForObject(Constants.url + "saveSiteVisitor", visitor, SiteVisitor.class);
					System.err.println("siteVisitorSaveRes " + siteVisitorSaveRes);
					session.setAttribute("custId", 0);
					retPage = 1;
				} else if (userType == 2 && custAddDetail == null) {
					System.err.println("Ok userType==2 && custAddDetail=null ");
					retPage = 0;
				} else if (custAddDetail != null) {
					// goto home
					System.err.println("Ok else if custAddDetail!=null " + custAddDetail);

					session.setAttribute("custId", custAddDetail.getCustId());
					// frId = Integer.parseInt(request.getParameter("selectShop"));
					frId = custAddDetail.getExInt3();
					session.setAttribute("frId", frId);
					try {
						frKm = Float.parseFloat(custAddDetail.getExVar3());
					} catch (Exception e) {
						frKm = 0;
					}
					session.setAttribute("frKm", frKm);

					landMark = custAddDetail.getLandmark();
					session.setAttribute("landMark", landMark);
					landMarkCookie = new Cookie("landMarkCookie", EncodeDecode.Encrypt(landMark));
					landMarkCookie.setMaxAge(60 * 60 * 24 * 15);
					response.addCookie(landMarkCookie);
					
					Cookie custIdCookie=new Cookie("custIdCookie", EncodeDecode.Encrypt(""+custId));
					custIdCookie.setMaxAge(60 * 60 * 24 * 15);
					response.addCookie(custIdCookie);
					

					frIdCookie = new Cookie("frIdCookie", EncodeDecode.Encrypt("" + frId));
					frIdCookie.setMaxAge(60 * 60 * 24 * 15);
					response.addCookie(frIdCookie);

					// 24-12-2020
					frKmCookie = new Cookie("frKmCookie", EncodeDecode.Encrypt("" + frKm));
					frKmCookie.setMaxAge(60 * 60 * 24 * 15);
					response.addCookie(frKmCookie);

					// 4-01-2021
					delAddIdCookie = new Cookie("delAddIdCookie",
							EncodeDecode.Encrypt("" + custAddDetail.getCustDetailId()));
					delAddIdCookie.setMaxAge(60 * 60 * 24 * 15);
					response.addCookie(delAddIdCookie);
					session.setAttribute("delAddId", custAddDetail.getCustDetailId());
					session.setAttribute("userId", 0);
					retPage = 2;

				}
				System.err.println("Mob No Here " + mobNo);
				session.setAttribute("mobNo", mobNo);
				System.err.println("frId Here " + frId);
			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("In Catch here  " + frId);
			}
		}
		return retPage;
	}
	
	//Sachin 12-01-2021
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response,Model model) {
		String returnPage="";
		ObjectMapper mapper = new ObjectMapper();
		CityData[] city = null;
		try {
			city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
					CityData[].class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<CityData> cityList = null;
		try {
		  cityList = new ArrayList<>(Arrays.asList(city));
		}catch (Exception e) {
			// TODO: handle exception
		}
		String frData = null;
		try {
			frData = new Scanner(new File(Constants.JSON_FILES_PATH + "AllFrData_.json")).useDelimiter("\\Z")
					.next();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("cityList", cityList);
		model.addAttribute("frData", frData);

		CategoryList[] catArray = null;
		try {
			catArray = mapper.readValue(
					new File(Constants.JSON_FILES_PATH + "MasterCategoryData_.json"), CategoryList[].class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<CategoryList> catList=null;
		try {
		 catList = new ArrayList<>(Arrays.asList(catArray));
		}catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("catList", catList);
		model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);

		CompanyTestomonials[] testMonArray = null;
		try {
			testMonArray = mapper.readValue(
					new File(Constants.JSON_FILES_PATH + "MasterTestimonialData_.json"), CompanyTestomonials[].class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<CompanyTestomonials> testMonialList =null;
		try {
		 testMonialList = new ArrayList<>(Arrays.asList(testMonArray));
		}catch (Exception e) {
			
		}
		model.addAttribute("testMonialList", testMonialList);
		model.addAttribute("TestimonialImgUrl", Constants.TESTMON_IMG_VIEW_URL);
		model.addAttribute("isAddNewAdd", 0);
		
		HttpSession session=request.getSession();
		
		session.removeAttribute("userName");
		session.removeAttribute("userEmail");
		session.removeAttribute("userMobile");
		session.removeAttribute("userAddress");
		session.removeAttribute("profileImg");
		session.removeAttribute("mobNo");
		session.removeAttribute("frId");
		session.removeAttribute("custId");
		session.removeAttribute("landMark");
		session.removeAttribute("frKm");
		
		session.removeAttribute("allDataJson");
		session.removeAttribute("likeCount");
		
		returnPage = "landing";
		
		return returnPage;
	}
	
	// Modified By -Sachin
	// Modific Date -11-11-2020
	@RequestMapping(value = "/showProdDetail/{index}", method = RequestMethod.GET)
	public String showProdDetailIndex(@PathVariable int index, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		System.err.println("In Show Prod Detail");
		try {
			model.addAttribute("frCatList", data.getFranchiseCatList());

			model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("prodHeaderList", data.getFeProductHeadList());
			model.addAttribute("flavTagStatusList", data.getFlavorTagStatusList());

			FEProductHeader prodHeader = data.getFeProductHeadList().get(index);
			model.addAttribute("prodHeader", prodHeader);

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
			e.printStackTrace();
		}
		return "productdetail";
	}

	@RequestMapping(value = "/showProductDetail/{id}", method = RequestMethod.GET)
	public String showProductDetail(@PathVariable int id, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		System.err.println("In Show Product Detail");
		try {
			model.addAttribute("frCatList", data.getFranchiseCatList());

			model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("prodHeaderList", data.getFeProductHeadList());
			model.addAttribute("flavTagStatusList", data.getFlavorTagStatusList());

			FEProductHeader prodHeader = null;

			if (data.getFeProductHeadList() != null) {
				for (FEProductHeader prod : data.getFeProductHeadList()) {
					if (prod.getProductId() == id) {
						prodHeader = prod;
						break;
					}
				}
			}

			// FEProductHeader prodHeader = data.getFeProductHeadList().get(index);
			model.addAttribute("prodHeader", prodHeader);

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
			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map = new LinkedMultiValueMap<>();
			int companyId = (int) request.getSession().getAttribute("companyId");
			map.add("compId", companyId);
			map.add("itemIds", id);
			Integer[] relateItemArray = Constants.getRestTemplate()
					.postForObject(Constants.url + "getRelateProductByProductIds", map, Integer[].class);
			System.err.println("relateItemArray " +relateItemArray.length);
			model.addAttribute("relateItemArray", relateItemArray);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "productdetail";
	}

	@RequestMapping(value = "/getAllFrWiseData", method = RequestMethod.POST)
	@ResponseBody
	public FEDataTraveller getAllFrWiseData(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();

		Gson gson = new Gson();
		FEDataTraveller data = gson.fromJson(session.getAttribute("allDataJson").toString(), FEDataTraveller.class);

		return data;
	}

	// Sachin 25-11-2020
	// showEventBasedCakes
	@RequestMapping(value = "/showEventBasedCakes/{index}", method = RequestMethod.GET)
	public String showEventBasedCakesIndex(@PathVariable int index, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String returnPage = "productlist";
		try {
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

			model.addAttribute("prodHeaderList", data.getFeProductHeadList());

			model.addAttribute("festiveEvent", data.getFestEventList().get(index));

			System.err.println("INDEX - " + index + "    -------> " + data.getFestEventList().get(index));
			

			
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

							int compId = (Integer) request.getSession().getAttribute("companyId");

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

							int compId = (Integer) request.getSession().getAttribute("companyId");

							MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
							map.add("compId", compId);

							FilterTypes[] filterArr = Constants.getRestTemplate()
									.postForObject(Constants.url + "getActiveFilterTypes", map, FilterTypes[].class);
							allFilterTypeList = new ArrayList<FilterTypes>(Arrays.asList(filterArr));

						} catch (Exception e) {
							e.printStackTrace();
						}

						model.addAttribute("allListFilter", 1);
						model.addAttribute("allData", data);
						model.addAttribute("allFilterList", allFilterList);
						model.addAttribute("allFilterTypeList", allFilterTypeList);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnPage;

	}

	@RequestMapping(value = "/landing", method = RequestMethod.GET)
	public String landing(Locale locale, Model model) {
		return "landing";
	}

	@RequestMapping(value = "/productlist", method = RequestMethod.GET)
	public String productList(Locale locale, Model model) {
		return "productlist";
	}

	@RequestMapping(value = "/productdetail", method = RequestMethod.GET)
	public String productDetail(Locale locale, Model model) {
		return "productdetail";
	}

//	@RequestMapping(value = "/addresslist", method = RequestMethod.GET)
//	public String addressList(Locale locale, Model model) {
//		return "addresslist";
//	}

//	@RequestMapping(value = "/profile", method = RequestMethod.GET)
//	public String profile(Locale locale, Model model) {
//		return "profile";
//	}

//	@RequestMapping(value = "/orderhistory", method = RequestMethod.GET)
//	public String orderHistory(Locale locale, Model model) {
//		return "orderhistory";
//	}

	@RequestMapping(value = "/viewcart", method = RequestMethod.GET)
	public String viewCart(Locale locale, Model model) {
		return "viewcart";
	}

	@RequestMapping(value = "/viewmap", method = RequestMethod.GET)
	public String viewMap(Locale locale, Model model) {

		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);

		System.err.println(lat + "          " + lng);

		return "viewmap";
	}

	String lat = "0", lng = "0";

	@RequestMapping(value = "/viewmapNew", method = RequestMethod.GET)
	public @ResponseBody Info viewMap(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();

		try {
			lat = request.getParameter("lat");
			lng = request.getParameter("lng");
		} catch (Exception e) {
		}

		System.err.println(lng + "          " + lat);
		info.setError(false);

		return info;
	}

	@RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
	public @ResponseBody Object uploadImg(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("In uploadImg");
		try {
			String imgData = request.getParameter("imageData");
			System.err.println(" imgData " + imgData);
			ObjectMapper objectMapper = new ObjectMapper();

			// convert json string to object
			TempImageHolder[] imageJsonArray = objectMapper.readValue(imgData, TempImageHolder[].class);
			System.err.println("imageJsonArray " + imageJsonArray[0].toString());
			System.err.println("img " + decodeToImage(imageJsonArray[0].getImgFile()));
			// ImageUploadController.saveImgFiles(decodeToImage(imageJsonArray[0].getImgFile()),
			// Constants.imageFileExtensions, imageJsonArray[0].getImgName());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "viewmap";
	}

	public static BufferedImage decodeToImage(String imageString) {

		BufferedImage image = null;
		byte[] imageByte;
		ByteArrayInputStream bis = null;
		try {
			Decoder decoder = Base64.getDecoder();
			imageByte = decoder.decode(imageString);
			bis = new ByteArrayInputStream(imageByte);
			image = ImageIO.read(bis);

			System.err.println("original width" + image.getWidth() + "height " + image.getHeight());

			int height = (int) ((image.getHeight()) - (image.getHeight() * 0.25));
			int width = (int) ((image.getWidth()) - (image.getWidth() * 0.25));
			System.err.println("width" + width + "height " + height);
			ImageUploadController.saveImgWithByteArray(imageByte, "sai11.jpeg", width, height);
			bis.close();
		} catch (Exception e) {
			try {
				bis.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}

		return image;

	}

	@RequestMapping(value = "/showAboutUsPage", method = RequestMethod.GET)
	public String showAboutUsPage(Locale locale, Model model) {
		return "about-us";
	}

	@RequestMapping(value = "/showContactUsPage", method = RequestMethod.GET)
	public String showContactUsPage(Locale locale, Model model) throws JsonParseException, JsonMappingException, IOException {
		int compId = data.getFranchiseCatList().get(0).getCompanyId();
		System.out.println("Compan Id : "+compId);
		
		ContactUs cus = new ContactUs();
		
		ObjectMapper mapper = new ObjectMapper();
		ContactUs[] cusArr = null;
		
		cusArr = mapper.readValue(new File(Constants.JSON_FILES_PATH + "1_ContactUS_.json"),
					ContactUs[].class);
			
		List<ContactUs> cusList = new ArrayList<ContactUs>(Arrays.asList(cusArr));
		for (int i = 0; i < cusList.size(); i++) {
			if(cusList.get(i).getCompanyId()==compId) {
				
				cus.setCompanyId(compId);
				
				cus.setEmailText(cusList.get(i).getEmailText());
				cus.setEmail1(cusList.get(i).getEmail2());
				cus.setEmail2(cusList.get(i).getEmail1());			

				cus.setManufacAddressTxt(cusList.get(i).getManufacAddressTxt());
				cus.setManufacAddress(cusList.get(i).getManufacAddress());
				
				cus.setOfficeText(cusList.get(i).getManufacAddressTxt());
				cus.setOfficeAddress(cusList.get(i).getManufacAddress());			
				
				cus.setPageHead(cusList.get(i).getPageHead());
				cus.setSubHeading(cusList.get(i).getSubHeading());
				
				cus.setPhoneText(cusList.get(i).getPhoneText());
				cus.setPhone1(cusList.get(i).getPhone1());
				cus.setPhone2(cusList.get(i).getPhone2());
			}
		}
		
		model.addAttribute("cus", cus);			
		return "contact-us";
	}

	@RequestMapping(value = "/showT&CPage", method = RequestMethod.GET)
	public String showT(Locale locale, Model model) {
		return "terms-condition";
	}

	@RequestMapping(value = "/showVistStorePage", method = RequestMethod.GET)
	public String showVistStorePage(Locale locale, Model model) {
		return "visit-stores";
	}

	@RequestMapping(value = "/showBecmVendrFr", method = RequestMethod.GET)
	public String showBecmVendrFr(Locale locale, Model model) {
		try {
			ObjectMapper mapper = new ObjectMapper();
//			CityData[] city = mapper.readValue(new File(Constants.CITY_JSON_FILES_PATH),
//					CityData[].class);
//			List<CityData> cityList = new ArrayList<>(Arrays.asList(city));

			// model.addAttribute("cityList", cityList);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "becmVendorFr";
	}
	
	@RequestMapping(value = "/getFooterData", method = RequestMethod.GET)
	@ResponseBody
	public ContactUs getFooterData(HttpServletRequest request, HttpServletResponse response, Model model) throws JsonParseException, JsonMappingException, IOException {

		HttpSession session = request.getSession();
		ContactUs cus = new ContactUs();
		try {		
		ObjectMapper mapper = new ObjectMapper();
		ContactUs[] cusArr = null;
		
		cusArr = mapper.readValue(new File(Constants.JSON_FILES_PATH + "1_ContactUS_.json"),
					ContactUs[].class);
			
		List<ContactUs> cusList = new ArrayList<ContactUs>(Arrays.asList(cusArr));
		for (int i = 0; i < cusList.size(); i++) {
			if(cusList.get(i).getCompanyId()==1) {				
				
				cus.setFacebookLink(cusList.get(i).getFacebookLink());
				cus.setTwitterLink(cusList.get(i).getTwitterLink());
				cus.setLinkedInLink(cusList.get(i).getLinkedInLink());
				cus.setGoogleAcLink(cusList.get(i).getGoogleAcLink());
				
				cus.setFooterAddress(cusList.get(i).getFooterAddress());
				cus.setFooterEmail1(cusList.get(i).getFooterEmail1());			
				cus.setFooterEmail2(cusList.get(i).getFooterEmail2());
				cus.setFooterPhone1(cusList.get(i).getFooterPhone1());
				cus.setFooterPhone2(cusList.get(i).getFooterPhone2());
			}
		}
		}catch (Exception e) {
			e.getMessage();
		}
		return cus;
	}
}
