<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<style type="text/css">
.ui-autocomplete {
	position: relative;
	z-index: 999999;
}

#txtPlaces, #city, .txtPlaces {
	position: relative;
	z-index: 999999;
}

.pac-container {
	z-index: 999999 !important;
}
</style>
<jsp:include page="/WEB-INF/views/include/customjscss.jsp"></jsp:include>

<style>
</style>

<c:url var="viewmapNew" value="/viewmapNew"></c:url>

<body>

	<div>
		<!-- class="head_marg"-->

		<!--main banner -->
		<div class="main_banner land"
			style="background: url(${pageContext.request.contextPath}/resources/images/franchisee_banner.jpg) no-repeat center bottom; background-size: cover;">
			<div class="landing_cont">
				<div class="landing_button">
					If user login first time or we didn't get any info of user from
					browser cache then user land here <a href="javascript:void(0)"
						class="landingpop_open">Book your online order</a> <input
						type="button" id="openLocPopup" class="landingpop_open"
						value="aaaa" style="display: none;">
				</div>
			</div>
		</div>

	</div>





	<!-- multiple product boxes -->
	<div class="find_store">
		<div class="wrapper">
			<div class="prod_cat_bx">
				<div class="prod_cat_1">
					<div class="cakes_cat_1">
						<a href="javascript:void(0)" class="landingpop_open">
							<div class="img_cap">
								<img
									src="${pageContext.request.contextPath}/resources/images/cakes_1.jpg"
									alt="">
								<div class="prod_cat_cap">
									<span>Cakes</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="prod_cat_2">
					<div class="divid_two">
						<div class="divide_one_pic left">
							<div class="single_pic">
								<a href="javascript:void(0)" class="landingpop_open"> <img
									src="${pageContext.request.contextPath}/resources/images/offers_prod_1.jpg"
									alt="">
									<div class="prod_cat_cap1">
										<span>Pastries</span>
									</div>
								</a>
							</div>
						</div>
						<div class="divide_one_pic right">
							<div class="single_pic">
								<a href="javascript:void(0)" class="landingpop_open"> <img
									src="${pageContext.request.contextPath}/resources/images/offers_prod_2.jpg"
									alt="">
									<div class="prod_cat_cap1">
										<span>Savories</span>
									</div>
								</a>
							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div class="divid_two">
						<div class="divide_one_pic left">
							<div class="single_pic">
								<a href="javascript:void(0)" class="landingpop_open"> <img
									src="${pageContext.request.contextPath}/resources/images/offers_prod_3.jpg"
									alt="">
									<div class="prod_cat_cap1">
										<span>Packaged Cakes</span>
									</div>
								</a>
							</div>
						</div>
						<div class="divide_one_pic right">
							<div class="single_pic">
								<a href="javascript:void(0)" class="landingpop_open"> <img
									src="${pageContext.request.contextPath}/resources/images/offers_prod_4.jpg"
									alt="">
									<div class="prod_cat_cap1">
										<span>Chocolates</span>
									</div>
								</a>
							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div class="single_prod">
						<div class="single_pic">
							<a href="javascript:void(0)" class="landingpop_open"> <img
								src="${pageContext.request.contextPath}/resources/images/offers_prod_5.jpg"
								alt="">
								<div class="prod_cat_cap1">
									<span>Bakersware</span>
								</div>
							</a>

						</div>
					</div>
				</div>
				<div class="prod_cat_3">
					<div class="lst_tow marg_btm divice">
						<div class="single_pic">
							<a href="javascript:void(0)" class="landingpop_open"> <img
								src="${pageContext.request.contextPath}/resources/images/combo_2.jpg"
								alt="">
								<div class="prod_cat_cap1">
									<span>Combo</span>
								</div>
							</a>
						</div>
					</div>
					<div class="lst_tow divice1">
						<div class="single_pic ">
							<a href="javascript:void(0)" class="landingpop_open"> <img
								src="${pageContext.request.contextPath}/resources/images/combo_2.jpg"
								alt="">
								<div class="prod_cat_cap1">
									<span>Combo</span>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="clr"></div>
			</div>
		</div>
	</div>




	<div class="land_franchisee">
		<div class="wrapper">
			<div class="tweets_row">
				<div class="tweets_l">
					<img
						src="${pageContext.request.contextPath}/resources/images/tweets.jpg"
						alt="">
				</div>
				<div class="tweets_r">
					<i class="fa fa-user-circle" aria-hidden="true"></i> New user as a
					Franchisee <a href="#">Connect With Us</a>
				</div>
				<div class="clr"></div>
			</div>
		</div>
	</div>




	<!--testimonial-box-->
	<div class="testimonial_bx">
		<h2 class="sec_title">
			<center>
				Our Testimonials <span>Customer Reviews regarding to our Shop</span>
			</center>
		</h2>

		<div class="wrapper">
			<section class="regular slider">
				<c:forEach items="${testMonialList}" var="testmoni"
					varStatus="count">
					<div>
						<div class="testimonial_one">
							<i class="fa fa-quote-left" aria-hidden="true"></i>
							<p class="testimoial_txt">${testmoni.message}</p>

							<div class="testimonial_nm">
								<img src="${TestimonialImgUrl}${testmoni.photo}" alt="">
								<h2 class="testimonial_date">
									${testmoni.name}
									<!--  <span>Date : date</span> -->
									<!--  <span>Location: location</span> -->
								</h2>
							</div>
						</div>
					</div>
				</c:forEach>

				<%-- <div>
					<div class="testimonial_one">
						<i class="fa fa-quote-left" aria-hidden="true"></i>
						<p class="testimoial_txt">There are many variations of
							passages of Lorem Ipsum available, but the majority have suffered
							alteration in some form, by injected humour, or randomised words
							which don't look even slightly believable. If you are going to
							use a passage of Lorem Ipsum, you need to be sure there isn't
							anything embarrassing hidden.</p>
						<div class="testimonial_nm">
							<img
								src="${pageContext.request.contextPath}/resources/images/testimonial_pic.jpg"
								alt="">
							<h2 class="testimonial_date">
								Sumit Mahshalkar <span>Date : 17-09-2020</span> <span>Location:
									Nashik</span>
							</h2>
						</div>
					</div>
				</div>
				<div>
					<div class="testimonial_one">
						<i class="fa fa-quote-left" aria-hidden="true"></i>
						<p class="testimoial_txt">There are many variations of
							passages of Lorem Ipsum available, but the majority have suffered
							alteration in some form, by injected humour, or randomised words
							which don't look even slightly believable. If you are going to
							use a passage of Lorem Ipsum, you need to be sure there isn't
							anything embarrassing hidden.</p>
						<div class="testimonial_nm">
							<img
								src="${pageContext.request.contextPath}/resources/images/testimonial_pic.jpg"
								alt="">
							<h2 class="testimonial_date">
								Sumit Mahshalkar <span>Date : 17-09-2020</span> <span>Location:
									Nashik</span>
							</h2>
						</div>
					</div>
				</div>
				<div>
					<div class="testimonial_one">
						<i class="fa fa-quote-left" aria-hidden="true"></i>
						<p class="testimoial_txt">There are many variations of
							passages of Lorem Ipsum available, but the majority have suffered
							alteration in some form, by injected humour, or randomised words
							which don't look even slightly believable. If you are going to
							use a passage of Lorem Ipsum, you need to be sure there isn't
							anything embarrassing hidden.</p>
						<div class="testimonial_nm">
							<img
								src="${pageContext.request.contextPath}/resources/images/testimonial_pic.jpg"
								alt="">
							<h2 class="testimonial_date">
								Sumit Mahshalkar <span>Date : 17-09-2020</span> <span>Location:
									Nashik</span>
							</h2>
						</div>
					</div>
				</div> --%>

			</section>
		</div>

	</div>

	<!--find-store-->
	<div class="find_store">
		<div class="wrapper">
			<div class="store_banner"
				style="background: url(${pageContext.request.contextPath}/resources/images/add_banner.jpg) no-repeat center top; background-size: cover;">
				<div class="store_content">
					<div class="visit_cont">
						<div class="experiance_bx">
							<div class="experiance_bor">
								<h2 class="visit_title">Visit &amp; Experience Our Service
									in Your City</h2>
								<a href="#" class="find_btn">Find Stores <i
									class="fa fa-angle-right" aria-hidden="true"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--strip-->
	<div class="type_strip">
		<div class="wrapper">
			<ul class="strip_divid">
				<li>
					<div class="strip_payment">
						<img
							src="${pageContext.request.contextPath}/resources/images/secure_icn.png"
							alt=""> 100% Secure Payments <span>All major credit
							&amp; debit cards accepted</span>
					</div>
				</li>
				<li>
					<div class="strip_payment extra_padd">
						<img
							src="${pageContext.request.contextPath}/resources/images/customer.png"
							alt=""> 3,000,000 <span>Customers across the world</span>
					</div>
				</li>
				<li>
					<div class="strip_payment extra_padd">
						<img
							src="${pageContext.request.contextPath}/resources/images/gifts.png"
							alt=""> 2 Million+ Gift <span>boxes delivered
							worldwide</span>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<!--footer start here-->
	<<%-- footer> <div class="footer_menu"> <div class="wrapper"> <div
	class="menu_bx"> <!--left-certificate--> <div class="certificate_one">
	<h3 class="footer_title">Our Certificate</h3> <img
	src="${pageContext.request.contextPath}/resources/images/iso_certificate.png"
	alt=""> </div> <!--center menu list--> <div class="menu_list"> <h3
	class="footer_title">Main Menu</h3> <ul class="footer_menu_list">
	<li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> About
	Us</a></li> <li><a href="#"><i class="fa fa-check"
	aria-hidden="true"></i> Privacy Policy</a></li> <li><a href="#"><i
	class="fa fa-check" aria-hidden="true"></i> Terms &amp;
	Condition</a></li> <li><a href="#"><i class="fa fa-check"
	aria-hidden="true"></i> Meet Our Team</a></li> <li><a href="#"><i
	class="fa fa-check" aria-hidden="true"></i> Contact Us</a></li>

	<!--<li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> Our
	Moral Responsibility</a></li> <li><a href="#"><i class="fa fa-check"
	aria-hidden="true"></i> Recognition &amp; Awards</a></li> <li><a
	href="#"><i class="fa fa-check" aria-hidden="true"></i>
	Disclaimer</a></li> <li><a href="#"><i class="fa fa-check"
	aria-hidden="true"></i> Monginis Egypt</a></li> <li><a href="#"><i
	class="fa fa-check" aria-hidden="true"></i> Cake Studies</a></li>
	<li><a href="#"><i class="fa fa-check" aria-hidden="true"></i> Delicias
	Foods</a></li> <li><a href="#"><i class="fa fa-check"
	aria-hidden="true"></i> Training Videos</a></li>--> </ul> <div
	class="footer_social"> <ul> <li> Connect with Us : </li> <li><a
	href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
	<li><a href="#"><i class="fa fa-twitter"
	aria-hidden="true"></i></a></li> <li><a href="#"><i class="fa
	fa-linkedin" aria-hidden="true"></i></a></li> <li><a href="#"><i
	class="fa fa-google-plus" aria-hidden="true"></i></a></li> </ul> </div>

	</div> <!--right-contact--> <div class="contact_address"> <h3
	class="footer_title">Contact Us</h3> <div class="cont_add"><i class="fa
	fa-map-marker" aria-hidden="true"></i> Shop 57, Near Shri Bhagvati
	Hotel Puriya Park Road Panchvati Karanje, Nashik, Maharashtra
	422003.</div> <div class="cont_add"><i class="fa fa-phone"
	aria-hidden="true"></i> <a href="callto:(+91) 1234 567 890"> (+91) 1234
	567 890</a> <span>/</span> <a href="callto:(+91) 9876 543 210">(+91)
	9876 543 210</a></div> <div class="cont_add"><i class="fa fa-envelope"
	aria-hidden="true"></i> <a
	href="mailto:customercare@monginis.net">customercare@monginis.net</a>
	<span>/</span> <a
	href="mailto:info@monginis.net">info@monginis.net</a></div> </div>
	</div> </div> </div> <div class="copyright"> &copy; Copyright 2019-20.
	All Right Reserv. Aarya Tech Solutions</div> </footer> --%>
	<jsp:include
	page="/WEB-INF/views/include/bottomMenu.jsp"></jsp:include>


	<!--apply now pop up-->
	<div id="landingpop" class="well_landing">
		<h2 class="location_title">
			Select your Delivery Location
			<div class="landingpop_close close_pop">
				<i class="fa fa-times" aria-hidden="true"></i>
			</div>
		</h2>
		<form id="validation-form"
			action="${pageContext.request.contextPath}/preHome" method="post">
			<div class="location_padd">
				<div class="current_location">
					<a href="javascript:void(0)" onclick="goToMap()"><img
						src="${pageContext.request.contextPath}/resources/images/location_icn.png"
						alt=""> use Current Location </a>
				</div>
				<div class="location_or">Or</div>

				<div class="location_city">
					<h2 class="serv_city">Serving Cities</h2>
					<ul>
						<li><a href="javascript:void(0)"
							onclick="setCityNameToInput('Mumbai')"><img
								src="${pageContext.request.contextPath}/resources/images/city_mumbai.png"
								alt=""> Mumbai</a></li>
						<li><a href="javascript:void(0)"
							onclick="setCityNameToInput('Delhi')"><img
								src="${pageContext.request.contextPath}/resources/images/city_delhi.png"
								alt=""> Delhi</a></li>
						<li><a href="javascript:void(0)"
							onclick="setCityNameToInput('Hyderabad')"><img
								src="${pageContext.request.contextPath}/resources/images/city_hydrabad.png"
								alt=""> Hydrabad</a></li>
						<li><a href="javascript:void(0)"
							onclick="setCityNameToInput('Agra')"><img
								src="${pageContext.request.contextPath}/resources/images/city_agra.png"
								alt=""> Agra</a></li>
						<li><a href="javascript:void(0)"
							onclick="setCityNameToInput('Nashik')"><img
								src="${pageContext.request.contextPath}/resources/images/city_nashik.png"
								alt=""> Nasik</a></li>
						<li><a href="javascript:void(0)"
							onclick="setCityNameToInput('Goa')"><img
								src="${pageContext.request.contextPath}/resources/images/city_goa.png"
								alt=""> Goa</a></li>
					</ul>
				</div>

				<div class="place_search_row">

					<div class="search_one">
						<!--  <div class="dropdown">
                                <div class="select"> <span>Other City</span></div>
                                <input type="hidden" name="gender">
                                <ul class="dropdown-menu">
                                  <li id="male">Aurangabad</li>
                                  <li id="female">Pune</li>
                                    <li id="female">Gandhi Nagar</li>
                                </ul>
                              </div> -->
						<div>
							<select id="citySel" name="citySel"
								style="border-radius: 3px; background: #FFF; padding: 10px; font-size: 16px; color: #a6a6a6; width: 100%;"
								onchange="getCityName(this.value)">
								<option value="0" id="city0" data-cityname="">select</option>
								<c:forEach items="${cityList}" var="cityList">
									<option value="${cityList.cityId}" id="city${cityList.cityId}"
										data-cityname="${cityList.cityName}">${cityList.cityName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="search_one" style="display: none;">
						<div class="search_one_l">
							<input name="" type="text" class="input_search1"
								placeholder="Search your Area" /> <i class="fa fa-search"
								aria-hidden="true"></i>
						</div>
						<div class="search_one_r">
							<a href="get_location.html">Get Location</a>
						</div>
						<div class="clr"></div>
					</div>

					<div class="search_one">
						<div class="search_one_l">
							<input name="txtPlaces" value="Pune Univeristy Building" required
								type="text" class="input_search" placeholder="Search your Area"
								id="txtPlaces" /> <i class="fa fa-search" aria-hidden="true"></i>
						</div>

						<input name="hideLat" value="0" required type="hidden"
							id="hideLat" /> <input name="hideLong" value="0" required
							type="hidden" id="hideLong" />


						<div class="search_one_r">
							<%-- <a href="${pageContext.request.contextPath}/viewmap">Get
								Location</a> --%>


							<a href="javascript:void(0)" onclick="goToMap()">Get Location</a>
						</div>
						<div class="clr"></div>
					</div>


					<!-- <div class="search_one">
                            <div class="dropdown">
                                <div class="select"> <span>Select your nearest franchisee</span></div>
                                <input type="hidden" name="gender">
                                <ul class="dropdown-menu">
                                  <li id="male">Pune</li>
                                  <li id="female">Mumbai</li>
                                    <li id="female">Nashik</li>
                                </ul>
                              </div>
                        </div> -->
					<div class="search_one">
						<div style="width: 100%;">
							<select required id="selectShop" name="selectShop"
								style="background-color: #FFF; border-radius: 3px; padding: 10px; font-size: 16px; color: #a6a6a6; width: 100%;">
								<option selected value="27">FR ID 27</option>
							</select>
						</div>
					</div>

				</div>

				<!--                 <div class="place_login">If you are existing user Login</div>
 -->

				<!--apply now pop up-->

				<div class="select_location" style="display: none;">
					<span><img
						src="${pageContext.request.contextPath}/resources/images/current_icn.png"
						alt=""> Currently our services are unavailable at selected
						location.</span>
				</div>

				<div class="proceed_btn_1">
					<a href="#"><input name="" type="submit" value="Proceed"
						class="proceed" /></a>
				</div>

			</div>
		</form>

	</div>

	<script type="text/javascript">
		$(document).ready(function() {

			var frData = '${frData}';
			//alert(frData)
			sessionStorage.setItem("frList", frData);

			$('#landingpop').popup();
			document.getElementById("openLocPopup").click();

			var lat = sessionStorage.getItem("selLat");
			var lng = sessionStorage.getItem("selLng");
			var addr = sessionStorage.getItem("selAddr");

			document.getElementById("txtPlaces").value = addr;
			sessionStorage.setItem("selLat", "");
			sessionStorage.setItem("selLng", "");
			sessionStorage.setItem("selAddr", "");

			if (lat == "") {
				lat = 0;
			}
			if (lng == "") {
				lng = 0;
			}

			calculateDistance(parseFloat(lat), parseFloat(lng), 2);

		});
		function gotoHome() {
			var form = document.getElementById("validation-form");
			form.action = "home";
			form.submit();
		}
	</script>

	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&libraries=places"></script>









	<!--cart-sidepanel-->
	<script type="text/javascript">
		function openNav() {
			document.getElementById("mySidepanel").style.width = "300px";
		}
		function closeNav() {
			document.getElementById("mySidepanel").style.width = "0";
		}
	</script>

	<!--cart-sidepanel-->
	<script type="text/javascript">
		function openNav2() {
			document.getElementById("mySidepanel2").style.width = "300px";
		}
		function closeNav2() {
			document.getElementById("mySidepanel2").style.width = "0";
		}
	</script>

	<!--main-menu-js-->
	<script>
		function openNav1() {
			document.getElementById("myNav").style.height = "100%";
		}

		function closeNav1() {
			document.getElementById("myNav").style.height = "0%";
		}
	</script>

	<!--menuzord -->
	<!-- <script type="text/javascript" src="js/menuzord.js"></script>
 -->
	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("#menuzord").menuzord({
				align : "left"
			});
		});
	</script>
	<!--menuzord-->
	<!--slick slider-->
	<!-- <script src="js/slick.js" type="text/javascript"></script>
 -->
	<script type="text/javascript">
		$(document).on('ready', function() {

			$(".regular").slick({
				dots : true,
				infinite : true,
				slidesToShow : 3,
				slidesToScroll : 1,
				autoplay : true,
				responsive : [ {
					breakpoint : 1024,
					settings : {
						slidesToShow : 3,
						slidesToScroll : 1,
						infinite : true,
						dots : true
					}
				}, {
					breakpoint : 768,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 1
					}
				}, {
					breakpoint : 480,
					settings : {
						slidesToShow : 1,
						slidesToScroll : 1
					}
				}
				// You can unslick at a given breakpoint now by adding:
				// settings: "unslick"
				// instead of a settings object
				]
			});

			$(".regular-cake").slick({
				dots : true,
				infinite : true,
				slidesToShow : 4,
				slidesToScroll : 1,
				autoplay : true,
				responsive : [ {
					breakpoint : 1024,
					settings : {
						slidesToShow : 3,
						slidesToScroll : 1,
						infinite : true,
						dots : true
					}
				}, {
					breakpoint : 768,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 1
					}
				}, {
					breakpoint : 480,
					settings : {
						slidesToShow : 1,
						slidesToScroll : 1
					}
				}
				// You can unslick at a given breakpoint now by adding:
				// settings: "unslick"
				// instead of a settings object
				]
			});

		});
	</script>

	<script type="text/javascript">
		$(document).ready(function($) {

		});
		$('.cityclass').click(function() {
			//var id = this.value();
			//var id = $(this).val();
			var cityname = $(this).data("cityname");
			$('#txtPlaces').val(cityname + " ");
			document.getElementById("txtPlaces").focus();
		});

		function getCityName(val) {
			var cityname = $("#city" + val).data("cityname");
			$('#txtPlaces').val(cityname + " ");
			document.getElementById("txtPlaces").focus();
		}
		function calculateDistance(latitude, longitude, type) {

			var frData = '${frData}';
			sessionStorage.setItem("frList", frData);

			//alert(latitude)
			//alert(longitude) 

			//alert("Prev ---> "+latitude+"     "+longitude);

			var bounds = new google.maps.LatLngBounds;

			var origin1 = {
				lat : parseFloat(latitude),
				lng : parseFloat(longitude)
			};

			var waypts = [];

			var frList = sessionStorage.getItem("frList");
			var list = $.parseJSON(frList);

			//alert("fr count = "+list.length)

			for (var i = 0; i < list.length; i++) {

				if (!isNaN(parseFloat(list[i].shopsLatitude))) {
					var data_add = {
						lat : parseFloat(list[i].shopsLatitude),
						lng : parseFloat(list[i].shopsLogitude)
					}
					waypts.push(data_add);

					//alert(list[i].frName+"       --> "+parseFloat(list[i].shopsLatitude)+"     "+parseFloat(list[i].shopsLogitude))

				} else {
					var data_add = {
						lat : parseFloat(0),
						lng : parseFloat(0)
					}
					waypts.push(data_add);
				}

			}

			//alert("fr count = "+waypts.length)

			//console.log(waypts);

			var geocoder = new google.maps.Geocoder;
			var service = new google.maps.DistanceMatrixService;
			service
					.getDistanceMatrix(
							{
								origins : [ origin1 ],
								destinations : waypts,
								travelMode : google.maps.TravelMode.DRIVING,
								unitSystem : google.maps.UnitSystem.METRIC,
								avoidHighways : false,
								avoidTolls : false
							},
							function(response, status) {

								//alert(JSON.stringify(response.rows[0].elements))

								if (status !== 'OK') {
									//alert('Error was: ' + status);
								} else {
									$('#selectShop').html('');
									var html = '<option value="0" selected>Select Shop</option>';

									var originList = response.originAddresses;
									var destinationList = response.destinationAddresses;

									var results = response.rows[0].elements;
									var newFrList = [];

									//alert("res count = "+results.length)

									for (var j = 0; j < results.length; j++) {

										try {
											var km = (parseFloat((results[j].distance.value) / 1000))
													.toFixed(2);

											//alert(list[j].frName+"    --->    "+km+"        ---> "+list[j].noOfKmAreaCover + "      latlng --> "+parseFloat(list[j].shopsLatitude)+"   "+parseFloat(list[j].shopsLogitude))

											list[j].exInt1 = km;
											if (km <= parseFloat(list[j].noOfKmAreaCover)) {
												newFrList.push(list[j]);
											}

										} catch (err) {
											//alert("err---")
										}

									}
									sortArray(newFrList, "exInt1");
									for (var j = 0; j < newFrList.length; j++) {

										//alert(newFrList[j].exInt1)
										html += '<option value="' + newFrList[j].frId + '">'
												+ newFrList[j].frName
												+ ' ('
												+ newFrList[j].frCode
												+ ') - '
												+ newFrList[j].frAddress
												+ ' - '
												+ newFrList[j].exInt1
												+ ' KM</option>';

									}

									if (type != 2) {
										sessionStorage.setItem("frList", JSON
												.stringify(newFrList));
									}
									$('#selectShop').html(html);

								}
							});

		}
		google.maps.event.addDomListener(window, 'load', function() {
			var places = new google.maps.places.Autocomplete(document
					.getElementById('txtPlaces'), {
				fields : [ "name", "geometry.location", "place_id",
						"formatted_address" ]
			});
			places.setFields([ "name", "geometry.location", "place_id",
					"formatted_address" ]);
			google.maps.event.addListener(places, 'place_changed', function() {

				var place = places.getPlace();

				//console.log(place);
				try {
					var address = place.formatted_address;
					var latitude = place.geometry.location.lat();
					var longitude = place.geometry.location.lng();
					/*  alert(latitude)
					alert(longitude)  */

					document.getElementById('hideLong').value = longitude;
					document.getElementById('hideLat').value = latitude;

					calculateDistance(latitude, longitude, 1);

				} catch (err) {
					document.getElementById('hideLong').value = 0;
					document.getElementById('hideLat').value = 0;
				}

			});

		});
		function sortArray(array, property, direction) {
			direction = direction || 1;
			array.sort(function compare(a, b) {
				let comparison = 0;
				if (a[property] > b[property]) {
					comparison = 1 * direction;
				} else if (a[property] < b[property]) {
					comparison = -1 * direction;
				}
				return comparison;
			});
			return array; // Chainable
		}
	</script>



	<script type="text/javascript">
		/*Dropdown Menu*/
		$('.dropdown').click(function() {
			$(this).attr('tabindex', 1).focus();
			$(this).toggleClass('active');
			$(this).find('.dropdown-menu').slideToggle(300);
		});
		$('.dropdown').focusout(function() {
			$(this).removeClass('active');
			$(this).find('.dropdown-menu').slideUp(300);
		});
		$('.dropdown .dropdown-menu li').click(
				function() {
					$(this).parents('.dropdown').find('span').text(
							$(this).text());
					$(this).parents('.dropdown').find('input').attr('value',
							$(this).attr('id'));
				});
		/*End Dropdown Menu*/

		$('.dropdown2').click(function() {
			$(this).attr('tabindex', 1).focus();
			$(this).toggleClass('active');
			$(this).find('.dropdown-menu').slideToggle(300);
		});
		$('.dropdown2').focusout(function() {
			$(this).removeClass('active');
			$(this).find('.dropdown-menu').slideUp(300);
		});
		$('.dropdown2 .dropdown-menu li').click(
				function() {
					$(this).parents('.dropdown2').find('span').text(
							$(this).text());
					$(this).parents('.dropdown2').find('input').attr('value',
							$(this).attr('id'));
				});
	</script>


	<script type="text/javascript">
		function goToMap() {

			var lat = document.getElementById("hideLat").value;
			var lng = document.getElementById("hideLong").value;
			//alert(lat+"     "+lng)

			//window.open("${pageContext.request.contextPath}/viewmap/"+lng+"/"+lng1,"_self");

			$.getJSON('${viewmapNew}', {
				lat : lat,
				lng : lng,
				ajax : 'true'
			}, function(data) {
				//alert(JSON.stringify(data));
				window.open("${pageContext.request.contextPath}/viewmap",
						"_self");

			});

		}

		function setCityNameToInput(cityname) {
			$('#txtPlaces').val(cityname + " ");
			document.getElementById("txtPlaces").focus();
		}
	</script>






</body>
</html>