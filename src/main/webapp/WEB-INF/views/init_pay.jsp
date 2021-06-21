<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Info</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/fevicon.png"
	type="images/png" sizes="32x32">
</head>
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
<body >
<button id="rzp-button1" style="display:none;">Pay ${sessionScope.userName}</button>
<div class="pay_btn">
<a href="${pageContext.request.contextPath}/checkout/0" class="goback_btn">Go Back</a>
<a href="#" onclick="openPayBox()" class="makepay_btn">Make Payment</a>
</div>

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "rzp_live_1xwIfbV7BUaBxt", // Enter the Key ID generated from the Dashboard
   "amount": "${amount}", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
 //"amount": "100", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise

    "currency": "INR",
    "name": "Pay To Monginis",
    "description": "Order Value from  ${sessionScope.userName}",
    "image": "${pageContext.request.contextPath}/resources/images/logo_monginis-trasPng.png",
    "order_id": "${orderId}",
    //"callback_url": "https://pecom.monginis.net/ecom/payResponse",
   "callback_url": "http://localhost:8080/ecommerce/payResponse",
    "prefill": {
        "name": "${sessionScope.userName}",
        "email": "${sessionScope.userEmail}",
        "contact": "${sessionScope.userMobile}",
    },
    "notes": {
        "address": "${sessionScope.landMark}"
    },
    "theme": {
       "color": "#ec268f"
    	// "color": "orange"
    }
};

var rzp1 = new Razorpay(options);
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
document.getElementById('rzp-button1').onclick();
function openPayBox(){
	document.getElementById('rzp-button1').onclick();

}
</script>
</body>
</html>