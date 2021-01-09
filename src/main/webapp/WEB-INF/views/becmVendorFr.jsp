<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Monginis</title>
<jsp:include page="/WEB-INF/views/include/othercssjs.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
</head>
<body>
  


       
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include> 

<div class="head_marg">  
    
<!--product listing-->    
    <div class="find_store with_bread"><!--with_bread-->
        <div class="wrapper">
            <div class="breadcrums">
                <a href="home.html">Home</a> 
                <i class="fa fa-angle-right" aria-hidden="true"></i> 
                Become a Franchisee
            </div>
            
            
            <h2 class="sec_title">
                <center>Become a <i id="typeTitle"></i>
                <span>Looking for a Partner</span></center> 
            </h2>
            
            <div class="contact_row">
                
                <div class="contact_add">
                    <div class="step_bx">
                        <h3 class="store_title">
                            What will be net step?
                            <span>You are one step closer to build your perfect product</span>
                        </h3>
                        
                        <div class="proposal_1">
                            <i class="fa fa-circle-o" aria-hidden="true"></i>
                            <h4><span>1.</span> We'll prepare a proposal</h4>
                            <p>Required scope, timeline and apr. price will be included if you provides us with detail information about a project.</p>
                        </div>
                        
                        <div class="proposal_1">
                            <i class="fa fa-circle-o" aria-hidden="true"></i>
                            <h4><span>2.</span> Together we discuss it</h4>
                            <p>Required scope, timeline and apr. price will be included if you provides us with detail information about a project.</p>
                        </div>
                        
                        <div class="proposal_1 last">
                            <i class="fa fa-circle-o" aria-hidden="true"></i>
                            <h4><span>3.</span> Let's start building</h4>
                            <p>Required scope, timeline and apr. price will be included if you provides us with detail information about a project.</p>
                        </div>
                        
                    </div>
                    
                </div>
                
                <!--right form start here-->
                <div class="contact_frm">
                    <form action="${pageContext.request.contextPath}/mailBcmPartnrmail" method="post" id="submitInsert">
                        <!--<h5 class="touch_title">
                            Get in Touch
                            <span>Please fill out the quick form and we will be in touch with lightening speed.</span>
                        </h5>-->
                        
                        
                        
                        <div class="frm_bx">
                            
                            <div class="frm_one">
                            <div class="radio_1 franchisee">
                                  <ul>
                                  <li>
                                    <input type="radio" id="a-option" name="valSlct" value="1" onclick="chngTitle(this.value)" checked="checked">
                                    <label for="a-option">Become a Vendor</label>
                                    <div class="check"></div>
                                  </li>

                                  <li>
                                    <input type="radio" id="b-option" name="valSlct" value="2" onclick="chngTitle(this.value)">
                                    <label for="b-option">Become a Franchise</label>
                                    <div class="check"><div class="inside"></div></div>
                                  </li>
                                  
                                   <li>
                                    <input type="radio" id="c-option" name="valSlct" value="3" onclick="chngTitle(this.value)">
                                    <label for="c-option">Corporate Gift</label>
                                    <div class="check"><div class="inside"></div></div>
                                  </li>

                                </ul>
                                </div>
                            <div class="clr"></div>
                        </div>
                            
                            
                            <div class="frm_one">
                                <div class="frm_one_l"><input name="firstName" id="firstName" type="text" class="input_two" placeholder="First Name" /></div>
                                <span class="validation-invalid-label text-danger" id="error_firstName" style="display: none;">This field is required.</span>	
                              
                                <div class="frm_one_r"><input name="lastName" id="lastName" type="text" class="input_two" placeholder="Last Name" /></div>
                                <span class="validation-invalid-label text-danger" id="error_lastName" style="display: none;">This field is required.</span>	
                              <div class="clr"></div>                                     
                            </div>
                            <div class="frm_one">
                                <div class="frm_one_l"><input name="contactNo" type="text" class="input_two" placeholder="Phone Number" /></div>
                               <span class="validation-invalid-label text-danger" id="error_contactNo" style="display: none;">This field is required.</span>	
                              
                              
                               <div class="frm_one_r"><input name="email" type="text" class="input_two" placeholder="Email Address" /></div>
                               <span class="validation-invalid-label text-danger" id="error_email" style="display: none;">This field is required.</span>	
                               <div class="clr"></div>                                     
                            </div>
                            
                            <div class="frm_one">
                                <div class="dropdown border_whole">
                                <div class="select"> <span>Select Your City</span></div>
                                <input type="hidden" id="city" name="city">
                                <ul class="dropdown-menu">
                                	<%-- <c:forEach items="${cityList}" var="city">
                                		 <li id="${city.cityName}">${city.cityName}</li>
                                	</c:forEach> --%>
                                  <li id="Aurangabad">Aurangabad</li>
                                  <li id="Pune">Pune</li>
                                  <li id="Gandhi Nagar">Gandhi Nagar</li>
                                </ul>
                              </div>
                            </div>
                            
                            <div class="frm_one">
                                <div class="frm_one_l"><input name="address1" type="text" class="input_two" placeholder="Your Address" /></div>
                              <span class="validation-invalid-label text-danger" id="error_address1" style="display: none;">This field is required.</span>	
                               
                                <div class="frm_one_r"><input name="address2" type="text" class="input_two" placeholder="Your Address Line 1" /></div>
                             <span class="validation-invalid-label text-danger" id="error_address2" style="display: none;">This field is required.</span>	
                                  <div class="clr"></div>                                     
                            </div>
                            
                            <div class="frm_one">
                                <textarea name="message" cols="" rows="5" class="input_two" placeholder="Enter Your Message"></textarea>
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
    
<script>
$(document).ready(function () {
	document.getElementById("typeTitle").innerHTML = "Vendor"; 
  });
function chngTitle(val){
	if(val==1){
		 document.getElementById("typeTitle").innerHTML = "Vendor"; 
	}else if(val==2){
		document.getElementById("typeTitle").innerHTML = "Franchise"; 
	}else{
		document.getElementById("typeTitle").innerHTML = "Gift"; 
	}
	
}
/* $(document).ready(function($) {

	$("#submitInsert").submit(function(e) {
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
		
		if (!$("#email").val()) {
			isError = true;
			$("#error_email").show()
		} else {
			$("#error_email").hide()
		}
		
		if (!$("#address1").val()) {
			isError = true;
			$("#error_address1").show()
		} else {
			$("#error_address1").hide()
		}
		
		if (!$("#address2").val()) {
			isError = true;
			$("#error_address2").show()
		} else {
			$("#error_address2").hide()
		}
		
		if (!isError) {
			var x = true;
			if (x == true) {
				document.getElementById("submtbtn").disabled = true;
				return true;
			}
		}

		return false;

	});
}); */

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

  
    
</body>

</html>
