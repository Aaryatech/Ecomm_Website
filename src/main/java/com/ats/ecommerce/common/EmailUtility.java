package com.ats.ecommerce.common;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Formatter;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import com.ats.ecommerce.model.Info;

/*<!-- Java Mail Dependency -->
<dependency>
	<groupId>javax.mail</groupId>
	<artifactId>javax.mail-api</artifactId>
	<version>1.5.5</version>
</dependency>
<dependency>
	<groupId>javax.mail</groupId>
	<artifactId>mail</artifactId>
	<version>1.4.7</version>
</dependency>*/

public class EmailUtility {
	public static void main(String[] args) {
		
		SimpleDateFormat dttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date insetDateTime=null;
		try {
			insetDateTime =dttime.parse("2021-07-06 17:30:30");
			System.err.println(insetDateTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String curDtTime=dttime.format(new Date());
		Date now = null;
		try {
			now = dttime.parse(curDtTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.err.println(now.compareTo(insetDateTime));
		
		long duration  = now.getTime() - insetDateTime.getTime();

		
		long diffInMinutes = TimeUnit.MILLISECONDS.toMinutes(duration);
		
		System.err.println("diffInMinutes" +diffInMinutes);
		
		
		
		String x="<!doctype html>\n" + 
				"<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + 
				"<head><style type=\"text/css\">\n" + 
				".btm tbody, .btm tr {\n" + 
				"	width: 100% !important;\n" + 
				"	float: left !important;\n" + 
				"}\n" + 
				".ReadMsgBody {\n" + 
				"	width: 100%;\n" + 
				"	background-color: #ffffff;\n" + 
				"}\n" + 
				".ExternalClass {\n" + 
				"	width: 100%;\n" + 
				"	background-color: #ffffff;\n" + 
				"}\n" + 
				"body {\n" + 
				"	width: 100%;\n" + 
				"	background-color: #ffffff;\n" + 
				"	margin: 0;\n" + 
				"	padding: 0;\n" + 
				"	-webkit-font-smoothing: antialiased;\n" + 
				"	font-family: Arial, sans-serif;\n" + 
				"}\n" + 
				"table {\n" + 
				"	border-collapse: collapse;\n" + 
				"}\n" + 
				"body[yahoo] #tborder {\n" + 
				"	/*border: #f2f2f2 thin solid*/\n" + 
				"}\n" + 
				".valid_till {\n" + 
				"	position: absolute;\n" + 
				"	font-size: 11px;\n" + 
				"	color: #fff;\n" + 
				"	font-weight: bold;\n" + 
				"	font-family: Arial, sans-serif;\n" + 
				"	right: -49px;\n" + 
				"	top: 170px;\n" + 
				"	-ms-transform: rotate(90deg);\n" + 
				"	-webkit-transform: rotate(90deg);\n" + 
				"	transform: rotate(90deg);\n" + 
				"}\n" + 
				"@media handheld, only screen and (max-width: 640px) {\n" + 
				"body[yahoo] .bottommargin {\n" + 
				"	margin-bottom: 10px;\n" + 
				"}\n" + 
				"body[yahoo] .deviceWidth {\n" + 
				"	width: 440px!important;\n" + 
				"	padding: 0;\n" + 
				"}\n" + 
				"body[yahoo] .center {\n" + 
				"	text-align: center!important;\n" + 
				"}\n" + 
				"}\n" + 
				"@media handheld, only screen and (max-width: 479px) {\n" + 
				"body[yahoo] .bottommargin {\n" + 
				"	margin-bottom: 10px;\n" + 
				"}\n" + 
				"body[yahoo] .deviceWidth {\n" + 
				"	width: 280px!important;\n" + 
				"	padding: 0;\n" + 
				"}\n" + 
				"body[yahoo] .center {\n" + 
				"	text-align: center!important;\n" + 
				"}\n" + 
				".bbutton {\n" + 
				"	background-color: #111940 !important;\n" + 
				"	padding-top: 10px;\n" + 
				"	padding-bottom: 10px;\n" + 
				"	padding-right: 30px;\n" + 
				"	text-align: center !important;\n" + 
				"}\n" + 
				"}\n" + 
				"@media handheld, only screen and (min-width:641px) {\n" + 
				"body[yahoo] #tborder {\n" + 
				"	/*border: #f2f2f2 thin solid*/\n" + 
				"}\n" + 
				"body[yahoo] .thumbres {\n" + 
				"	padding-left: 20%;\n" + 
				"	padding-right: 20%;\n" + 
				"}\n" + 
				"body[yahoo] .f-left {\n" + 
				"	display: inline-table !important;\n" + 
				"}\n" + 
				"body[yahoo] .f-right {\n" + 
				"	float: right;\n" + 
				"	display: inline-table !important;\n" + 
				"}\n" + 
				"body[yahoo] .f-center {\n" + 
				"	display: inline-table !important;\n" + 
				"}\n" + 
				"}\n" + 
				"</style>\n" + 
				"\n" + 
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n" + 
				"<title>:: Monginis | Emailer ::</title>\n" + 
				"</head>\n" + 
				"<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" yahoo=\"fix\" style=\"font-family:Arial, sans-serif; background:#e3ebef;\">\n" + 
				"<!-- Wrapper -->\n" + 
				"<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\n" + 
				"  <tr>\n" + 
				"    <td width=\"100%\" valign=\"top\" bgcolor=\"#f8208d\">\n" + 
				"    	<!-- Start Header-->\n" + 
				"      <table width=\"700\" id=\"tborder\" class=\"deviceWidth\" bgcolor=\"#FFF\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\"  style=\"position:relative;\">\n" + 
				"        <tr>\n" + 
				"          <td cellspacing=\"0\" cellpadding=\"0\"  style=\" padding:0;\"><table width=\"100%\" id=\"\" class=\"\" cellspacing=\"0\" cellpadding=\"0\"  align=\"center\" background=\"#000\" border=\"0\" style=\"padding:0;\">\n" + 
				"          	  \n" + 
				"              <tr>\n" + 
				"                <td align=\"center\">&nbsp;</td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td align=\"center\">\n" + 
				"                    <img src=https://pecom.monginis.net/ecom/resources/images/emailer_img/logo.png alt=\"main_logo\" style=\"border:none; max-width:100%; padding: 0; float:none;\">\n" + 
				"                  </td>\n" + 
				"              </tr>\n" + 
				"              <tr>\n" + 
				"                <td cellspacing=\"0\" cellpadding=\"0\" style=\"position:relative; padding:30px 15px 10px 15px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"text-align:center; font-size:16px; letter-spacing:0.5px; text-transform:uppercase; padding:0 0 20px 0; color:#24247e;\">\n" + 
				"                      	<strong>Order Confirmation</strong></td>\n" + 
				"                    </tr>\n" + 
				"                    <tr>\n" + 
				"                      <td style=\"text-align:center; padding:0 0 25px 0; font-size:13px; line-height:28px; color:#3a3a3a;\">\n" + 
				"                      	Hi nine eight-9898989898, <br>\n" + 
				"                        We've got your order! Your world is about to look a whole lot better.<br>\n" + 
				"						We'll drop you another email when your order ships.\n" + 
				"                      </td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                    <tr>\n" + 
				"                      <td style=\"text-align:center; padding:0 0 15px 0; font-size:15px; text-transform:uppercase; letter-spacing:0.5px; font-weight:bold; line-height:24px; color:#24247e;\">\n" + 
				"                      	Order No. Monginis-00377 <br>\n" + 
				"						<span style=\"font-size:13px; color:#3a3a3a; font-weight:bold;\">07-07-2021</span>\n" + 
				"                      </td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                  </table></td>\n" + 
				"              </tr>\n" + 
				"              \n" + 
				"              <tr>\n" + 
				"                <td cellspacing=\"0\" cellpadding=\"0\"  style=\"background: #FFF; position:relative; padding:0 15px;\" border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                    <tr>                          \n" + 
				"                      <td style=\"background:#FFF; padding:15px 0; color:#24247e; text-align:left; font-size:13px; font-weight:bold; text-transform:uppercase; border-bottom:1px solid #d9d9d9; letter-spacing:0.5px;\"><strong>Item Order</strong></td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:15px; border-bottom:1px solid #d9d9d9;\">\n" + 
				"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td><img src=http://107.180.72.86:8080/uploads/ecomAdmin/PROD_IMG_UP/1622539785982_72.jpg alt=\"\" width=\"64\" style=\"border:none; max-width:100%; float:left;\"></td>\n" + 
				"                                <td style=\"font-size:13px; line-height:20px; padding:0 0 0 15px;\"><strong style=\"color:#24247e;\">Motu Patlu Photo Cake</strong> <br>  Weight : 1.0 </td>\n" + 
				"                                <td style=\"text-align:right; font-size:13px; font-weight:bold; color:#ed258f; padding:0 0 0 15px;\">Rate : 900.0</td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"\n" + 
				"                    <!--price box-->\n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:20px 0; font-size:13px; font-weight:bold; line-height:28px; color:#3a3a3a;\">\n" + 
				"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"text-align:left; width:75%; max-width:100%; line-height:24px;\">\n" + 
				"                                    Discount nn <br>\n" + 
				"                                    Subtotal <br>\n" + 
				"                                    Delivery Charges <br>\n" + 
				"                                    Total\n" + 
				"                                </td>\n" + 
				"                               <td style=\"line-height:24px; text-align:left; \">\n" + 
				"                                    Rs. -0.0<br>\n" + 
				"                                    Rs. 900.0<br>\n" + 
				"                                    Rs. 60.0<br>\n" + 
				"                                    Rs. 960.0\n" + 
				"                                </td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                    <!--billing info box-->\n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:20px 0; font-size:13px; color:#3a3a3a; border-top:1px solid #d9d9d9; border-bottom:1px solid #d9d9d9;\">\n" + 
				"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td style=\"float:left; width:50%; max-width:100%; text-align:left; line-height:24px;\">\n" + 
				"                                	<span style=\"display:block; padding:0 0 5px 0; font-weight:bold; text-transform:uppercase; color:#24247e;\">Billing Info</span>\n" + 
				"                                    nine eight <br>\n" + 
				"903<br>\n" + 
				"Near G Temple<br>\n" + 
				"                             422210                                  <br>\n" + 
				" <a href=\"mailto:ne@neee.com\">ne@neee.com</a>\n" + 
				"                                </td>\n" + 
				"                                <td style=\"float:right; max-width:100%; width:50%; line-height:24px; \">\n" + 
				"                                	<span style=\"display:block; padding:0 0 5px 0; font-weight:bold; text-transform:uppercase; color:#24247e;\">Shipping Address</span>\n" + 
				"                                    nine eight - 9898989898 <br>\n" + 
				"903<br>\n" + 
				" Near G Temple<br>\n" + 
				"293, Mahatma Gandhi Rd, Motilal Nagar II, Goregaon West, Mumbai, Maharashtra 400104, India<br>\n" + 
				"     422210                               <br>\n" + 
				" </td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                    \n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"border-bottom:1px solid #d9d9d9; padding:25px 0 40px 0; font-size:13px; color:#3a3a3a; text-align:center;\">\n" + 
				"                        	<span style=\"display:block; padding:0 0 25px 0; font-size:13px; text-transform:uppercase; letter-spacing:0.3px; font-weight:bold; color:#24247e;\">Change your mind?</span>\n" + 
				"                            <span style=\"color:#ed258f; font-size:12px; text-transform:uppercase; font-weight:bold; padding:0; line-height:12px;\">Cancelling an order</span>\n" + 
				"                            <p style=\"color:#3a3a3a; padding:0 0 10px 0; display:block;\">we're not able to make changes to your order, but you do have the option to cancel it.</p>\n" + 
				"                            \n" + 
				"                            <p style=\"line-height:20px; padding:0 0 5px 0;\">\n" + 
				"                            	<img src=https://pecom.monginis.net/ecom/resources/images/emailer_img/shipping_pic.png alt=\"\" style=\"border:none; max-width:100%; vertical-align:top; padding:0 5px 0 0; display:inline-block;\">\n" + 
				"                                <span style=\"display:inline-block; text-align:left;\">\n" + 
				"                                <strong>Standard Delivery</strong> <br>\n" + 
				"								Cancel within one hour</span>\n" + 
				"                            </p>\n" + 
				"                            \n" + 
				"                            <p style=\"font-size:13px; color:#3a3a3a; padding:0 0 25px 0;\">Go to your order from the button below and follow the instructions.</p>\n" + 
				"                            <a href=\"https://pecom.monginis.net/ecom/orderhistory/\" style=\"text-decoration:none; padding:10px 40px; border:1px solid #d9d9d9; color:#3a3a3a; text-transform:uppercase; font-weight:bold; font-size:12px;\">View Order</a>\n" + 
				"                            \n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                    \n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:20px 0; color:#3a3a3a; font-size:13px; border-bottom:1px solid #d9d9d9;\">\n" + 
				"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                              <tr>\n" + 
				"                                <td colspan=\"3\" style=\"text-align:center; padding:0 0 40px 0; line-height:20px; color:#3a3a3a;\">\n" + 
				"                                    If you need help with anything please don't hesitate to drop us an <br>email:care@monginis.com\n" + 
				"                                </td>\n" + 
				"                                </tr>\n" + 
				"                              <tr>\n" + 
				"                                <td colspan=\"3\" >&nbsp;</td>\n" + 
				"                              </tr>\n" + 
				"                              <tr>\n" + 
				"                                <td align=\"center\" style=\"font-size:12px; text-transform:uppercase; font-weight:bold; letter-spacing:0.3px; width:33.333%; max-width:100%;\">\n" + 
				"                                  <a href=\"https://pecom.monginis.net/ecom\" style=\"text-decoration:none; color:#24247e;\">Home</a>\n" + 
				"                                </td>\n" + 
				"                                <td align=\"center\" style=\"font-size:12px; text-transform:uppercase; font-weight:bold; letter-spacing:0.3px; width:33.333%; max-width:100%;\">\n" + 
				"                                  <a href=\"https://pecom.monginis.net/ecom\" style=\"text-decoration:none; color:#24247e;\">About Us</a>\n" + 
				"                                </td>\n" + 
				"                                <td align=\"center\" style=\"font-size:12px; text-transform:uppercase; font-weight:bold; letter-spacing:0.3px; width:33.333%; max-width:100%;\">\n" + 
				"                                  <a href=\"https://pecom.monginis.net/ecom\" style=\"text-decoration:none; color:#24247e;\">Contact Us</a>\n" + 
				"                                </td>\n" + 
				"                              </tr>\n" + 
				"                            </table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"border-bottom:1px solid #d9d9d9;\">\n" + 
				"                        	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" + 
				"                  <tr>\n" + 
				"                    <td style=\"width:50%; max-width:100%; text-align:center; padding:20px;\">\n" + 
				"                        <span style=\"font-size:13px; padding:0 0 20px 0; display:block; color:#3a3a3a;\">Lets Hang Out?</span>\n" + 
				"                        <a href=\"https://www.facebook.com/monginis/\" target=\"_blank\" style=\"text-decoration:none;\"> \n" + 
				"                            <img src=https://pecom.monginis.net/ecom/resources/images/emailer_img/fb_icon.jpg alt=\"\" style=\"border:none; max-width:100%; display:inline-block; margin:0 5px;\">\n" + 
				"                        </a>\n" + 
				"                        <a href=\"https://twitter.com/MonginisIndia\" target=\"_blank\" style=\"text-decoration:none;\"> \n" + 
				"                            <img src=https://pecom.monginis.net/ecom/resources/images/emailer_img/twt_icon.jpg alt=\"\" style=\"border:none; max-width:100%; display:inline-block; margin:0 5px;\">\n" + 
				"                        </a>\n" + 
				"                        <a href=\"https://www.youtube.com/channel/UCL2K9zi9D94YBbmU1GJicAA\" target=\"_blank\" style=\"text-decoration:none;\"> \n" + 
				"                            <img src=https://pecom.monginis.net/ecom/resources/images/emailer_img/yt_icon.jpg alt=\"\" style=\"border:none; max-width:100%; display:inline-block; margin:0 5px;\">\n" + 
				"                        </a>\n" + 
				"                        <a href=\"https://www.instagram.com/monginiscelebrations/\" target=\"_blank\" style=\"text-decoration:none;\"> \n" + 
				"                            <img src=https://pecom.monginis.net/ecom/resources/images/emailer_img/insta_icon.jpg alt=\"\" style=\"border:none; max-width:100%; display:inline-block; margin:0 5px;\">\n" + 
				"                        </a>\n" + 
				"                    </td>\n" + 
				"                    <td style=\"width:50%; max-width:100%; text-align:center; padding:20px; border-left:1px solid #d9d9d9; color:#3a3a3a; font-size:13px;\">\n" + 
				"                    	<span style=\"text-transform:uppercase; font-size:13px; padding:0 0 0px 0; display:block; font-weight:bold;\">Office</span>\n" + 
				"                         <p style=\"font-size:13px; line-height:20px;\">1st Floor, Raj Apartment, <br>\n" + 
				"                            Rachna Vidyalay Road,<br>\n" + 
				"                            Sharanpur Rd, Nashik.<br></p>\n" + 
				"\n" + 
				"						 Copyright &copy; 2021\n" + 
				"                    </td>\n" + 
				"                  </tr>\n" + 
				"</table>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                    \n" + 
				"                    <tr>\n" + 
				"                    	<td style=\"padding:20px 10px; text-align:center;\">\n" + 
				"                        	<a href=\"https://www.monginis.net/\" target=\"_blank\" style=\"color:#24247e; text-decoration:none; font-size:13px;\">monginis.net</a>\n" + 
				"                        </td>\n" + 
				"                    </tr>\n" + 
				"                  </table></td>\n" + 
				"              </tr>\n" + 
				"            </table>\n" + 
				"            <!--bottom start---> \n" + 
				"            <!--bottom end---></td>\n" + 
				"        </tr>\n" + 
				"      </table>\n" + 
				"      <!--end--></td>\n" + 
				"  </tr>\n" + 
				"</table>\n" + 
				"</body>\n" + 
				"</html>\n" + 
				"";
		/*
		 * sendEmailer("atsinfosoft@gmail.com", "atsinfosoft#123",
		 * "mohsinmaster47@gmail.com", "Ecom Test", x);
		 */
	}
	public static Info sendEmail(String senderEmail, String senderPassword, String recipientEmail, String mailsubject,
			String mailMsg) {

		Info info = new Info();

		try {

			final String emailSMTPserver = "smtp.gmail.com";
			final String emailSMTPPort = "587";
			final String mailStoreType = "imaps";

			System.out.println("senderEmail " + senderEmail);
			System.out.println("password " + senderPassword);

			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.starttls.enable", "true");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(senderEmail, senderPassword);
				}
			});

			try {
				Store mailStore = session.getStore(mailStoreType);
				mailStore.connect(emailSMTPserver, senderEmail, senderPassword);

				String address = recipientEmail;// "atsinfosoft@gmail.com";// address of to

				String subject = mailsubject;// " Login Credentials For RUSA Login ";

				Message mimeMessage = new MimeMessage(session);
				mimeMessage.setFrom(new InternetAddress(senderEmail));
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(address));
				mimeMessage.setSubject(subject);
				mimeMessage.setText(mailMsg);

				Transport.send(mimeMessage);
			} catch (Exception e) {
				e.printStackTrace();
				info.setError(true);
				info.setMsg("email_exce");
				// System.err.println("Mail Response1 : "+info);
				System.err.println("Ex1" + e.getMessage());
			}

			info.setError(false);
			info.setMsg("success_email");
			// System.err.println("Mail Response2 : "+info);

		} catch (Exception e) {

			info.setError(true);
			info.setMsg("email_exce");
			// System.err.println("Mail Response3 : "+info);
			System.err.println("Ex2" + e.getMessage());
		}

		return info;

	}
	
