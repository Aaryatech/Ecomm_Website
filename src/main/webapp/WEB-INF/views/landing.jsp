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

.form-label-hint-error-l {
	color: red;
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
					<!-- If user login first time or we didn't get any info of user from
					browser cache then user land here -->
					<a href="javascript:void(0)" class="landingpop_open">Book your
						online order</a> <input type="button" id="openLocPopup"
						class="landingpop_open" value="aaaa" style="display: none;">
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
					<div style="height: 400px; overflow-y: scroll;">
						<a class="twitter-timeline"
							href="https://twitter.com/AtsInfosoft?ref_src=twsrc%5Etfw">Tweets
							by AtsInfosoft</a>
						<script async src="https://platform.twitter.com/widgets.js"
							charset="utf-8"></script>
					</div>

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
	<jsp:include page="/WEB-INF/views/include/bottomMenu.jsp"></jsp:include>
	<!--apply now pop up-->
	<div id="landingpop" class="well_landing">
		<h2 class="location_title">
			Select your Delivery Location
			<div class="landingpop_close close_pop">
				<i class="fa fa-times" aria-hidden="true" id="main_close"></i>
			</div>
		</h2>
		<form id="validation-form"
			action="${pageContext.request.contextPath}/preHome" method="post">

			<input type="hidden" id="user_type" name="user_type"
				value="${userType}" />
			<div class="location_padd">
				<div class="current_location">
					<a href="javascript:void(0)" onclick="goToMap(1)"><img
						src="${pageContext.request.contextPath}/resources/images/location_icn.png"
						alt=""> use Current Location </a>
				</div>
				<div class="location_or extra_txt">OR Select Your Delivery
					Location</div>

				<div class="location_city">
					<h2 class="serv_city">Popular Serving Locations</h2>
					<ul>
						<li>
							<!-- <a href="javascript:void(0)"> --> <img
							src="${pageContext.request.contextPath}/resources/images/city_mumbai.png"
							alt=""> Mumbai<!-- </a> -->
						</li>
						<li>
							<!-- <a href="javascript:void(0)"> --> <img
							src="${pageContext.request.contextPath}/resources/images/city_delhi.png"
							alt=""> Delhi<!-- </a> -->
						</li>
						<li>
							<!-- <a href="javascript:void(0)"> --> <img
							src="${pageContext.request.contextPath}/resources/images/city_hydrabad.png"
							alt=""> Hyderabad<!-- </a> -->
						</li>
						<li>
							<!-- <a href="javascript:void(0)"> --> <img
							src="${pageContext.request.contextPath}/resources/images/city_agra.png"
							alt=""> Agra<!-- </a> -->
						</li>
						<li>
							<!-- <a href="javascript:void(0)"> --> <img
							src="${pageContext.request.contextPath}/resources/images/city_nashik.png"
							alt=""> Nashik<!-- </a> -->
						</li>
						<li>
							<!-- <a href="javascript:void(0)"> --> <img
							src="${pageContext.request.contextPath}/resources/images/city_goa.png"
							alt=""> Goa<!-- </a> -->
						</li>
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
						<div id="showCityDiv">
							<select id="citySel" name="citySel" class="citysel"
								onchange="getCityName(this.value)">
								<option value="0" id="city0" data-cityname="">Select
									City</option>
								<c:forEach items="${cityList}" var="cityList">
									<option value="${cityList.cityId}" id="city${cityList.cityId}"
										data-cityname="${cityList.cityName}">${cityList.cityName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="search_one" style="display: none;">
						<div class="search_one_l">
							<input name="" type="text" class="input_search landing"
								placeholder="Search your Area" /> <i class="fa fa-search"
								aria-hidden="true"></i>
						</div>
						<div class="search_one_r">
							<a href="get_location.html">Get Location</a>
						</div>
						<div class="clr"></div>
					</div>

					<div class="search_one">
						<div class="search_one_l" id="textareaclass">
							<input name="txtPlaces" value="" type="text" required
								class="input_search landing" placeholder="Search your Area"
								id="txtPlaces" /> <i class="fa fa-search" aria-hidden="true"></i>
							<span class="form-label-hint-error-l" id="error_txtPlaces"
								style="display: none;">This field is required.</span>
						</div>

						<input name="hideLat" value="0" required type="hidden"
							id="hideLat" /> <input name="hideLong" value="0" required
							type="hidden" id="hideLong" />


						<div class="search_one_r">
							<%-- <a href="${pageContext.request.contextPath}/viewmap">Get
								Location</a> --%>


							<a href="javascript:void(0)" onclick="goToMap(2)"
								style="display: none;" id="goLocBtn">Get Location</a>
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
					<div class="search_one" style="display: none;" id="showShopDiv">
						<div style="width: 100%;">
							<select onchange="getKM(this)" required id="selectShop"
								name="selectShop" class="citysel">
								<!-- style="background-color: #FFF; border-radius: 3px; padding: 7px; font-size: 16px; color: #a6a6a6; width: 100%;"> -->
							</select> <span class="form-label-hint-error-l" id="error_selectShop"
								style="display: none;">This field is required.</span>
						</div>
					</div>
					<div class="clr"></div>
				</div>




				<!--apply now pop up-->

				<div class="select_location" style="display: none;">
					<span><img
						src="${pageContext.request.contextPath}/resources/images/current_icn.png"
						alt=""> Currently our services are unavailable at selected
						location.</span>
				</div>

				<!-- <div class="search_one">
						<div class="search_one_l">
							<input name="mobNo" value="" maxlength="10" pattern="[7-9]{1}[0-9]{9}" 
								type="text" class="input_search numbersOnly" placeholder="Enter Mobile No"
								id="mobNo" /> <i class="fa fa-mobile" aria-hidden="true"></i>
								<a href="#" onclick="sendOTP()"><i class="fa fa-refresh refresh" title="GET OTP" aria-hidden="true"></i></a>
								<label class="form-label-hint-error-l"
									id="errorMobNo" style="display: none;">Please enter
									Mobile No</label>
						</div>
						<div class="search_one_r">
							<input name="otp" value="" maxlength="8" 
								type="text" class="input_search numbersOnly" placeholder="Enter OTP"
								id="otp" /> <i class="fa fa-key" onclick="checkValidOTP()" aria-hidden="true"></i>
								<label class="form-label-hint-error-l"
									id="errorotp" style="display: none;">Please enter
									OTP</label>
						</div>
						
						<div class="clr"></div>
				

			</div> -->
				<div id="addNewAddDiv" style="display: none;">
					<div class="proceed_btn_1">
						<input name="" id="addNewAddDiv_btn" type="button"
							value="Proceed with Address" class="proceed" />
					</div>
				</div>


				<div id="addAddDiv" style="display: none;">
					<div class="proceed_btn_1">
						<input name="" id="submtbtn" type="button"
							value="Proceed New User" class="landingpop-mobno_open proceed" />

						<span id="resetBtnDiv" style="display: none;"> <input
							name="" id="resetbtn" type="button" value="RESET"
							class="landingpop-mobno_open proceed" onclick="resetPage()" />
						</span>


					</div>

					<div class="location_or spc">OR</div>
					<div class="location_if">If you are exisiting user</div>

					<div>
						<center>
							<input name="" id="submtbtn_ex_use" type="button"
								value="Login Existing User"
								class="landingpop-mobno_open proceed" />
						</center>
					</div>


					<input type="hidden" id="frKm" name="frKm" value="0" />
				</div>
			</div>
		</form>

	</div>

	<!--   New Popup -->
	<div id="landingpop-mobno" class="well_landing mobile"
		style="display: none;">
		<h2 class="location_title">
			Enter Your Details
			<div class="landingpop-mobno_close close_pop">
				<i class="fa fa-times" id="sub_close" aria-hidden="true"></i>
			</div>
			<h3 style="color: red; display: none" id="no_user_exist">Mobile
				number not found in system please proceed as new user!!</h3>
		</h2>

		<form>
			<div class="location_padd extra">
				<div class="search_one">
					<div class="search_one_l">
						<span class="pop_spn">Mobile Number</span> <input name="mobNo"
							value="" maxlength="10" pattern="[7-9]{1}[0-9]{9}" type="text"
							class="input_search landing numbersOnly" autocomplete="off"
							placeholder="Enter Mobile No" id="mobNo" /> <i
							class="fa fa-mobile" aria-hidden="true"></i>
						<!-- <a href="#" onclick="sendOTP()"><i class="fa fa-refresh refresh" title="GET OTP" aria-hidden="true"></i></a> -->
						<label class="form-label-hint-error-l" id="errorMobNo"
							style="display: none;">Please enter Mobile No</label>
					</div>
					<div class="search_one_r">
						<input name="" id="sendOtpBtn" type="button" value="Send OTP"
							onclick="sendOTP()" class="proceed last" />
					</div>
					<div class="clr"></div>
				</div>
				<div id="otp_div" style="display: none;">
					<div class="search_one new_marg">
						<div class="search_one_l">
							<span class="pop_spn">Enter OTP</span> <input name="otp" value=""
								maxlength="8" type="text"
								class="input_search landing numbersOnly" autocomplete="off"
								placeholder="Enter OTP" id="otp" /> <i class="fa fa-key"
								onclick="checkValidOTP()" aria-hidden="true"></i> <label
								class="form-label-hint-error-l" id="errorotp"
								style="display: none;">Please enter valid OTP</label>
						</div>
						<div class="search_one_r">
							<input name="" type="button" value="Resend otp"
								onclick="sendOTP()" class="proceed last" />
						</div>
						<div class="clr"></div>
					</div>
				</div>
				<div class="search-one twobtn">
					<input name="" id="main_submit" style="display: none;"
						type="button" value="Submit" class="proceed" />
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							//$('#landingpop-mobno').hide();
							var isAddNewAdd = '${isAddNewAdd}';
							if (parseInt(isAddNewAdd) == 1) {
								document.getElementById("addAddDiv").style = "display:none";
								document.getElementById("addNewAddDiv").style = "display:block";
							} else {
								document.getElementById("addAddDiv").style = "display:block";
								document.getElementById("addNewAddDiv").style = "display:none";
							}
						});

		jQuery('.numbersOnly').keyup(
				function() {
					this.value = this.value.replace(/[^0-9\.]/g, '');
					this.value = this.value.replace(/[^0-9.]/g, '').replace(
							/(\..*)\./g, '$1');
				});
		var enteredOTP = "";
		var currentOTP = "";
		function sendOTP() {
			document.getElementById("sendOtpBtn").style = "display:block";
			//document.getElementById("sendOtpBtn").style="display:none";
			$("#main_submit").show();
			$('#no_user_exist').hide();
			document.getElementById("mobNo").readOnly = false;
			document.getElementById("otp_div").style = "display:none";
			var mobNo = document.getElementById("mobNo").value;
			mobNo = mobNo.trim();
			enteredOTP = "";
			$("#errorMobNo").hide();
			if (mobNo.length == 10) {
				var fd = new FormData();
				fd.append('mobNo', mobNo);
				$
						.ajax({
							url : '${pageContext.request.contextPath}/sendOTP',
							type : 'POST',
							data : fd,
							dataType : 'json',
							processData : false,
							contentType : false,
							async : false,
							success : function(resData, textStatus, jqXHR) {
								currentOTP = resData.msg;
								//console.log('rrr: ' + JSON.stringify(jqXHR));
								document.getElementById("mobNo").readOnly = true;
								//document.getElementById("sendOtpBtn").style="display:block";
								document.getElementById("sendOtpBtn").style = "display:none";
								document.getElementById("otp_div").style = "display:block";
							},
							error : function(jqXHR, textStatus, errorThrown) {
								console.log('ERRORS: ' + textStatus);
							}
						});
			} else {
				$("#errorMobNo").show();
			}
		}
		function checkValidOTP() {
			//alert("checkValidOTP");
			$("#errorotp").hide();
			$("#errorMobNo").hide();
			var mobNo = document.getElementById("mobNo").value;
			mobNo = mobNo.trim();
			if (mobNo.length < 10) {
				$("#errorMobNo").show();
			} else {
				$("#errorMobNo").hide();
			}

			var otp = document.getElementById("otp").value;
			otp = otp.trim();
			if (parseInt(otp) == parseInt(currentOTP)) {
				$("#errorotp").hide();
				return false;
			} else {
				$("#errorotp").show();
				return true;
			}
			return true;
		}

		//New User Proceed
		$("#submtbtn").click(function(e) {
			////$('#landingpop-mobno').popup();	
			$('#landingpop-mobno').hide();
			document.getElementById("sendOtpBtn").style = "display:block";
			// document.getElementById('landingpop-mobno').style.display = 'none';
			// $('#landingpop-mobno').hide()
			// var popup = $("#landingpop-mobno");
			// popup.hide();
			var isError = false;
			var errMsg = "";
			enteredOTP = "";
			currentOTP = "";
			$("#errorMobNo").hide();
			$("#errorotp").hide();
			$("#error_selectShop").hide();
			$("#error_txtPlaces").hide();
			$("#main_submit").hide();
			$('#no_user_exist').hide();
			document.getElementById("mobNo").readOnly = false;

			document.getElementById("otp_div").style = "display:none";
			if (!$("#selectShop").val()) {
				isError = true;
				$("#error_selectShop").show()
			} else if ($("#selectShop").val() < 1) {
				isError = true;
				$("#error_selectShop").show();
			} else {
				$("#error_selectShop").hide()
			}

			if (!$("#txtPlaces").val()) {
				isError = true;
				$("#error_txtPlaces").show()
			} else {
				$("#error_txtPlaces").hide()
			}
			//alert(isError);
			if (isError == false) {
				document.getElementById("mobNo").value = "";
				document.getElementById("otp").value = "";
				$('#landingpop-mobno').show();
				$('#landingpop-mobno').popup();
				//$('#landingpop-mobno').show();
				document.getElementById("main_close").click();
				document.getElementById("user_type").value = 1;
			} else {
				//$('#landingpop-mobno').style="display:block";
				//document.getElementById("sub_close").click();
				//alert("else Ki")
			}
			//$('#landingpop').hide();
		});

		//Existing user login
		$("#submtbtn_ex_use").click(function(e) {
			enteredOTP = "";
			currentOTP = "";
			$("#errorMobNo").hide();
			$("#errorotp").hide();
			$("#main_submit").hide();
			document.getElementById("mobNo").readOnly = false;
			document.getElementById("sendOtpBtn").style = "display:block";

			$('#no_user_exist').hide();

			document.getElementById("otp_div").style = "display:none";
			document.getElementById("user_type").value = 2;
			document.getElementById("mobNo").value = "";
			document.getElementById("otp").value = "";
			$('#landingpop-mobno').show();
			$('#landingpop-mobno').popup();
			// $('#landingpop-mobno').show();
			document.getElementById("main_close").click();
		});

		//after coming from as Add New Address
		$("#addNewAddDiv_btn")
				.click(
						function(e) {
							var dataError = false;
							if (!$("#selectShop").val()) {
								dataError = true;
								$("#error_selectShop").show()
							} else if ($("#selectShop").val() < 1) {
								dataError = true;
								$("#error_selectShop").show();
							} else {
								$("#error_selectShop").hide()
							}
							if (!$("#txtPlaces").val()) {
								dataError = true;
								$("#error_txtPlaces").show()
							} else {
								$("#error_txtPlaces").hide()
							}
							if (dataError == false) {
								var userType = document
										.getElementById("user_type").value;

								var fd = new FormData();
								fd.append('selectShop', $("#selectShop").val());
								fd.append('txtPlaces', $("#txtPlaces").val());
								fd.append('frKm', $("#frKm").val());
								fd.append('selectShop', $("#selectShop").val());
								fd.append('user_type', userType);

								$
										.ajax({
											url : '${pageContext.request.contextPath}/preHome',
											type : 'POST',
											data : fd,
											dataType : 'json',
											processData : false,
											contentType : false,
											async : false,
											success : function(resData,
													textStatus, jqXHR) {
												isReload = true;
												var url = "";
												if (parseInt(resData) == 1
														|| parseInt(resData) == 3) {
													url = '${pageContext.request.contextPath}/home';
												} else if (parseInt(resData) == 0) {
													//alert("Ok Here 731")
													$('#landingpop-mobno')
															.show();
													$('#landingpop-mobno')
															.popup();
													$('#no_user_exist').show();
													isReload = false;
												} else {
													url = '${pageContext.request.contextPath}/addresslist';
												}
												if (isReload) {
													window.location = url;
												}
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												console.log('km', jqXHR);
											}
										});
							}
						});//end of function
		//old
		$("#main_submit")
				.click(
						function(e) {
							var allError = false;
							var isError = false;
							var isError1 = false;

							var otpError = false;
							var dataError = false;
							$('#no_user_exist').hide();
							var userType = document.getElementById("user_type").value;
							//alert("userType" +userType);
							var isOtpMached = checkValidOTP();
							//alert("isOtpMached "+isOtpMached);
							if (isOtpMached == false) {

								isError = false;
								isError1 = false;
								otpError = false;
							} else {
								otpError = true;
								isError = true;
								isError1 = true;
							}
							document.getElementById("mobNo").readOnly = false;
							if (parseInt(userType) == 1) {
								dataError = false;
								var errMsg = "";
								if (!$("#selectShop").val()) {
									isError1 = true;
									dataError = true;
									$("#error_selectShop").show()
								} else if ($("#selectShop").val() < 1) {
									isError1 = true;
									dataError = true;
									$("#error_selectShop").show();
								} else {
									$("#error_selectShop").hide()
								}

								if (!$("#txtPlaces").val()) {
									isError1 = true;
									dataError = true;
									$("#error_txtPlaces").show()
								} else {
									$("#error_txtPlaces").hide()
								}
							}//end of if user Type==1
							//alert("A" +isError)
							if (otpError == false) {
								//alert("Error False 663");
							} else {
								//alert("I am  709")
								$('#landingpop-mobno').popup();
							}
							//alert("isError1" +isError1)
							if (isError1 == false) {
								allError = false;
								//alert("LL715")
								//document.getElementById("sub_close").click();
							} else {
								//alert("final")
								allError = true;
								//
							}
							//alert("allError" +allError)
							if (otpError == false && dataError == false) {
								//alert("In x 680")
								//document.getElementById("sub_close").click();
								var fd = new FormData();
								fd.append('selectShop', $("#selectShop").val());
								fd.append('txtPlaces', $("#txtPlaces").val());
								fd.append('frKm', $("#frKm").val());
								fd.append('selectShop', $("#selectShop").val());
								fd.append('user_type', userType);
								fd.append('mobNo', $("#mobNo").val());
								fd.append('otp', $("#otp").val());
								//console.log("fd ",JSON.stringify(fd));
								$
										.ajax({
											url : '${pageContext.request.contextPath}/preHome',
											type : 'POST',
											data : fd,
											dataType : 'json',
											processData : false,
											contentType : false,
											async : false,
											success : function(resData,
													textStatus, jqXHR) {
												//alert(resData);
												isReload = true;
												var url = "";
												if (parseInt(resData) == 1
														|| parseInt(resData) == 3) {
													url = '${pageContext.request.contextPath}/home';
												} else if (parseInt(resData) == 0) {
													//alert("Ok Here 731")
													$('#landingpop-mobno')
															.show();
													$('#landingpop-mobno')
															.popup();
													$('#no_user_exist').show();
													isReload = false;
												} else {
													url = '${pageContext.request.contextPath}/addresslist';
												}
												if (isReload) {
													//alert("Okkk")
													window.location = url;
												}

											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												//alert("JJJ")
												console.log('km', jqXHR);
											}
										});
							} else {
								//alert("final else")
								//$('#landingpop-mobno').popup();
								$('#landingpop-mobno').show();
							}

						});
		function getKM(thisobj) {
			/* 	var plant = document.getElementById('selectShop');
				var fruitCount = plant.getAttribute('data-km'); // fruitCount = '12'
				alert(fruitCount); */

			var totalDistance = $(thisobj).find(':selected').attr('data-km');
			//alert(totalDistance);
			document.getElementById('frKm').value = totalDistance;
		}
		$(document).ready(
				function() {

					var frData = '${frData}';
					//alert(frData)
					sessionStorage.setItem("frList", frData);

					$('#landingpop').popup();
					document.getElementById("openLocPopup").click();

					var lat = sessionStorage.getItem("selLat");
					var lng = sessionStorage.getItem("selLng");
					var addr = sessionStorage.getItem("selAddr");
					var divertBtn = sessionStorage.getItem("divertBtn");

					if (divertBtn == null) {
						sessionStorage.setItem("divertBtn", "0");
					}

					divertBtn = sessionStorage.getItem("divertBtn");

					if (divertBtn == 0) {
						$("#goLocBtn").show();
					} else {
						$("#goLocBtn").hide();
						document.getElementById("textareaclass").classList
								.remove('search_one_l');
					}

					if (addr != null && addr != "") {

						$("#showCityDiv").hide();
						$("#resetBtnDiv").show();
						document.getElementById("txtPlaces").readOnly = true;

						//document.getElementById("txtPlaces").setAttribute("readonly", true);
						//$('#citySel').prop('disabled', true);
					}
					document.getElementById("txtPlaces").value = addr;
					sessionStorage.setItem("selLat", "");
					sessionStorage.setItem("selLng", "");
					sessionStorage.setItem("selAddr", "");
					sessionStorage.setItem("divertBtn", "0");

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
		function resetPage() {

			window.open('${pageContext.request.contextPath}/', '_self');
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
			document.getElementById("txtPlaces").removeAttribute("readonly");
			$('#citySel').prop('disabled', false);
		});

		function getCityName(val) {
			var cityname = $("#city" + val).data("cityname");
			document.getElementById("txtPlaces").removeAttribute("readonly");

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

									if (longitude != 0 && latitude != 0) {
										$('#showShopDiv').show();
									}

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
											/* if(list[j].frId==13){
												alert(list[j].exInt1);
											} */
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
										html += '<option data-km="'+newFrList[j].exInt1+'" value="' + newFrList[j].frId + '">Monginis Cake Shop - '
												+ newFrList[j].city
												+ ' </option>';

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
		function goToMap(value) {

			if (value == 1) {
				sessionStorage.setItem("divertBtn", "1");
			} else {
				sessionStorage.setItem("divertBtn", "0");
			}

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
			document.getElementById("txtPlaces").removeAttribute("readonly");
			$('#citySel').prop('disabled', false);
		}
	</script>






</body>
</html>