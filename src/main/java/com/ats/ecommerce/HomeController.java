package com.ats.ecommerce;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
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
import com.ats.ecommerce.model.CityData;
import com.ats.ecommerce.model.Customer;
import com.ats.ecommerce.model.FEDataTraveller;
import com.ats.ecommerce.model.FEProductHeader;
import com.ats.ecommerce.model.GetFlavorTagStatusList;
import com.ats.ecommerce.model.Info;
import com.ats.ecommerce.model.TempImageHolder;
import com.ats.ecommerce.model.order.OrderDetail;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import java.util.Base64;
import java.util.Base64.Decoder;

@Controller
@Scope("session")

public class HomeController {

	FEDataTraveller data = new FEDataTraveller();

	// Modified By -Sachin
	// Modific Date -03-11-2020
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		// System.err.println("Data home " +data.toString());
		HttpSession session = request.getSession();
		String strFrId = "0";
		int frId = 0;
		try {
			frId = (int) session.getAttribute("frId");

			System.err.println("Fr Id " + strFrId);
		} catch (Exception e) {
			System.err.println("In Home catch");
		}

		ObjectMapper mapper = new ObjectMapper();
		try {
			if (frId > 0)
				data = mapper.readValue(new File(Constants.JSON_FILES_PATH + frId + "_.json"), FEDataTraveller.class);
			System.err.println("data " + data.toString());

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
			System.err.println("custId " + custId);

			if (custId > 0) {
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("custId", custId);
				Customer cust = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
						Customer.class);
				session.setAttribute("userName", cust.getCustName());
				session.setAttribute("userEmail", cust.getEmailId());
				session.setAttribute("userMobile", cust.getCustMobileNo());
				session.setAttribute("userAddress", cust.getExVar3());
				session.setAttribute("profileImg", Constants.PROFILE_IMG_VIEW_URL + cust.getProfilePic());
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

		model.addAttribute("tagsJson", jsonStr);

		if (frId > 0)
			return "home";
		else
			return "redirect:/";
	}

	@RequestMapping(value = "/preHome", method = RequestMethod.POST)
	public String preHome(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		System.err.println("in Pre Home");
		HttpSession session = request.getSession();
		session.setAttribute("custId", 0);
		int frId = 0;

		try {
			frId = Integer.parseInt(request.getParameter("selectShop"));
			System.err.println("FrId " + frId);
			session.setAttribute("frId", frId);
			try {
				String landMark = request.getParameter("txtPlaces");
				session.setAttribute("landMark", landMark);
				System.err.println("landMark " + landMark);
			} catch (Exception em) {
				System.err.println("In Landmark Catch");
			}
		} catch (Exception e) {
			System.err.println("In Catch " + frId);
			try {
				System.err.println("Inner Try " + frId);
				// session.setAttribute("frId", session.getAttribute("frId"));
			} catch (Exception ex) {
				System.err.println("Inner Catch ");
				// session.setAttribute("frId",0);
			}
		}

		Cookie frIdCookie = new Cookie("frIdCookie", EncodeDecode.Encrypt("" + frId));
		frIdCookie.setMaxAge(60 * 60 * 24 * 15);
		response.addCookie(frIdCookie);

		session.setAttribute("userId", 0);
		return "redirect:/home";
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
	public String showContactUsPage(Locale locale, Model model) {
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
			CityData[] city = mapper.readValue(new File(Constants.CITY_JSON_FILES_PATH),
					CityData[].class);
			List<CityData> cityList = new ArrayList<>(Arrays.asList(city));

			model.addAttribute("cityList", cityList);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return "becmVendorFr";
	}
}
