<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<style>
.xdsoft_datetimepicker {
	z-index: 999999 !important;
}
</style>

<body>
	<c:url var="placeOrder" value="/placeOrder" />


	<!--mongi help-popup-->
	<%-- 	<div class="mongi_help">
		<a href="#mongi" class="initialism mongi_open"><img
			src="${pageContext.request.contextPath}/resources/images/mongi_help.png"
			alt=""></a>
	</div>
 --%>
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
		<div class="find_store">
			<div class="wrapper">


				<div class="cart_row">
					<div class="cart_l">

						<!-- desktop table-->
						<div class="cart_able_bx">
							<div class="table_bx">
								<table class="cart" id="cartTable">
									<thead>
										<th>Product Name</th>
										<th>Quantity</th>
										<th>Delivery Option</th>
										<th>Sub Total</th>
										<th>Action</th>
									</thead>

									<tbody></tbody>

								</table>
							</div>
						</div>



						<!-- mobile-table-->
						<div class="mobile_table">
							<!--mobile-row-1-->
							<div class="row_1">
								<div class="mob_prod">
									<div class="mob_prod_title">Product Name</div>
									<div class="cart_pic_row mobile_width">
										<div class="cart_pic">
											<img
												src="${pageContext.request.contextPath}/resources/images/cart_pic_1.jpg"
												alt=""> <img
												src="${pageContext.request.contextPath}/resources/images/icon_veg.png"
												alt="" class="veg_icn">
										</div>
										<div class="cart_cont width_inc">
											<h3 class="cart_cake">Cars Lightning McQueen Cake</h3>
											<h3 class="cart_prc">495.00</h3>
											<div class="cart_show" style="display: none;">
												<a href="#"><i class="fa fa-eye" aria-hidden="true"></i>
													Show Details</a>
											</div>
											<div class="cart_det">
												Weight - 500 gm <br> Eggless - False <br> Heart
												Shape - False <br>
											</div>

										</div>
									</div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Quantity</div>
									<div class="mob_quan_r">
										<form id="myform" method="POST" action="#">
											<button type="button" value="" field="quantity"
												class="qtyminus cart">
												<i class="fa fa-minus" aria-hidden="true"></i>
											</button>
											<input type="text" name="quantity" value="0" class="qty cart">
											<button type="button" value="" field="quantity"
												class="qtyplus cart">
												<i class="fa fa-plus" aria-hidden="true"></i>
											</button>
										</form>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Delivery Option</div>
									<div class="mob_quan_r">
										<div class="cart_option">
											<img src="images/user_pic.jpg" alt=""> <span>Message
												in the cake</span>
										</div>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Sub Total</div>
									<div class="mob_quan_r">990.00</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Action</div>
									<div class="mob_quan_r">
										<div class="cart_delete">
											<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
										</div>
									</div>
									<div class="clr"></div>
								</div>
							</div>

							<!--mobile-row-2-->
							<div class="row_1">
								<div class="mob_prod">
									<div class="mob_prod_title">Product Name</div>
									<div class="cart_pic_row mobile_width">
										<div class="cart_pic">
											<img
												src="${pageContext.request.contextPath}/resources/images/cart_pic_2.jpg"
												alt=""> <img
												src="${pageContext.request.contextPath}/resources/images/icon_nonveg.png"
												alt="" class="veg_icn">
										</div>
										<div class="cart_cont width_inc">
											<h3 class="cart_cake">Classic Red Velvet Cake</h3>
											<h3 class="cart_prc">495.00</h3>
											<div class="cart_show">
												<a href="#"><i class="fa fa-eye" aria-hidden="true"></i>
													Show Details</a>
											</div>
											<div class="cart_det" style="display: none;">
												Weight - 500 gm <br> Eggless - False <br> Heart
												Shape - False <br>
											</div>

										</div>
									</div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Quantity</div>
									<div class="mob_quan_r">
										<form id="myform" method="POST" action="#">
											<button type="button" value="" field="quantity"
												class="qtyminus cart">
												<i class="fa fa-minus" aria-hidden="true"></i>
											</button>
											<input type="text" name="quantity" value="0" class="qty cart">
											<button type="button" value="" field="quantity"
												class="qtyplus cart">
												<i class="fa fa-plus" aria-hidden="true"></i>
											</button>
										</form>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Delivery Option</div>
									<div class="mob_quan_r">
										<div class="cart_option">
											<img src="images/user_pic.jpg" alt=""> <span>Message
												in the cake</span>
										</div>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Sub Total</div>
									<div class="mob_quan_r">
										<div class="cart_prc_1">990.00</div>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Action</div>
									<div class="mob_quan_r">
										<div class="cart_delete">
											<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
										</div>
									</div>
									<div class="clr"></div>
								</div>
							</div>
						</div>


						<!-- desktop table-->
						<div class="total_row">
							<!--cart-right-->
							<div class="total_row_r">
								<div class="total_one">
									Items subtotal <span>Rs. <label id="lbl_ItemTotal">0.00</label></span>
								</div>
								<div class="total_one pink">
									Delivery <span>Free</span>
								</div>
								<div class="total_one">
									Sales tax <span>Rs. <label id="lbl_SalesTax">0.00</label></span>
								</div>
								<div class="total_one">
									Tip <span>Rs. <label id="lbl_Tip">0.00</label></span>
								</div>
								<div class="total_one">
									Total <span>Rs. <label id="lbl_Total">0.00</label></span>
								</div>
								<div class="total_row_btm">
									Total <span><label id="lbl_FinalTotal">0.00</label></span>
								</div>

							</div>

							<!--left form-->
							<div class="total_row_l">

								<div class="promo_row">
									<div class="promo_row_l">Promo Code</div>
									<div class="promo_row_r">
										<input name="promoCode" id="promoCode" type="text"
											class="input_two" placeholder="Enter Your Offer Code" />
									</div>
								</div>

								<h3 class="payment_title">Payment Method</h3>
								<!-- <form action="" method="get"> -->
								<div class="payment_one">
									<div class="select-style">
										<select name="paymentMode" id="paymentMode">
											<option value="">Select Payment Type</option>
											<option value="1">COD (Cash on Delivery)</option>
											<option value="2">Card</option>
											<option value="3">E-Pay</option>
										</select>
									</div>
								</div>
								<div>
									<div class="payment_two left">
										<input name="delvrInst" id="delvrInst" type="text"
											class="input_two" placeholder="Delivery Instruction" />
									</div>
									<div class="payment_two right">
										<div id="filters">
											<input type="text" name="delvrDateTime" id="delvrDateTime"
												class="input_two" placeholder="Delivery Date or Time" />
										</div>
									</div>
								</div>
								<div class="payment_click">
									By Clicking the button, you agree to the <a href="#">Terms
										and Conditions.</a>
								</div>
								<div>

									<input name="" type="button" class="place_btn place_open"
										value="Place Order" />
								</div>




								<!--mongi help-popup-->


								<!--apply now pop up-->



								<script type="text/javascript">
										$(document).ready(function() {
											$('#place').popup();
										});
									</script>



								<!-- </form> -->
							</div>
						</div>





					</div>




					<!--related-product-box-->
					<div class="cart_r">
						<h3 class="sidebar_title">Related Item</h3>
						<div class="related_container">
							<!--related-product-1-->
							<div class="related_one">
								<a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/related_itm_1.jpg"
									alt=""></a> <a href="#" class="related_nm">Black Forest
									Cake (Half Kg)</a>
								<div class="related_prc">
									490.00 <span> 690.00</span>
								</div>
								<div class="related_deliver">
									Earlist Delivery : <span>Today</span>
								</div>

								<a href="#" class="related_cart">Add To Cart</a>

							</div>
							<!--related-product-2-->
							<div class="related_one">
								<a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/related_itm_2.jpg"
									alt=""></a> <a href="#" class="related_nm">Black Forest
									Cake (Half Kg)</a>
								<div class="related_prc">
									490.00 <span>690.00</span>
								</div>
								<div class="related_deliver">
									Earlist Delivery : <span>Today</span>
								</div>

								<a href="#" class="related_cart">Add To Cart</a>
							</div>
							<!--related-product-3-->
							<div class="related_one">
								<a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/related_itm_3.jpg"
									alt=""></a> <a href="#" class="related_nm">Black Forest
									Cake (Half Kg)</a>
								<div class="related_prc">
									490.00 <span> 690.00</span>
								</div>
								<div class="related_deliver">
									Earlist Delivery : <span>Today</span>
								</div>

								<a href="#" class="related_cart">Add To Cart</a>
							</div>
							<!--related-product-4-->
							<div class="related_one">
								<a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/related_itm_4.jpg"
									alt=""></a> <a href="#" class="related_nm">Black Forest
									Cake (Half Kg)</a>
								<div class="related_prc">
									490.00 <span>690.00</span>
								</div>
								<div class="related_deliver">
									Earlist Delivery : <span>Today</span>
								</div>

								<a href="#" class="related_cart">Add To Cart</a>
							</div>
							<!--related-product-5-->
							<div class="related_one">
								<a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/related_itm_5.jpg"
									alt=""></a> <a href="#" class="related_nm">Black Forest
									Cake (Half Kg)</a>
								<div class="related_prc">
									490.00 <span>690.00</span>
								</div>
								<div class="related_deliver">
									Earlist Delivery : <span>Today</span>
								</div>

								<a href="#" class="related_cart">Add To Cart</a>
							</div>
						</div>
					</div>
					<div class="clr"></div>
				</div>



				<!-- PLACE ORDER POPUP -->
				<div id="place" class="well_palace">
					<div class="mongi_title">
						Place Order Popup
						<div class="place_close close_pop">
							<i class="fa fa-times" aria-hidden="true"></i>
						</div>
					</div>
					<div class="mongi_cont">

						<%-- <form action="${pageContext.request.contextPath}/viewcart"
							method="post" onsubmit="return validateForm()"> --%>

						<div class="place_row">
							<div class="place_row_l">
								<div class="select-style">
									<select id="txtCity" name=txtCity>
										<c:forEach items="${cityList}" var="city">
											<option value="${city.cityId}"
												${city.cityId==cust.cityId ? 'selected' : ''}>${city.cityName}</option>
										</c:forEach>
									</select>
								</div>
								<!-- <input type="text" class="input_place" id="txtCity"
										name="txtCity" readonly="readonly" value=""
										placeholder="Enter Your City" /> -->
								<label class="form-label-hint-error" id="errorCity"
									style="display: none;">please enter city</label>
							</div>
							<div class="place_row_r">
								<input type="text" class="input_place" readonly="readonly"
									placeholder="City Related Landmark" />
							</div>
							<div class="clr"></div>
						</div>

						<div class="place_row">
							<div class="place_row_l">
								<input type="text" class="input_place" id="txtBillName"
									readonly="readonly" name="txtBillName"
									placeholder="Billing Name" value="${cust.custName}"
									autocomplete="off" /> <label class="form-label-hint-error"
									id="errorBillName" style="display: none;">please enter
									billing name</label>

							</div>
							<div class="place_row_r">
								<input type="text" class="input_place" id="txtMobile"
									value="${cust.custMobileNo}" maxlength="10" name="txtMobile"
									placeholder="Mobile Number" readonly="readonly"
									autocomplete="off" /> <label class="form-label-hint-error"
									id="errorMobile" style="display: none;">please enter
									mobile number</label> <label class="form-label-hint-error"
									id="errorMobileInvalid" style="display: none;">invalid
									mobile number</label>

							</div>
							<div class="clr"></div>
						</div>

						<div class="place_row">
							<div class="place_row_l">
								<input type="text" class="input_place" id="txtEmail"
									value="${cust.emailId}" name="txtEmail" placeholder="Email ID"
									autocomplete="off" readonly="readonly" /> <label
									class="form-label-hint-error" id="errorEmail"
									style="display: none;">please enter email id</label> <label
									class="form-label-hint-error" id="errorEmailInvalid"
									style="display: none;">invalid email id</label>

							</div>
							<div class="place_row_r">
								<div class="gender_l">Gender</div>
								<div class="gender_r">
									<div class="radio_1 gender">
										<ul>
											<li><input type="radio" id="a-option" name="gender"
												value="1" ${cust.custGender==1 ? 'checked' : ''}> <label
												for="a-option">Male</label>
												<div class="check"></div></li>

											<li><input type="radio" id="b-option" name="gender"
												value="2" ${cust.custGender==2 ? 'checked' : ''}> <label
												for="b-option">Female</label>
												<div class="check">
													<div class="inside"></div>
												</div></li>

											<li><input type="radio" id="c-option" name="gender"
												value="3" ${cust.custGender==3 ? 'checked' : ''}> <label
												for="c-option">Other</label>
												<div class="check">
													<div class="inside"></div>
												</div></li>

										</ul>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>

						<div class="place_row">
							<div class="place_row_l">
								<input type="text" class="input_place" id="txtDob"
									value="${cust.dateOfBirth}" name="txtDob"
									placeholder="Date of Birth" autocomplete="off"
									readonly="readonly" /> <label class="form-label-hint-error"
									id="errorDob" style="display: none;">please enter date
									of birth</label>

							</div>
							<div class="place_row_r">
								<input type="text" class="input_place" id="txtGst"
									value="${cust.exVar2}" name="txtGst" placeholder="GST Number"
									autocomplete="off" readonly="readonly" /> <label
									class="form-label-hint-error" id="errorGst"
									style="display: none;">invalid GST number</label>

							</div>
							<div class="clr"></div>
						</div>

						<!-- ------------------------ -->

						<div class="place_row">
							<div class="place_row_l">
								<h3 class="payment_title">Delivery Address</h3>
							</div>
							<div class="place_row_r"></div>
							<div class="clr"></div>
						</div>


						<div class="place_row">
							<div class="place_row_l">
								<input type="text" class="input_place" autocomplete="off"
									id="txtDelvFlat" name="txtDelvFlat"
									placeholder="Flat, House no., Building, Company, Apartment" />

								<label class="form-label-hint-error" id="errorDelvFlat"
									style="display: none;">please enter flat, house no.,
									building, company, apartment</label>
							</div>
							<div class="place_row_r">
								<input type="text" class="input_place" autocomplete="off"
									id="txtDelvArea" name="txtDelvArea"
									placeholder="Area, Colony, Street, Sector, Village" /> <label
									class="form-label-hint-error" id="errorDelvArea"
									style="display: none;">please enter area, colony,
									street, sector, village</label>

							</div>
							<div class="clr"></div>
						</div>



						<div class="place_row">
							<div class="place_row_l">
								<input type="text" class="input_place" autocomplete="off"
									id="txtDelvLandmark" name="txtDelvLandmark"
									placeholder="Landmark" /> <label class="form-label-hint-error"
									id="errorDelvLandmark" style="display: none;">please
									enter landmark</label>

							</div>
							<div class="place_row_r">
								<input type="text" class="input_place" autocomplete="off"
									id="txtDelvPincode" name="txtDelvPincode" maxlength="6"
									placeholder="Shipping Pincode" /> <label
									class="form-label-hint-error" id="errorDelvPincode"
									style="display: none;">please enter pincode</label>
							</div>
							<div class="clr"></div>
						</div>



						<!-- BILLING ADDRESS -->

						<div class="place_row">
							<div class="place_row_l">
								<h3 class="payment_title">Billing Address</h3>
							</div>
							<div class="place_row_r">
								<input type="checkbox" id="chkbox" name="chkbox"
									onchange="setBillingDataByCheckbox()" class="payment_title"
									value="chkbox"> <label for="chkbox"> Same as
									delivery address</label>
							</div>
							<div class="clr"></div>
						</div>


						<div class="place_row">
							<div class="place_row_l">
								<input type="text" class="input_place" autocomplete="off"
									id="txtBillingFlat" name="txtBillingFlat"
									placeholder="Flat, House no., Building, Company, Apartment" />

								<label class="form-label-hint-error" id="errorBillingFlat"
									style="display: none;">please enter flat, house no.,
									building, company, apartment</label>
							</div>
							<div class="place_row_r">
								<input type="text" class="input_place" autocomplete="off"
									id="txtBillingArea" name="txtBillingArea"
									placeholder="Area, Colony, Street, Sector, Village" /> <label
									class="form-label-hint-error" id="errorBillingArea"
									style="display: none;">please enter area, colony,
									street, sector, village</label>
							</div>
							<div class="clr"></div>
						</div>



						<div class="place_row">
							<div class="place_row_l">
								<input type="text" class="input_place" autocomplete="off"
									id="txtBillingLandmark" name="txtBillingLandmark"
									placeholder="Landmark" /> <label class="form-label-hint-error"
									id="errorBillingLandmark" style="display: none;">please
									enter landmark</label>
							</div>
							<div class="place_row_r">
								<input type="text" class="input_place" autocomplete="off"
									id="txtBillingPincode" name="txtBillingPincode"
									placeholder="Billing Pincode" /> <label
									class="form-label-hint-error" id="errorBillingPincode"
									style="display: none;">please enter pincode</label>
							</div>
							<div class="clr"></div>
						</div>


						<!-- ------------------------ -->





						<div class="place_row">
							<input name="" type="button" value="Place Order"
								class="pop_place_btn" onclick="placeOrder()" />
						</div>

						<!-- </form> -->

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

	<!-- bottom -->
	<jsp:include page="/WEB-INF/views/include/bottomMenu.jsp"></jsp:include>


	<!--date or time picker-->

	<script>
		/*jslint browser:true*/
		/*global jQuery, document*/
		jQuery(document)
				.ready(
						function() {
							'use strict';
							jQuery(
									'#delvrDateTime, #search-from-date, #search-to-date')
									.datetimepicker();

							// SET CART DATA

							getItemList();

						});
	</script>


	<script>
		function getItemList() {

			//document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();
			$.ajax({
				url : '${pageContext.request.contextPath}/getAllFrWiseData',
				type : 'post',
				dataType : 'json',
				data : fd,
				contentType : false,
				processData : false,
				success : function(response) {
					//document.getElementById("loaderimg").style.display = "none";
					//alert(JSON.stringify(response.feProductHeadList))
					sessionStorage.setItem("allItemList", JSON
							.stringify(response.feProductHeadList));

					setCartData();

				},
			});

		}

		function setCartData() {

			if (sessionStorage.getItem("allItemList") == null) {
				var table = [];
				sessionStorage.setItem("allItemList", JSON.stringify(table));
			}

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var allItemList = sessionStorage.getItem("allItemList");
			var allItemArr = $.parseJSON(allItemList);

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			$("#cartTable tbody").empty();
			var subtotal = 0;
			var taxtotal = 0;
			var finaltotal = 0;
			var discPer = 0;
			var discAmt = 0;

			for (var j = 0; j < allItemArr.length; j++) {

				for (var i = 0; i < table.length; i++) {

					if (table[i].itemId == allItemArr[j].productId) {

						subtotal = (parseFloat(subtotal) + parseFloat(table[i].totalAmt))
								.toFixed(2);

						var tbl_data = '<tr>'
								+ '<td><div class="cart_pic_row">'
								+ '<div class="cart_pic"><img src="${prodImgUrl}'+allItemArr[j].prodImagePrimary+'" alt=""> <img src="${pageContext.request.contextPath}/resources/images/icon_veg.png" alt="" class="veg_icn"></div>'
								+ '<div class="cart_cont">'
								+ '<h3 class="cart_cake">'
								+ table[i].exVar1
								+ '</h3>'
								+ '<h3 class="cart_prc"> &#8377;'
								+ table[i].mrp
								+ '</h3>'
								+ '<div class="cart_show" ><a href="javascript:void(0)" onclick="showDetail('
								+ table[i].itemId
								+ ')" id="aTagShowDetail'
								+ table[i].itemId
								+ '"><i class="fa fa-eye" aria-hidden="true"></i>Show Details</a><div>'
								+ '<div class="cart_det" style="display: none;" id="detail'+table[i].itemId+'">Weight - '
								+ table[i].weight
								+ ' '
								+ allItemArr[j].uomShowName
								+ ' <br> '
								+ table[i].veg
								+ ' <br> Cake Shape - '
								+ allItemArr[j].shapeNames
								+ ' <br></div>'
								+ '</div>'
								+ '</div></td>'
								+

								'<td>'
								+ '<button type="button" value="" field="quantity" class="qtyminus cart" id="btnMin'
								+ table[i].itemId
								+ '"  name="btnMin'
								+ table[i].itemId
								+ '" onclick="minusQty('
								+ table[i].itemId
								+ ','
								+ table[i].qty
								+ ')"> <i class="fa fa-minus" aria-hidden="true"></i> </button>'

								+ '<input type="text" id="quantity'
								+ table[i].itemId
								+ '" name="quantity'
								+ table[i].itemId
								+ '" value="'
								+ table[i].qty
								+ '" class="qty cart" onblur="typeQty('
								+ table[i].itemId
								+ ')"> '

								+ '<button type="button" value="" field="quantity" class="qtyplus cart" id="btnPlus'
								+ table[i].itemId
								+ '"  name="btnPlus'
								+ table[i].itemId
								+ '" onclick="plusQty('
								+ table[i].itemId
								+ ','
								+ table[i].qty
								+ ')"> <i class="fa fa-plus" aria-hidden="true"></i> </button>'

								+ '<span class="cart_remove"><a href="javascript:void(0)" onclick="removeQty('
								+ table[i].itemId
								+ ')">Remove</a></span>'
								+ '</td>'
								+

								'<td><div class="cart_option">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/user_pic.jpg" alt=""> <span>Message in the cake</span>'
								+ '</div></td>'
								+

								'<td><div class="cart_prc_1"> &#8377; '
								+ table[i].totalAmt
								+ '</div></td>'
								+

								'<td><div class="cart_delete"><a href="javascript:void(0)" onclick="removeQty('
								+ table[i].itemId
								+ ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></div></td>'
								+

								'</tr>';

						$('#cartTable').append(tbl_data);

					}
				}
			}

			finaltotal = (parseFloat(finaltotal) + parseFloat(subtotal))
					.toFixed(2);

			document.getElementById("lbl_ItemTotal").innerHTML = subtotal;
			document.getElementById("lbl_FinalTotal").innerHTML = finaltotal;

			document.getElementById("cart_item_count").innerHTML = ""
					+ table.length;

		}

		function minusQty(id, curQty) {

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			var newCartVal = [];

			if (curQty == 1) {

				for (var i = 0; i < table.length; i++) {
					if (id != table[i].itemId && curQty == 1) {
						newCartVal.push(table[i]);
					}
				}

			} else {

				for (var i = 0; i < table.length; i++) {
					var qty = curQty - 1;

					if (id == table[i].itemId) {
						table[i].qty = qty;

						var taxableAmt = parseFloat(table[i].rate)
								* parseFloat(qty).toFixed(2);
						var cgstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].cgstPer)) / 100;
						var sgstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].sgstPer)) / 100;
						var igstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].igstPer)) / 100;

						var taxAmt = (cgstAmt + sgstAmt + igstAmt).toFixed(2);
						var totalAmt = parseFloat(taxableAmt).toFixed(2);

						table[i].taxableAmt = taxableAmt;
						table[i].cgstAmt = cgstAmt;
						table[i].sgstAmt = sgstAmt;
						table[i].igstAmt = igstAmt;
						table[i].taxAmt = taxAmt;
						table[i].totalAmt = totalAmt;
					}

					newCartVal.push(table[i]);
				}

			}

			sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));

			setCartData();
		}

		function plusQty(id, curQty) {

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			var newCartVal = [];

			for (var i = 0; i < table.length; i++) {
				var qty = curQty + 1;

				if (id == table[i].itemId) {
					table[i].qty = qty;

					var taxableAmt = parseFloat(table[i].rate)
							* parseFloat(qty).toFixed(2);
					var cgstAmt = (parseFloat(table[i].rate) * parseFloat(qty) * parseFloat(table[i].cgstPer)) / 100;
					var sgstAmt = (parseFloat(table[i].rate) * parseFloat(qty) * parseFloat(table[i].sgstPer)) / 100;
					var igstAmt = (parseFloat(table[i].rate) * parseFloat(qty) * parseFloat(table[i].igstPer)) / 100;

					var taxAmt = (cgstAmt + sgstAmt + igstAmt).toFixed(2);
					var totalAmt = parseFloat(taxableAmt).toFixed(2);

					table[i].taxableAmt = taxableAmt;
					table[i].cgstAmt = cgstAmt;
					table[i].sgstAmt = sgstAmt;
					table[i].igstAmt = igstAmt;
					table[i].taxAmt = taxAmt;
					table[i].totalAmt = totalAmt;

				}

				newCartVal.push(table[i]);
			}

			sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));
			setCartData();
		}

		function removeQty(id) {

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			var newCartVal = [];

			for (var i = 0; i < table.length; i++) {
				if (id != table[i].itemId) {
					newCartVal.push(table[i]);
				}
			}

			sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));

			setCartData();
		}

		function typeQty(id) {

			var qty = document.getElementById("quantity" + id).value;

			if (qty > 0) {

				if (sessionStorage.getItem("cartValue") == null) {
					var table = [];
					sessionStorage.setItem("cartValue", JSON.stringify(table));
				}

				var cartValue = sessionStorage.getItem("cartValue");
				var table = $.parseJSON(cartValue);

				var newCartVal = [];

				for (var i = 0; i < table.length; i++) {

					if (id == table[i].itemId) {
						table[i].qty = qty;

						var taxableAmt = parseFloat(table[i].rate)
								* parseFloat(qty).toFixed(2);
						var cgstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].cgstPer)) / 100;
						var sgstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].sgstPer)) / 100;
						var igstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].igstPer)) / 100;

						var taxAmt = (cgstAmt + sgstAmt + igstAmt).toFixed(2);
						var totalAmt = parseFloat(taxableAmt).toFixed(2);

						table[i].taxableAmt = taxableAmt;
						table[i].cgstAmt = cgstAmt;
						table[i].sgstAmt = sgstAmt;
						table[i].igstAmt = igstAmt;
						table[i].taxAmt = taxAmt;
						table[i].totalAmt = totalAmt;

					}

					newCartVal.push(table[i]);
				}

				sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));

				setCartData();

			}

		}

		function showDetail(id) {

			// $("aTagShowDetail"+id).hide();
			//$("detail"+id).show();
			document.getElementById("aTagShowDetail" + id).style.display = "none";
			document.getElementById("detail" + id).style.display = "block";

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

	<script type="text/javascript">
		jQuery(document)
				.ready(
						function() {
							// This button will increment the value
							$('.qtyplus')
									.click(
											function(e) {
												// Stop acting like a button
												e.preventDefault();
												// Get the field name
												fieldName = $(this).attr(
														'field');
												// Get its current value
												var currentVal = parseInt($(
														'input[name='
																+ fieldName
																+ ']').val());
												// If is not undefined
												if (!isNaN(currentVal)) {
													// Increment
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															currentVal + 1);
												} else {
													// Otherwise put a 0 there
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															0);
												}
											});
							// This button will decrement the value till 0
							$(".qtyminus")
									.click(
											function(e) {
												// Stop acting like a button
												e.preventDefault();
												// Get the field name
												fieldName = $(this).attr(
														'field');
												// Get its current value
												var currentVal = parseInt($(
														'input[name='
																+ fieldName
																+ ']').val());
												// If it isn't undefined or its greater than 0
												if (!isNaN(currentVal)
														&& currentVal > 0) {
													// Decrement one
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															currentVal - 1);
												} else {
													// Otherwise put a 0 there
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															0);
												}
											});
						});
	</script>


	<!--slick slider-->
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
		function validateForm() {

			var isError = true;

			var billName = true, mobile = true, email = true, dob = true, gst = true, delvFlat = true, delvArea = true, delvLand = true, delvPin = true, billFlat = true, billArea = true, billLand = true, billPin = true;

			if (!$("#txtBillName").val().trim()) {
				billName = false;
				$("#errorBillName").show();
			} else {
				$("#errorBillName").hide();
			}

			if (!$("#txtMobile").val().trim()) {
				mobile = false;
				$("#errorMobile").show();
			} else if ($("#txtMobile").val().trim().length != 10) {
				mobile = false;
				$("#errorMobile").hide();
				$("#errorMobileInvalid").show();
			} else {
				$("#errorMobile").hide();
				$("#errorMobileInvalid").hide();
			}

			if (!$("#txtEmail").val().trim()) {
				email = false;
				$("#errorEmail").show();
			} else if (!ValidateEmail($("#txtEmail").val().trim())) {
				email = false;
				$("#errorEmailInvalid").show();
				$("#errorEmail").hide();
			} else {
				$("#errorEmailInvalid").hide();
				$("#errorEmail").hide();
			}

			if (!$("#txtDob").val().trim()) {
				dob = false;
				$("#errorDob").show();
			} else {
				$("#errorDob").hide();
			}

			if ($("#txtGst").val().trim()) {

				if (checkGST($("#txtGst").val().trim()) == false) {
					gst = false;
					$("#errorGst").show();
				} else {
					$("#errorGst").hide();
				}

			} else {
				$("#errorGst").hide();
			}

			if (!$("#txtDelvFlat").val().trim()) {
				delvFlat = false;
				$("#errorDelvFlat").show();
			} else {
				$("#errorDelvFlat").hide();
			}

			if (!$("#txtDelvArea").val().trim()) {
				delvArea = false;
				$("#errorDelvArea").show();
			} else {
				$("#errorDelvArea").hide();
			}

			if (!$("#txtDelvLandmark").val().trim()) {
				delvLand = false;
				$("#errorDelvLandmark").show();
			} else {
				$("#errorDelvLandmark").hide();
			}

			if (!$("#txtDelvPincode").val().trim()) {
				delvPin = false;
				$("#errorDelvPincode").show();
			} else {
				$("#errorDelvPincode").hide();
			}

			if (!$("#txtBillingFlat").val().trim()) {
				billFlat = false;
				$("#errorBillingFlat").show();
			} else {
				$("#errorBillingFlat").hide();
			}

			if (!$("#txtBillingArea").val().trim()) {
				billArea = false;
				$("#errorBillingArea").show();
			} else {
				$("#errorBillingArea").hide();
			}

			if (!$("#txtBillingLandmark").val().trim()) {
				billLand = false;
				$("#errorBillingLandmark").show();
			} else {
				$("#errorBillingLandmark").hide();
			}

			if (!$("#txtBillingPincode").val().trim()) {
				billPin = false;
				$("#errorBillingPincode").show();
			} else {
				$("#errorBillingPincode").hide();
			}

			if (!billName || !mobile || !email || !dob || !gst || !delvFlat
					|| !delvArea || !delvLand || !delvPin || !billFlat
					|| !billArea || !billLand || !billPin) {
				isError = false;
			}

			return isError;

		}

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

		function setBillingDataByCheckbox() {

			if (document.getElementById("chkbox").checked == true) {

				$("#txtBillingFlat").val($("#txtDelvFlat").val());
				$("#txtBillingArea").val($("#txtDelvArea").val());
				$("#txtBillingLandmark").val($("#txtDelvLandmark").val());
				$("#txtBillingPincode").val($("#txtDelvPincode").val());

			} else {

				$("#txtBillingFlat").val("");
				$("#txtBillingArea").val("");
				$("#txtBillingLandmark").val("");
				$("#txtBillingPincode").val("");

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
	</script>
	<!------------------------------------------------------- Place Order--------------------------------------------------- -->
	<script type="text/javascript">
	function placeOrder() {
		var cartValue = sessionStorage.getItem("cartValue");
		var table = $.parseJSON(cartValue);		
		
		$.getJSON('${placeOrder}', {
			promoCode : $("#promoCode").val(),
			paymentMode : $("#paymentMode").val(),
			delvrInst : $("#delvrInst").val(),
			delvrDateTime : $("#delvrDateTime").val(),
			
			txtCity : $("#txtCity").val(),
			txtBillName : $("#txtBillName").val(),
			txtMobile : $("#txtMobile").val(),
			txtEmail : $("#txtEmail").val(),
			gender : $("input[name='gender']:checked").val(),
			txtDob : $("#txtDob").val(),
			txtGst : $("#txtGst").val(),
			
			txtDelvFlat : $("#txtDelvFlat").val(),
			txtDelvArea : $("#txtDelvArea").val(),
			txtDelvLandmark : $("#txtDelvLandmark").val(),
			txtDelvPincode : $("#txtDelvPincode").val(),
			
			txtBillingFlat : $("#txtBillingFlat").val(),
			txtBillingArea : $("#txtBillingArea").val(),
			txtBillingLandmark : $("#txtBillingLandmark").val(),
			txtBillingPincode : $("#txtBillingPincode").val(),
			
			itemData : JSON.stringify(table),
			
			ajax : 'true'
		}, function(data) {
			//alert(JSON.stringify(data.error));
			if (data.error==false) {
				
				$("#promoCode").val('');
				$("#paymentMode").val('');
				$("#delvrInst").val('');
				$("#delvrDateTime").val('');
				
				$("#txtCity").val('');
				$("#txtBillName").val('');
				$("#txtMobile").val('');
				$("#txtEmail").val('');
				$("#txtGst").val('');
				
				$("#txtDelvFlat").val('');
				$("#txtDelvArea").val('');
				$("#txtDelvLandmark").val('');
				$("#txtDelvPincode").val('');
				
				$("#txtBillingFlat").val('');
				$("#txtBillingArea").val('');
				$("#txtBillingLandmark").val('');
				$("#txtBillingPincode").val('');
				
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
				  $("#place").hide();
			
			}
			var url = '${pageContext.request.contextPath}/home';
			window.location = url;
		});
	}
	
	
	$('#txtDelvPincode').on('input', function() {
		 this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
		});
	
	$('#txtBillingPincode').on('input', function() {
		 this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
		});

	</script>

</body>

</html>
