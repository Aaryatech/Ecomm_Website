<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<c:url value="/setLikeOrDislike" var="setLikeOrDislike"></c:url>

<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>


	<div class="head_marg">
		<!--product listing-->
		<div class="find_store">
			<div class="wrapper">

				<div class="product_boxes">
					<h2 class="sec_title">
						<center>Customer Like this Products</center>
					</h2>


					<ul id="itemListUl">

						<c:forEach items="${allData.feProductHeadList}" var="product">

							<c:if test="${product.isLike==1}">

								<li>
									<!-- <div class="cake_one product_padd"> -->
									
									<div class="cake_one">
												<div class="cake_pic">
													<a
														href="${pageContext.request.contextPath}/showProductDetail/${product.productId}/${product.prodNameDisp}" target="_blank">
														<img src="#"
														data-src="${prodImgUrl}${product.prodImagePrimary}"
														onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'"
														class="mobile_fit transition lazy">
													</a>

													<div class="purity_icn">
														<c:choose>
															<c:when test="${product.vegNonvegName eq 'VEG'}">
																<img src="#" class="lazy"
																	data-src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg"
																	alt="">
															</c:when>
															<c:when test="${product.vegNonvegName eq 'NON-VEG'}">
																<img src="#" class="lazy"
																	id="nonveg${product.productId}"
																	data-src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg"
																	alt="">
															</c:when>
															<c:otherwise>
																<img src="#" class="lazy"
																	data-src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg"
																	alt="">
																<img src="#" class="lazy"
																	id="nonveg${product.productId}"
																	data-src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg"
																	alt="">
															</c:otherwise>
														</c:choose>
													</div>





													<div class="circle_tag active"
														onclick="setLike(${product.productId},${product.isLike})">

														<c:choose>

															<c:when test="${product.isLike==0}">
																<img src="#" class="lazy" id="like${product.productId}"
																	data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
																	alt="">
															</c:when>
															<c:when test="${product.isLike==1}">
																<img src="#" class="lazy" id="like${product.productId}"
																	data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
																	alt="">
															</c:when>

														</c:choose>


													</div>



													<div class="cake_prc">
												<div>
																<i class="fa fa-inr cake_prc_detail_iclass"
																	aria-hidden="true"></i>

																<c:set value="${product.defaultPrice}" var="price"></c:set>
																<c:set value="1" var="defaultWt"></c:set>

																<c:choose>

																	<c:when test="${product.rateSettingType == 1}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:set value="${product.defaultPrice * defaultWt}"
																			var="price"></c:set>

																	</c:when>

																	<c:when test="${product.rateSettingType == 2}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:forEach items="${product.prodDetailList}"
																			var="proDetail">

																			<c:choose>
																				<c:when
																					test="${proDetail.flavorId==product.defaultFlavorId and proDetail.qty==defaultWt}">
																					<c:set value="${proDetail.actualRate}" var="price"></c:set>
																				</c:when>
																			</c:choose>
																		</c:forEach>

																	</c:when>


																</c:choose>

																<p class="cake_prc_detail_pclass"
																	id="newPrice${product.productId}">${price}</p>

															</div>
													<%-- <i class="fa fa-inr" aria-hidden="true"></i>
													<fmt:formatNumber type="number" groupingUsed="false"
														value="${product.defaultPrice}" maxFractionDigits="0"
														minFractionDigits="0" /> 													
													<p class="per_kg">${product.uomShowName}</p>--%>
													
													<%-- <span class="off_prc"><i class="fa fa-inr"
														aria-hidden="true"></i> <fmt:formatNumber type="number"
															groupingUsed="false" value="${product.defaultPrice}"
															maxFractionDigits="0" minFractionDigits="0" /></span>  --%><span
														class="prc_off"></span>
												</div>

												</div>
												<div class="cake_container">
													<h4 class="cake_nm">
														<a
															href="${pageContext.request.contextPath}/showProductDetail/${product.productId}/${product.prodNameDisp}" target="_blank">${product.productName}</a>
													</h4>
													<div class="cake_dropdown">
														<div class="cake_dropdown_l">


															<c:choose>

																<c:when test="${product.rateSettingType==0}">
																	<!-- <input type="number" id="wt" value="1" max="2" min="0"
																		limit="1" style="text-align: center;"> -->
																	<div class="plus_minus_one">
																		<button type="button" value="" field="quantity"
																			class="qtyminus slide"
																			onclick="setQtyText(${product.productId},0,'${product.prodDetailList}')">
																			<i class="fa fa-minus" aria-hidden="true"></i>
																		</button>
																		<input type="text" id="txtWt${product.productId}"
																			value="1" style="text-align: center;"
																			class="qty slide">
																		<button type="button" value="" field="quantity"
																			onclick="setQtyText(${product.productId},1,'${product.prodDetailList}')"
																			class="qtyplus slide">
																			<i class="fa fa-plus" aria-hidden="true"></i>
																		</button>
																	</div>
																</c:when>

																<c:otherwise>

																	<!-- <div class="custom-select-new1"> -->
																	<div class="small_field">
																		<select class="select-css" id="wt${product.productId}"
																			onchange="setPriceByWtAndFlavour('${product.productId}','${product.rateSettingType}')">
																			<!-- <option value="7">7</option> -->
																			<c:forEach items="${product.availInWeights}"
																				var="prodDetailwt">
																				<option value="${prodDetailwt}">${prodDetailwt}</option>
																			</c:forEach>
																		</select>
																		<!-- </div> -->
																	</div>

																</c:otherwise>

															</c:choose>

															<span class="prod_kgs">${product.uomShowName}</span>

														</div>
														<div class="cake_dropdown_r">


															<div class="radio_1">
																<ul>
																	<c:set var="isVegFound" value="0"></c:set>
																	<c:set var="isNonVegFound" value="0"></c:set>
																	<c:forEach items="${product.isVeg}"
																		var="prodDetailVegNon">


																		<c:forEach items="${flavTagStatusList}"
																			var="vegNonFilter" varStatus="flavorFilterCount">
																			<c:if test="${vegNonFilter.filterTypeId==12}">



																				<c:if
																					test="${vegNonFilter.filterId==prodDetailVegNon}">
																					<c:if test="${vegNonFilter.adminName eq 'VEG'}">
																						<c:set var="isVegFound" value="1"></c:set>
																					</c:if>

																					<c:if test="${vegNonFilter.adminName eq 'NONVEG'}">
																						<c:set var="isNonVegFound" value="1"></c:set>
																					</c:if>
																				</c:if>
																			</c:if>
																		</c:forEach>

																	</c:forEach>



																	<%-- <c:if test="${isVegFound==1}">
																		<li><input type="radio" value="0"
																			id="prod_veg${product.productId}"
																			name="prod_vnv${product.productId}"> <label
																			for="prod_veg${product.productId}"> Veg</label>
																			<div class="check">
																				<div class="inside"></div>
																			</div></li>

																	</c:if>

																	<c:if test="${isNonVegFound==1}">
																		<li><input type="radio" value="1"
																			id="prod_nonveg${product.productId}"
																			name="prod_vnv${product.productId}"> <label
																			for="prod_nonveg${product.productId}"> Non
																				Veg</label>
																			<div class="check">
																				<div class="inside"></div>
																			</div></li>
																	</c:if> --%>

																	<div style="display: none;">
																	<%-- <c:if test="${product.flavourIds!=0}">
																		<select class="select-css"
																			id="flav${product.productId}"
																			onchange="setPriceByWtAndFlavour('${product.productId}','${product.rateSettingType}')">
																			<c:forEach items="${product.flavourIds}"
																				var="prodDetail">

																				<c:forEach items="${flavTagStatusList}"
																					var="flavorFilter" varStatus="flavorFilterCount">

																					<c:if test="${flavorFilter.filterTypeId==4}">

																						<c:choose>
																							<c:when
																								test="${prodDetail==flavorFilter.filterId}">
																								<c:choose>
																									<c:when
																										test="${prodDetail==product.defaultFlavorId}">
																										<option value="${prodDetail}" selected>${flavorFilter.adminName}</option>
																									</c:when>
																									<c:otherwise>
																										<option value="${prodDetail}">${flavorFilter.adminName}</option>
																									</c:otherwise>
																								</c:choose>
																							</c:when>
																							<c:otherwise>

																							</c:otherwise>
																						</c:choose>
																					</c:if>

																				</c:forEach>
																			</c:forEach>
																		</select>
																	</c:if> --%>
																	</div>
																</ul>
																<!-- <ul>
																	<li><input type="radio" id="a-option"
																		name="selector"> <label for="a-option">Veg</label>
																		<div class="check"></div></li>

																	<li><input type="radio" id="b-option"
																		name="selector"> <label for="b-option">Non
																			Veg</label>
																		<div class="check">
																			<div class="inside"></div>
																		</div></li>

																</ul> -->
															</div>
														</div>
														<div class="radio_r">
															<a href="javascript:void(0)"
																onclick="addCart('${product.productId}','${product.rateSettingType}')" title="Add To Cart">
																<i class="fa fa-shopping-cart shop_cart"></i></a>
														</div>
														<div class="clr"></div>
													</div>
													<!-- <div class="cake_radio_row">
														<div class="radio_l">

															<div class="radio_1">
																<ul>
																	<li><input type="radio" id="a-option"
																		name="selector"> <label for="a-option">Veg</label>
																		<div class="check"></div></li>

																	<li><input type="radio" id="b-option"
																		name="selector"> <label for="b-option">Non
																			Veg</label>
																		<div class="check">
																			<div class="inside"></div>
																		</div></li>

																</ul>
															</div>

														</div>
														<div class="radio_r">
															<a href="my-cart.html" class="cart_btn">Add to Cart</a>
														</div>
														<div class="clr"></div>
													</div> -->


													<%-- <div class="cake_radio_row">
														<div class="radio_l">

															<!-- Flavor 25-12-2020 -->

															<div>
																<i class="fa fa-inr cake_prc_detail_iclass"
																	aria-hidden="true"></i>

																<c:set value="${product.defaultPrice}" var="price"></c:set>
																<c:set value="1" var="defaultWt"></c:set>

																<c:choose>

																	<c:when test="${product.rateSettingType == 1}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:set value="${product.defaultPrice * defaultWt}"
																			var="price"></c:set>

																	</c:when>

																	<c:when test="${product.rateSettingType == 2}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:forEach items="${product.prodDetailList}"
																			var="proDetail">

																			<c:choose>
																				<c:when
																					test="${proDetail.flavorId==product.defaultFlavorId and proDetail.qty==defaultWt}">
																					<c:set value="${proDetail.actualRate}" var="price"></c:set>
																				</c:when>
																			</c:choose>
																		</c:forEach>

																	</c:when>


																</c:choose>

																<p class="cake_prc_detail_pclass"
																	id="newPrice${product.productId}">${price}</p>

															</div>


														</div>
														<div class="radio_r">
															<a href="javascript:void(0)"
																onclick="addCart('${product.productId}','${product.rateSettingType}')"
																class="cart_btn">Add to Cart</a>
														</div>
														<div class="clr"></div>
													</div> --%>

												</div>

											</div>
										
								</li>

							</c:if>


						</c:forEach>


					</ul>
				</div>




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

