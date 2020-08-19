<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="../css/reveal.css">	
<link rel="stylesheet" href="../css/button.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="../js/jquery.reveal.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?ke=AIzaSyCGyskv9GawVKPMdnZ3pbznyKNMjaEQGj0&sensor=false"></script>	
	<script type="text/javascript" src = "ui/min/jquery.ui.map.full.min.js"></script>
     <script type="text/javascript" src =  "ui/jquery.ui.map.extensions.js"></script>	

<script type="text/javascript">


	function children_list() {

		$("#myMo").load("children_listAll");

	}
	function female_list() {

		$("#myMo").load("female_listAll");

	}
	function group_list() {

		$("#myMo").load("group_listAll");

	}
	
	var watchid;
    var map,mapTypeId,infowindow;
  


   function watchLocation(start,end) {
	  
//       $("#map_control").data("first","true");
//       var posOption = {maximumAge: 30000, timeout: 50000, enableHighAccuracy: true};
//       watchid = navigator.geolocation.getCurrentPosition(onSuccess, onError, posOption);  
      	
      	loadGoogleMap(start,end);
    
   
   }

   function onError(posError) {
      document.getElementById("message").innerHTML = "Error Code: " + posError.code + "Error Messge :" + posError.message;
   }
   
   function onSuccess(position) {
	 // alert("onSuccess");
     
      
     if( $("#map_control").data("first") == "true") {
         $("#map_control").data("first", "false");
         //alert("before loadGoogleMap");
         loadGoogleMap(position.coords.latitude, position.coords.longitude);
         //alert("after loadGoogleMap");
      }else {
        repostionGoogleMap(position.coords.latitude, position.coords.longitude);
      }
   }
      
      function loadGoogleMap(start,end) {
    	 // alert("here!!!!");
    	  var s_point = start.split('/');
    	  var e_point = end.split('/');
    	  
          var latlng = new google.maps.LatLng(s_point[0], s_point[1]);
          var end_latlng = new google.maps.LatLng(e_point[0],e_point[1]);
         
        // alert("lat["+lat+"] lng["+lng+"]");     
         map = new google.maps.Map(document.getElementById('map_control'), {
             mapTypeId: google.maps.MapTypeId.ROADMAP,
             center:latlng,
             zoom: 15
           });
         
        var marker = new google.maps.Marker({
           url:'http://google-maps-icons.googlecode.com/files/walking-tour.png',
           map: map,
           position: latlng
         });
         
         var e_marker = new google.maps.Marker({
             url:'http://google-maps-icons.googlecode.com/files/walking-tour.png',
             map: map,
             position: end_latlng
           });
         
         var flightPlanCoordinates = [
                     new google.maps.LatLng(s_point[0], s_point[1]),
                     new google.maps.LatLng(e_point[0],e_point[1]),
                     ];
         
         
         var flightPath = new google.maps.Polyline({
        	    path: flightPlanCoordinates,
        	    geodesic: true,
        	    strokeColor: '#FF0000',
        	    strokeOpacity: 1.0,
        	    strokeWeight: 2
        	  });

        	  flightPath.setMap(map);
         
      
//          google.maps.event.addListener(marker, 'click', function() {
          
       
//             infowindow.open(map, this);
      
//        });           
//           infowindow = new google.maps.InfoWindow();
         
      
          //alert("end of loadMap!!!");
       
      }
      
     function repostionGoogleMap(lat, lng) {
         var latlng = new google.maps.LatLng(lat, lng);
         $("#map_control").gmap("get", "map").panTo(latlng);
      }
    
	
	
</script>

<style>
.shape {
    border-style: solid;
    border-width: 0 70px 40px 0;
    float: right;
    height: 0px;
    width: 0px;
    -ms-transform: rotate(360deg); /* IE 9 */
    -o-transform: rotate(360deg); /* Opera 10.5 */
    -webkit-transform: rotate(360deg); /* Safari and Chrome */
    transform: rotate(360deg);
}
.listing {
    background: #fff;
    border: 1px solid #ddd;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    margin: 15px 0;
    overflow: hidden;
}
.listing:hover {
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    -ms-transform: scale(1.1);
    -o-transform: scale(1.1);
    transform: rotate scale(1.1);
    -webkit-transition: all 0.4s ease-in-out;
    -moz-transition: all 0.4s ease-in-out;
    -o-transition: all 0.4s ease-in-out;
    transition: all 0.4s ease-in-out;
}
.shape {
    border-color: rgba(255,255,255,0) #d9534f rgba(255,255,255,0) rgba(255,255,255,0);
}
.listing-radius {
    border-radius: 7px;
}
.listing-danger {
    border-color: #d9534f;
}
.listing-danger .shape {
    border-color: transparent #d9533f transparent transparent;
}
.listing-success {
    border-color: #5cb85c;
}
.listing-success .shape {
    border-color: transparent #5cb75c transparent transparent;
}
.listing-default {
    border-color: #999999;
}
.listing-default .shape {
    border-color: transparent #999999 transparent transparent;
}
.listing-primary {
    border-color: #428bca;
}
.listing-primary .shape {
    border-color: transparent #318bca transparent transparent;
}
.listing-info {
    border-color: #5bc0de;
}
.listing-info .shape {
    border-color: transparent #5bc0de transparent transparent;
}
.listing-warning {
    border-color: #f0ad4e;
}
.listing-warning .shape {
    border-color: transparent #f0ad4e transparent transparent;
}
.shape-text {
    color: #fff;
    font-size: 12px;
    font-weight: bold;
    position: relative;
    right: -40px;
    top: 2px;
    white-space: nowrap;
    -ms-transform: rotate(30deg); /* IE 9 */
    -o-transform: rotate(360deg); /* Opera 10.5 */
    -webkit-transform: rotate(30deg); /* Safari and Chrome */
    transform: rotate(30deg);
}
.listing-content {
    padding: 0 20px 10px;
}


