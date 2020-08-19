<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=320, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    
    <link rel="stylesheet" href="jquery.mobile/jquery.mobile-1.3.1.min.css"/>
    <script src = "jquery.mobile/jquery-1.7.2.min"></script>
    <script src = "jquery.mobile/jquery.mobile-1.3.1.min.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCGyskv9GawVKPMdnZ3pbznyKNMjaEQGj0&sensor=false&libraries=places"></script>
     <script type="text/javascript" charset ="EUC-KR" src="cordova/cordova-2.5.0.js"></script>
     <script type="text/javascript" src = "ui/min/jquery.ui.map.full.min.js"></script>
     <script type="text/javascript" src =  "ui/jquery.ui.map.extensions.js"></script>
 <script type="text/javascript">
	    var watchid;
	    var map,mapTypeId,infowindow;
	    var place;
	    function police_list(name){
	    	
	    	location.href="m_policelist?name="+name;
	    	
	    }
  
       function watchLocation() {
    	   geocoder = new google.maps.Geocoder();
    	   
           $("#map_control").data("first","true");
           var posOption = {maximumAge: 3000, timeout: 5000, enableHighAccuracy: true};
           watchid = navigator.geolocation.getCurrentPosition(onSuccess, onError, posOption);  
           
           document.getElementById("message").innerHTML = "������ġ�� �˻��մϴ�.";
           
       
       }
       function codeAddress(){  
   	    var address = document.getElementById("address").value;  
   	    var r = document.getElementById("r");  
   	      
   	    r.innerHTML = '';  
   	      
   	    geocoder.geocode({  
   	        'address': address  
   	    }, function(results, status){  
   	        if (status == google.maps.GeocoderStatus.OK) {  
   	            map.setCenter(results[0].geometry.location);  
   	            loadGoogleMap2(results[0].geometry.location.lat(), results[0].geometry.location.lng());
   	                          
   	            for(var i in  results){  
   	                //r.innerHTML += results[i].formatted_address+',';  
   	                var li = document.createElement('li');  
   	                var a = document.createElement('a');  
   	               
   	                a.innerHTML = results[i].formatted_address;  
   	   
   	                li.appendChild(a);  
   	                r.appendChild(li);  
   	            }             
   	        } else {  
   	            r.innerHTML = "�˻� ����� �����ϴ�."+status;              
   	        }  
   	    });  
   	}  
 
       function onError(posError) {
          document.getElementById("message").innerHTML = "Error Code: " + posError.code + "Error Messge :" + posError.message;
       }
       
       function onSuccess(position) {
    	   document.getElementById("message").innerHTML ="�����Ͻ� ���� �����Ͻø� ������������ �Ѿ�ϴ�.";
          
          
          if( $("#map_control").data("first") == "true") {
             $("#map_control").data("first", "false");
             //alert("before loadGoogleMap");
             loadGoogleMap(position.coords.latitude, position.coords.longitude);
             //alert("after loadGoogleMap");
          }else {
            repostionGoogleMap(position.coords.latitude, position.coords.longitude);
          }
       }
          
          function loadGoogleMap(lat, lng) {
        	 // alert("here!!!!");
        	  
             var latlng = new google.maps.LatLng(lat, lng);
             
            // alert("lat["+lat+"] lng["+lng+"]");     
             map = new google.maps.Map(document.getElementById('map_control'), {
                 mapTypeId: google.maps.MapTypeId.ROADMAP,
                 center:latlng ,
                 zoom: 15
               });
             
             var request = {
                    location: latlng,
                    radius: 1000,
                    types: ['police']
                  };
          
              infowindow = new google.maps.InfoWindow();
               var service = new google.maps.places.PlacesService(map);
                service.nearbySearch(request, callback);
          
              //alert("end of loadMap!!!");
           
          }
          
          function callback(results, status) {
               
               if (status == google.maps.places.PlacesServiceStatus.OK) {
                 for (var i = 0; i < results.length; i++) {
                    place = results[i];
                   createMarker(results[i]);
                 }
               }
          }
          
          function createMarker(place) {
              
              
              var marker = new google.maps.Marker({
                url:place.icon,
               map: map,
                position: place.geometry.location
              });
           
              google.maps.event.addListener(marker, 'click', function() {
               var div = document.createElement("div");
               div.innerHTML = place.name;
         
               div.onclick = function(){police_list(place.name)};
               
                 infowindow.setContent(div);
                 
                 infowindow.open(map, this);
               
              

            });             
          }
        
          
          function repostionGoogleMap(lat, lng) {
             var latlng = new google.maps.LatLng(lat, lng);
             $("#map_control").gmap("get", "map").panTo(latlng);
          }
          function loadGoogleMap2(lat, lng) {
              var latlng = new google.maps.LatLng(lat, lng);
              
                   
              map = new google.maps.Map(document.getElementById('map_control'), {
                  mapTypeId: google.maps.MapTypeId.ROADMAP,
                  center:latlng ,
                  zoom: 15
                });
              
              var request = {
                     location: latlng,
                     radius: 1000,
                     types: ['police']
                   };
           
               infowindow = new google.maps.InfoWindow();
                var service = new google.maps.places.PlacesService(map);
                 service.nearbySearch(request, callback1);
           
              
           }
          function callback1(results, status) {
              
              if (status == google.maps.places.PlacesServiceStatus.OK) {
                for (var i = 0; i < results.length; i++) {
                   place = results[i];
                  createMarker1(results[i]);
                }
              }
         }
         
         function createMarker1(place) {
      
             
              var marker = new google.maps.Marker({
                url:place.icon,
               map: map,
                position: place.geometry.location
              });
           
              google.maps.event.addListener(marker, 'click', function() {
               var div = document.createElement("div");
               div.innerHTML = place.name;
         
               div.onclick = function(){police_list(place.name)};
               
                 infowindow.setContent(div);
                 
                 infowindow.open(map, this);
               
              

            });             
          }

        
		google.maps.event.addDomListener(window, 'load', watchLocation);   
        </script>   
    
        </head>
        <body id="stage" class="theme">

        
       <p><label id="message">Press Button.</label></p>
       
           <div>   
    		<input id="address" type="text" >   
    		<input type="button" value="�����ġ" onclick="codeAddress()" class="asd-blue">   <input type="button" value="����ġ" onClick="watchLocation();" class="asd-blue">
    		
		</div>   
		<div id="r"></div>
          
       
       <div id="map_control" style="width:100%; height: 500px;"></div>
 	</body>
</html>