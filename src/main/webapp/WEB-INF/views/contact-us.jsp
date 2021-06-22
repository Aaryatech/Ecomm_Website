<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Monginis</title>
<jsp:include page="/WEB-INF/views/include/othercssjs.jsp"></jsp:include>

<%--   <jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
 --%> 
 </head>
<body>
	<jsp:include page="/WEB-INF/views/include/tags.jsp"></jsp:include>

<!--mongi help-popup-->    
<%-- <div class="mongi_help"><a href="#mongi" class="initialism mongi_open"><img src="${pageContext.request.contextPath}/resources/otherresources/images/mongi_help.png" alt=""></a></div> 
    
<!--apply now pop up-->
    <div id="mongi" class="well">
      <div class="mongi_title"><span><a href="#"> Clear</a></span>   Select Our Best Filter <div class="mongi_close close_pop"><i class="fa fa-times" aria-hidden="true"></i></div></div>
        <div class="mongi_cont">
            <ul class="ks-cboxtags">
    <li><input type="checkbox" id="checkboxOne" ><label for="checkboxOne">Chocolate Cakes</label></li>
    <li><input type="checkbox" id="checkboxtwo" ><label for="checkboxtwo">Exotic Cakes</label></li>
    <li><input type="checkbox" id="checkboxthree" ><label for="checkboxthree">Black Forest Cakes</label></li>
    <li><input type="checkbox" id="checkboxfour" ><label for="checkboxfour">Designer Cakes</label></li>
    <li><input type="checkbox" id="checkboxfive"><label for="checkboxfive">Derpy Hooves</label></li>
    <li><input type="checkbox" id="checkboxsix" ><label for="checkboxsix">Party Celebration Cakes</label></li>
    <li><input type="checkbox" id="checkboxseven" ><label for="checkboxseven">Wedding Cakes</label></li>
    <li><input type="checkbox" id="checkboxeight" ><label for="checkboxeight">Photo Cakes</label></li>
    <li><input type="checkbox" id="checkboxnine" ><label for="checkboxnine">Cakes For Kids</label></li>
    <li><input type="checkbox" id="checkboxten"><label for="checkboxten">Medley</label></li>
    <li><input type="checkbox" id="checkboxeleven" ><label for="checkboxeleven">Party Celebration Cakes</label></li>
        
    <li><input type="checkbox" id="checkboxtwel" ><label for="checkboxtwel">Pizza</label></li>
    <li><input type="checkbox" id="checkboxthirteen" checked><label for="checkboxthirteen">Sandwich</label></li>
    <li><input type="checkbox" id="checkboxfourteen"><label for="checkboxfourteen">Fish</label></li>
    <li><input type="checkbox" id="checkboxfifteen"><label for="checkboxfifteen">Desert</label></li>
    <li><input type="checkbox" id="checkboxsixteen" ><label for="checkboxsixteen">Salad</label></li>
    <li><input type="checkbox" id="checkboxseventeen"><label for="checkboxseventeen">Italian</label></li>
    <li><input type="checkbox" id="checkboxeighteen"><label for="checkboxeighteen">Indian</label></li>
    <li><input type="checkbox" id="checkboxninteen"><label for="checkboxninteen">Derpy Hooves</label></li>
    <li><input type="checkbox" id="checkboxtwenteen"><label for="checkboxtwenteen">Princess Celestia</label></li>
    <li><input type="checkbox" id="checkboxtwenone"><label for="checkboxtwenone">Gusty</label></li>
    <li ><input type="checkbox" id="checkboxtwentwo"><label for="checkboxtwentwo">Discord</label></li>
    <li><input type="checkbox" id="checkboxtewnthree"><label for="checkboxtewnthree">Clover</label></li>
    <li><input type="checkbox" id="checkboxTwenfour"><label for="checkboxTwenfour">Baby Moondancer</label></li>
    <li><input type="checkbox" id="checkboxtwenfive"><label for="checkboxtwenfive">Medley</label></li>
    <li><input type="checkbox" id="checkboxtwensix"><label for="checkboxtwensix">Firefly</label></li>
    <li><input type="checkbox" id="checkboxtwenseven"><label for="checkboxtwenseven">Princess Celestia</label></li>
    <li><input type="checkbox" id="checkboxtweneight"><label for="checkboxtweneight">Gusty</label></li>
    <li ><input type="checkbox" id="checkboxtwennine"><label for="checkboxtwennine">Discord</label></li>
    <li><input type="checkbox" id="checkboxthirtee"><label for="checkboxthirtee">Clover</label></li>
    <li><input type="checkbox" id="checkboxthirteeone"><label for="checkboxthirteeone">Baby Moondancer</label></li>            
  </ul>
            
            
            
        </div>
        
        <div class="proceend_bnt"> <a href="product.html" class="proceed_btn">Proceed</a></div>
        
    </div> --%>
    <script type="text/javascript">
    $(document).ready(function () {
      $('#mongi').popup();
    });
    </script>    
    
    
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>  
<div class="head_marg">  
<!--product listing-->    
    <div class="find_store with_bread"><!--with_bread-->
        <div class="wrapper">
            <div class="breadcrums"><a href="home.html">Home</a>    <i class="fa fa-angle-right" aria-hidden="true"></i> Contact Us
        </div>
            
            
            <h2 class="sec_title">
                <center>${cus.pageHead}
                <span>${cus.subHeading}</span></center> 
            </h2><!-- Get in Touch -->
            <!-- Here's How You Can Reach Us -->
				<%
					if (session.getAttribute("successMsg") != null) {
				%> 
				<div class="contact_row" style="margin-bottom: 30px; position: relative;" id="final_msg">
				<i class="fa fa-times" aria-hidden="true" style="position: absolute; right: 10px; top: 10px; color: #fff; font-size: 13px;" id="cls_btn"></i>
				<div 
					class="contact_sucs_msg"
					class="alert bg-success text-white alert-styled-left alert-dismissible">
					<span class="font-weight-semibold"> Thank you
						for getting in touch! <br> We appreciate you contacting us. One of our colleagues will get back in touch with
						you soon! Have a great day!
					</span>
				</div></div>
				 <%
					session.removeAttribute("successMsg");
					}
				%>  
				<div class="contact_row">
                
                <div class="contact_add">
                    
                    <div class="call_r">                    
                        <i class="fa fa-phone" aria-hidden="true"></i>
                        <h2 class="off_address">${cus.phoneText}</h2><!-- PHONE NUMBER -->
                        Mobile : +91 ${cus.phone1} <br>
                        Landline: +91 ${cus.phone2}
                    </div> 
                    
                    <div class="call_r">                    
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                        <h2 class="off_address">${cus.emailText}</h2><!-- EMAIL ADDRESS -->
                        <a href="${cus.email1}">${cus.email1}</a>/
                        <a href="${cus.email2}">${cus.email2}</a>
                    </div> 
                    
                    <div class="call_r">                    
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                        <h2 class="off_address">${cus.officeText}</h2><!-- Corporate Office -->
                        ${cus.officeAddress}
                        <!-- Shop 57, Near Shri Bhagvati Hotel Puriya Park Road Panchvati Karanje, Mashik, Maharashtra 422003. -->
                    </div>
                    
                    <div class="call_r">                    
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                        <h2 class="off_address">${cus.manufacAddressTxt}</h2><!-- Manufacture Address -->
                        ${cus.manufacAddress}
                        <!-- Shop 57, Near Shri Bhagvati Hotel Puriya Park Road Panchvati Karanje, Mashik, Maharashtra 422003. -->
                    </div>
                </div>
                
                <!--right form start here-->
                <div class="contact_frm">
                    <form action="${pageContext.request.contextPath}/mailVistorInfo" method="post" id="submitInsert">
                        <!--<h5 class="touch_title">
                            Get in Touch
                            <span>Please fill out the quick form and we will be in touch with lightening speed.</span>
                        </h5>-->
                        
                        <div class="frm_bx">
                            <div class="frm_one">
                                <div class="frm_one_l"><input name="firstName" id="firstName" type="text" class="input_two txt-val" placeholder="First Name" autocomplete="off"/>
                                   <span class="validation-invalid-label text-danger"
									id="error_firstName" style="display: none; color: red;">This field
												is required.</span></div>
									
                                <div class="frm_one_r"><input name="lastName" id="lastName" type="text" class="input_two txt-val" placeholder="Last Name" autocomplete="off"/>
                                   <span class="validation-invalid-label text-danger"
									id="error_lastName" style="display: none; color: red;">This field
												is required.</span></div>
                                <div class="clr"></div>                                     
                            </div>
                            <div class="frm_one">
                                <div class="frm_one_l"><input name="contactNo" id="contactNo" type="text" class="input_two num" placeholder="Phone Number" maxlength="10" autocomplete="off"/>
                                <span class="validation-invalid-label text-danger"
									id="error_contactNo" style="display: none; color: red;">This field
												is required.</span></div>  
                               
                                <div class="frm_one_r"><input name="email" id="email" type="text" class="input_two txt-mail" placeholder="Email Address" autocomplete="off"/>
                                <span class="validation-invalid-label text-danger"
									id="error_email" style="display: none; color: red;">Invalid email address.</span></div>
                                <div class="clr"></div>                                     
                            </div>
                            
                            <div class="frm_one">
                                <textarea name="message" id="msg" cols="" rows="5" class="input_two" placeholder="Enter Your Message"></textarea>
                                <span class="validation-invalid-label text-danger"
									id="error_msg" style="display: none; color: red;">This field
												is required.</span>
                            </div>
                            <div><input name="" type="submit" class="sub_btn" value="Submit" /></div>
                        </div>
                        
                    </form>
                </div>
                <!--right form close here-->
                
                
                
                <div class="clr"></div>
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
                    <img src="${pageContext.request.contextPath}/resources/otherresources/images/secure_icn.png" alt="">
                    100% Secure Payments <span>All major credit &amp; debit cards accepted</span></div>
            </li>
            <li>
                <div class="strip_payment extra_padd">
                    <img src="${pageContext.request.contextPath}/resources/otherresources/images/customer.png" alt="">
                    3,000,000 <span>Customers across the world</span></div>
            </li>
            <li>
                <div class="strip_payment extra_padd">
                    <img src="${pageContext.request.contextPath}/resources/otherresources/images/gifts.png" alt="">
                    2 Million+ Gift <span>boxes delivered worldwide</span></div>
            </li>
        </ul>
    </div>
