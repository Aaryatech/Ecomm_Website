<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<body>
	<c:url value="/validateCustEmail" var="validateCustEmail"></c:url>
	<c:url value="/validateCustMob" var="validateCustMob"></c:url>

	<!--mongi help-popup-->
	<div class="mongi_help">
		<a href="#mongi" class="initialism mongi_open"><img
			src="${pageContext.request.contextPath}/resources/images/mongi_help.png"
			alt=""></a>
	</div>

	<!--apply now pop up-->
	<div id="mongi" class="well">
		<div class="mongi_title">
			<span><a href="#"> Clear</a></span> Select Our Best Filter
			<div class="mongi_close close_pop">
				<i class="fa fa-times" aria-hidden="true"></i>
			</div>
		</div>
		<div class="mongi_cont">
			<ul class="ks-cboxtags">
				<li><input type="checkbox" id="checkboxOne"><label
					for="checkboxOne">Chocolate Cakes</label></li>
				<li><input type="checkbox" id="checkboxtwo"><label
					for="checkboxtwo">Exotic Cakes</label></li>
				<li><input type="checkbox" id="checkboxthree"><label
					for="checkboxthree">Black Forest Cakes</label></li>
				<li><input type="checkbox" id="checkboxfour"><label
					for="checkboxfour">Designer Cakes</label></li>
				<li><input type="checkbox" id="checkboxfive"><label
					for="checkboxfive">Derpy Hooves</label></li>
				<li><input type="checkbox" id="checkboxsix"><label
					for="checkboxsix">Party Celebration Cakes</label></li>
				<li><input type="checkbox" id="checkboxseven"><label
					for="checkboxseven">Wedding Cakes</label></li>
				<li><input type="checkbox" id="checkboxeight"><label
					for="checkboxeight">Photo Cakes</label></li>
				<li><input type="checkbox" id="checkboxnine"><label
					for="checkboxnine">Cakes For Kids</label></li>
				<li><input type="checkbox" id="checkboxten"><label
					for="checkboxten">Medley</label></li>
				<li><input type="checkbox" id="checkboxeleven"><label
					for="checkboxeleven">Party Celebration Cakes</label></li>

				<li><input type="checkbox" id="checkboxtwel"><label
					for="checkboxtwel">Pizza</label></li>
				<li><input type="checkbox" id="checkboxthirteen" checked><label
					for="checkboxthirteen">Sandwich</label></li>
				<li><input type="checkbox" id="checkboxfourteen"><label
					for="checkboxfourteen">Fish</label></li>
				<li><input type="checkbox" id="checkboxfifteen"><label
					for="checkboxfifteen">Desert</label></li>
				<li><input type="checkbox" id="checkboxsixteen"><label
					for="checkboxsixteen">Salad</label></li>
				<li><input type="checkbox" id="checkboxseventeen"><label
					for="checkboxseventeen">Italian</label></li>
				<li><input type="checkbox" id="checkboxeighteen"><label
					for="checkboxeighteen">Indian</label></li>
				<li><input type="checkbox" id="checkboxninteen"><label
					for="checkboxninteen">Derpy Hooves</label></li>
				<li><input type="checkbox" id="checkboxtwenteen"><label
					for="checkboxtwenteen">Princess Celestia</label></li>
				<li><input type="checkbox" id="checkboxtwenone"><label
					for="checkboxtwenone">Gusty</label></li>
				<li><input type="checkbox" id="checkboxtwentwo"><label
					for="checkboxtwentwo">Discord</label></li>
				<li><input type="checkbox" id="checkboxtewnthree"><label
					for="checkboxtewnthree">Clover</label></li>
				<li><input type="checkbox" id="checkboxTwenfour"><label
					for="checkboxTwenfour">Baby Moondancer</label></li>
				<li><input type="checkbox" id="checkboxtwenfive"><label
					for="checkboxtwenfive">Medley</label></li>
				<li><input type="checkbox" id="checkboxtwensix"><label
					for="checkboxtwensix">Firefly</label></li>
				<li><input type="checkbox" id="checkboxtwenseven"><label
					for="checkboxtwenseven">Princess Celestia</label></li>
				<li><input type="checkbox" id="checkboxtweneight"><label
					for="checkboxtweneight">Gusty</label></li>
				<li><input type="checkbox" id="checkboxtwennine"><label
					for="checkboxtwennine">Discord</label></li>
				<li><input type="checkbox" id="checkboxthirtee"><label
					for="checkboxthirtee">Clover</label></li>
				<li><input type="checkbox" id="checkboxthirteeone"><label
					for="checkboxthirteeone">Baby Moondancer</label></li>
			</ul>



		</div>

		<div class="proceend_bnt">
			<a href="product.html" class="proceed_btn">Proceed</a>
		</div>

	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#mongi').popup();
		});
	</script>


	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>


	<div class="head_marg">
		<!--product listing-->
		<div class="find_store profile_bg">
			<div class="wrapper">

				<form action="${pageContext.request.contextPath}/addCustomer"
					method="post" id="submitInsert" enctype="multipart/form-data">
					<div class="profile_bx">
						<div class="profile_l">
							<div class="profile_picture">
								<img id="output" src="" alt="">
								<!-- src="${pageContext.request.contextPath}${profileImg}" -->
							</div>

							<div class="upload-btn-wrapper">
								<button class="btn">
									Upload a file <i class="fa fa-camera" aria-hidden="true"></i>
								</button>
								<input type="file" name="doc" id="doc" accept="image/*"
									accept=".jpg,.png,.gif,.jpeg,.bmp" onchange="loadFile(event)" />
							</div>

							<!-- <div class="register_date">
								Registerd Date <span>01 . Oct . 2020</span>
							</div> -->

						</div>
						<div class="profile_r">
							<h2 class="profile_title">New User</h2>
							<div class="profile_cont">

								<div class="place_row">
									<div class="place_row_l">
										<label class="form-label-hint">Billing Name</label> <input
											type="text" class="input_two" maxlength="180"
											id="txtBillName" name="txtBillName"
											placeholder="Billing Name" /> <label
											class="form-label-hint-error" id="errorBillName"
											style="display: none;">please enter billing name</label>
									</div>

									<div class="place_row_r">
										<label class="form-label-hint">Enter Your City</label>
										<div class="select-style">
											<select id="city" name="city">
												<c:forEach items="${cityList}" var="city">
													<option value="${city.cityId}">${city.cityName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="clr"></div>
								</div>

								<div class="place_row">
									<!--input_place-->
									<div class="place_row_l">
										<label class="form-label-hint">Email ID</label> <input
											type="text" class="input_two" id="txtEmail" name="txtEmail"
											placeholder="Email ID" /> <label
											class="form-label-hint-error" id="errorEmail"
											style="display: none;">please enter email id</label> <label
											class="form-label-hint-error" id="errorEmailInvalid"
											style="display: none;">invalid email id</label>
											 <label
											class="form-label-hint-error" id="unq_email"
											style="display: none;">This email id is already exist</label>

									</div>
									<div class="place_row_r">
										<label class="form-label-hint">Mobile Number</label> <input
											type="text" class="input_two" id="txtMobile" maxlength="10"
											oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
											name="txtMobile" placeholder="Mobile Number" /> <label
											class="form-label-hint-error" id="errorMobile"
											style="display: none;">please enter mobile number</label> <label
											class="form-label-hint-error" id="errorMobileInvalid"
											style="display: none;">invalid mobile number</label>
											<label
											class="form-label-hint-error" id="unq_mob"
											style="display: none;">This mobile No. is already
											exist</label>
									</div>
									<div class="clr"></div>
								</div>

								<div class="place_row">
									<label class="form-label-hint" style="display: block;">Gender</label>
									<div class="radio_1 one_row gender">
										<ul>
											<li><input type="radio" id="a-option" name="gender"
												value="1"> <label for="a-option">Male</label>
												<div class="check"></div></li>

											<li><input type="radio" id="b-option" name="gender"
												value="2"> <label for="b-option">Female</label>
												<div class="check">
													<div class="inside"></div>
												</div></li>

											<li><input type="radio" id="c-option" name="gender"
												value="3"> <label for="c-option">Other</label>
												<div class="check">
													<div class="inside"></div>
												</div></li>
										</ul>
										<label
											class="form-label-hint-error" id="errorGender"
											style="display: none;">please select gender</label>
									</div>
								</div>

								<div class="place_row">
									<div class="place_row_r">
										<div class="gender_r"></div>
									</div>
									<div class="clr"></div>
								</div>

								<div class="place_row">
									<div class="place_row_l">
										<label class="form-label-hint">Date of Birth</label> <input
											type="text" class="input_two" id="txtDob" name="txtDob"
											placeholder="Date of Birth" /> <label
											class="form-label-hint-error" id="errorDob"
											style="display: none;">please enter date of birth</label>
									</div>
									<div class="place_row_r">
										<label class="form-label-hint">GST Number</label> <input
											style="text-transform: uppercase;" type="text"
											class="input_two" id="txtGst" name="txtGst" maxlength="15"
											placeholder="GST Number" /> <label
											class="form-label-hint-error" id="errorGst"
											style="display: none;">invalid GST number</label>
									</div>
									<div class="clr"></div>
								</div>

								<div class="place_row">
									<div class="place_row_l">
										<h3 class="payment_title">Billing Address</h3>
									</div>
									<div class="place_row_r"></div>
									<div class="clr"></div>
								</div>

								<div class="place_row">
									<div class="place_row_l">

										<label class="form-label-hint">Flat, House no.,
											Building, Company, Apartment</label> <input type="text"
											class="input_two" id="txtFlat" name="txtFlat"
											placeholder="Flat, House no., Building, Company, Apartment" />

										<label class="form-label-hint-error" id="errorFlat"
											style="display: none;">please enter Flat, House No.</label>

									</div>
									<div class="place_row_r">


										<label class="form-label-hint">Area, Colony, Street,
											Sector, Village</label> <input type="text" class="input_two"
											id="txtArea" name="txtArea"
											placeholder="Area, Colony, Street, Sector, Village" /> <label
											class="form-label-hint-error" id="errorArea"
											style="display: none;">please enter area</label>


									</div>
									<div class="clr"></div>
								</div>



								<div class="place_row">
									<div class="place_row_l">

										<label class="form-label-hint">Landmark</label> <input
											type="text" class="input_two" id="txtLandmark"
											name="txtLandmark" placeholder="Landmark" /> <label
											class="form-label-hint-error" id="errorLandmark"
											style="display: none;">please enter landmark</label>


									</div>
									<div class="place_row_r">


										<label class="form-label-hint">Pincode</label> <input
											type="text" class="input_two" id="txtPincode"
											name="txtPincode" placeholder="Pincode" /> <label
											class="form-label-hint-error" id="errorPincode"
											style="display: none;">please enter pincode</label>

									</div>
									<div class="clr"></div>
								</div>

								<div class="place_row">
									<input name="" type="submit" value="Save Profile"
										class="pop_place_btn" />
								</div>


							</div>
						</div>
						<div class="clr"></div>
					</div>
				</form>
				<!--  -->

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

	<!-- bottom -->
	<jsp:include page="/WEB-INF/views/include/bottomMenu.jsp"></jsp:include>


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
	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("#menuzord").menuzord({
				align : "left"
			});
		});
	</script>
	<!--menuzord-->



	<!--slick slider-->




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
		$(document)
				.ready(
						function($) {

							$("#submitInsert")
									.submit(
											function(e) {
												var isError = false;
												var errMsg = "";

												if (!$("#txtBillName").val()
														.trim()) {
													isError = true;
													$("#errorBillName").show();
												} else {
													$("#errorBillName").hide();
												}

												if (!$("#txtMobile").val()
														.trim()) {
													$("#unq_mob").hide();
													isError = true;
													$("#errorMobile").show();
												} else if ($("#txtMobile")
														.val().trim().length != 10) {
													isError = true;
													$("#errorMobile").hide();
													$("#errorMobileInvalid")
															.show();
												} else {
													$("#errorMobile").hide();
													$("#errorMobileInvalid")
															.hide();
												}

												if (!$("#txtEmail").val()
														.trim()) {
													$("#unq_email").hide();
													isError = true;
													$("#errorEmail").show();
												} else if (!ValidateEmail($(
														"#txtEmail").val()
														.trim())) {
													isError = true;
													$("#errorEmailInvalid")
															.show();
													$("#errorEmail").hide();
												} else {
													$("#errorEmailInvalid")
															.hide();
													$("#errorEmail").hide();
												}

												if (!$("#txtGst").val().trim()
														|| checkGST($("#txtGst")
																.val().trim()) == false) {
													isError = true;
													$("#errorGst").show();
												} else {
													$("#errorGst").hide();
												}

												if (!$("#txtFlat").val().trim()) {
													isError = true;
													$("#errorFlat").show();
												} else {
													$("#errorFlat").hide();
												}

												if (!$("#txtArea").val().trim()) {
													isError = true;
													$("#errorArea").show();
												} else {
													$("#errorArea").hide();
												}

												if (!$("#txtLandmark").val()
														.trim()) {
													isError = true;
													$("#errorLandmark").show();
												} else {
													$("#errorLandmark").hide();
												}

												if (!$("#txtPincode").val()
														.trim()) {
													isError = true;
													$("#errorPincode").show();
												} else {
													$("#errorPincode").hide();
												}
												
												var checked_gender = document.querySelector('input[name = "gender"]:checked');
												if(checked_gender != null) {
													$("#errorGender").hide();
												}else{
													isError = true;
													$("#errorGender").show();
												}

												if (!isError) {

													var r = confirm("Are you sure you want to Submit?");
													if (r == true) {
														form.submit();
													} else {

													}
													/* bootbox
															.confirm({
																title : 'Confirm ',
																message : 'Are you sure you want to Submit?',
																buttons : {
																	confirm : {
																		label : 'Yes',
																		className : 'btn-success'
																	},
																	cancel : {
																		label : 'Cancel',
																		className : 'btn-danger'
																	}
																},
																callback : function(
																		result) {
																	if (result) {
																		$(".btn").attr("disabled", true);
																		var form = document
																				.getElementById("submitInsert")
																		form
																				.submit();
																	}
																}
															}); */
													//end ajax send this to php page
													return false;
												}//end of if !isError

												return false;

											});
						});

		function ValidateEmail(email) {
			var eml = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
			if (eml.test($.trim(email)) == false) {
				return false;
			}
			return true;
		}

		function checkGST(g) {

			var gstinformat = new RegExp(
					'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');
			if (gstinformat.test(g)) {
				return true;
			} else {
				return false;
			}
		}

		$('#txtDob').datetimepicker({
			//yearOffset:222,
			lang : 'en',
			timepicker : false,
			format : 'd-m-Y',
			formatDate : 'Y-m-d',
		//minDate:'-1970/01/02', // yesterday is minimum date
		//maxDate:'+1970/01/02' // and tommorow is maximum date calendar
		});

		var loadFile = function(event) {
			document.getElementById('output').style.display = "none";
			try {
				var image = document.getElementById('output');
				image.src = URL.createObjectURL(event.target.files[0]);
				document.getElementById('output').style = "display:block"
			} catch (err) {
				console.log(err);
			}
		};

		/* $('.maxlength-badge-position').maxlength({
		    alwaysShow: true,
		    placement: 'top'
		}); */
		
		$("#txtMobile").change(function() {
			var mobNo = $("#txtMobile").val();
			//alert(mobNo)
			$.getJSON('${validateCustMob}', {
				mobNo : mobNo,
				ajax : 'true',
			}, function(data) {

				if (data.error == false) {
					$("#unq_mob").show();
					$("#txtMobile").val('');
					document.getElementById("txtMobile").focus();
				} else {
					$("#unq_mob").hide();
				}
			});
		});

		$("#txtEmail").change(function() {
			var email = $("#txtEmail").val();
			//alert(email)

			$.getJSON('${validateCustEmail}', {
				email : email,
				ajax : 'true',
			}, function(data) {

				if (data.error == false) {
					$("#unq_email").show();
					$("#txtEmail").val('');
					document.getElementById("txtEmail").focus();
				} else {
					$("#unq_email").hide();
				}
			});
		});
		
	</script>





</body>

</html>
