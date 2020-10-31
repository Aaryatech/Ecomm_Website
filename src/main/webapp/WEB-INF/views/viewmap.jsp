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
			class="mobile_location">Get Location</a>
	</div>

	<div class="current_location" style="display: none;">
		<a href="javascript:void(0)" onclick="setLocation()"><img
			src="${pageContext.request.contextPath}/resources/images/location_icn.png"
			alt=""> Set Location </a>
	</div>

	<input type="hidden" value="" id="latVal" name="latVal">
	<input type="hidden" value="" id="lngVal" name="lngVal">


	<script>
		function getBrowserLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(initMap);
			} else {
				initMap();
			}
		}

		function initMap(position) {

			var latVal = 0;
			var lngVal = 0;
			
			latVal = position.coords.latitude;
			lngVal = position.coords.longitude;
			
			console.log("loc-------> " + position.coords.latitude + "     "
					+ position.coords.longitude);

			$("#latVal").val(latVal);
			$("#lngVal").val(lngVal);
			
			//lat : -25.363,
			//lng : 131.044
			var myLatlng = {
				lat : latVal,
				lng : lngVal
			};

			console.log("location -------> " + latVal + "     " + lngVal);

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
				    icon: "${pageContext.request.contextPath}/resources/images/marker1.gif",
				  });
			 
			 var geocoder = new google.maps.Geocoder();
			 
			 map
				.addListener(
						'click',
						function(mapsMouseEvent) {
							
							//position : mapsMouseEvent.latLng;
							
							//console.log("CLICKED : "+JSON.stringify(mapsMouseEvent.latLng.toJSON(), null, 2));
							//console.log("LAT : "+JSON.stringify(mapsMouseEvent.latLng.toJSON().lat));
							
							var lat=JSON.stringify(mapsMouseEvent.latLng.toJSON().lat);
							var lng=JSON.stringify(mapsMouseEvent.latLng.toJSON().lng);
							
							var latlng = new google.maps.LatLng(lat,lng);
							marker.setPosition(latlng);
							
							$("#latVal").val(lat);
							$("#lngVal").val(lng);
							
							
							
							/* geocoder.geocode({
							    'latLng': mapsMouseEvent.latLng
							  }, function(results, status) {
							    if (status == google.maps.GeocoderStatus.OK) {
							      if (results[0]) {
							        alert(results[0].formatted_address);
							      }
							    }
							  }); */
							
						});
			 
			 
			 

			// Create the initial InfoWindow.
			/* var infoWindow = new google.maps.InfoWindow({
				content : 'Click the map to get Lat/Lng!',
				position : myLatlng
			});
			infoWindow.open(map); */

			// Configure the click listener.
			/* map
					.addListener(
							'click',
							function(mapsMouseEvent) {
								// Close the current InfoWindow.
								infoWindow.close();

								// Create a new InfoWindow.
								infoWindow = new google.maps.InfoWindow({
									position : mapsMouseEvent.latLng
								});
								infoWindow.setContent(mapsMouseEvent.latLng
										.toString());
								infoWindow.open(map);

								window
										.open(
												'${pageContext.request.contextPath}/home',
												'_self');

							}); */
		}
		
		
		function setLocation(){
			
			var lat=document.getElementById("latVal").value;
			
			//alert(lat)
			
			 window
			.open(
					'${pageContext.request.contextPath}/home',
					'_self'); 
		}
		
		
	</script>
	<script defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&callback=getBrowserLocation">
		
	</script>
</body>
</html>