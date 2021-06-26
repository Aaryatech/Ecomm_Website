<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/fevicon.png"
	type="images/png" sizes="32x32">

<title>Monginis</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

</head>
<body>


	<div id="map"></div>



	<div class="location_button">
		<a href="javascript:void(0)" onclick="setLocation()"
			class="mobile_location">Pin Point Your Delivery Location</a>
	</div>

	<div class="current_location" style="display: none;">
		<a href="javascript:void(0)" onclick="setLocation()"><img
			src="${pageContext.request.contextPath}/resources/images/location_icn.png"
			alt=""> Set Location </a>
	</div>

	<input type="hidden" value="" id="latVal" name="latVal">
	<input type="hidden" value="" id="lngVal" name="lngVal">
	<input type="hidden" value="" id="latlng" name="latlng">
	<input type="hidden" value="" id="addr" name="addr">


	<script>
		function getBrowserLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(initMap);
			} else {
				initMap();
			}
		}

		function initMap(position) {
			
			var latVal = ${lat};
			var lngVal = ${lng};
			
			//alert(latVal+"       "+lngVal)
			 
			
			if(latVal ==0 && lngVal ==0){
				latVal = position.coords.latitude;
				lngVal = position.coords.longitude;
				
				console.log("loc-------> " + position.coords.latitude + "     "
						+ position.coords.longitude);
			}

			$("#latVal").val(latVal);
			$("#lngVal").val(lngVal);
			
			//lat : -25.363,
			//lng : 131.044
			var myLatlng = {
				lat : latVal,
				lng : lngVal
			};
			
			document.getElementById("latlng").value=myLatlng;

			//console.log("location -------> " + latVal + "     " + lngVal);
			
			//alert(latVal+"       "+lngVal)


			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 18,
				center : myLatlng
			});
			
			const icons = {
				    info: {
				      icon: "${pageContext.request.contextPath}/resources/images/marker.gif",
				    },
				  };
			
			 var marker = new google.maps.Marker({
				    position: myLatlng,
				    map,
				    title: "You are here!",
				    animation: google.maps.Animation.DROP,
				    zIndex: 100,
				    icon: "${pageContext.request.contextPath}/resources/images/marker1.gif",
				  });
			 
			 var geocoder = new google.maps.Geocoder();
			 
			 var infowindow = new google.maps.InfoWindow();
			 
			 geocodeLatLng(geocoder, latVal,lngVal, infowindow);
			/*  map.addListener('center_changed', () => {
				  marker.setPosition(map.getCenter())
				}) */
				
				google.maps.event.addListener(map, 'dragend', function() {
				    marker.setPosition(map.getCenter()); 
				    var NewMapCenter = map.getCenter();
			           var lat = NewMapCenter.lat();
						var lng = NewMapCenter.lng(); 
						$("#latVal").val(lat);
						$("#lngVal").val(lng); 
						coordinates_to_address(geocoder,lat,lng);
				} );
			
				google.maps.event.addListener(map, 'center_changed', function() {
				    marker.setPosition(map.getCenter());  
				} );
				 
			 /* map
				.addListener(
						'click',
						function(mapsMouseEvent) {
							 
							var lat=JSON.stringify(mapsMouseEvent.latLng.toJSON().lat);
							var lng=JSON.stringify(mapsMouseEvent.latLng.toJSON().lng);
							
							var latlng = new google.maps.LatLng(lat,lng);
							marker.setPosition(latlng);
							
							$("#latVal").val(lat);
							$("#lngVal").val(lng);
							 
							  
							geocodeLatLng(geocoder, lat,lng, infowindow);
							  
							
						}); */
			 
			  

		}
		
		
		
		function geocodeLatLng(geocoder, lat,lng, infowindow) {
	
			  var latlng = {
			    lat: parseFloat(lat),
			    lng: parseFloat(lng),
			  };
			  
			  geocoder.geocode({ location: latlng }, (results, status) => {
			    if (status === "OK") {
			      if (results[0]) {
			    	  //alert("--> "+results[0].formatted_address)
			    	 
			    	  document.getElementById("addr").value=results[0].formatted_address;
			      } else {
			        alert("No results found");
			        document.getElementById("addr").value="";
			      }
			    } else {
			     // alert("Geocoder failed due to: " + status);
			        document.getElementById("addr").value="";

			    }
			  });
			}
		
		
		function coordinates_to_address(geocoder,lat, lng) {
		    var latlng = new google.maps.LatLng(lat, lng);

		    geocoder.geocode({'latLng': latlng}, function(results, status) {
		        if(status == google.maps.GeocoderStatus.OK) {
		            if(results[0]) {
		                
		                document.getElementById("addr").value=results[0].formatted_address;
		            } else {
		                alert('No results found');
		            }
		        } else {
		            var error = {
		                'ZERO_RESULTS': 'Kunde inte hitta adress'
		            }
 
		        }
		       // console.log("location -------> " + lat + "     " + lng);
		    });
		}
		
		function setLocation(){
			
			var lat=document.getElementById("latVal").value;
			var lng=document.getElementById("lngVal").value;
			var addr=document.getElementById("addr").value;
			
			//alert(lat+"    --   "+lng+"    --      "+addr)
			
			sessionStorage.setItem("selLat", lat);
			sessionStorage.setItem("selLng", lng);
			sessionStorage.setItem("selAddr", addr);
			sessionStorage.setItem("fromGetLocation", "1");
			
			 window
			.open(
					'${pageContext.request.contextPath}/',
					'_self');
		}
		
		
	</script>
	<script defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&libraries=places&callback=getBrowserLocation">
		
	</script>
</body>
</html>