	public static Info sendEmailer(String senderEmail, String senderPassword, String recipientEmail, String mailsubject,
			String mailMsg) {

		Info info = new Info();
		/*
		 * senderEmail="noreply.order@monginis.net"; senderPassword="eCom$orD%0507";
		 */
		try {
			

			final String emailSMTPserver = "smtp.gmail.com";
			final String emailSMTPPort = "587";
			final String mailStoreType = "imaps";

			//System.out.println("mailMsg " + mailMsg);
			//System.out.println("password " + senderPassword);

			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.starttls.enable", "true");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(senderEmail, senderPassword);
				}
			});

			try {
				session.setDebug(true);
				
				Store mailStore = session.getStore(mailStoreType);
				mailStore.connect(emailSMTPserver, senderEmail, senderPassword);

				String address = recipientEmail;// "atsinfosoft@gmail.com";// address of to

				String subject = mailsubject;// " Login Credentials For RUSA Login ";

				Message mimeMessage = new MimeMessage(session);
				mimeMessage.setFrom(new InternetAddress(senderEmail));
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(address));
				mimeMessage.setSubject(subject);
				// mimeMessage.setText(mailMsg);
				MimeMultipart multipart = new MimeMultipart("related");
				BodyPart messageBodyPart = new MimeBodyPart();				
				messageBodyPart.setContent(mailMsg, "text/html");
				multipart.addBodyPart(messageBodyPart);				
				mimeMessage.setContent(multipart);
				
