package com.ats.ecommerce;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ats.ecommerce.common.CommonUtility;
import com.ats.ecommerce.common.Constants;
import com.atss.ecommerce.model.City;
import com.atss.ecommerce.model.CityData;
import com.atss.ecommerce.model.Customer;
import com.atss.ecommerce.model.CustomerAddDetail;
import com.atss.ecommerce.model.Info;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class MasterController {

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(HttpServletRequest request, HttpServletResponse response, Model model) {
		try {

			HttpSession session = request.getSession();

//			List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
//			Info view = AccessControll.checkAccess("showCustomers", "showCustomers", "1", "0", "0", "0", newModuleList);
//
//			if (view.isError() == true) {
//
//				mav = "accessDenied";
//
//			} else {

			int custId = (Integer) session.getAttribute("custId");
			int compId = (Integer) session.getAttribute("companyId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("custId", custId);
			Customer cust = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
					Customer.class);
			model.addAttribute("cust", cust);

			String[] billAddress = cust.getExVar3().split("~");
			model.addAttribute("getFlat", billAddress[0]);
			model.addAttribute("getArea", billAddress[1]);
			model.addAttribute("getLandmark", billAddress[2]);
			model.addAttribute("getPin", billAddress[3]);
			model.addAttribute("profileImg", Constants.UPLOAD_URL + cust.getProfilePic());

			CustomerAddDetail[] addrsArr = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllCustomerDetailByCustId", map, CustomerAddDetail[].class);
			List<CustomerAddDetail> custAddList = new ArrayList<CustomerAddDetail>(Arrays.asList(addrsArr));

			model.addAttribute("custAddList", custAddList);

			map = new LinkedMultiValueMap<>();
			map.add("compId", compId);

//			City[] cityArr = Constants.getRestTemplate().postForObject(Constants.url + "getAllCities", map,
//					City[].class);
//			List<City> cityList = new ArrayList<City>(Arrays.asList(cityArr));
			
			ObjectMapper mapper = new ObjectMapper();
			CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
					CityData[].class);
			List<CityData> cityList = new ArrayList<>(Arrays.asList(city));

			model.addAttribute("cityList", cityList);

//				Info add = AccessControll.checkAccess("showCustomers", "showCustomers", "0", "1", "0", "0",
//						newModuleList);
//				Info edit = AccessControll.checkAccess("showCustomers", "showCustomers", "0", "0", "1", "0",
//						newModuleList);
//				Info delete = AccessControll.checkAccess("showCustomers", "showCustomers", "0", "0", "0", "1",
//						newModuleList);
//
//				if (add.isError() == false) { // System.out.println(" add Accessable ");
//					model.addAttribute("addAccess", 0);
//
//				}
//				if (edit.isError() == false) { // System.out.println(" edit Accessable ");
//					model.addAttribute("editAccess", 0);
//				}
//				if (delete.isError() == false) { //
//					System.out.println(" delete Accessable ");
//					model.addAttribute("deleteAccess", 0);
//
//				}
//			}		
		} catch (Exception e) {
			System.out.println("Exception in /profile : " + e.getMessage());
			e.printStackTrace();
		}
		return "profile";
	}

	@RequestMapping(value = "/updateCustProfile", method = RequestMethod.POST)
	public String updateCustProfile(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("doc") MultipartFile doc) {
		try {

			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String curDateTime = CommonUtility.getCurrentYMDDateTime();

			String profileImage = null;

			HttpSession session = request.getSession();
			int companyId = (int) session.getAttribute("companyId");
			Info info = new Info();
			if (!doc.getOriginalFilename().equalsIgnoreCase("")) {

				profileImage = dateFormat.format(date) + "_" + doc.getOriginalFilename();

				try {
					// new ImageUploadController().saveUploadedFiles(doc, 1, profileImage);
					info = ImageUploadController.saveImgFiles(doc, Constants.imageFileExtensions, profileImage);
				} catch (Exception e) {
				}

			} else {
				profileImage = request.getParameter("editImg");

			}

			String billFlat = request.getParameter("txtFlat");
			String billArea = request.getParameter("txtArea");
			String billLandmark = request.getParameter("txtLandmark");
			String billPincode = request.getParameter("txtPincode");

			String billAddress = billFlat + "~" + billArea + "~" + billLandmark + "~" + billPincode;

			Customer cust = new Customer();

			int custId = (Integer) session.getAttribute("custId");

			if (custId > 0) {
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("custId", custId);
				Customer cust1 = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
						Customer.class);

				cust.setUpdtDttime(curDateTime);
				cust.setInsertDttime(cust1.getInsertDttime());
				cust.setAgeRange(cust1.getAgeRange());
				cust.setMakerUserId(cust1.getMakerUserId());
				cust.setLanguageId(cust1.getLanguageId());
			}

			cust.setCityId(Integer.parseInt(request.getParameter("city")));
			cust.setCustAddPlatform(2);
			cust.setCustGender(Integer.parseInt(request.getParameter("gender")));
			cust.setCustId(custId);
			cust.setCustMobileNo(request.getParameter("txtMobile"));
			cust.setCustName(request.getParameter("txtBillName"));
			cust.setDateOfBirth(request.getParameter("txtDob"));
			cust.setEmailId(request.getParameter("txtEmail"));
			cust.setIsPrimiunmCust(0);
			cust.setProfilePic(profileImage);
			cust.setCompanyId(companyId);
			cust.setIsActive(1);
			cust.setDelStatus(1);
			cust.setExInt1(Integer.parseInt(request.getParameter("defltAddressId")));
			cust.setExInt2(0);
			cust.setExInt3(0);
			cust.setExVar1("NA");
			cust.setExVar2(request.getParameter("txtGst"));
			cust.setExVar3(billAddress);

			System.err.println(cust.toString());
			Customer res = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomer", cust,
					Customer.class);

			if (res.getCustId() > 0) {
				session.setAttribute("successMsg", "Profile Update Successfully");
			} else {
				session.setAttribute("errorMsg", "Failed to Update Profile");
			}

		} catch (Exception e) {
			System.out.println("Exception in updateCustProfile : " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/profile";
	}

	@RequestMapping(value = "/addNewCustomer", method = RequestMethod.GET)
	public String addNewCustomer(HttpServletRequest request, HttpServletResponse response, Model model) {
		try {

			HttpSession session = request.getSession();

//			List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
//			Info view = AccessControll.checkAccess("showCustomers", "showCustomers", "1", "0", "0", "0", newModuleList);
//
//			if (view.isError() == true) {
//
//				mav = "accessDenied";
//
//			} else {

			int compId = (Integer) session.getAttribute("companyId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("compId", compId);

			ObjectMapper mapper = new ObjectMapper();
			CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
					CityData[].class);
			List<CityData> cityList = new ArrayList<>(Arrays.asList(city));
			model.addAttribute("cityList", cityList);

//				Info add = AccessControll.checkAccess("showCustomers", "showCustomers", "0", "1", "0", "0",
//						newModuleList);
//				Info edit = AccessControll.checkAccess("showCustomers", "showCustomers", "0", "0", "1", "0",
//						newModuleList);
//				Info delete = AccessControll.checkAccess("showCustomers", "showCustomers", "0", "0", "0", "1",
//						newModuleList);
//
//				if (add.isError() == false) { // System.out.println(" add Accessable ");
//					model.addAttribute("addAccess", 0);
//
//				}
//				if (edit.isError() == false) { // System.out.println(" edit Accessable ");
//					model.addAttribute("editAccess", 0);
//				}
//				if (delete.isError() == false) { //
//					System.out.println(" delete Accessable ");
//					model.addAttribute("deleteAccess", 0);
//
//				}
//			}		
		} catch (Exception e) {
			System.out.println("Exception in /addNewCustomer : " + e.getMessage());
			e.printStackTrace();
		}
		return "addCustomer";
	}

	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public String addCustomer(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("doc") MultipartFile doc) {
		try {
			HttpSession session = request.getSession();

			int custId = (Integer) session.getAttribute("custId");
			if (custId==0) {
				Date date = new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String curDateTime = CommonUtility.getCurrentYMDDateTime();

				String profileImage = null;

				int companyId = (int) session.getAttribute("companyId");
				Info info = new Info();
				if (!doc.getOriginalFilename().equalsIgnoreCase("")) {

					profileImage = dateFormat.format(date) + "_" + doc.getOriginalFilename();

					try {
						// new ImageUploadController().saveUploadedFiles(doc, 1, profileImage);
						info = ImageUploadController.saveImgFiles(doc, Constants.imageFileExtensions, profileImage);
					} catch (Exception e) {
					}

				}

				String billFlat = request.getParameter("txtFlat");
				String billArea = request.getParameter("txtArea");
				String billLandmark = request.getParameter("txtLandmark");
				String billPincode = request.getParameter("txtPincode");

				String billAddress = billFlat + "~" + billArea + "~" + billLandmark + "~" + billPincode;

				Customer cust = new Customer();

				if (custId > 0) {
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
					map.add("custId", custId);
					Customer cust1 = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
							Customer.class);

					cust.setUpdtDttime(curDateTime);
					cust.setInsertDttime(cust1.getInsertDttime());
					cust.setAgeRange(cust1.getAgeRange());
					cust.setMakerUserId(cust1.getMakerUserId());
					cust.setLanguageId(cust1.getLanguageId());
				} else {
					cust.setUpdtDttime(curDateTime);
					cust.setInsertDttime(curDateTime);
					cust.setAgeRange(2);
					cust.setMakerUserId(0);
					cust.setLanguageId(1);
				}

				int defaultCustAddrs = 0;
				try {
					defaultCustAddrs = Integer.parseInt(request.getParameter("defltAddressId"));
				} catch (Exception e) {
					defaultCustAddrs = 0;
				}
				cust.setCityId(Integer.parseInt(request.getParameter("city")));
				cust.setCustAddPlatform(2);
				cust.setCustGender(Integer.parseInt(request.getParameter("gender")));
				cust.setCustId(custId);
				cust.setCustMobileNo(request.getParameter("txtMobile"));
				cust.setCustName(request.getParameter("txtBillName"));
				cust.setDateOfBirth(request.getParameter("txtDob"));
				cust.setEmailId(request.getParameter("txtEmail"));
				cust.setIsPrimiunmCust(0);
				cust.setProfilePic(profileImage);
				cust.setCompanyId(companyId);
				cust.setIsActive(1);
				cust.setDelStatus(1);
				cust.setExInt1(defaultCustAddrs);
				cust.setExInt2(0);
				cust.setExInt3(0);
				cust.setExVar1("NA");
				cust.setExVar2(request.getParameter("txtGst"));
				cust.setExVar3(billAddress);

				System.err.println(cust.toString());
				Customer res = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomer", cust,
						Customer.class);
				session.setAttribute("custId", res.getCustId());
			}

		} catch (Exception e) {
			System.out.println("Exception in /addCustomer : " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/checkout";

	}

}