<script type="text/javascript">
		function addCart1(id,type) {
			
			
			
			var selectFlav = 0;
			
			var selectWt = 0;
			
			var selFlvName ="";
			
			if(type == 0){
				selectWt = document.getElementById("txtWt"+id).value;	
				alert("selectWt" +selectWt)
			}else if(type == 1 || type == 2){
				selectWt = document.getElementById("wt" + id).value;
				
				try {
					selectFlav = document.getElementById("flav" + id).value;
					
					var docFlv = document.getElementById("flav" + id);
					selFlvName = docFlv.options[docFlv.selectedIndex].text;
					
				} catch (e) {
					selectFlav = 0;
				}
				if (selectFlav == "" || isNaN(selectFlav) || selectFlav == null) {
					selectFlav = 0;
				}
			}
			
			
				
				
				var prodMaster;
				
				if (sessionStorage.getItem("allItemList") == null) {
					var table = [];
					sessionStorage.setItem("allItemList", JSON.stringify(table));
				}

				var allItemList = sessionStorage.getItem("allItemList");
				var prodHead = $.parseJSON(allItemList);
				
				//alert("dfdfd "+prodHead )
				
				
				for (var h = 0; h < prodHead.length; h++) {
					if (parseInt(id) == parseInt(prodHead[h].productId)) {
						prodMaster = prodHead[h];
						break;
					}
				}
				
				var prodDetail = prodMaster.prodDetailList;
				//alert(prodDetail)
				
				var actualRate=0;
				var calRate=0;
				var displayRate=0;
				var configDetailId=0;
				var flvId=0;
				var isVeg=0;
				var shapeId=0;
				var flvName=selFlvName;
				
				var qty = 1;
				
				var uniq = (new Date()).getTime();
				//alert(uniq)
						
				 for (var d = 0; d < prodDetail.length; d++) {
					
					if(type == 0){
						
						qty=selectWt;
						
						calRate=prodDetail[d].actualRate*selectWt;
						actualRate=prodDetail[d].actualRate;
						displayRate=prodDetail[d].displayRate;
						configDetailId=prodDetail[d].configDetailId;
						flvId=prodDetail[d].flavorId;
						isVeg=prodDetail[d].isVeg;
						shapeId=prodDetail[d].shapeId;
						
						break;
							
					}else if(type == 1){
						
						if (parseInt(prodDetail[d].flavorId) == parseInt(selectFlav)) {
							
							
							//alert("Shape = "+parseInt(prodDetail[d].shapeId)+"             Flv = "+parseInt(selectFlav))
							
							//alert("1  - "+prodDetail[d].configDetailId)
							
							calRate=prodDetail[d].actualRate*selectWt;
							actualRate=prodDetail[d].actualRate;
							displayRate=prodDetail[d].displayRate;
							configDetailId=prodDetail[d].configDetailId;
							flvId=prodDetail[d].flavorId;
							isVeg=prodDetail[d].isVeg;
							shapeId=prodDetail[d].shapeId;
							
							break;

						}
						
					} else if(type == 2){
						
						if (parseInt(prodDetail[d].flavorId) == parseInt(selectFlav) && parseFloat(selectWt) == parseFloat(prodDetail[d].qty)) {
							
							calRate=prodDetail[d].actualRate;
							actualRate=prodDetail[d].actualRate;
							displayRate=prodDetail[d].displayRate;
							configDetailId=prodDetail[d].configDetailId;
							flvId=prodDetail[d].flavorId;
							isVeg=prodDetail[d].isVeg;
							shapeId=prodDetail[d].shapeId;
							
							break;

						}
						
					} 

				}
				 
				
				
				
				var priceDiff = parseFloat(displayRate)
						- parseFloat(actualRate);
				
				offPer = (parseFloat(priceDiff)
						/ parseFloat(displayRate) * 100);

				taxableAmt = calRate;

				cgstAmt = ((calRate) * parseFloat(prodMaster.cgstPer)) / 100;
				sgstAmt = ((calRate) * parseFloat(prodMaster.sgstPer)) / 100;
				igstAmt = ((calRate) * parseFloat(prodMaster.igstPer)) / 100;

				taxAmt = (cgstAmt + sgstAmt + igstAmt)
						.toFixed(2);
				
				totalAmt = (parseFloat(taxableAmt)).toFixed(2);

				if (sessionStorage.getItem("cartValue") == null) {
					var table = [];
					sessionStorage.setItem("cartValue", JSON
							.stringify(table));
				}

				var cartValue = sessionStorage
						.getItem("cartValue");
				var table = $.parseJSON(cartValue);
				//alert("actualRate" +actualRate)
				if(type==0){
					calRate=actualRate;
				}
				
				
				if (sessionStorage.getItem("cartValue") == null) {
					var table = [];
					sessionStorage.setItem("cartValue", JSON.stringify(table));
				}

				var cartValue = sessionStorage.getItem("cartValue");
				var cartArray = $.parseJSON(cartValue);
				
				var imgFile="";
				var imgName="";
				
			
				
				var index=0,itemFound=0;
				
			
				
				for(var i=0; i<cartArray.length;i++){
					
					//alert(selectWt+"      "+cartArray[i].qty+"         Type - "+type)
					
					if(configDetailId==cartArray[i].exInt1 && type==0){
						index=i;
						itemFound=1;
						imgFile : cartArray[i].imgFile;
						imgName : cartArray[i].imgName;
						break;
					}else if(selectWt==cartArray[i].weight && configDetailId==cartArray[i].exInt1){
						//alert("asasas")
						index=i;
						itemFound=1;
						imgFile : cartArray[i].imgFile;
						imgName : cartArray[i].imgName;
						break;
					}
					/* else if(configDetailId==cartArray[i].exInt1){
						index=i;
						itemFound=1;
						break;
					} */
				}
				
				
				var obj={
						uniqueId : uniq,
						orderDetailId : 0,
						orderId : 0,
						itemId : prodMaster.productId,
						hsnCode : prodMaster.hsnCode,
						qty : qty,
						mrp : displayRate,
						rate : calRate,
						taxableAmt : taxableAmt,
						cgstPer : prodMaster.cgstPer,
						sgstPer : prodMaster.sgstPer,
						igstPer : prodMaster.igstPer,
						cgstAmt : cgstAmt,
						sgstAmt : sgstAmt,
						igstAmt : igstAmt,
						discAmt : 0,
						taxAmt : taxAmt,
						totalAmt : totalAmt,
						delStatus : 1,
						remark : '',
						exInt1 : configDetailId,
						exInt2 : flvId,
						exInt3 : isVeg,
						exInt4 : shapeId,
						exVar1 : prodMaster.productName,
						exVar2 : '',
						exVar3 : '',
						exVar4 : '',
						exFloat1 : 1,
						exFloat2 : 1,
						exFloat3 : 1,
						exFloat4 : 1,
						weight : selectWt,
						veg : "",
						rateSettingType : type,
						flvName : flvName,
						imgFile : imgFile,
						imgName : imgName,
						spInst : "NA",
						msgonCake : 'NA'
						
					}
				
				if(itemFound==1){
					table[index]=obj;
				}else{
					table.push(obj);	
				}
				
				sessionStorage.setItem("cartValue", JSON
						.stringify(table));
				appendCartData();
				
					openNav();
				  	setTimeout(function(){ closeNav(); }, 4000);
				 
		} 
		
		
		
		
		
	</script>
		
	<script type="text/javascript">
		
		function setPriceByWtAndFlavour(id,type) {
			
			//alert(id+"      "+type)
			
			var selectWt = document.getElementById("wt" + id).value;
			var selectFlav = 0;
			try {
				selectFlav = document.getElementById("flav" + id).value;
			} catch (e) {
				selectFlav = 0;
			}
			if (selectFlav == "" || isNaN(selectFlav) || selectFlav == null) {
				selectFlav = 0;
			}
			
			//alert(selectWt+"          "+selectFlav)
			
			if (sessionStorage.getItem("allItemList") == null) {
				var table = [];
				sessionStorage.setItem("allItemList", JSON.stringify(table));
			}

			var allItemList = sessionStorage.getItem("allItemList");
			var allItemArr = $.parseJSON(allItemList);

			var rate=0;
			
			for(var i=0;i<allItemArr.length;i++){
				if(allItemArr[i].productId==id){
					rate=parseFloat(allItemArr[i].defaultPrice);
					break;
				}
			}
			
			for(var i=0;i<allItemArr.length;i++){
				if(allItemArr[i].productId==id){
					for(var j=0;j<allItemArr[i].prodDetailList.length;j++){
						if(type==1){
							rate=parseFloat(allItemArr[i].prodDetailList[j].actualRate);
							break;
						}else if(allItemArr[i].prodDetailList[j].qty==selectWt && type==2){
							rate=parseFloat(allItemArr[i].prodDetailList[j].actualRate);
							break;
						}
					}
				}
			}
			
			if(type==1){
				rate=rate*parseFloat(selectWt);
			}
			
			document.getElementById("newPrice"+id).innerHTML=rate.toFixed(1);
			
		}
		
		</script>
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
	<script type="text/javascript" src="js/menuzord.js"></script>
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
	<script src="js/slick.js" type="text/javascript"></script>
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
	
