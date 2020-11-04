<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8" />
<title>Monginis</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0" />
<meta name="keywords"
	content="Monginis only uses the finest ingredients in its products, ensuring the goods that we send out into the market" />
<meta name="description"
	content="Monginis only uses the finest ingredients in its products, ensuring the goods that we send out into the market " />
<meta name="author"
	content="Monginis only uses the finest ingredients in its products, ensuring the goods that we send out into the market">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	type="text/css" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/fevicon.png"
	type="images/png" sizes="32x32">

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/lozad/dist/lozad.min.js"></script>

<!--commanJS-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
<!--commanJS-->

<!-- jQuery Popup Overlay -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.popupoverlay.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Hind:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<!--font-family: 'Hind', sans-serif;-->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>


	<section class="search_city">
		<div class="search_container">
			<div class="search_wrapper w3-animate-zoom">
				<h2 class="location_title">Select your Delivery Location</h2>

				<div class="location_padd">
					<div class="current_location">
						<a href="${pageContext.request.contextPath}/viewmap"><img
							src="${pageContext.request.contextPath}/resources/images/location_icn.png"
							alt=""> use Current Location </a>
					</div>
					<div class="location_or">Or</div>

					<div class="location_city">
						<h2 class="serv_city">Serving Cities</h2>
						<ul>
							<li><a href="javascript:void(0)"
								onclick="setCityData('Mumbai')"><img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/city_mumbai.png"
									alt=""> Mumbai</a></li>
							<li><a href="javascript:void(0)"
								onclick="setCityData('Delhi')"><img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/city_delhi.png"
									alt=""> Delhi</a></li>
							<li><a href="javascript:void(0)"
								onclick="setCityData('Hyderabad')"><img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/city_hydrabad.png"
									alt=""> Hyderabad</a></li>
							<li><a href="javascript:void(0)"
								onclick="setCityData('Agra')"><img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/city_agra.png"
									alt=""> Agra</a></li>
							<li><a href="javascript:void(0)"
								onclick="setCityData('Nashik')"><img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/city_nashik.png"
									alt=""> Nashik</a></li>
							<li><a href="javascript:void(0)"
								onclick="setCityData('Goa')"><img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/city_goa.png"
									alt=""> Goa</a></li>
						</ul>
					</div>

					<div class="place_search_row">
						<form action="" method="get">
							<div class="search_one">
								<%-- <div class="dropdown">
									<div class="select">
										<span>Other City</span>
									</div>
									<ul class="dropdown-menu" id="citySel">
										<c:forEach items="${cityList}" var="cityList">
											<li id="city${cityList.cityId}" value="${cityList.cityId}"
												data-cityname="${cityList.cityName}" class="cityclass">${cityList.cityName}</li>
										</c:forEach>
									</ul>
								</div> --%>

								<div
									style="background-color: #FFF; border-radius: 3px; width: 100%;">
									<select id="citySel" name="citySel"
										style="padding: 10px; font-size: 16px; color: #a6a6a6; width: 100%;"
										onchange="getCityName(this.value)">
										<option value="0" id="city0" data-cityname="">select</option>
										<c:forEach items="${cityList}" var="cityList">
											<option value="${cityList.cityId}"
												id="city${cityList.cityId}"
												data-cityname="${cityList.cityName}">${cityList.cityName}</option>
										</c:forEach>

									</select>
								</div>

							</div>

							<div class="search_one" style="display: none;">
								<div
									style="background-color: #FFF; border-radius: 3px; width: 100%;">
									<select id="address" name="address"
										style="padding: 10px; font-size: 16px; color: #a6a6a6; width: 100%;">
										<option value="1">choose your default address 1</option>
										<option value="2">choose your default address 2</option>
										<option value="3">choose your default address 3</option>
									</select>
								</div>
							</div>

							<div class="search_one">
								<div class="search_one_l">
									<input name="txtPlaces" type="text" class="input_search"
										placeholder="Search your Area" id="txtPlaces" /> <i
										class="fa fa-search" aria-hidden="true"></i>
								</div>
								<div class="search_one_r">
									<a href="${pageContext.request.contextPath}/viewmap">Get
										Location</a>
								</div>
								<div class="clr"></div>
							</div>
							<div class="search_one">
								<div
									style="background-color: #FFF; border-radius: 3px; width: 100%;">
									<select id="selectShop" name="selectShop"
										style="padding: 10px; font-size: 16px; color: #a6a6a6; width: 100%;">
										<option value="1">choose your default address 1</option>
										<option value="2">choose your default address 2</option>
										<option value="3">choose your default address 3</option>
									</select>
								</div>
							</div>
						</form>
					</div>

					<div class="place_login">
						If you are existing user <a href="#" class="loginpop_open">Login</a>
					</div>


					<!--apply now pop up-->
					<div id="loginpop" class="well_palace login_pop">
						<div class="mongi_title">
							Login
							<div class="loginpop_close close_pop">
								<i class="fa fa-times" aria-hidden="true"></i>
							</div>
						</div>
						<div class="mongi_cont">
							<form action="" method="get">

								<div class="place_row">
									<div class="login_one">
										<input name="" type="text" class="input_place"
											placeholder="Enter Your Mobile Number" />
									</div>
									<div class="login_one">
										<input name="" type="text" class="input_place"
											placeholder="Enter OTP" /> <span><a href="#"><i
												class="fa fa-refresh" aria-hidden="true"></i> Resend OTP</a></span>
									</div>
									<div class="clr"></div>
								</div>

								<div>
									<a href="home.html"><input name="" type="button"
										value="Login" class="pop_place_btn" /></a>
								</div>

							</form>



						</div>



					</div>
					<script type="text/javascript">
						$(document).ready(function() {
							$('#loginpop').popup();
						});
					</script>



					<div class="select_location" style="display: none;">
						<span><img src="#" class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/current_icn.png"
							alt=""> Currently our services are unavailable at selected
							location.</span>
					</div>

					<div class="proceed_btn_1">
						<a href="home.html"><input name="" type="button"
							value="Proceed" class="proceed" /></a>
					</div>

				</div>



			</div>
		</div>
	</section>

	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&libraries=places"></script>
	<!--menuzord -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("#menuzord").menuzord({
				align : "left"
			});
		});
	</script>
	<!--menuzord-->

	<!--slick slider-->
	<script src="${pageContext.request.contextPath}/resources/js/slick.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {
			$(".lazy").slick({
				lazyLoad : 'ondemand', // ondemand progressive anticipated
				autoplay : true,
				infinite : true
			});

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

			$(".lazy-testimonial").slick({
				lazyLoad : 'ondemand', // ondemand progressive anticipated
				infinite : true,
				autoplay : true,
				dots : true
			});

		});
	</script>


	<!--fixed-header -->
	<script type="text/javascript">
		window.onscroll = function() {
			myFunction()
		};

		var header = document.getElementById("myHeader");
		var sticky = header.offsetTop;

		function myFunction() {
			if (window.pageYOffset > sticky) {
				header.classList.add("sticky");
			} else {
				header.classList.remove("sticky");
			}
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
	</script>



	<script type="text/javascript">
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var lazyloadImages;

							if ("IntersectionObserver" in window) {
								lazyloadImages = document
										.querySelectorAll(".lazy");
								var imageObserver = new IntersectionObserver(
										function(entries, observer) {
											entries
													.forEach(function(entry) {
														if (entry.isIntersecting) {
															var image = entry.target;
															image.src = image.dataset.src;
															image.classList
																	.remove("lazy");
															imageObserver
																	.unobserve(image);
														}
													});
										});

								lazyloadImages.forEach(function(image) {
									imageObserver.observe(image);
								});
							} else {
								var lazyloadThrottleTimeout;
								lazyloadImages = document
										.querySelectorAll(".lazy");

								function lazyload() {
									if (lazyloadThrottleTimeout) {
										clearTimeout(lazyloadThrottleTimeout);
									}

									lazyloadThrottleTimeout = setTimeout(
											function() {
												var scrollTop = window.pageYOffset;
												lazyloadImages
														.forEach(function(img) {
															if (img.offsetTop < (window.innerHeight + scrollTop)) {
																img.src = img.dataset.src;
																img.classList
																		.remove('lazy');
															}
														});
												if (lazyloadImages.length == 0) {
													document
															.removeEventListener(
																	"scroll",
																	lazyload);
													window.removeEventListener(
															"resize", lazyload);
													window
															.removeEventListener(
																	"orientationChange",
																	lazyload);
												}
											}, 20);
								}

								document.addEventListener("scroll", lazyload);
								window.addEventListener("resize", lazyload);
								window.addEventListener("orientationChange",
										lazyload);
							}
						})
	</script>


	<script type="text/javascript">
		$(document).ready(function($) {

			var frData = '${frData}';
			sessionStorage.setItem("frList", frData);
			//console.log(frData)
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

			/* alert(latitude)
			alert(longitude) */
			var bounds = new google.maps.LatLngBounds;

			var origin1 = {
				lat : latitude,
				lng : longitude
			};

			var waypts = [];

			var frList = sessionStorage.getItem("frList");
			var list = $.parseJSON(frList);

			for (var i = 0; i < list.length; i++) {

				if (!isNaN(parseFloat(list[i].shopsLatitude))) {
					var data_add = {
						lat : parseFloat(list[i].shopsLatitude),
						lng : parseFloat(list[i].shopsLogitude)
					}
					waypts.push(data_add);
				}

			}

			//console.log(waypts);

			var geocoder = new google.maps.Geocoder;
			var service = new google.maps.DistanceMatrixService;
			service
					.getDistanceMatrix(
							{
								origins : [ origin1 ],
								destinations : waypts,
								travelMode : 'DRIVING',
								unitSystem : google.maps.UnitSystem.METRIC,
								avoidHighways : false,
								avoidTolls : false
							},
							function(response, status) {

								//alert(JSON.stringify(response))

								if (status !== 'OK') {
									alert('Error was: ' + status);
								} else {
									$('#selectShop').html('');
									var html = '<option value="0" selected>Select Shop</option>';

									var originList = response.originAddresses;
									var destinationList = response.destinationAddresses;

									var results = response.rows[0].elements;
									var newFrList = [];

									for (var j = 0; j < results.length; j++) {

										try {
											var km = (parseFloat((results[j].distance.value) / 1000))
													.toFixed(2);
											list[j].exInt1 = km;
											if (km <= parseFloat(list[j].noOfKmAreaCover)) {
												newFrList.push(list[j]);
											}

										} catch (err) {

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

									sessionStorage.setItem("frList", JSON
											.stringify(newFrList));
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
					/* alert(latitude)
					alert(longitude) */
					calculateDistance(latitude, longitude, 1);

				} catch (err) {

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


</body>

</html>
