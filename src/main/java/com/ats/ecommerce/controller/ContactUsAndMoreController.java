package com.ats.ecommerce.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.ecommerce.common.Constants;
import com.ats.ecommerce.common.EmailUtility;
import com.ats.ecommerce.model.Info;


@Controller
@Scope("session")
public class ContactUsAndMoreController {

	@RequestMapping(value = "/mailVistorInfo", method = RequestMethod.POST)
	public String mailVistorInfo(Model model, HttpServletRequest request, HttpServletResponse response) {
		String redirect = null;
		try {
		HttpSession session = request.getSession();
		
		String senderEmail = Constants.senderEmail;
		String senderPassword = Constants.senderPassword;
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String contactNo = request.getParameter("contactNo");
		String message = request.getParameter("message");
		
		String recipientEmail = request.getParameter("email");
		String mailsubject = "You received a new enquiry from "+firstName+" "+lastName+".";
		String mailMsg = "Name : "+firstName+" "+lastName
				+"\n Email Id : "+recipientEmail
				+"\n Contact No. : "+contactNo
				+"\n Message : "+message;
		
		System.out.println(mailMsg+"----"+recipientEmail);
		Info mailResp = EmailUtility.sendEmail(senderEmail, senderPassword, recipientEmail, mailsubject, mailMsg);
		if(!mailResp.isError()) {
			System.out.println("Mail Send Successfully");
			redirect = "redirect:/showContactUsPage";
		}else {
			System.out.println("Failed to Send Mail");
			redirect = "redirect:/showContactUsPage";
		}
		}catch (Exception e) {
			System.out.println("Excep in /mailVistorInfo : "+e.getMessage());
		}
		
		
		return redirect;
	}
	
	
	
	@RequestMapping(value = "/mailBcmPartnrmail", method = RequestMethod.POST)
	public String mailBcmPartnrmail(Model model, HttpServletRequest request, HttpServletResponse response) {
		String redirect = null;
		try {
		HttpSession session = request.getSession();
		
		String senderEmail = Constants.senderEmail;
		String senderPassword = Constants.senderPassword;
		
		int visitorType = Integer.parseInt(request.getParameter("valSlct"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String contactNo = request.getParameter("contactNo");
		String city = request.getParameter("city");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String message = request.getParameter("message");
		
		String recipientEmail = request.getParameter("email");
		String mailsubject = null;
		if(visitorType==1){
			mailsubject = "You received a new enquiry for vendor partnership from "+firstName+" "+lastName+".";
		}else if(visitorType==2){
			mailsubject = "You received a new enquiry for franchise partnership from "+firstName+" "+lastName+".";
		}else{
			mailsubject = "You received a new enquiry for corporate gift partnership from "+firstName+" "+lastName+".";
		}
		String mailMsg = "Name : "+firstName+" "+lastName
				+"\n Email Id : "+recipientEmail
				+"\n Contact No. : "+contactNo
				+"\n Address : "+city+",\n\t\t "+address1+",\n\t\t "+address2
				+"\n Message : "+message;
		
		System.out.println(mailMsg+"----"+recipientEmail);
		Info mailResp = EmailUtility.sendEmail(senderEmail, senderPassword, recipientEmail, mailsubject, mailMsg);
		if(!mailResp.isError()) {
			System.out.println("Mail Send Successfully");
			redirect = "redirect:/showBecmVendrFr";
		}else {
			System.out.println("Failed to Send Mail");
			redirect = "redirect:/showBecmVendrFr";
		}
		}catch (Exception e) {
			System.out.println("Excep in /mailBcmPartnrmail : "+e.getMessage());
		}
		
		
		return redirect;
	}
}
