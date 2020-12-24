package com.ats.ecommerce.common;


import java.net.URLEncoder;
import java.util.Formatter;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
	public static Info sendEmail(String senderEmail,String senderPassword,String recipientEmail,String mailsubject,
			String mailMsg) {
			
			Info info=new Info();
			
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

				String address =recipientEmail;// "atsinfosoft@gmail.com";// address of to

				String subject = mailsubject;//" Login Credentials For RUSA Login  ";

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
				//System.err.println("Mail Response1 : "+info);
				System.err.println("Ex1"+e.getMessage());
			}
				
				info.setError(false);
				info.setMsg("success_email");
				//System.err.println("Mail Response2 : "+info);
				
			}catch (Exception e) {
				
				info.setError(true);
				info.setMsg("email_exce");
				//System.err.println("Mail Response3 : "+info);
				System.err.println("Ex2"+e.getMessage());
			}
			
			return info;
			
		}
		
}
