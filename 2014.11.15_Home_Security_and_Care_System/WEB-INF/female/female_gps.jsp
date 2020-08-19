<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">

function getLocation()
{

	if (navigator.geolocation) //브라우져가 geolocation을 지원하는지 확인한 후 
		navigator.geolocation.getCurrentPosition(initialize, errorHandler);

}
      function initialize(position) {
			latLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			
	        var mapOptions = {
	                center: latLng, 
	                zoom: 18, 
	                mapTypeId: google.maps.MapTypeId.ROADMAP
	              };
	        
	        var map = new google.maps.Map(document.getElementById("map-canvas"), 
	                  mapOptions);
	              
			
			var size_x = 60; 
			var size_y = 60; 
         
       
			var image = new google.maps.MarkerImage( 'http://google-maps-icons.googlecode.com/files/walking-tour.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));	
	        
	        
	        markers= new google.maps.Marker({position: latLng, 
	        									map: map, 
	        									icon: image, 
	        									title: '현위치'
	        								});    	  
			
	
         
			var content = "현위치구하기"; 
         
			var infowindow = new google.maps.InfoWindow({ content: content});
 
			google.maps.event.addListener(markers, "click", function() {
            	infowindow.open(map,markers);
        	});
         
 
         
      }
      function errorHandler(error) {}
    
      google.maps.event.addDomListener(window, 'load', getLocation);
</script>

</head>
<body>
<div id="map-canvas" style="width: 100%; height: 400px"></div>


</body>
</html>