</div>
    
<!--footer start here-->
<!--footer start here-->
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/otherresources/js/menuzord.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#menuzord").menuzord({
		align:"left"
	});
});
</script>
<!--menuzord-->
    
    <script type="text/javascript">
        jQuery(document).ready(function(){
    // This button will increment the value
    $('.qtyplus').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If is not undefined
        if (!isNaN(currentVal)) {
            // Increment
            $('input[name='+fieldName+']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
    // This button will decrement the value till 0
    $(".qtyminus").click(function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 0) {
            // Decrement one
            $('input[name='+fieldName+']').val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
});
    </script>
    

<!--slick slider-->
<script src="${pageContext.request.contextPath}/resources/otherresources/js/slick.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).on('ready', function() {
      $(".regular").slick({
        dots: true,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        responsive: [
    {
        breakpoint: 1024,
        settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        dots: true
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
		      });
    
    $(".regular-cake").slick({
        dots: true,
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        responsive: [
    {
        breakpoint: 1024,
        settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        dots: true
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
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
$('.dropdown').click(function () {
        $(this).attr('tabindex', 1).focus();
        $(this).toggleClass('active');
        $(this).find('.dropdown-menu').slideToggle(300);
    });
    $('.dropdown').focusout(function () {
        $(this).removeClass('active');
        $(this).find('.dropdown-menu').slideUp(300);
    });
    $('.dropdown .dropdown-menu li').click(function () {
        $(this).parents('.dropdown').find('span').text($(this).text());
        $(this).parents('.dropdown').find('input').attr('value', $(this).attr('id'));
    });
/*End Dropdown Menu*/
    
    $('.dropdown2').click(function () {
        $(this).attr('tabindex', 1).focus();
        $(this).toggleClass('active');
        $(this).find('.dropdown-menu').slideToggle(300);
    });
    $('.dropdown2').focusout(function () {
        $(this).removeClass('active');
        $(this).find('.dropdown-menu').slideUp(300);
    });
    $('.dropdown2 .dropdown-menu li').click(function () {
        $(this).parents('.dropdown2').find('span').text($(this).text());
        $(this).parents('.dropdown2').find('input').attr('value', $(this).attr('id'));
    });
</script>    
<script type="text/javascript">
    $(function () {
        $(".txt-val").keypress(function (e) {
            var keyCode = e.keyCode || e.which; 
            
            //Regex for Valid Characters i.e. Alphabets and Numbers.
            var regex = /^[A-Za-z]+$/;
 
            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(keyCode));           
 
            return isValid;
        });
    });
    
    $('.num').on('input', function() {
    	 this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
    	});

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
								
								if (!$("#firstName").val()) {
									isError = true;
									$("#error_firstName").show()
								} else {
									$("#error_firstName").hide()
								}
								
								if (!$("#lastName").val()) {
									isError = true;
									$("#error_lastName").show()
								} else {
									$("#error_lastName").hide()
								}
								
								if (!$("#contactNo").val()) {
									isError = true;
									$("#error_contactNo").show()
								} else {
									$("#error_contactNo").hide()
								}
								
								if (!$("#msg").val()) {
									isError = true;
									$("#error_msg").show()
								} else {
									$("#error_msg").hide()
								}

						
								if (!$("#email").val()
										|| !validateEmail($(
												"#email").val())) {
									isError = true;
									$("#error_email").show()
								} else {
									$("#error_email").hide()
								}

								if (!isError) {
									var x = true;
									if (x == true) {
										document
												.getElementById("submtbtn").disabled = true;
										return true;
									}
								}

								return false;

							});
			
		});

function validateEmail(email) {
	var eml = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	if (eml.test($.trim(email)) == false) {
		return false;
	}
	return true;
}


$( document ).ready(function() {
	setTimeout(function(){$('#final_msg').fadeOut();}, 60000);
});

$( "#firstName,#lastName,#email,#contactNo" ).on( "copy cut paste drop", function() {
    return false;
});

$( "#cls_btn" ).click(function() {
	  $("#final_msg").hide();
	});
</script>
  
    
</body>

</html>
