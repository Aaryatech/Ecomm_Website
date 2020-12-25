package com.ats.ecommerce.controller;

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

	final String logoImg="http://198.12.156.31:8080/uploads/mail_logo.png";
	final String saperatorImg="http://198.12.156.31:8080/uploads/mail_seprator.jpg";
	
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
		/*String mailMsg = "Name : "+firstName+" "+lastName
				+"\n Email Id : "+recipientEmail
				+"\n Contact No. : "+contactNo
				+"\n Message : "+message;*/
		
		
		String mailMsg = "<!doctype html>\n" + 
				"<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
				"<head>\n" + 
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n" + 
				"<title>:: Monginis ::</title>\n" + 
				"</head>\n" + 
				"<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" yahoo=\"fix\" style=\"font-family:Arial, sans-serif; background:#e3ebef;\">\n" + 
				"<!-- Wrapper -->\n" + 
				"<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"margin-top:10px; margin-bottom:10px;\">\n" + 
				"  <tr>\n" + 
				"    <td width=\"100%\" valign=\"top\" bgcolor=\"#e3ebef\"><!-- Start Header--> <!--style=\"padding-top:20px; padding-bottom:20px;\"-->\n" + 
				"      \n" + 
				"      <table width=\"700\" id=\"tborder\" class=\"deviceWidth\" bgcolor=\"#f5f5f5\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\"  style=\"position:relative; border:2px solid #d8e0e4;\">\n" + 
				"        <!--f07d00-->\n" + 
				"        <tr>\n" + 
				"          <td cellspacing=\"0\" cellpadding=\"0\"  style=\" padding:0;\"><table width=\"100%\" id=\"\" class=\"\" cellspacing=\"0\" cellpadding=\"0\"  align=\"center\" background=\"#000\" border=\"0\" style=\"padding:0;\">\n" + 
				"              <tr>\n" + 
				"                <td align=\"center\" style=\"background:#f5f5f5;\">\n" + 
				"                    <img src="+logoImg+" alt=\"main_logo\" style=\"border:none; max-width:100%; padding: 0; float:none;\">\n" + 
				"                  </td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td cellspacing=\"0\" cellpadding=\"0\"  style=\"position:relative; padding:20px 40px 10px 40px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"text-align:center; font-size:14px; text-transform:uppercase; padding:0 0 5px 0; color:#e21586;\"><strong>Hello Monginis</strong></td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"text-align:left; padding:0 0 15px 0; font-size:13px; line-height:24px; color:#3a3a3a;\"><strong style=\"color:#373991;\">Business Name</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                  </table></td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td style=\"background: #FFF;\"><img src="+saperatorImg+" alt=\"seprator\" style=\"border:none; max-width:100%; float:left; padding:0 0 28px 0;\"></td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td cellspacing=\"0\" cellpadding=\"0\"  style=\"background: #FFF; position:relative; padding:0 50px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border:1px solid #e3ebef;\">\n" + 
				"                    <tr>                          \n" + 
				"                      <td style=\"background:#e21586; padding:10px; color:#FFF; text-align:center; font-size:13px; font-weight:bold;\">Personal Information</td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:10px 15px; border-bottom:1px solid #e3ebef; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Name</strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\">"+firstName+" "+lastName+"</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:10px 15px; border-bottom:1px solid #e3ebef; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Contact No.</strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\">"+contactNo+"</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				
				"                    <tr>\n" + 
				"                    	<td style=\"padding:10px 15px; background:#ecf4f8; border-bottom:1px solid #e3ebef; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Email Id </strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\"><a href=\"mailto:"+recipientEmail+"\">"+recipientEmail+"</a> </td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
