<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="getFooterData" value="getFooterData"/>
<!--footer start here-->
<footer>
	<div class="footer_menu">
		<div class="wrapper">
			<div class="menu_bx">
				<!--left-certificate-->
				<div class="certificate_one">
					<h3 class="footer_title">Our Certificate</h3>
					<img src="#" class="lazy"
						data-src="${pageContext.request.contextPath}/resources/images/iso_certificate.png"
						alt="">
				</div>
				<!--center menu list-->
				<div class="menu_list">
					<h3 class="footer_title">Main Menu</h3>
					<ul class="footer_menu_list">
						<li><a href="${pageContext.request.contextPath}/showAboutUsPage"><i class="fa fa-check" aria-hidden="true"></i>
								About Us</a></li>
						<li><a href="#"><i class="fa fa-check" aria-hidden="true"></i>
								Privacy Policy</a></li>
						<li><a href="${pageContext.request.contextPath}/showT&CPage"><i class="fa fa-check" aria-hidden="true"></i>
								Terms &amp; Condition</a></li>
						<!-- <li><a href="#"><i class="fa fa-check" aria-hidden="true"></i>
								Meet Our Team</a></li> -->
						<li><a href="${pageContext.request.contextPath}/showContactUsPage"><i class="fa fa-check" aria-hidden="true"></i>
								Contact Us</a></li>

						<!--<li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> Our Moral Responsibility</a></li>
                        <li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> Recognition &amp; Awards</a></li>
                        <li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> Disclaimer</a></li>
                        <li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> Monginis Egypt</a></li>
                        <li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> Cake Studies</a></li>
                        <li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> Delicias Foods</a></li>
                        <li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> Training Videos</a></li>-->
					</ul>

					<div class="footer_social">
						<ul>
							<li>Connect with Us :</li>
							<li><a href="" id="faceLink"><i class="fa fa-facebook"
									aria-hidden="true"></i></a></li>
							<li><a href="" id="twitLink"><i class="fa fa-twitter"
									aria-hidden="true"></i></a></li>
							<li><a href="" id="linkedLink"><i class="fa fa-linkedin"
									aria-hidden="true"></i></a></li>
							<li><a href="" id="googleLink"><i class="fa fa-google-plus"
									aria-hidden="true"></i></a></li>
						</ul>
					</div>

				</div>
				<!--right-contact-->
				<div class="contact_address">
					<h3 class="footer_title">Contact Us</h3>
					<div class="cont_add">
						<i class="fa fa-map-marker" aria-hidden="true"></i><p id="footeraddress"></p> <!-- Shop 57, Near
						Shri Bhagvati Hotel Puriya Park Road Panchvati Karanje, Nashik,
						Maharashtra 422003. -->
					</div>
					<div class="cont_add">
						<i class="fa fa-phone" aria-hidden="true"></i> <a id="phone1"
							href="javascript:void(0)"></a> <span>/</span><!--(+91) 1234567890  -->
						<a id="phone2" href="javascript:void(0)"></a> <!-- (+91) 9876 543 210 -->
					</div>
					<div class="cont_add">
						<i class="fa fa-envelope" aria-hidden="true"></i> <a id="email1"
							href=""></a> <!-- customercare@monginis.net -->
						<span>/</span> <a id="email2" href="" ></a><!-- mailto:info@monginis.net -->
					</div>



				</div>
			</div>
		</div>
	</div>
	<div class="copyright">&copy; Copyright 2019-20. All Right
		Reserv. Aarya Tech Solutions</div>
</footer>
<script type="text/javascript">
getFooteDtl();
function getFooteDtl() {
$
.getJSON(
		'${getFooterData}',
		{
			ajax : 'true',
		},
		function(data) {

			const faclink = document.querySelector('#faceLink');
			faclink.href = data.facebookLink;
			
			const twtlink = document.querySelector('#twitLink');
			twtlink.href = data.twitterLink;
			
			const linkdlink = document.querySelector('#linkedLink');
			linkdlink.href = data.linkedInLink;
			
			const gglelink = document.querySelector('#googleLink');
			gglelink.href = data.googleAcLink;
			
			document.getElementById("footeraddress").innerHTML = data.footerAddress;
			
			document.getElementById("phone1").innerHTML = '(+91) '+data.footerPhone1;
			document.getElementById("phone2").innerHTML = '(+91) '+data.footerPhone2;
			
			document.getElementById("email1").innerHTML = data.footerEmail1;
			const a = document.querySelector('#email1');
			a.href = 'mailto:'+data.footerEmail1;
						
			document.getElementById("email2").innerHTML = data.footerEmail2;
			const b = 'mailto:'+document.querySelector('#email2');
			b.href = data.footerEmail2; 
			
		});
}		
</script>
