package com.ats.ecommerce;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.Base64.Decoder;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.common.DateConvertor;
import com.ats.ecommerce.common.EncodeDecode;
import com.ats.ecommerce.model.CityData;
import com.ats.ecommerce.model.Customer;
import com.ats.ecommerce.model.CustomerAddDetail;
import com.ats.ecommerce.model.FEDataTraveller;
import com.ats.ecommerce.model.Info;
import com.ats.ecommerce.model.TempImageHolder;
import com.ats.ecommerce.model.offer.CkDeliveryCharges;
import com.ats.ecommerce.model.offer.FrCharges;
import com.ats.ecommerce.model.offer.OfferDetail;
import com.ats.ecommerce.model.offer.OfferList;
import com.ats.ecommerce.model.offer.OrderCheckoutData;
import com.ats.ecommerce.model.order.DeliverySlots;
import com.ats.ecommerce.model.order.OrderDetail;
import com.ats.ecommerce.model.order.OrderHeader;
import com.ats.ecommerce.model.order.OrderSaveData;
import com.ats.ecommerce.model.order.OrderTrail;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")

public class CheckoutController {
	List<OfferDetail> offerDetailList = new ArrayList<>();
	List<OfferList> offerHeaderList = new ArrayList<>();

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String viewCart(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			int compId = (int) session.getAttribute("companyId");
			map.add("compId", compId);

//		City[] cityArr = Constants.getRestTemplate().postForObject(Constants.url + "getAllCities", map, City[].class);
//		List<City> cityList = new ArrayList<City>(Arrays.asList(cityArr));

			ObjectMapper mapper = new ObjectMapper();
			CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
					CityData[].class);
			List<CityData> cityList = new ArrayList<>(Arrays.asList(city));

			model.addAttribute("cityList", cityList);
			FEDataTraveller data = new FEDataTraveller();
			int frId = (int) session.getAttribute("frId");
			data = mapper.readValue(new File(Constants.JSON_FILES_PATH + frId + "_.json"), FEDataTraveller.class);
			// System.err.println("data " + data.toString());
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("prodHeaderList", data.getFeProductHeadList());

			try {
				int custId = (int) session.getAttribute("custId");
				int companyId = (int) session.getAttribute("companyId");

				if (custId > 0) {
					map = new LinkedMultiValueMap<>();

					map.add("custId", custId);
					Customer cust = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
							Customer.class);
					model.addAttribute("cust", cust);

					String[] billAddress = cust.getExVar3().split("~");
					model.addAttribute("getFlat", billAddress[0]);
					model.addAttribute("getArea", billAddress[1]);
					model.addAttribute("getLandmark", billAddress[2]);
					model.addAttribute("getPin", billAddress[3]);
				} else {
					System.err.println("Cust Id zero");
				}
				// 04-01-2021
				int delAddId = 0;
				try {

					// String delAddIdStr=(String) session.getAttribute("delAddId");
					delAddId = (int) session.getAttribute("delAddId");// Integer.parseInt(delAddIdStr);
				} catch (Exception e) {
					e.printStackTrace();
				}
				System.err.println("delAddId " + delAddId);

				map = new LinkedMultiValueMap<>();
				map.add("custId", custId);
				map.add("compId", companyId);
				CustomerAddDetail[] addrsArr = Constants.getRestTemplate()
						.postForObject(Constants.url + "getAllCustAdresListCustId", map, CustomerAddDetail[].class);
				List<CustomerAddDetail> custAddList = new ArrayList<CustomerAddDetail>(Arrays.asList(addrsArr));
				CustomerAddDetail addDetail = new CustomerAddDetail();
				if (delAddId > 0) {
					if (custAddList.size() > 0) {

						if (custAddList.size() == 1) {
							addDetail = custAddList.get(0);
						} else {
							for (int i = 0; i < custAddList.size(); i++) {
								if (custAddList.get(i).getCustDetailId() == delAddId) {
									addDetail = custAddList.get(i);
									break;
								}
							}
						}

						model.addAttribute("getFlatD", addDetail.getAddress());
						model.addAttribute("getAreaD", addDetail.getExVar1());
						// model.addAttribute("getLandmarkD", billAddress[2]);
						model.addAttribute("getPinD", addDetail.getExVar2());
						session.setAttribute("delAddId", addDetail.getCustDetailId());
					}
				}

				// 23-12-2020

				float km = 0;