#safe_body,#left {
	display: none;
}

#children_cu{
	float: left;
	width: 45%;
	height: 50%;
	margin-left: 70px;
}

#female_cu{
	float: left;
	width: 45%;
	height: 50%;
}

#main_img{

	width: 100%;
	height: 30%;

}

#main1 {
	margin-top : 50px;
	margin-left : 100px;
	width: 100%;
	height: 70%;
}
</style>
<div id= "main_img">
<img src="../images/safeliving_main.jpg" width="1350">
</div>

<div id="main1">
	
	
	<c:choose>
		<c:when test="${s.id == null}">
			<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="listing listing-radius listing-success">
                <br>
                <div class="listing-content">
                   <a href="children_info"> <img src="../images/children_main.jpg"></a>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="listing listing-radius listing-success">
                <br>
                <div class="listing-content">
                    <a href="../safe/female_addWrite"><img src="../images/female_main.jpg"></a>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="listing listing-radius listing-success">
                 <br>
                <div class="listing-content">
                   <a href="homeIntroduce"> <img src="../images/home_main.jpg"></a>
                </div>
            </div>
        </div>
    </div>
</div>
		</c:when>

		<c:when test="${s.id != null}">
			
			<table width="1000" id="tab" border="1" cellspacing="10"
				 align="center" class="bordered">
				<thead>
					<th width="330"><a href="#" onclick="children_list();" style="text-decoration:none"><font color="black">자녀안전귀가</font></a></th>
					<th width="330"><a href="#" onclick="female_list();" style="text-decoration:none"><font color="black">여성안전귀가</font></a></th>
					<th width="340"><a href="#" onclick="group_list();" style="text-decoration:none"><font color="black">그룹보기</font></a></th>
				</thead>
			</table>
			<br />
			<br />
			<center>
				<div id="myMo">
				<table class="bordered" width="800">
			<tr>
				<td align="center">
					메뉴를 클릭해주세요.
				</td>	
			</tr>
		</table>
				</div>
			</center>
			<br><br><br>
	<c:if test="${s.category == 1}">
			<div id="children_cu">
				<table width="450" id="tab" border="1" align="center" class="bordered" cellspacing="0" cellpadding="5" style="font-size : 10pt">
				<thead>
					
				<th colspan="5">Scheduler</th>
				</thead>
					<tr>
					<td>자녀ID</td>
					<td>출발시간</td>
					<td>도착시간</td>
					<td>위치보기</td>
					<td>현황</td>
					</tr>
					<c:forEach var="sche" items="${sche_list}">
					
					<tr>
					<td>${sche.s_id}</td>
					<td><fmt:formatDate value="${sche.start_time}"  pattern="yy-MM-dd hh:mm"/></td>
					<td><fmt:formatDate value="${sche.end_time}"  pattern="yy-MM-dd hh:mm"/></td>
					<td>
					
					<a href="#" class="big-link" onclick="watchLocation('${sche.startpoint}','${sche.endpoint}')"  data-reveal-id="myModal" data-animation="fade" id ="myMap">
					위치보기
					</a>
					</td>
					
					<c:if test="${sche.end_time==null}">
					<td>수행중</td>
					</c:if>
					<c:if test="${sche.end_time!=null}">
					<td>수행완료</td>
					</c:if>
					</tr>
				</c:forEach>
			</table>
			</div>
			
			<center>
			
			<div id="female_cu">
				<table width="450" id="tab" border="1" cellspacing="0"
				cellpadding="5" align="center" class="bordered" style="font-size: 10pt">
				<thead>
					<th>여성안전귀가</th>
					
				</thead>
			</table>
			
			
			</div>
		</c:if>
		</c:when>
	</c:choose>
	
	
	
</div>

		<div id="myModal" class="reveal-modal">
		 
			<div id="map_control" style="width:100%; height: 500px;"></div>		
		</div>