//				messageBodyPart = new MimeBodyPart();
//				DataSource fds = new FileDataSource(imgPath);
//				messageBodyPart.setDataHandler(new DataHandler(fds));
//				messageBodyPart.setHeader("Content-ID", "<image>");
//				
//				mimeMessage.setContent(multipart);

				Transport.send(mimeMessage);
			} catch (Exception e) {
				e.printStackTrace();
				info.setError(true);
				info.setMsg("email_exce");
				// System.err.println("Mail Response1 : "+info);
				System.err.println("Ex1" + e.getMessage());
			}

			info.setError(false);
			info.setMsg("success_email");
			// System.err.println("Mail Response2 : "+info);

		} catch (Exception e) {

			info.setError(true);
			info.setMsg("email_exce");
			// System.err.println("Mail Response3 : "+info);
			System.err.println("Ex2" + e.getMessage());
		}

		return info;

	}

//	public class SendInlineImagesInEmail {
//		   
//		      // Recipient's email ID needs to be mentioned.
//		      String to = "destinationemail@gmail.com";
//
//		      // Sender's email ID needs to be mentioned
//		      String from = "fromemail@gmail.com";
//		      final String username = "manishaspatil";//change accordingly
//		      final String password = "******";//change accordingly
//
//		      // Assuming you are sending email through relay.jangosmtp.net
//		      String host = "relay.jangosmtp.net";
//
//		      Properties props = new Properties();
//		      props.put("mail.smtp.auth", "true");
//		      props.put("mail.smtp.starttls.enable", "true");
//		      props.put("mail.smtp.host", host);
//		      props.put("mail.smtp.port", "25");
//
//		      Session session = Session.getInstance(props,
//		         new javax.mail.Authenticator() {
//		            protected PasswordAuthentication getPasswordAuthentication() {
//		               return new PasswordAuthentication(username, password);
//		            }
//		         });
//
//
//		         // Create a default MimeMessage object.
//		         Message message = new MimeMessage(session);
//
//		        
//		         message.setFrom(new InternetAddress(from));
//		         message.setRecipients(Message.RecipientType.TO,
//		            InternetAddress.parse(to));
//
//		         
//		         message.setSubject("Testing Subject");
//		         MimeMultipart multipart = new MimeMultipart("related");
//		         BodyPart messageBodyPart = new MimeBodyPart();
//		         String htmlText = "<H1>Hello</H1><img src=\"cid:image\">";
//		         messageBodyPart.setContent(htmlText, "text/html");		        
//		         multipart.addBodyPart(messageBodyPart);
//		         messageBodyPart = new MimeBodyPart();
//		         
//		         DataSource fds = new FileDataSource(
//		            "/home/manisha/javamail-mini-logo.png");
//
//		         messageBodyPart.setDataHandler(new DataHandler(fds));
//		         messageBodyPart.setHeader("Content-ID", "<image>");
//		        
//		         multipart.addBodyPart(messageBodyPart);
//
//		         
//		         message.setContent(multipart);
//		         
//		         Transport.send(message);
//
//		         System.out.println("Sent message successfully....");
//		   
//		}

}
