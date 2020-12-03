package com.ats.ecommerce;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
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
import com.atss.ecommerce.model.City;
import com.atss.ecommerce.model.CityData;
import com.atss.ecommerce.model.Customer;
import com.atss.ecommerce.model.FEDataTraveller;
import com.atss.ecommerce.model.Info;
import com.atss.ecommerce.model.TempImageHolder;
import com.atss.ecommerce.model.order.ItemJsonImportData;
import com.atss.ecommerce.model.order.OrderDetail;
import com.atss.ecommerce.model.order.OrderHeader;
import com.atss.ecommerce.model.order.OrderResponse;
import com.atss.ecommerce.model.order.OrderSaveData;
import com.atss.ecommerce.model.order.OrderTrail;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")

public class CheckoutController {

	
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String viewCart(Model model,
			HttpServletRequest request, HttpServletResponse response) {
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
			data = mapper.readValue(new File(Constants.JSON_FILES_PATH+frId+"_.json"),
					FEDataTraveller.class);
			System.err.println("data " + data.toString());
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("prodHeaderList", data.getFeProductHeadList());

			try {
			
			map = new LinkedMultiValueMap<>();
			int custId = (int) session.getAttribute("custId");
			map.add("custId", custId);
			Customer cust = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
					Customer.class);
			model.addAttribute("cust", cust);
			
			
			String[] billAddress = cust.getExVar3().split("~");
			model.addAttribute("getFlat", billAddress[0]);
			model.addAttribute("getArea", billAddress[1]);
			model.addAttribute("getLandmark", billAddress[2]);
			model.addAttribute("getPin", billAddress[3]);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception in checkout : " + e.getMessage());
		}
		return "viewcart";
	}
	
	@RequestMapping(value = "/checkout/{prodIdStr}", method = RequestMethod.GET)
	public String viewCart(@PathVariable String prodIdStr,Model model,
			HttpServletRequest request, HttpServletResponse response) {
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
			data = mapper.readValue(new File(Constants.JSON_FILES_PATH+frId+"_.json"),
					FEDataTraveller.class);
			System.err.println("data " + data.toString());
			model.addAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
			model.addAttribute("prodHeaderList", data.getFeProductHeadList());
			
			try {
				map = new LinkedMultiValueMap<>();
				int companyId = (int) session.getAttribute("companyId");
				map.add("compId", companyId);
				map.add("itemIds", prodIdStr);
				List[] relateItemArray = Constants.getRestTemplate().postForObject(Constants.url + "getRelateProductByProductIds", map,
						List[].class);
				//System.err.println("relateItemArray " +relateItemArray[0]);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			model.addAttribute("relateItemList", "relateItemList");

			try {
			
			map = new LinkedMultiValueMap<>();
			int custId = (int) session.getAttribute("custId");
			map.add("custId", custId);
			Customer cust = Constants.getRestTemplate().postForObject(Constants.url + "getCustById", map,
					Customer.class);
			model.addAttribute("cust", cust);
			
			
			String[] billAddress = cust.getExVar3().split("~");
			model.addAttribute("getFlat", billAddress[0]);
			model.addAttribute("getArea", billAddress[1]);
			model.addAttribute("getLandmark", billAddress[2]);
			model.addAttribute("getPin", billAddress[3]);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception in checkout : " + e.getMessage());
		}
		return "viewcart";
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
			int userId = (int) session.getAttribute("userId");
			int custId = (Integer) session.getAttribute("custId");
			int compId = (Integer) session.getAttribute("companyId");

			String promoCode = request.getParameter("promoCode");

			int paymentMethod = 0;
			try {
				paymentMethod = Integer.parseInt(request.getParameter("paymentMode"));
			} catch (Exception e) {
				// TODO: handle exception
			}

			String delvrInst = request.getParameter("delvrInst");
			String delvrDateTime = request.getParameter("delvrDateTime");
			String[] deliveryDateTime = delvrDateTime.split(" ");

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

			ObjectMapper objectMapper = new ObjectMapper();

			// convert json string to object
			OrderDetail[] itemJsonImportData = objectMapper.readValue(itemData, OrderDetail[].class);

			
			
			float finaTaxableAmt = 0;
			float finaTaxAmt = 0;
			float finaTotalAmt = 0;
			float finalCgstAmt = 0;
			float finalsgstAmt = 0;
			float finalIgstAmt = 0;

			String uuid = UUID.randomUUID().toString();

			DecimalFormat df = new DecimalFormat("#.00");

			OrderHeader order = new OrderHeader();
			order.setOrderNo("0002");
			order.setOrderDate(sfd.format(ct));
			order.setFrId(frId);
			order.setCustId(custId);
			int status = 2;
			if (paymentMethod == 2 && status == 1) {
				order.setOrderStatus(9);
			} else {
				order.setOrderStatus(status);
			}

			order.setPaidStatus(0);
			order.setPaymentMethod(paymentMethod);
			order.setCityId(txtCity);
			order.setAreaId(0);
			order.setAddressId(1);
			order.setAddress(txtDelvFlat);
			order.setWhatsappNo(txtMobile);
			order.setLandmark(txtDelvLandmark);
			order.setDeliveryDate(DateConvertor.convertToDMY(deliveryDate));
			order.setDeliveryTime(deliveryDateTime[1]);
			order.setProductionDate(sf.format(ct));
			order.setProductionTime("00:00");
			order.setInsertDateTime(dttime.format(ct));
			order.setInsertUserId(custId);
			order.setOrderPlatform(1);
			order.setBillingName(txtBillName);
			order.setBillingAddress(txtDelvFlat);
			order.setDeliveryType(1);
			order.setDeliveryInstId(1);
			order.setDeliveryInstText(delvrInst);
			order.setDelStatus(1);
			order.setUuidNo(uuid);
			order.setExFloat1(0);// Wallet Amt
			order.setExInt1(compId);
			order.setExVar1(txtGst);
			order.setExVar2(promoCode);
			order.setOfferId(0);
			order.setDeliveryKm(0);

			if (addCustAgent > 0) {
				order.setIsAgent(1);
				order.setOrderDeliveredBy(deliveryBoy);
			} else {
				order.setIsAgent(0);
				order.setOrderDeliveredBy(deliveryBoy);
			}

			List<OrderDetail> orderDetailList = new ArrayList<>();

			float grandTotal = 0;
			for (int i = 0; i < itemJsonImportData.length; i++) {
				grandTotal = grandTotal + itemJsonImportData[i].getTotalAmt();
			}

			float totalDiscAmt = 0, totalAddChargesAmt = 0;
			String imgData=request.getParameter("imageData");
			TempImageHolder[] imageJsonArray = objectMapper.readValue(imgData, TempImageHolder[].class);
			for (int i = 0; i < itemJsonImportData.length; i++) {
				OrderDetail orderDetail = new OrderDetail();
				try {
				if(imageJsonArray.length>0)
				for(int j=0;j<imageJsonArray.length;j++) {
					if(imageJsonArray[j].getItemId()==itemJsonImportData[i].getItemId()) {
						decodeToImageAndUpload(imageJsonArray[j].getImgFile(),imageJsonArray[j].getImgName());
						orderDetail.setExVar4(imageJsonArray[j].getImgName());
					}
				}
				}catch (Exception e) {
					// TODO: handle exception
				}
				orderDetail.setItemId(itemJsonImportData[i].getItemId());
				orderDetail.setQty(itemJsonImportData[i].getQty());
				orderDetail.setRate(itemJsonImportData[i].getRate());
				orderDetail.setMrp(itemJsonImportData[i].getMrp());
				orderDetail.setCgstPer(itemJsonImportData[i].getCgstPer());
				orderDetail.setIgstPer(itemJsonImportData[i].getIgstPer());
				orderDetail.setSgstPer(itemJsonImportData[i].getSgstPer());
				orderDetail.setRemark(itemJsonImportData[i].getRemark());

				float detailDiscPer = 0;
				float detailDiscAmt = 0;

				if (discAmt > 0) {
					detailDiscPer = ((itemJsonImportData[i].getTotalAmt() * 100) / grandTotal);
					detailDiscAmt = ((detailDiscPer * discAmt) / 100);
					totalDiscAmt = totalDiscAmt + detailDiscAmt;
				}

				float chPer = 0, chAmt = 0;
				if (deliveryCharges > 0) {
					chPer = ((itemJsonImportData[i].getTotalAmt() * 100) / grandTotal);
					chAmt = ((chPer * deliveryCharges) / 100);
					totalAddChargesAmt = totalAddChargesAmt + chAmt;
				}

				float detailTotal = itemJsonImportData[i].getTotalAmt() - detailDiscAmt + chAmt;

				// float baseRate = (detailTotal * 100) / (100 +
				// itemJsonImportData[i].getIgstPer());
				// float taxAmt = Float.parseFloat(df.format(detailTotal - baseRate));
				float taxAmt = itemJsonImportData[i].getTaxAmt();
				orderDetail.setTaxAmt(taxAmt);

				// float taxableAmt = detailTotal - taxAmt;
				float taxableAmt = itemJsonImportData[i].getTaxableAmt();
				orderDetail.setTaxableAmt(Float.parseFloat(df.format(taxableAmt)));

				// orderDetail.setTotalAmt(itemJsonImportData[i].getTotal());
				orderDetail.setTotalAmt(Float.parseFloat(df.format(detailTotal)));

				float cgstAmt = Float.parseFloat(df.format(taxAmt / 2));

				orderDetail.setCgstAmt(cgstAmt);
				orderDetail.setSgstAmt(cgstAmt);
				orderDetail.setIgstAmt(taxAmt);

				orderDetail.setDiscAmt(detailDiscAmt);
				orderDetail.setExFloat1(chAmt);

				finalCgstAmt = Float.parseFloat(df.format(finalCgstAmt + (taxAmt / 2)));
				finalsgstAmt = Float.parseFloat(df.format(finalsgstAmt + (taxAmt / 2)));
				finalIgstAmt = Float.parseFloat(df.format(finalIgstAmt + (taxAmt)));

				finaTaxableAmt = Float.parseFloat(df.format(finaTaxableAmt + taxableAmt));
				finaTaxAmt = Float.parseFloat(df.format(finaTaxAmt + taxAmt));

				orderDetail.setDelStatus(1);
				orderDetailList.add(orderDetail);
			}

			finaTotalAmt = finaTaxableAmt + finaTaxAmt;

			order.setDiscAmt(totalDiscAmt - applyWalletAmt);
			order.setDeliveryCharges(totalAddChargesAmt);// Delivery and additional charges

			order.setTaxableAmt(finaTaxableAmt);
			order.setTaxAmt(finaTaxAmt);
			// order.setTotalAmt(finaTotalAmt + deliveryCharges);
			order.setTotalAmt(Float.parseFloat(df.format(finaTotalAmt)));
			order.setSgstAmt(finalsgstAmt);
			order.setCgstAmt(finalCgstAmt);
			order.setIgstAmt(finalIgstAmt);

			OrderTrail orderTrail = new OrderTrail();
			orderTrail.setActionByUserId(userId);
			orderTrail.setActionDateTime(dttime.format(ct));
			orderTrail.setStatus(status);
			orderTrail.setExInt1(1);
			orderTrail.setExVar1("-");

			OrderSaveData orderSaveData = new OrderSaveData();
			orderSaveData.setOrderDetailList(orderDetailList);
			orderSaveData.setOrderHeader(order);
			orderSaveData.setOrderTrail(orderTrail);

			info = Constants.getRestTemplate().postForObject(Constants.url + "saveCloudOrder", orderSaveData,
					Info.class);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return info;
	}
	
	public static BufferedImage decodeToImageAndUpload(String imageString,String imgName) {
		 
        BufferedImage image = null;
        byte[] imageByte;
        ByteArrayInputStream bis = null;
        try {
            Decoder decoder = Base64.getDecoder();
            imageByte = decoder.decode(imageString);
             bis = new ByteArrayInputStream(imageByte);
            image = ImageIO.read(bis);
          
            System.err.println("original width" +image.getWidth() +"height " +image.getHeight());
           
            int  height = (int) ((image.getHeight())-(image.getHeight() * 0.25) );
             int  width = (int) ((image.getWidth())-(image.getWidth() * 0.25) );
           System.err.println("width" +width +"height " +height);
		ImageUploadController.saveImgWithByteArray(imageByte,imgName,width,height);
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
}