//				"                    <tr>\n" + 
//				"                    	<td style=\"padding:10px 15px; font-size:13px; color:#3a3a3a;\">\n" + 
//				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
//				"                              <tr>\n" + 
//				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">City </strong></td>\n" + 
//				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\"> Gandhi Nagar, Gujrat </td>\n" + 
//				"                              </tr>\n" + 
//				"                            </table>\n" + 
//				"                        </td>\n" + 
//				"                     \n" + 
//				"                    </tr>\n" + 
//				"                    <tr>\n" + 
//				"                    \n" + 
//				"                    	<td style=\"padding:10px 15px; background:#ecf4f8; font-size:13px; color:#3a3a3a;\">\n" + 
//				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
//				"                              <tr>\n" + 
//				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Address 1</strong></td>\n" + 
//				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\"> 26, Sharanpur Rd, Adwait Colony. </td>\n" + 
//				"                              </tr>\n" + 
//				"                            </table>\n" + 
//				"                        </td>\n" + 
//				"                    \n" + 
//				"                      \n" + 
//				"                    </tr>                    \n" + 
//				"                    <tr>\n" + 
//				"                    	\n" + 
//				"                        <td style=\"padding:10px 15px; font-size:13px; color:#3a3a3a;\">\n" + 
//				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
//				"                              <tr>\n" + 
//				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Address 2</strong></td>\n" + 
//				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\"> Canada Corner, Nashik, Maharashtra 422005.</td>\n" + 
//				"                              </tr>\n" + 
//				"                            </table>\n" + 
//				"                        </td>\n" + 
//				"                    </tr>\n" + 
//				"                     <tr>\n" + 
//				"                     \n" + 
				"                     	<td style=\"padding:10px 15px; background:#ecf4f8; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Message</strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px; line-height:20px;\">"+message+"</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                  </table></td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td style=\"background: #FFF;\"><img src="+saperatorImg+" alt=\"seprator\" style=\"border:none; max-width:100%; float:left; padding:28px 0 0 0;\"></td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td cellspacing=\"0\" cellpadding=\"0\"  style=\"position:relative; padding:28px 30px 30px 30px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"font-size:13px; padding:0 0 8px 0; color:#262626;\"><strong>Merchant Contact</strong> - Email : <a href=\"mailto:test@gmail.com\" style=\"color:#4666b9; text-decoration:underline;\">test@gmail.com</a> | Phone : <a href=\"tel:123-456-7890\" style=\"color:#4666b9; text-decoration:underline;\">123-456-7890</a></td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"font-size:13px; color:#262626; padding:0 0 8px 0;\">(Hit 'Reply' to send a query to merchant)</td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"color:#8f8b9f; font-size:12px; padding:10px 0; line-height:20px;\">if you are not the intended receiver of his email or feel there has been a mistake, then please reach out to <a href=\"mailto:test@gmail.com\" style=\"color:#4666b9; text-decoration:underline;\">test@gmail.com</a></td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"color:#3a3a3a; font-size:13px; line-height:20px; font-weight:bold;\">Regards,<br>\n" + 
				"                        Team Monginis </td>\n" + 
				"                    </tr>\n" + 
				"                  </table></td>\n" + 
				"              </tr>\n" + 
				"            </table>\n" + 
				"            \n" + 
				"            <!--bottom start---> \n" + 
				"            <!--bottom end---></td>\n" + 
				"        </tr>\n" + 
				"      </table>\n" + 
				"      \n" + 
				"      <!--end--></td>\n" + 
				"  </tr>\n" + 
				"</table>\n" + 
				"<!-- End Wrapper https://www.mytatasky.com/delegate/EmailCampaignAction/CampaignAction?campaignID=liUFBUl1mbM=&vendor=oBEMvseSmG0= -->\n" + 
				"</body>\n" + 
				"</html>\n";
		
		
		Info mailResp = EmailUtility.sendEmailer(senderEmail, senderPassword, recipientEmail, mailsubject, mailMsg);
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
		
		String mailMsg = "<!doctype html>\n" + 
				"<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
				"<head>\n" + 
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n" + 
				"<title>:: Monginis ::</title>\n" + 
				"</head>\n" + 
				"<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" yahoo=\"fix\" style=\"font-family:Arial, sans-serif; background:#e3ebef;\">\n" + 
				"<!-- Wrapper -->\n" + 
				"<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"margin-top:10px; margin-bottom:10px;\">\n" + 
				"  <tr>\n" + 
				"    <td width=\"100%\" valign=\"top\" bgcolor=\"#e3ebef\"><!-- Start Header--> <!--style=\"padding-top:20px; padding-bottom:20px;\"-->\n" + 
				"      \n" + 
				"      <table width=\"700\" id=\"tborder\" class=\"deviceWidth\" bgcolor=\"#f5f5f5\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\"  style=\"position:relative; border:2px solid #d8e0e4;\">\n" + 
				"        <!--f07d00-->\n" + 
				"        <tr>\n" + 
				"          <td cellspacing=\"0\" cellpadding=\"0\"  style=\" padding:0;\"><table width=\"100%\" id=\"\" class=\"\" cellspacing=\"0\" cellpadding=\"0\"  align=\"center\" background=\"#000\" border=\"0\" style=\"padding:0;\">\n" + 
				"              <tr>\n" + 
				"                <td align=\"center\" style=\"background:#f5f5f5;\">\n" + 
				"                    <img src="+logoImg+" alt=\"main_logo\" style=\"border:none; max-width:100%; padding: 0; float:none;\">\n" + 
				"                  </td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td cellspacing=\"0\" cellpadding=\"0\"  style=\"position:relative; padding:20px 40px 10px 40px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"text-align:center; font-size:14px; text-transform:uppercase; padding:0 0 5px 0; color:#e21586;\"><strong>Hello Monginis</strong></td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"text-align:left; padding:0 0 15px 0; font-size:13px; line-height:24px; color:#3a3a3a;\"><strong style=\"color:#373991;\">Business Name</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                  </table></td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td style=\"background: #FFF;\"><img src="+saperatorImg+" alt=\"seprator\" style=\"border:none; max-width:100%; float:left; padding:0 0 28px 0;\"></td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td cellspacing=\"0\" cellpadding=\"0\"  style=\"background: #FFF; position:relative; padding:0 50px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border:1px solid #e3ebef;\">\n" + 
				"                    <tr>                          \n" + 
				"                      <td style=\"background:#e21586; padding:10px; color:#FFF; text-align:center; font-size:13px; font-weight:bold;\">Personal Information</td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:10px 15px; border-bottom:1px solid #e3ebef; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Name</strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\">"+firstName+" "+lastName+"</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:10px 15px; border-bottom:1px solid #e3ebef; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Contact No.</strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\">"+contactNo+"</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				
				"                    <tr>\n" + 
				"                    	<td style=\"padding:10px 15px; background:#ecf4f8; border-bottom:1px solid #e3ebef; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Email Id </strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\"><a href=\"mailto:"+recipientEmail+"\">"+recipientEmail+"</a> </td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:10px 15px; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">City </strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\">"+city+"</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                     \n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                    \n" + 
				"                    	<td style=\"padding:10px 15px; background:#ecf4f8; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Address 1</strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\">"+address1+"</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    \n" + 
				"                      \n" + 
				"                    </tr>                    \n" + 
				"                    <tr>\n" + 
				"                    	\n" + 
				"                        <td style=\"padding:10px 15px; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Address 2</strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px;\">"+address2+"</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                     <tr>\n" + 
				"                     \n" + 
				"                     	<td style=\"padding:10px 15px; background:#ecf4f8; font-size:13px; color:#3a3a3a;\">\n" + 
				"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"width:15%; text-align:left; margin:0px; padding:0px;\"><strong style=\"font-size:13px;\">Message</strong></td>\n" + 
				"                                <td style=\"width:85%; text-align:left; margin:0px; padding-left:20px; line-height:20px;\">"+message+"</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                  </table></td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td style=\"background: #FFF;\"><img src="+saperatorImg+" alt=\"seprator\" style=\"border:none; max-width:100%; float:left; padding:28px 0 0 0;\"></td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td cellspacing=\"0\" cellpadding=\"0\"  style=\"position:relative; padding:28px 30px 30px 30px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"font-size:13px; padding:0 0 8px 0; color:#262626;\"><strong>Merchant Contact</strong> - Email : <a href=\"mailto:test@gmail.com\" style=\"color:#4666b9; text-decoration:underline;\">test@gmail.com</a> | Phone : <a href=\"tel:123-456-7890\" style=\"color:#4666b9; text-decoration:underline;\">123-456-7890</a></td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"font-size:13px; color:#262626; padding:0 0 8px 0;\">(Hit 'Reply' to send a query to merchant)</td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"color:#8f8b9f; font-size:12px; padding:10px 0; line-height:20px;\">if you are not the intended receiver of his email or feel there has been a mistake, then please reach out to <a href=\"mailto:test@gmail.com\" style=\"color:#4666b9; text-decoration:underline;\">test@gmail.com</a></td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"color:#3a3a3a; font-size:13px; line-height:20px; font-weight:bold;\">Regards,<br>\n" + 
				"                        Team Monginis </td>\n" + 
				"                    </tr>\n" + 
				"                  </table></td>\n" + 
				"              </tr>\n" + 
				"            </table>\n" + 
				"            \n" + 
				"            <!--bottom start---> \n" + 
				"            <!--bottom end---></td>\n" + 
				"        </tr>\n" + 
				"      </table>\n" + 
				"      \n" + 
				"      <!--end--></td>\n" + 
				"  </tr>\n" + 
				"</table>\n" + 
				"<!-- End Wrapper https://www.mytatasky.com/delegate/EmailCampaignAction/CampaignAction?campaignID=liUFBUl1mbM=&vendor=oBEMvseSmG0= -->\n" + 
				"</body>\n" + 
				"</html>\n";
		
		
		Info mailResp = EmailUtility.sendEmailer(senderEmail, senderPassword, recipientEmail, mailsubject, mailMsg);
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
