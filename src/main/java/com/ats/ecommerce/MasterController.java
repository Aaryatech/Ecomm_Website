package com.ats.ecommerce;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Scanner;

import javax.servlet.http.Cookie;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ats.ecommerce.common.CommonUtility;
import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.common.EncodeDecode;
import com.ats.ecommerce.model.City;
import com.ats.ecommerce.model.CityData;
import com.ats.ecommerce.model.Customer;
import com.ats.ecommerce.model.CustomerAddDetail;
import com.ats.ecommerce.model.Info;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class MasterController {

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(HttpServletRequest request, HttpServletResponse response, Model model) {
		try {

			HttpSession session = request.getSession();

			int custId = (int) session.getAttribute("custId");
			int compId = (int) session.getAttribute("companyId");

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
			model.addAttribute("profileImg", Constants.PROFILE_IMG_VIEW_URL + cust.getProfilePic());

			CustomerAddDetail[] addrsArr = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllCustomerDetailByCustId", map, CustomerAddDetail[].class);
			List<CustomerAddDetail> custAddList = new ArrayList<CustomerAddDetail>(Arrays.asList(addrsArr));

			model.addAttribute("custAddList", custAddList);

			map = new LinkedMultiValueMap<>();
			map.add("compId", compId);

			ObjectMapper mapper = new ObjectMapper();
			CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
					CityData[].class);
			List<CityData> cityList = new ArrayList<>(Arrays.asList(city));

			model.addAttribute("cityList", cityList);

		} catch (Exception e) {
			System.out.println("Exception in /profile : " + e.getMessage());
			e.printStackTrace();
		}
		return "profile";
	}

	@RequestMapping(value = "/updateCustProfile", method = RequestMethod.POST)
	public String updateCustProfile(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("doc") MultipartFile doc, Model model) {
		String redirect = new String();
		try {

			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmms");
			Calendar cal = Calendar.getInstance();
			String curDateTime = CommonUtility.getCurrentYMDDateTime();

			String profileImage = null;

			HttpSession session = request.getSession();
			int companyId = (int) session.getAttribute("companyId");
			int custId = (int) session.getAttribute("custId");

			Info info = new Info();

			String email = request.getParameter("txtEmail");
			String mobNo = request.getParameter("txtMobile");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("email", email);
			map.add("custId", custId);
			Customer chkEmail = Constants.getRestTemplate().postForObject(Constants.url + "getCustByEmailId", map,
					Customer.class);
		
			
			map = new LinkedMultiValueMap<>();
			map.add("mobNo", mobNo);
			map.add("userId", custId);
			Customer chkMob = Constants.getRestTemplate().postForObject(Constants.url + "getCustByMobNo", map,
					Customer.class);
			
			if (chkEmail != null) {
				session.setAttribute("respMsg", "Email Id already exist");
				redirect = "redirect:/profile";
			} 
			else if (chkMob != null) {
				session.setAttribute("respMsg", "Mobile No. already exist");
				redirect = "redirect:/profile";
			} else {
				info.setError(true);
				info.setMsg("Customer Not Found");

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

				if (custId > 0) {
					map = new LinkedMultiValueMap<>();
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
				cust.setCustMobileNo(mobNo);
				cust.setCustName(request.getParameter("txtBillName"));
				cust.setDateOfBirth(request.getParameter("txtDob"));
				cust.setEmailId(email);
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
					session.setAttribute("custId",res.getCustId());
					Cookie custIdCookie = new Cookie("custIdCookie", EncodeDecode.Encrypt(""+res.getCustId())); 
					custIdCookie.setMaxAge(60 *  60 * 24 * 15); 
					response.addCookie(custIdCookie);
					session.setAttribute("userName", cust.getCustName());
					session.setAttribute("userMobile", cust.getCustMobileNo());
					session.setAttribute("userEmail", cust.getEmailId());
					session.setAttribute("profileImg", Constants.PROFILE_IMG_VIEW_URL + cust.getProfilePic());
				} else {
					session.setAttribute("respMsg", "Failed to Update Profile");
				}
				redirect = "redirect:/profile";
			}

		} catch (Exception e) {
			System.out.println("Exception in updateCustProfile : " + e.getMessage());
			e.printStackTrace();
		}

		return redirect;
	}

	@RequestMapping(value = "/addNewCustomer", method = RequestMethod.GET)
	public String addNewCustomer(HttpServletRequest request, HttpServletResponse response, Model model) {
		try {

			HttpSession session = request.getSession();

			int compId = (int) session.getAttribute("companyId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("compId", compId);

			ObjectMapper mapper = new ObjectMapper();
			CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
					CityData[].class);
			List<CityData> cityList = new ArrayList<>(Arrays.asList(city));
			model.addAttribute("cityList", cityList);

		} catch (Exception e) {
			System.out.println("Exception in /addNewCustomer : " + e.getMessage());
			e.printStackTrace();
		}
		return "addCustomer";
	}

	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public String addCustomer(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("doc") MultipartFile doc) {
		
		String redirect = new String();
		try {
			
			HttpSession session = request.getSession();

			int custId = (int) session.getAttribute("custId");
			String email = request.getParameter("txtEmail");
			String mobNo = request.getParameter("txtMobile");
						
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("email", email);
			map.add("custId", custId);
			Customer chkEmail = Constants.getRestTemplate().postForObject(Constants.url + "getCustByEmailId", map,
					Customer.class);
			
			map = new LinkedMultiValueMap<>();
			map.add("mobNo", mobNo);
			map.add("userId", custId);
			Customer chkMob = Constants.getRestTemplate().postForObject(Constants.url + "getCustByMobNo", map,
					Customer.class);
			
			if (chkEmail != null) {
				
				session.setAttribute("respMsg", "Email Id already exist");
				redirect = "redirect:/checkout";
			} else if (chkMob != null) {
				
				session.setAttribute("respMsg", "Mobile No. already exist");
				redirect = "redirect:/checkout";
			} else {
			
			if (custId == 0) {
				Date date = new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmms");
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
				
				int cityId = Integer.parseInt(request.getParameter("city"));

				String billAddress = billFlat + "~" + billArea + "~" + billLandmark + "~" + billPincode;

				Customer cust = new Customer();

				int defaultCustAddrs = 0;
				try {
					defaultCustAddrs = Integer.parseInt(request.getParameter("defltAddressId"));
				} catch (Exception e) {
					defaultCustAddrs = 0;
				}
				cust.setCityId(cityId);
				cust.setCustAddPlatform(2);
				cust.setCustGender(Integer.parseInt(request.getParameter("gender")));
				cust.setCustId(custId);
				cust.setCustMobileNo(mobNo);
				cust.setCustName(request.getParameter("txtBillName"));
				cust.setDateOfBirth(request.getParameter("txtDob"));
				cust.setEmailId(email);
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
				cust.setUpdtDttime(curDateTime);
				cust.setInsertDttime(curDateTime);
				cust.setAgeRange(2);
				cust.setMakerUserId(0);
				cust.setLanguageId(1);

				System.err.println(cust.toString());
				Customer res = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomer", cust,
						Customer.class);
				if (res.getCustId() > 0) {
					session.setAttribute("successMsg", "New customer added successfully");
					Cookie custIdCookie = new Cookie("custIdCookie", EncodeDecode.Encrypt(""+res.getCustId())); 
					custIdCookie.setMaxAge(60 *  60 * 24 * 15); 
					response.addCookie(custIdCookie);
					CustomerAddDetail custDet = new CustomerAddDetail();

					custDet.setAddress(billFlat);
					custDet.setAreaId(0);
					custDet.setCaption("NA");
					custDet.setCityId(cityId);
					custDet.setCustDetailId(0);
					custDet.setCustId(res.getCustId());
					custDet.setLandmark(billLandmark);
					custDet.setLatitude("NA");
					custDet.setLongitude("NA");
					custDet.setIsActive(1);
					custDet.setDelStatus(1);
					custDet.setExInt1(0);
					custDet.setExInt2(0);
					custDet.setExInt3(0);
					custDet.setExVar1(billArea);
					custDet.setExVar2(billPincode);
					custDet.setExVar3("NA");
					custDet.setMakerUserId(res.getCustId());
					custDet.setInsertDttime(curDateTime);
					custDet.setUpdtDttime(curDateTime);
					
					CustomerAddDetail saveCustAdd = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomerDet",
							custDet, CustomerAddDetail.class);
				} else {
					session.setAttribute("respMsg", "Failed to add New customer");
				}
				session.setAttribute("custId", res.getCustId());
				session.setAttribute("userName", cust.getCustName());
				session.setAttribute("userMobile", cust.getCustMobileNo());
				session.setAttribute("userEmail", cust.getEmailId());
				session.setAttribute("profileImg", Constants.PROFILE_IMG_VIEW_URL + cust.getProfilePic());
				redirect = "redirect:/checkout";
			}
			
		}

		} catch (Exception e) {
			System.out.println("Exception in /addCustomer : " + e.getMessage());
			e.printStackTrace();
		}

		return redirect;

	}

	@RequestMapping(value = "/addresslist", method = RequestMethod.GET)
	public String addressList(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {
		try {
			HttpSession session = request.getSession();

			int custId = (Integer) session.getAttribute("custId");
			int companyId = (int) session.getAttribute("companyId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("custId", custId);
			Customer cust = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
					Customer.class);
			model.addAttribute("cust", cust);

			map = new LinkedMultiValueMap<>();
			map.add("custId", custId);
			map.add("compId", companyId);
			CustomerAddDetail[] addrsArr = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllCustAdresListCustId", map, CustomerAddDetail[].class);
			List<CustomerAddDetail> custAddList = new ArrayList<CustomerAddDetail>(Arrays.asList(addrsArr));

			model.addAttribute("custAddList", custAddList);

		} catch (Exception e) {
			System.out.println("Exception in /addresslist : " + e.getMessage());
			e.printStackTrace();
		}
		return "addresslist";
	}

	@RequestMapping(value = "/deleteAddressDetlById", method = RequestMethod.GET)
	public String deleteAddressDetlById(HttpServletRequest request, HttpServletResponse response, Locale locale,
			Model model) {
		String redirect = new String();
		try {
			HttpSession session = request.getSession();

			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");

			int custId = (Integer) session.getAttribute("custId");

			int addressDtlId = Integer.parseInt(request.getParameter("addressDtlId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("custDetId", addressDtlId);
			map.add("userId", custId);
			map.add("dateTime", df.format(date));

			Info info = Constants.getRestTemplate().postForObject(Constants.url + "deleteCustDetById", map, Info.class);

			if (!info.isError()) {
				redirect = "redirect:/addresslist";
				session.setAttribute("msg", "Customer Address Detail Deleted Successfully");
			} else {
				redirect = "redirect:/addresslist";
				session.setAttribute("msg", "Failed to Delete Customer Address Detail");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return redirect;
	}

	// Created By :- Mahendra Singh
	// Created On :- 27-11-2020
	// Modified By :- NA
	// Modified On :- NA
	// Descriprion :- Check unique Cust Email
	@RequestMapping(value = "/validateCustEmail", method = RequestMethod.GET)
	@ResponseBody
	public Info getCustInfoByEmail(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		try {
			HttpSession session = request.getSession();
			int custId = (Integer) session.getAttribute("custId");
			String email = request.getParameter("email");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("email", email);
			map.add("custId", custId);
			Customer res = Constants.getRestTemplate().postForObject(Constants.url + "getCustByEmailId", map,
					Customer.class);
			if (res != null) {
				info.setError(false);
				info.setMsg("Customer Found");
			} else {
				info.setError(true);
				info.setMsg("Customer Not Found");
			}
		} catch (

		Exception e) {
			System.out.println("Execption in /validateCustEmail : " + e.getMessage());
			e.printStackTrace();
		}
		return info;
	}

	// Created By :- Mahendra Singh
	// Created On :- 27-11-2020
	// Modified By :- NA
	// Modified On :- NA
	// Descriprion :- Check unique Cust mobile
	@RequestMapping(value = "/validateCustMob", method = RequestMethod.GET)
	@ResponseBody
	public Info getUserInfo(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		try {
			HttpSession session = request.getSession();
			int userId = (Integer) session.getAttribute("custId");
			String mobNo = request.getParameter("mobNo");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("mobNo", mobNo);
			map.add("userId", userId);
			Customer res = Constants.getRestTemplate().postForObject(Constants.url + "getCustByMobNo", map,
					Customer.class);
			if (res != null) {
				info.setError(false);
				info.setMsg("Customer Found");
			} else {
				info.setError(true);
				info.setMsg("Customer Not Found");
			}
		} catch (Exception e) {
			System.out.println("Execption in /validateCustMob : " + e.getMessage());
			e.printStackTrace();
		}
		return info;
	}

}
