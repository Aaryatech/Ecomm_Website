<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="utf-8" />
<title>Monginis Order Confirmation</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="">
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/fevicon.png"
	type="images/png" sizes="32x32">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<!--font-family: 'Rubik', sans-serif;-->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/stylesheet.css"
	type="text/css" />
<style>
.pay_btn{    display: block;
    width: 100%;

    text-align: center;
    vertical-align: 100vh;
    padding: 100px 0;}
.pay_btn a{padding: 10px 20px;
    border-radius: 5px;
    margin: 0 5px;    
    height: 20px;
    vertical-align: middle;
    height: 20px;
    display: inline-block; text-decoration: none;}
.goback_btn{background: #ec268f; color: #FFF; font-size: 16px;}
.goback_btn:hover{background: #373991; color: #FFF;}
.makepay_btn{background: #373991; color:#FFF; font-size:16px;}
.makepay_btn:hover{background: #ec268f; color: #FFF;}
</style>
<!--jquery-min-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/otherresources/js/jquery.popupoverlay.js"></script>    
	
<!--jquery-min-->

 <script>
$(document).ready(function () {
	

    $('#fade').popup({
      transition: 'all 0.3s',
      scrolllock: true
    });
    document.getElementById('auto_popup').click();
});
function openPayBox(){
	document.getElementById('auto_popup').click();

}
</script>
    <script type="text/javascript">
    $(window).load(function() {			try{
				var isPaid=${payStatus}
				console.log('isPaid',isPaid);
				//alert("isPaid "+isPaid)
				if(parseInt(isPaid)==2){ 
					var table = [];
				sessionStorage.setItem("cartValue", JSON
						.stringify(table));
				sessionStorage.setItem("prodImageList", JSON
						.stringify(table));
				updateFirebase();
				//location.reload();
				}
			}catch (e) {
				alert(e)
			}
			 
		});
		
		/* $(window).load(function() {
			 // executes when complete page is fully loaded, including all frames, objects and images
			 alert("window is loaded");
			}); */
		
	</script>





</head>
<body>

<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/8.6.7/firebase-app.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.6.7/firebase-database.js"></script>

	<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->

	<script>
		// Your web app's Firebase configuration
		var firebaseConfig = {
			apiKey : "AIzaSyDigzfh2ygt26QhXa7YoJrmNqOdx126oWg",
			authDomain : "gfplsecurityapp.firebaseapp.com",
			databaseURL : "https://gfplsecurityapp.firebaseio.com",
			projectId : "gfplsecurityapp",
			storageBucket : "gfplsecurityapp.appspot.com",
			messagingSenderId : "1093488930367",
			appId : "1:1093488930367:web:674415ee8c528ae737928a"
		};
		// Initialize Firebase
		firebase.initializeApp(firebaseConfig);

		var cart_tab = 'cart_value';
		const dbrefObject = firebase.database().ref(cart_tab);
		
		function updateFirebase() {
			//alert("hieeee");
			//var mob = '7588519473';
			var mob='${sessionScope.mobNo}';
			firebase.database().ref(
					"cart_value/" + mob
							+ "/cart_value").set(sessionStorage.getItem("cartValue"));
		}
	</script>
    <div class="initialism fade_open" href="#fade"><a href="#" id="auto_popup" style="display: none;">Order Confirmation</a></div>
    
    <div class="pay_btn">
<a href="${pageContext.request.contextPath}/home" class="goback_btn">Go Back</a>
<a href="#" onclick="openPayBox()" class="makepay_btn">Make Payment</a>
</div>
<div id="fade" class="well">
        <div class="fade_close close_btn" onclick="goHome()"><i class="fa fa-times"   aria-hidden="true"></i></div>
        <div class="back_button">
						<a href="${pageContext.request.contextPath}/orderhistory"
							class="profile_back"><i class="fa fa-chevron-left"
							aria-hidden="true"></i> Back to profile</a>
					</div>
        
        <div class="title_area">
                    <h2 class="thanks_msg">Thank you for your order</h2>
                    <p>${orderSaveData.insertDateTime}</p>
                </div> 
        
        <div class="delivery_add">
                    <div class="delivery_dt">
                            
                            <div class="delivery_one left_side extra_marg">
                                Name:
                                <span>${orderSaveData.custName}</span>
                            </div>
                        
                        <div class="delivery_one left_side extra_marg">
                                Order Number:
                                <span># ${orderSaveData.orderNo}</span>
                            </div>
                        
                            <div class="delivery_one left_side extra_marg">
                                Delivery Date :
                                <span> ${orderSaveData.deliveryDate}</span>
                                <span> ${orderSaveData.exVar3} </span>
                            </div>
                        
                            <div class="delivery_one left_side">
                                Payment Information :
                                <c:choose>
                                <c:when test="${orderSaveData.paymentMethod==1}">
                                 <span>Cash On Delivery</span>
                                </c:when>
                                <c:otherwise>
                                   <span>Online Payment Ref No. ${orderSaveData.paymentRemark}</span>
                                </c:otherwise>
                                </c:choose>
                             
                            </div>
                    </div>
                    <div class="delivery_dt">
                        <div class="delivery_one extra_marg">
                            Your order will be sent to:
                            <span>${orderSaveData.address}</span>
                        </div>    
                        <div class="delivery_one left_side">
                                Delivery Charges :
                                <span>${orderSaveData.deliveryCharges}</span>
                            </div>
                            
                            <div class="delivery_one left_side">
                                Order Total :
                                <span>${orderSaveData.exFloat1}</span>
                            </div>
                        <div class="delivery_one left_side">
                                 Total :
                                <span>${orderSaveData.totalAmt}</span>
                            </div>
                    </div>
                    <div class="clr"></div>
                </div>
        
        <div class="order_det_bx">
                    <div class="order_head">Order Details</div>
                    <c:set var="imagePart1" value="${orderSaveData.imgList}" />
                   <%--  // <c:set var="imagePart2" value="${imagePart1.exVar1}" /> --%>
                      <c:set var="imagePart" value="${fn:split(imagePart1, '~')}" />
                  
            <!--product-row-1-->
            <c:forEach items="${orderSaveData.detailList}" var="detailList" varStatus="detailCount">
                    <div class="order_one">
                       <%--  <div class="order_pic"><img src="${prodImgUrl}${detailList.exVar4}" alt="na" width="102"></div>
                        
                        <div class="order_pic_r"><img src="${prodUplImgUrl}${imagePart[detailCount.index]}" alt="" ></div>
                         --%>
                         
<%--                           <div class="order_pic"><img src="${prodImgUrl}${imagePart[detailCount.index]}" onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'" width="102"></div>
 --%>
                           <div class="order_pic"><img src="${prodImgUrl}${detailList.remark}" onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'" width="102"></div>
                         
                        <div class="order_pic_r"><img src="${prodUplImgUrl}${detailList.exVar4}" onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'" ></div>
                        
                        <div class="order_cont">
                            <h3 class="cake_nm">${detailList.itemName} <c:if test="${detailList.exInt1!=0}">
												, ${detailList.filterName} 
											</c:if></h3>
											
											<c:choose>
									<c:when test="${detailList.exVar2 == null}">

									</c:when>
									<c:otherwise>
										<h4 class="item_no">
											Message on Cake : <span>${detailList.exVar2}</span>
										</h4>
									</c:otherwise>
								</c:choose>
                            <div class="table_list">
                                <ul>
                                    <%-- <li>Item Price : <span><fmt:formatNumber
													type="number" groupingUsed="false"
													value="${detailList.totalAmt}" maxFractionDigits="0"
													minFractionDigits="0" /></span></li> --%>
													
													<li>Item Price : <span><fmt:formatNumber
													type="number" groupingUsed="false"
													value="${detailList.rate}" maxFractionDigits="0"
													minFractionDigits="0" /></span></li>
                                    <c:choose>
											<c:when test="${detailList.exInt1==0}">
												<li>Qty : <span><fmt:formatNumber type="number"
															groupingUsed="false" value="${detailList.qty}"
															maxFractionDigits="0" minFractionDigits="0" /></span></li>
											</c:when>
											<c:otherwise>
												<li>Weight : <span>${detailList.exFloat3}</span></li>
											</c:otherwise>
										</c:choose>
                                    <li>Total : <span><fmt:formatNumber type="number"
													groupingUsed="false" value="${detailList.rate*detailList.qty}"
													maxFractionDigits="0" minFractionDigits="0" /></span></li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="clr"></div>
                    </div>
                    </c:forEach>
                    
                    <!--product-row-2-->
                    <!--<div class="order_one">
                        <div class="order_pic"><img src="images/cake_pic.jpg" alt="" width="140" ></div>
                        <div class="order_cont">
                            <h3 class="cake_nm">Classic Red Velvet Cake</h3>
                            <h4 class="item_no">Message on Cake : <span>Happy Birthday Sachin</span></h4>
                            <div class="table_list">
                                <ul>
                                    <li>Item Price : <span>250.00</span></li>
                                    <li>Qty :  <span>02</span></li>
                                    <li>Total :  <span>500.00</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="order_pic_r"><img src="images/cake_pic.jpg" alt="" ></div>
                        <div class="clr"></div>
                    </div>-->
                    
                    
                    <!--<div class="order_total">
                        <div class="order_blnk">&nbsp;</div>
                        <div class="order_prc">
                            <h2 class="purchase_info">Purchase Information</h2>
                            <div class="purchase_count">
                                <div class="purchase_one">Subtotal <span>Rs. 423.19</span></div>
                                <div class="purchase_one">Shipping <span>Rs. 00.00</span></div>
                                <div class="purchase_one">Payment Information <span>123456</span></div>
                                <div class="purchase_one">Estimated Sales Tax <span>Rs. 35.19</span></div>
                                
                            </div>  
                            <div class="purchase_total">
                                    Order Total <span>Rs.12345</span>
                                </div>
                        </div>
                        <div class="clr"></div>
                    </div>-->
                    
                    
                    
                </div>
</div>
<!--ENd of new popup  -->


	<%-- <div class="page_div">
		<div class="wrapper">
			<div class="order_bx">



				<!--page title box-->
				<div class="title_area">
					<img
						src="${pageContext.request.contextPath}/resources/images/logo.jpg"
						alt="">
					<h2 class="thanks_msg">Thank you for your order</h2>

					<!-- <h2 class="thanks_msg error ">Error Message Put here</h2> -->

					<div class="back_button">
						<a href="${pageContext.request.contextPath}/orderhistory"
							class="profile_back"><i class="fa fa-chevron-left"
							aria-hidden="true"></i> Back to profile</a>
					</div>

					<h6 class="thanks_no">Hi, ${orderSaveData.custName}, we
						received your order and are working on it now. We'll notify you an
						update as soos as your order is proceed.</h6>
				</div>

				<!--delivery address box-->
				<div class="delivery_add">
					<div class="delivery_dt">

						<div class="delivery_one extra_marg">
							Delivery date : <span>${orderSaveData.deliveryDate}</span>
						</div>

						<!-- <div class="delivery_one">
							Your Shipping Speed: <span>Standard Shipping.</span>
						</div> -->

					</div>
					<div class="delivery_dt">
						<div class="delivery_one">
							Your order will be sent to: <span>${orderSaveData.address}</span>
						</div>
					</div>
					<div class="clr"></div>
				</div>

				<!-- Item Order box -->
				<div class="order_det_bx">
					<div class="order_head">Order Details</div>

					<c:forEach items="${orderSaveData.detailList}" var="detailList">
						<div class="order_one">
							<!-- <div class="order_pic">
								<img src="images/cake_pic.jpg" alt="" width="140">
							</div> -->
							<div class="order_cont">
								<h3 class="cake_nm">${detailList.itemName}
									<c:if test="${detailList.exInt1!=0}">
												, ${detailList.filterName} 
											</c:if>
								</h3>
								<c:choose>
									<c:when test="${ detailList.exVar2 == null}">

									</c:when>
									<c:otherwise>
										<h4 class="item_no">
											Message on Cake : <span>${detailList.exVar2}</span>
										</h4>
									</c:otherwise>
								</c:choose>
								<div class="table_list">
									<ul>
										<li>Item Price : <span><fmt:formatNumber
													type="number" groupingUsed="false"
													value="${detailList.totalAmt}" maxFractionDigits="0"
													minFractionDigits="0" /></span></li>
										<c:choose>
											<c:when test="${detailList.exInt1==0}">
												<li>Qty : <span><fmt:formatNumber type="number"
															groupingUsed="false" value="${detailList.qty}"
															maxFractionDigits="0" minFractionDigits="0" /></span></li>
											</c:when>
											<c:otherwise>
												<li>Weight : <span>${detailList.exFloat3}</span></li>
											</c:otherwise>
										</c:choose>

										<li>Total : <span><fmt:formatNumber type="number"
													groupingUsed="false" value="${detailList.totalAmt}"
													maxFractionDigits="0" minFractionDigits="0" /></span></li>
									</ul>
								</div>
							</div>
							<!-- <div class="order_pic_r">
								<img src="images/cake_pic.jpg" alt="" width="100">
							</div> -->
							<div class="clr"></div>
						</div>
					</c:forEach>
					<!--product-row-1-->


					<!--product-row-2-->
					<!-- <div class="order_one">
						<div class="order_pic">
							<img src="images/cake_pic.jpg" alt="" width="140">
						</div>
						<div class="order_cont">
							<h3 class="cake_nm">Classic Red Velvet Cake</h3>
							<h4 class="item_no">
								Message on Cake : <span>Happy Birthday Sachin</span>
							</h4>
							<div class="table_list">
								<ul>
									<li>Item Price : <span>250.00</span></li>
									<li>Qty : <span>02</span></li>
									<li>Total : <span>500.00</span></li>
								</ul>
							</div>
						</div>
						<div class="order_pic_r">
							<img src="images/cake_pic.jpg" alt="" width="100">
						</div>
						<div class="clr"></div>
					</div> -->


					<div class="order_total">
						<div class="order_blnk">&nbsp;</div>
						<div class="order_prc">
							<h2 class="purchase_info">Purchase Information</h2>
							<!-- <div class="purchase_count">
								<div class="purchase_one">
									Subtotal <span>Rs. 423.19</span>
								</div>
								<div class="purchase_one">
									Shipping <span>Rs. 00.00</span>
								</div>
								<div class="purchase_one">
									Payment Information <span>123456</span>
								</div>
								<div class="purchase_one">
									Estimated Sales Tax <span>Rs. 35.19</span>
								</div>

							</div> -->
							<div class="purchase_total">
								Order Total <span>Rs. <fmt:formatNumber type="number"
										groupingUsed="false" value="${orderSaveData.totalAmt}"
										maxFractionDigits="0" minFractionDigits="0" /></span>
							</div>
						</div>
						<div class="clr"></div>
					</div>

				</div>

			</div>
		</div>
	</div> --%>

</body>
<script type="text/javascript">
function goHome(){
	var url = '${pageContext.request.contextPath}/home';
	window.location = url;
}</script>
</html>