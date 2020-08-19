<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
	<link rel="stylesheet" href="../css/button.css">
   <link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?kye=AIzaSyAWpyTPBIt6tEGdNVrj_qSCzwp6TZ7Lw84&sensor=false&libraries=places"></script>
    <script type="text/javascript" src="cordova/cordova-2.5.0.js">      </script>
     <script type="text/javascript" src = "ui/min/jquery.ui.map.full.min.js"></script>
     <script type="text/javascript" src =  "ui/jquery.ui.map.extensions.js"></script>
    <script type="text/javascript">
    var geocoder;
    var watchid;
    var map,mapTypeId,infowindow;
    var place;
    function police_list(name){
    	var url = "policelist?name="+name;
    	open(url, "policelist", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=800,height=500");
    }
    
       function watchLocation() {
    	   geocoder = new google.maps.Geocoder();
    	   
          $("#map_control").data("first","true");
          var posOption = {maximumAge: 3000, timeout: 5000, enableHighAccuracy: true};
          watchid = navigator.geolocation.getCurrentPosition(onSuccess, onError, posOption);  
          
          document.getElementById("message").innerHTML = "현재위치를 검색합니다.";
          
       
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
    	            r.innerHTML = "검색 결과가 없습니다."+status;              
    	        }  
    	    });  
    	}  
       
       function onError(posError) {
          document.getElementById("message").innerHTML = "Error Code: " + posError.code + "Error Messge :" + posError.message;
       }
       
       function onSuccess(position) {
          document.getElementById("message").innerHTML ="선택하실 곳을 선택하시면 예약페이지로 넘어갑니다.";
          
          
          if( $("#map_control").data("first") == "true") {
             $("#map_control").data("first", "false");
             loadGoogleMap(position.coords.latitude, position.coords.longitude);
          }else {
             repostionGoogleMap(position.coords.latitude, position.coords.longitude);
          }
          function loadGoogleMap(lat, lng) {
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
                service.nearbySearch(request, callback);
          
             
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
        <body  id="stage" class="theme">
       <p><h2><label id="message">Press Button.</label></h2></p>
      
 
       <div>   
    		<input id="address" type="text" >   
    		<input type="button" value="출발위치" onclick="codeAddress()" class="asd-blue">   <input type="button" value="현위치" onClick="watchLocation();" class="asd-blue">
    		
		</div>   
		<div id="r"></div>  
         
          
      
       <div id="map_control" style="width:100%; height: 500px;"></div>
       
</html>