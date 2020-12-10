<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Info</title>
</head>
<body >
<button id="rzp-button1">Pay</button>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "rzp_test_1eXaKykckwM8kP", // Enter the Key ID generated from the Dashboard
    "amount": "100", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "Akki Corp",
    "description": "Test Transaction",
    "image": "https://example.com/your_logo",
    //"order_id": '${orderId}', This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "callback_url": "http://localhost:8989/ecommerce/payResponse",
    "prefill": {
        "name": "Akshay Kumar",
        "email": "akshaykasar72@gmail.com",
        "contact": "7588519473"
    },
    "notes": {
        "address": "Razorpay Corporate Office"
    },
    "theme": {
        "color": "#3399cc"
    }
};

var rzp1 = new Razorpay(options);
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
document.getElementById("rzp-button1").onclick();
</script>
</body>
</html>