function setLike(id,isLike) {
		
		if(parseInt(isLike)==0){
			document.getElementById("like"+id).src = "${pageContext.request.contextPath}/resources/images/heart.svg";
		}else{
			document.getElementById("like"+id).src = "${pageContext.request.contextPath}/resources/images/heart-1.svg";
		}
		
		$.getJSON(
				'${setLikeOrDislike}',
				{
					prodId : id,
					ajax : 'true'
				},
				function(data) {
					//alert(JSON.stringify(data));
					
					if(data.msg ==1){
						document.getElementById("like"+id).src = "${pageContext.request.contextPath}/resources/images/heart.svg";
						
					}else{
						document.getElementById("like"+id).src = "${pageContext.request.contextPath}/resources/images/heart-1.svg";
						
					}
					
					
					
					var divStr='';
					
					//alert(data.statusText)
					
					//alert(JSON.parse(data.statusText))
					
					var data1=JSON.parse(data.statusText);
					
					var noimage='onerror="this.src=\'${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg\'"'

					$.each(data1.feProductHeadList,
											function(key, product) {
						
						if(product.isLike ==1){
						var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+product.productId+'/'+product.prodNameDisp+'" target="_blank">'
							var like='<div class="circle_tag active" onclick="setLike('+product.productId+')">'
							+ '<img  id="like'+product.productId+'"  src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">'
							+ '</div>';
							
							divStr = divStr
							+ '<li>'
							+ ' <div class="item_div"> '
							+ ' <div class="cake_one product_padd"> '
							+ ' <div class="cake_pic"> '+detail
							+ ' <img src="${prodImgUrl}'+product.prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+product.prodImagePrimary+'" alt="" class="mobile_fit transition"></a> '
							+ like
							+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
							+ product.defaultPrice
							+ '<p class="per_kg" style="font-size: 12px; vertical-align: middle; display: inline-block;">'+product.uomShowName+'</p><span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
							+ product.defaultPrice
							+ '</span> <span class="prc_off"></span> </div> '
							+ ' <input type="hidden" class="tagNameHide" value="'+product.appliTagNames+'"> '
							+ ' </div> '
							+ ' <div class="cake_container"> '
							+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+product.productId+'/'+product.prodNameDisp+'" target="_blank">'
							+ product.productName + '</a> </h4>'
							+ ' </div> </div> </div> </li> ';
							
							
						
							
							
							
							
							
						}
						
					
						setLikeCount(data.statusText);	
					});
					
					document.getElementById("itemListUl").innerHTML = divStr;
					
				});

		
		
	}
	
	
	
	
	</script>
	
	<script type="text/javascript">
		function addCart(id,type) {
			//alert("Ok" +type);
			//alert("--------------- "+document.getElementById("txtWt").value)
		 
			 var prodMaster;
				
				if (sessionStorage.getItem("allItemList") == null) {
					var table = [];
					sessionStorage.setItem("allItemList", JSON.stringify(table));
				}
		
				var allItemList = sessionStorage.getItem("allItemList");
				var prodHead = $.parseJSON(allItemList);
				
				for (var h = 0; h < prodHead.length; h++) {
					if (parseInt(id) == parseInt(prodHead[h].productId)) {
						prodMaster = prodHead[h];
						break;
					}
				}
				
			var selectFlav = 0;
			
			var selectWt = 0;
			
			var selFlvName ="";
			
			if(parseInt(type) == 0){
				//alert("Its zero")
				selectWt = 1;	
					selectWt = document.getElementById("txtWt"+id).value;	
				
				
			}else if(parseInt(type) == 1 || parseInt(type) == 2){
				//alert("Its 1 || 2")
				
				try {
					
					var availablewt =prodMaster.availInWeights.split(",");
					selectWt = availablewt[0];
					
					selectFlav = prodMaster.defaultFlavorId;
					 
					//selFlvName = "akshay";
					var defFlvName =prodMaster.flavorNames.split(",");
					selFlvName=defFlvName[0];
					selectWt = document.getElementById("wt" + id).value;

				} catch (e) {
					selectFlav = 0;
				}
				if (selectFlav == "" || isNaN(selectFlav) || selectFlav == null) {
					selectFlav = 0;
				}
			}
			//alert("type" +type);
				var defFlvName =prodMaster.flavorNames.split(",");
				selFlvName=defFlvName[0];
				var prodDetail = prodMaster.prodDetailList;
				
				
				var actualRate=0;
				var calRate=0;
				var displayRate=0;
				var configDetailId=0;
				var flvId=0;
				var isVeg=0;
				var shapeId=0;
				var flvName=selFlvName;
				
				var qty = 1;
				
				var uniq = (new Date()).getTime();

				for (var d = 0; d < prodDetail.length; d++) {
					
					if(parseInt(type) == 0){
						
						qty=selectWt;
						
						calRate=prodDetail[d].actualRate*selectWt;
						actualRate=prodDetail[d].actualRate;
						displayRate=prodDetail[d].displayRate;
						configDetailId=prodDetail[d].configDetailId;
						flvId=prodDetail[d].flavorId;
						isVeg=prodDetail[d].isVeg;
						shapeId=prodDetail[d].shapeId;
						
						break;
							
					}else if(parseInt(type) == 1){
						
						if (parseInt(prodDetail[d].flavorId) == parseInt(selectFlav)) {
							
							
							//alert("Shape = "+parseInt(prodDetail[d].shapeId)+"             Flv = "+parseInt(selectFlav))
							
							//alert("1  - "+prodDetail[d].configDetailId)
							
							calRate=prodDetail[d].actualRate*selectWt;
							actualRate=prodDetail[d].actualRate;
							displayRate=prodDetail[d].displayRate;
							configDetailId=prodDetail[d].configDetailId;
							flvId=prodDetail[d].flavorId;
							isVeg=prodDetail[d].isVeg;
							shapeId=prodDetail[d].shapeId;
							
							break;
		
						}
						
					} else if(parseInt(type) == 2){
						
						if (parseInt(prodDetail[d].flavorId) == parseInt(selectFlav) && parseFloat(selectWt) == parseFloat(prodDetail[d].qty)) {
							
							calRate=prodDetail[d].actualRate;
							actualRate=prodDetail[d].actualRate;
							displayRate=prodDetail[d].displayRate;
							configDetailId=prodDetail[d].configDetailId;
							flvId=prodDetail[d].flavorId;
							isVeg=prodDetail[d].isVeg;
							shapeId=prodDetail[d].shapeId;
							
							break;
		
						}
						
					} 
		
				}
				
				//alert("HEE"+calRate);
				var priceDiff = parseFloat(displayRate)
						- parseFloat(actualRate);
				
				offPer = (parseFloat(priceDiff)
						/ parseFloat(displayRate) * 100);
		
				taxableAmt = calRate;
		
				cgstAmt = ((calRate) * parseFloat(prodMaster.cgstPer)) / 100;
				sgstAmt = ((calRate) * parseFloat(prodMaster.sgstPer)) / 100;
				igstAmt = ((calRate) * parseFloat(prodMaster.igstPer)) / 100;
		
				taxAmt = (cgstAmt + sgstAmt + igstAmt)
						.toFixed(2);
				
				totalAmt = (parseFloat(taxableAmt)).toFixed(2);
		
				if (sessionStorage.getItem("cartValue") == null) {
					var table = [];
					sessionStorage.setItem("cartValue", JSON
							.stringify(table));
				}
		
				var cartValue = sessionStorage
						.getItem("cartValue");
				var table = $.parseJSON(cartValue);
				
				  if(type==0){
					calRate=actualRate;
				}  
				
				var spInst;
				var msgonCake;
				
			 	if(prodMaster.allowSpecialInstruction==1){
					spInst="NA";
				}

				if(prodMaster.allowMsgOnCake==1){
					msgonCake ="NA";
				} 
				
				

				if (sessionStorage.getItem("cartValue") == null) {
					var table = [];
					sessionStorage.setItem("cartValue", JSON.stringify(table));
				}
		
				var cartValue = sessionStorage.getItem("cartValue");
				var cartArray = $.parseJSON(cartValue);
				
				
				  if (sessionStorage.getItem("prodImageList") == null) {
						var table = [];
						sessionStorage.setItem("prodImageList", JSON
								.stringify(table));
					} 
			   		
				var imgValue = sessionStorage .getItem("prodImageList");
				var imgObj = $.parseJSON(imgValue);
				
				var imgFile="";
				var imgName="";
				if(id==imgObj.itemId){
					imgFile=imgObj.imgFile;
					imgName=imgObj.imgName;
				}
				
				var index=0,itemFound=0;
				
				for(var i=0; i<cartArray.length;i++){
					if(configDetailId==cartArray[i].exInt1 && type==0){
						index=i;
						itemFound=1;
						imgFile : cartArray[i].imgFile;
						imgName : cartArray[i].imgName;
						break;
					}else if(selectWt==cartArray[i].weight && configDetailId==cartArray[i].exInt1){
						//alert("asasas")
						index=i;
						itemFound=1;
						imgFile : cartArray[i].imgFile;
						imgName : cartArray[i].imgName;
						break;
					}
					//alert(selectWt+"      "+cartArray[i].qty+"         Type - "+type)
					
					
				}
				
				var obj={
						uniqueId : uniq,
						orderDetailId : 0,
						orderId : 0,
						itemId : prodMaster.productId,
						hsnCode : prodMaster.hsnCode,
						qty : qty,
						mrp : displayRate,
						rate : calRate,
						taxableAmt : taxableAmt,
						cgstPer : prodMaster.cgstPer,
						sgstPer : prodMaster.sgstPer,
						igstPer : prodMaster.igstPer,
						cgstAmt : cgstAmt,
						sgstAmt : sgstAmt,
						igstAmt : igstAmt,
						discAmt : 0,
						taxAmt : taxAmt,
						totalAmt : totalAmt,
						delStatus : 1,
						remark : '',
						exInt1 : configDetailId,
						exInt2 : flvId,
						exInt3 : isVeg,
						exInt4 : shapeId,
						exVar1 : prodMaster.productName,
						exVar2 : '',
						exVar3 : '',
						exVar4 : '',
						exFloat1 : 1,
						exFloat2 : 1,
						exFloat3 : 1,
						exFloat4 : 1,
						weight : selectWt,
						veg : "",
						rateSettingType : type,
						flvName : flvName,
						imgFile : imgFile,
						imgName : imgName,
						spInst : spInst,
						msgonCake : msgonCake
					}
				
				
				
				if(itemFound==1){
					table[index]=obj;
				}else{
					table.push(obj);	
				}
				
				var tableClear = [];
				sessionStorage.setItem("prodImageList", JSON
						.stringify(tableClear));
				
				sessionStorage.setItem("cartValue", JSON
						.stringify(table));
				updateFirebase();
				
				appendCartData();
				openNav();
			  	setTimeout(function(){ closeNav(); }, 4000);
		} 
		</script>
		
		<script type="text/javascript">
		
		function setQtyText(id, type) {

			/* type  :  0 - minus,  1 - plus */
			
			var wt=document.getElementById("txtWt"+id).value;
		//alert(id+"    "+type+ "     "+wt)
		
		//alert(detailList);
			
			/* if(type==0){
			
				var newWt=wt+1;
				if(wt>1 && wt<=10){
					wt=parseInt(wt)-1;
				}
				
			}
			
			else if(type==1){
				if(wt>=1 && wt<10){
					wt=parseInt(wt)+1;
				}
			} */
			var maxValue=document.getElementById("maxValue").value;
			if(type==0){
				var newWt=wt+1;
				if(parseInt(wt)>1 && wt<=parseInt(maxValue)){
					wt=parseInt(wt)-1;
				}
			}
			else if(type==1){
				if(parseInt(wt)>=1 && parseInt(wt)<parseInt(maxValue)){
					wt=parseInt(wt)+1;
				}
			}

			document.getElementById("txtWt"+id).value=wt;
			
			
			if (sessionStorage.getItem("allItemList") == null) {
				var table = [];
				sessionStorage.setItem("allItemList", JSON.stringify(table));
			}

			var allItemList = sessionStorage.getItem("allItemList");
			var allItemArr = $.parseJSON(allItemList);

			var rate=0;
			
			for(var i=0;i<allItemArr.length;i++){
				
				if(allItemArr[i].productId==id){
			
					rate=parseFloat(allItemArr[i].prodDetailList[0].actualRate);
				}
				
			}
			
			rate=rate*wt;
			
			//27-04document.getElementById("newPrice"+id).innerHTML=rate.toFixed(1);
			document.getElementById("newPrice"+id).innerHTML=rate.toFixed(1);


		}
		
		</script>
<jsp:include page="/WEB-INF/views/include/qty_validation.jsp"></jsp:include>
</body>

</html>