				map = new LinkedMultiValueMap<String, Object>();
				map.add("frId", frId);
				map.add("km", km);

				// System.err.println("FR - "+frId+" KM - "+km);

				OrderCheckoutData data2 = Constants.getRestTemplate()
						.postForObject(Constants.url + "getOrderCheckoutData", map, OrderCheckoutData.class);
				if (data2 != null) {
					model.addAttribute("checkoutData", data2);
					model.addAttribute("FrCharges", data2.getAdditionalCharges());
					model.addAttribute("offerList", data2.getOfferList());
					offerDetailList = data2.getOfferDetailList();
					offerHeaderList = data2.getOfferList();

					float addCh = 0;
					try {
						addCh = data2.getAdditionalCharges().getSurchargeFee()
								+ data2.getAdditionalCharges().getHandlingChg()
								+ data2.getAdditionalCharges().getPackingChg()
								+ data2.getAdditionalCharges().getRoundOffAmt()
								+ data2.getAdditionalCharges().getExtraChg();
					} catch (Exception e) {
					}
					model.addAttribute("addCh", addCh);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				DeliverySlots[] delSlotArray = Constants.getRestTemplate()
						.getForObject(Constants.url + "getAllDeliverySlots", DeliverySlots[].class);
				List<DeliverySlots> delSlotList = new ArrayList<DeliverySlots>(Arrays.asList(delSlotArray));
				model.addAttribute("delSlotList", delSlotList);

			} catch (Exception e) {
				System.err.println("exce in getAllDeliverySlots Checkout controll");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception in checkout : " + e.getMessage());
		}
		return "viewcart";
	}

	@RequestMapping(value = "/checkout/{prodIdStr}", method = RequestMethod.GET)
	public String viewCart(@PathVariable String prodIdStr, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			System.err.println("prodIdStr " + prodIdStr);
			model.addAttribute("catImgUrl", Constants.CAT_IMG_VIEW_URL);
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			int compId = (int) session.getAttribute("companyId");
			map.add("compId", compId);

//		City[] cityArr = Constants.getRestTemplate().postForObject(Constants.url + "getAllCities", map, City[].class);
//		List<City> cityList = new ArrayList<City>(Arrays.asList(cityArr));

			ObjectMapper mapper = new ObjectMapper();
			CityData[] city = mapper.readValue(new File(Constants.JSON_FILES_PATH + "AllCityData_.json"),
					CityData[].class);
			List<CityData> cityList = new ArrayList<>(Arrays.asList(city));

			model.addAttribute("cityList", cityList);
			FEDataTraveller data = new FEDataTraveller();
			int frId = (int) session.getAttribute("frId");
			data = mapper.readValue(new File(Constants.JSON_FILES_PATH + frId + "_.json"), FEDataTraveller.class);
			// System.err.println("data " + data.toString());
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("prodHeaderList", data.getFeProductHeadList());

			try {
				/*
				 * map = new LinkedMultiValueMap<>(); int companyId = (int)
				 * session.getAttribute("companyId"); map.add("compId", companyId);
				 * map.add("itemIds", prodIdStr); Integer[] relateItemArray =
				 * Constants.getRestTemplate() .postForObject(Constants.url +
				 * "getRelateProductByProductIds", map, Integer[].class);
				 * System.err.println("relateItemArray " +relateItemArray[0]);
				 */
			} catch (Exception e) {
				e.printStackTrace();
			}

			model.addAttribute("relateItemList", "relateItemList");

			try {

				int custId = (int) session.getAttribute("custId");
				if (custId > 0) {
					map = new LinkedMultiValueMap<>();

					System.err.println(" custId  place ord" + custId);
					map.add("custId", custId);
					Customer cust = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
							Customer.class);
					model.addAttribute("cust", cust);
					try {
						String[] billAddress = cust.getExVar3().split("~");
						model.addAttribute("getFlat", billAddress[0]);
						model.addAttribute("getArea", billAddress[1]);
						model.addAttribute("getLandmark", billAddress[2]);
						model.addAttribute("getPin", billAddress[3]);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} // end of if custId>0
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 04-01-2021
			int delAddId = 0;
			try {

				// String delAddIdStr= (String) session.getAttribute("delAddId");
				delAddId = (int) session.getAttribute("delAddId");
				// delAddId=Integer.parseInt(delAddIdStr);
				System.err.println("delAddId " + delAddId);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (delAddId > 0) {
				int custId = (int) session.getAttribute("custId");
				int companyId = (int) session.getAttribute("companyId");
				map = new LinkedMultiValueMap<>();
				map.add("custId", custId);
				map.add("compId", companyId);
				CustomerAddDetail[] addrsArr = Constants.getRestTemplate()
						.postForObject(Constants.url + "getAllCustAdresListCustId", map, CustomerAddDetail[].class);
				List<CustomerAddDetail> custAddList = new ArrayList<CustomerAddDetail>(Arrays.asList(addrsArr));
				CustomerAddDetail addDetail = new CustomerAddDetail();
				if (custAddList.size() > 0) {

					if (custAddList.size() == 1) {
						addDetail = custAddList.get(0);
					} else {
						for (int i = 0; i < custAddList.size(); i++) {
							if (custAddList.get(i).getCustDetailId() == delAddId) {
								addDetail = custAddList.get(i);
								break;
							}
						}
					}

					model.addAttribute("getFlatD", addDetail.getAddress());
					model.addAttribute("getAreaD", addDetail.getExVar1());
					// model.addAttribute("getLandmarkD", billAddress[2]);
					model.addAttribute("getPinD", addDetail.getExVar2());
					session.setAttribute("delAddId", addDetail.getCustDetailId());
				}
			}

//23-12-2020

			float km = 0;

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frId);
			map.add("km", km);

			// System.err.println("FR - "+frId+" KM - "+km);

			OrderCheckoutData data2 = Constants.getRestTemplate().postForObject(Constants.url + "getOrderCheckoutData",
					map, OrderCheckoutData.class);
			if (data2 != null) {
				model.addAttribute("checkoutData", data2);
				model.addAttribute("FrCharges", data2.getAdditionalCharges());
				model.addAttribute("offerList", data2.getOfferList());
				offerDetailList = data2.getOfferDetailList();
				offerHeaderList = data2.getOfferList();

				float addCh = 0;
				try {
					addCh = data2.getAdditionalCharges().getSurchargeFee()
							+ data2.getAdditionalCharges().getHandlingChg()
							+ data2.getAdditionalCharges().getPackingChg()
							+ data2.getAdditionalCharges().getRoundOffAmt()
							+ data2.getAdditionalCharges().getExtraChg();
				} catch (Exception e) {
				}
				model.addAttribute("addCh", addCh);
			}

			try {
				DeliverySlots[] delSlotArray = Constants.getRestTemplate()
						.getForObject(Constants.url + "getAllDeliverySlots", DeliverySlots[].class);
				List<DeliverySlots> delSlotList = new ArrayList<DeliverySlots>(Arrays.asList(delSlotArray));
				model.addAttribute("delSlotList", delSlotList);

			} catch (Exception e) {
				System.err.println("exce in getAllDeliverySlots Checkout controll");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception in checkout : " + e.getMessage());
		}
		System.err.println("session.setAttribute(\"mobNo\", mobNo);" + session.getAttribute("mobNo"));
		return "viewcart";
	}

	@RequestMapping(value = "/getOrderCheckoutData", method = RequestMethod.GET)
	public @ResponseBody OrderCheckoutData getOrderCheckoutData(HttpServletRequest request,
			HttpServletResponse response) {

		OrderCheckoutData data = new OrderCheckoutData();
		try {

			float km = 0;
			try {
				if (request.getParameter("km") != null) {
					km = Float.parseFloat(request.getParameter("km"));
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			HttpSession session = request.getSession();
			int frId = (int) session.getAttribute("frId");

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frId);
			map.add("km", km);

			System.err.println("FR - " + frId + "    KM - " + km);

			data = Constants.getRestTemplate().postForObject(Constants.url + "getOrderCheckoutData", map,
					OrderCheckoutData.class);

			if (data == null) {
				data = new OrderCheckoutData();
			}

			System.err.println("DATA -------------------- " + data);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "/getOfferDetailListAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<OfferDetail> getOfferDetailListAjax(HttpServletRequest request, HttpServletResponse response) {
		return offerDetailList;
	}

	@RequestMapping(value = "/getOfferHeaderListAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<OfferList> getOfferHeaderListAjax(HttpServletRequest request, HttpServletResponse response) {
		return offerHeaderList;
	}

	@RequestMapping(value = "/checkIsValidOffer", method = RequestMethod.GET)
	@ResponseBody
	public Info checkIsValidOffer(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();

		int offerId = Integer.parseInt(request.getParameter("offerId"));
		String coupon = request.getParameter("coupon");
		int custId = Integer.parseInt(request.getParameter("custId"));

		LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("offerId", offerId);
		map.add("coupon", coupon);
		map.add("custId", custId);

		info = Constants.getRestTemplate().postForObject(Constants.url + "checkIsValidOffer", map, Info.class);

		return info;
	}

	@RequestMapping(value = "/getCouponOfferListAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<OfferList> getCouponOfferListAjax(HttpServletRequest request, HttpServletResponse response) {

		List<OfferList> offerList = new ArrayList<>();
		HttpSession session = request.getSession();

		LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("frId", session.getAttribute("frId"));

		OfferList[] arr = Constants.getRestTemplate().postForObject(Constants.url + "getCouponWiseBillOffers", map,
				OfferList[].class);
		offerList = new ArrayList<>(Arrays.asList(arr));

		return offerList;
	}

	@RequestMapping(value = "/getCustomerOfferListAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<OfferList> getCustomerOfferListAjax(HttpServletRequest request, HttpServletResponse response) {

		List<OfferList> offerList = new ArrayList<>();
		HttpSession session = request.getSession();

		int custId = Integer.parseInt(request.getParameter("custId"));

		LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("frId", session.getAttribute("frId"));
		map.add("custId", custId);

		OfferList[] arr = Constants.getRestTemplate().postForObject(Constants.url + "getCustomerWiseBillOffers", map,
				OfferList[].class);
		offerList = new ArrayList<>(Arrays.asList(arr));

		return offerList;
	}

	@RequestMapping(value = "/getDeliveryChargesByKm", method = RequestMethod.GET)
	@ResponseBody
	public CkDeliveryCharges getDeliveryChargesByKm(HttpServletRequest request, HttpServletResponse response,
			Model model) {

		CkDeliveryCharges charges = null;
		try {
			float km = 0;
			try {
				if (request.getParameter("km") != null) {
					km = (float) request.getSession().getAttribute("frKm");
				}

			} catch (Exception e) {
			}
			System.err.println("KM - " + km);

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("km", km);

			charges = Constants.getRestTemplate().postForObject(Constants.url + "getDeliveryCharges", map,
					CkDeliveryCharges.class);
			System.err.println("charges " + charges);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return charges;
	}

	// 25-12-2020

	@RequestMapping(value = "/getFrExCharges", method = RequestMethod.POST)
	@ResponseBody
	public FrCharges getFrExCharges(HttpServletRequest request, HttpServletResponse response) {

		FrCharges frExCharges = new FrCharges();

		try {

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("frId", request.getSession().getAttribute("frId"));

			frExCharges = Constants.getRestTemplate().postForObject(Constants.url + "getFrExCharges", map,
					FrCharges.class);

			System.err.println("frExCharges " + frExCharges);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return frExCharges;

	}

	@RequestMapping(value = "/placeOrder", method = RequestMethod.POST)
	@ResponseBody
	public Info placeOrder(HttpServletRequest request, HttpServletResponse response, Model model) {
		Info info = new Info();
		try {
			HttpSession session = request.getSession();
			Date ct = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sfd = new SimpleDateFormat("dd-MM-yyyy");
			SimpleDateFormat dttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			int frId = (int) session.getAttribute("frId");
			// int userId = (int) session.getAttribute("userId");
			int custId = 0;
			try {
				custId = (int) session.getAttribute("custId");
			} catch (Exception e) {
				custId = 0;
			}
			int compId = (int) session.getAttribute("companyId");

			String promoCode = request.getParameter("promoCode");
			int offerId = 0;
			try {
				offerId = Integer.parseInt(request.getParameter("offerId"));
			} catch (Exception e) {
				offerId = 0;
			}
			int paymentMethod = 0;
			try {
				paymentMethod = Integer.parseInt(request.getParameter("paymentMode"));
			} catch (Exception e) {
				// TODO: handle exception
			}

			String delvrInst = request.getParameter("delvrInst");
			String delvrDateTime = request.getParameter("delvrDateTime");
			String[] deliveryDateTime = delvrDateTime.split(" ");

			String delTimeSlot = request.getParameter("del_time_slot");
			String deliveryDate = deliveryDateTime[0].replace("/", "-");

//			Order Other Details
			int txtCity = 0;
			try {
				txtCity = Integer.parseInt(request.getParameter("txtCity"));
			} catch (Exception e) {
				// TODO: handle exception
			}

			String txtBillName = request.getParameter("txtBillName");
			String txtMobile = request.getParameter("txtMobile");
			String txtEmail = request.getParameter("txtEmail");
			int gender = Integer.parseInt(request.getParameter("gender"));
			String txtDob = request.getParameter("txtDob");
			String txtGst = request.getParameter("txtGst");

//			Delivery Address
			String txtDelvFlat = request.getParameter("txtDelvFlat");
			String txtDelvArea = request.getParameter("txtDelvArea");
			String txtDelvLandmark = request.getParameter("txtDelvLandmark");
			String txtDelvPincode = request.getParameter("txtDelvPincode");

//			Billing Address
			String txtBillingFlat = request.getParameter("txtBillingFlat");
			String txtBillingArea = request.getParameter("txtBillingArea");
			String txtBillingLandmark = request.getParameter("txtBillingLandmark");
			String txtBillingPincode = request.getParameter("txtBillingPincode");
			String itemData = request.getParameter("itemData");

			int addCustAgent = 0;
			int deliveryBoy = 0;
			float deliveryCharges = 0;
			float discAmt = 0;
			float applyWalletAmt = 0;
			// String strFrKm = (String) request.getSession().getAttribute("frKm");

			float km = (float) request.getSession().getAttribute("frKm");// Float.parseFloat(strFrKm);
			Customer cust = new Customer();

			int defaultCustAddrs = 0;
			try {
				defaultCustAddrs = Integer.parseInt(request.getParameter("defltAddressId"));
			} catch (Exception e) {
				defaultCustAddrs = 0;
			}
			cust.setCityId(txtCity);
			cust.setCustAddPlatform(2);
			cust.setCustGender(Integer.parseInt(request.getParameter("gender")));
			cust.setCustId(custId);
			cust.setCustMobileNo(txtMobile);
			cust.setCustName(txtBillName);
			cust.setDateOfBirth(txtDob);
			cust.setEmailId(txtEmail);
			cust.setIsPrimiunmCust(0);
			cust.setProfilePic("na");
			cust.setCompanyId(1);
			cust.setIsActive(1);
			cust.setDelStatus(1);
			cust.setExInt1(defaultCustAddrs);
			cust.setExInt2(0);
			cust.setExInt3(0);
			cust.setExVar1("NA");
			cust.setExVar2(txtGst);
			cust.setExVar3(
					txtBillingFlat + "~" + txtBillingArea + "~ " + txtBillingLandmark + "~ " + txtBillingPincode);
			cust.setUpdtDttime(dttime.format(ct));
			cust.setInsertDttime(dttime.format(ct));
			cust.setAgeRange(2);
			cust.setMakerUserId(0);
			cust.setLanguageId(1);

			// System.err.println(cust.toString());

			Customer res = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomer", cust,
					Customer.class);
			// 04-01-2021
			int delAddId = 0;
			try {
				// String delAddIdStr=(String) session.getAttribute("delAddId");
				delAddId = (int) session.getAttribute("delAddId");// Integer.parseInt(delAddIdStr);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.err.println("delAddId " + delAddId);
			if (delAddId < 1) {

				CustomerAddDetail custDet = new CustomerAddDetail();

				custDet.setAddress(txtBillingFlat);
				custDet.setAreaId(0);
				custDet.setCaption("NA");
				custDet.setCityId(0);
				custDet.setCustDetailId(0);
				custDet.setCustId(res.getCustId());
				custDet.setLandmark(txtDelvLandmark);
				custDet.setLatitude("NA");
				custDet.setLongitude("NA");
				custDet.setIsActive(1);
				custDet.setDelStatus(1);
				custDet.setExInt1(0);
				custDet.setExInt2(0);
				custDet.setExInt3(frId);// Used to store frId
				custDet.setExVar1(txtBillingArea);
				custDet.setExVar2(txtBillingPincode);
				custDet.setExVar3("" + km);// No of KM from Franchise
				custDet.setMakerUserId(res.getCustId());
				custDet.setInsertDttime(dttime.format(ct));
				custDet.setUpdtDttime(dttime.format(ct));

				CustomerAddDetail saveCustAdd = Constants.getRestTemplate()
						.postForObject(Constants.url + "saveCustomerDet", custDet, CustomerAddDetail.class);
				session.setAttribute("delAddId", saveCustAdd.getCustDetailId());

				Cookie delAddIdCookie = new Cookie("delAddIdCookie",
						EncodeDecode.Encrypt("" + saveCustAdd.getCustDetailId()));
				delAddIdCookie.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(delAddIdCookie);

			}
			// 04-01-2021 end
			if (res.getCustId() > 0) {
				session.setAttribute("successMsg", "New customer added successfully");
				Cookie custIdCookie = new Cookie("custIdCookie", EncodeDecode.Encrypt("" + res.getCustId()));
				custIdCookie.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(custIdCookie);

				session.setAttribute("custId", res.getCustId());
				session.setAttribute("userName", cust.getCustName());
				session.setAttribute("userMobile", cust.getCustMobileNo());
				session.setAttribute("userEmail", cust.getEmailId());
				session.setAttribute("profileImg", Constants.PROFILE_IMG_VIEW_URL + cust.getProfilePic());

			}
			custId = res.getCustId();
			ObjectMapper objectMapper = new ObjectMapper();

			// convert json string to object
			OrderDetail[] itemJsonImportData = objectMapper.readValue(itemData, OrderDetail[].class);

			float finalTaxableAmt = 0;
			float finalTaxAmt = 0;
			float finalTotalAmt = 0;
			float finalCgstAmt = 0;
			float finalSgstAmt = 0;
			float finalIgstAmt = 0;
			float finalDiscAmt = 0;
			float finalAddCharges = 0;

			String uuid = UUID.randomUUID().toString();

			DecimalFormat df = new DecimalFormat("#.00");

			OrderHeader order = new OrderHeader();
			order.setOrderNo("0002");
			order.setOrderDate(sfd.format(ct));
			order.setFrId(frId);
			order.setCustId(custId);
			int status = 2;
			if (paymentMethod == 2 && status == 1) {
				order.setOrderStatus(1);
			} else {
				order.setOrderStatus(1);
			}

			order.setPaidStatus(0);
			order.setPaymentMethod(paymentMethod);
			order.setCityId(txtCity);
			order.setAreaId(0);
			order.setAddressId(1);
			order.setAddress(txtDelvFlat + ", " + txtDelvArea + ", " + txtDelvLandmark + ", " + txtDelvPincode);
			order.setWhatsappNo(txtMobile);
			order.setLandmark("-" + session.getAttribute("landMark"));
			order.setDeliveryDate(DateConvertor.convertToDMY(deliveryDate));
			// order.setDeliveryTime(deliveryDateTime[1]);
			System.err.println("delvrDateTime " + delvrDateTime);
			order.setDeliveryTime(DateConvertor.convertToYMD(delvrDateTime));
			order.setProductionDate(sf.format(ct));
			order.setProductionTime("00:00");
			order.setInsertDateTime(dttime.format(ct));
			order.setInsertUserId(custId);
			order.setOrderPlatform(1);
			order.setBillingName(txtBillName);
			order.setBillingAddress(
					txtBillingFlat + "~" + txtBillingArea + "~ " + txtBillingLandmark + "~ " + txtBillingPincode);
			order.setDeliveryType(1);
			order.setDeliveryInstId(1);
			order.setDeliveryInstText(delvrInst);
			order.setDelStatus(1);
			order.setUuidNo(uuid);

			order.setExInt1(compId);
			order.setExVar1(txtGst);
			order.setExVar2(promoCode);// ie offercode
			order.setOfferId(offerId);
			order.setDeliveryKm(km);
			order.setExVar3(delTimeSlot);// 09-1-2021
			if (addCustAgent > 0) {
				order.setIsAgent(1);
				order.setOrderDeliveredBy(deliveryBoy);
			} else {
				order.setIsAgent(0);
				order.setOrderDeliveredBy(deliveryBoy);
			}

			List<OrderDetail> orderDetailList = new ArrayList<>();

			String imgData = request.getParameter("imageData");
			// TempImageHolder[] imageJsonArray = objectMapper.readValue(imgData,
			// TempImageHolder[].class);

			float grandItemTotal = Float.parseFloat(request.getParameter("itemTotal"));
			float grandDiscAmt = Float.parseFloat(request.getParameter("discAmt"));
			float grandAddCharge = Float.parseFloat(request.getParameter("addCharge"));

			System.err.println("grandItemTotal" + grandItemTotal + "grandDiscAmt " + grandDiscAmt + " grandAddCharge "
					+ grandAddCharge);

			order.setExFloat1(roundHalfUp(grandItemTotal, 2));// Item total Amt excluding disc and addCharges
			for (int i = 0; i < itemJsonImportData.length; i++) {
				OrderDetail orderDetail = new OrderDetail();
				/*
				 * try { if (imageJsonArray.length > 0) for (int j = 0; j <
				 * imageJsonArray.length; j++) { if (imageJsonArray[j].getItemId() ==
				 * itemJsonImportData[i].getItemId()) {
				 * decodeToImageAndUpload(imageJsonArray[j].getImgFile(),
				 * imageJsonArray[j].getImgName());
				 * orderDetail.setExVar4(imageJsonArray[j].getImgName());
				 * 
				 * break; } } } catch (Exception e) { // TODO: handle exception }
				 */

				float divFact = 0;
				float taxableAmt = 0;
				float itemDisc = 0;
				float itemAddCharge = 0;

				float sgstAmt = 0;
				float cgstAmt = 0;
				float igstAmt = 0;
				decodeToImageAndUpload(itemJsonImportData[i].getImgFile(), itemJsonImportData[i].getImgName());
				orderDetail.setExVar4(itemJsonImportData[i].getImgName());

				try {
					if (grandItemTotal > 0)
						// System.err.println("qty " +itemJsonImportData[i].getQty() + "rate " +
						// itemJsonImportData[i].getRate()) ;
						divFact = (itemJsonImportData[i].getQty() * itemJsonImportData[i].getRate() * 100)
								/ (grandItemTotal);

					System.err.println("Div factor " + divFact);

					itemDisc = (divFact * grandDiscAmt) / 100;
					finalDiscAmt = finalDiscAmt + itemDisc;

					itemAddCharge = (divFact * grandAddCharge) / 100;
					finalAddCharges = finalAddCharges + itemAddCharge;

					taxableAmt = ((itemJsonImportData[i].getQty() * itemJsonImportData[i].getRate()) - itemDisc
							+ itemAddCharge) * 100
							/ (100 + itemJsonImportData[i].getCgstPer() + itemJsonImportData[i].getSgstPer());
					finalTaxableAmt = finalTaxableAmt + taxableAmt;

					System.err.println(
							"Taxable Amt " + taxableAmt + "itemDisc " + itemDisc + " itemAddCharge" + itemAddCharge);
					sgstAmt = (taxableAmt * itemJsonImportData[i].getSgstPer()) / 100;
					finalSgstAmt = finalSgstAmt + sgstAmt;
					cgstAmt = (taxableAmt * itemJsonImportData[i].getCgstPer()) / 100;
					finalCgstAmt = finalCgstAmt + cgstAmt;

					System.err.println("sgstAmt " + sgstAmt + " cgstAmt " + cgstAmt);

					igstAmt = (taxableAmt * itemJsonImportData[i].getIgstPer()) / 100;
					igstAmt = 0;
					finalIgstAmt = finalIgstAmt + igstAmt;

					float totAmt = taxableAmt + (sgstAmt + cgstAmt);
					System.err.println("item totAmt" + totAmt);

					orderDetail.setRate(itemJsonImportData[i].getRate());
					orderDetail.setExFloat3(Float.parseFloat(itemJsonImportData[i].getWeight()));
					orderDetail.setExInt1(itemJsonImportData[i].getRateSettingType());

					orderDetail.setTaxAmt(roundHalfUp((sgstAmt + cgstAmt), 2));

					finalTaxAmt = finalTaxAmt + (sgstAmt + cgstAmt);
					// finalTaxAmt=finalTaxAmt+(igstAmt);

					orderDetail.setTaxableAmt(roundHalfUp(taxableAmt, 2));
					orderDetail.setTotalAmt(roundHalfUp(totAmt, 2));
					finalTotalAmt = finalTotalAmt + totAmt;

					orderDetail.setCgstAmt(roundHalfUp(cgstAmt, 2));
					orderDetail.setSgstAmt(roundHalfUp(sgstAmt, 2));
					orderDetail.setIgstAmt(roundHalfUp(igstAmt, 2));

					orderDetail.setDiscAmt(roundHalfUp(itemDisc, 2));
					orderDetail.setExFloat1(roundHalfUp(itemAddCharge, 2));

				} catch (Exception e) {
					e.printStackTrace();
				}

				orderDetail.setItemId(itemJsonImportData[i].getItemId());
				orderDetail.setQty(itemJsonImportData[i].getQty());
				orderDetail.setRate(itemJsonImportData[i].getRate());
				orderDetail.setMrp(itemJsonImportData[i].getMrp());
				orderDetail.setCgstPer(itemJsonImportData[i].getCgstPer());
				orderDetail.setIgstPer(itemJsonImportData[i].getIgstPer());
				orderDetail.setSgstPer(itemJsonImportData[i].getSgstPer());
				try {
					orderDetail.setRemark(itemJsonImportData[i].getSpInst().trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					orderDetail.setExVar2(itemJsonImportData[i].getMsgonCake().trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				orderDetail.setDelStatus(1);
				orderDetail.setExInt2(itemJsonImportData[i].getExInt1());// ie config detail Id
				System.err.println("orderDetail " + orderDetail.toString());
				orderDetailList.add(orderDetail);

			} // End of loop itemJsonImportData

			order.setDiscAmt(roundHalfUp(finalDiscAmt, 2));
			order.setDeliveryCharges(roundHalfUp(finalAddCharges, 2));// Delivery and additional charges

			order.setTaxableAmt(roundHalfUp(finalTaxableAmt, 2));
			order.setTaxAmt(roundHalfUp(finalTaxAmt, 2));
			order.setTotalAmt(roundHalfUp(finalTotalAmt, 2));
			order.setSgstAmt(roundHalfUp(finalSgstAmt, 2));
			order.setCgstAmt(roundHalfUp(finalCgstAmt, 2));
			order.setIgstAmt(roundHalfUp(finalIgstAmt, 2));

			order.setRemark("");
			System.err.println("order " + order.toString());
			OrderTrail orderTrail = new OrderTrail();
			orderTrail.setActionByUserId(custId);
			orderTrail.setActionDateTime(dttime.format(ct));
			orderTrail.setStatus(status);
			orderTrail.setExInt1(1);
			orderTrail.setExVar1("-");

			OrderSaveData orderSaveData = new OrderSaveData();

			orderSaveData.setOrderDetailList(orderDetailList);
			orderSaveData.setOrderHeader(order);
			orderSaveData.setOrderTrail(orderTrail);

			session.setAttribute("orderSaveData", orderSaveData);
			// System.err.println("Order Save Method is commented will not be saved in Db");

			info = Constants.getRestTemplate().postForObject(Constants.url + "saveCloudOrder", orderSaveData,
					Info.class);
			if (!info.getMsg().equalsIgnoreCase(null)) {
				// Order saved successfully.
				session.setAttribute("orderId", Integer.parseInt(info.getMsg()));
				if (orderSaveData.getOrderHeader().getPaymentMethod() == 2) {
					// ie paid by elecronic way

					info.setMsg("epay");
					info.setResponseObject1("");

				} else {
					info.setMsg("cashpay");
					info.setResponseObject1("");
				}
			}
			System.err.println("Info " + info.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}

	public static BufferedImage decodeToImageAndUpload(String imageString, String imgName) {

		BufferedImage image = null;
		byte[] imageByte;
		ByteArrayInputStream bis = null;
		try {
			Decoder decoder = Base64.getDecoder();
			imageByte = decoder.decode(imageString);
			bis = new ByteArrayInputStream(imageByte);
			image = ImageIO.read(bis);
			int height = 0, width = 0;
			// System.err.println("original width" + image.getWidth() + "height " +
			// image.getHeight());
			try {
				height = (int) ((image.getHeight()) - (image.getHeight() * 0.25));
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				width = (int) ((image.getWidth()) - (image.getWidth() * 0.25));
			} catch (Exception e) {
				// TODO: handle exception
			}
			// System.err.println("width" + width + "height " + height);
			ImageUploadController.saveImgWithByteArray(imageByte, imgName, width, height);
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

	public static float roundHalfUp(float d, int scale) {
		// return BigDecimal.valueOf(d).setScale(2,
		// BigDecimal.ROUND_HALF_UP).floatValue();
		return BigDecimal.valueOf(d).setScale(scale, BigDecimal.ROUND_HALF_UP).floatValue();
	}

	/*
	 * showCategoryList
	 * 
	 * 
	 * showAddSubCat showEditSubCat
	 * 
	 * configFranchise
	 */
}
