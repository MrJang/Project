<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reveal.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
<script type="text/javascript" src="../js/jquery.reveal.js"></script>
<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?ke=AIzaSyCGyskv9GawVKPMdnZ3pbznyKNMjaEQGj0&sensor=false"></script>
<script type="text/javascript" src="ui/min/jquery.ui.map.full.min.js"></script>
<script type="text/javascript" src="ui/jquery.ui.map.extensions.js"></script>

<style type="text/css">
body {
	font-family: "HelveticaNeue", "Helvetica-Neue", "Helvetica", "Arial",
		sans-serif;
}

.big-link {
	display: block;
	text-align: center;
	font-size: 14;
	color: #06f;
}

.bordered {
	border: solid #ccc 1px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 1px 1px #ccc;
	-moz-box-shadow: 0 1px 1px #ccc;
	box-shadow: 0 1px 1px #ccc;
}

.bordered tr:hover {
	background: #fbf8e9;
	-o-transition: all 0.1s ease-in-out;
	-webkit-transition: all 0.1s ease-in-out;
	-moz-transition: all 0.1s ease-in-out;
	-ms-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

.bordered td,.bordered th {
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

.bordered th {
	background-color: #dce9f9;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc),
		to(#dce9f9));
	background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: linear-gradient(top, #ebf3fc, #dce9f9);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	border-top: none;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
}

.bordered td:first-child,.bordered th:first-child {
	border-left: none;
}

.bordered th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.bordered th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.bordered th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}
</style>


<script type="text/javascript">
	var watchid;
	var map, mapTypeId, infowindow;

	function watchLocation(start, end) {

		//       $("#map_control").data("first","true");
		//       var posOption = {maximumAge: 30000, timeout: 50000, enableHighAccuracy: true};
		//       watchid = navigator.geolocation.getCurrentPosition(onSuccess, onError, posOption);  

		loadGoogleMap(start, end);

	}

	function onError(posError) {
		document.getElementById("message").innerHTML = "Error Code: "
				+ posError.code + "Error Messge :" + posError.message;
	}

	function onSuccess(position) {
		// alert("onSuccess");

		if ($("#map_control").data("first") == "true") {
			$("#map_control").data("first", "false");
			//alert("before loadGoogleMap");
			loadGoogleMap(position.coords.latitude, position.coords.longitude);
			//alert("after loadGoogleMap");
		} else {
			repostionGoogleMap(position.coords.latitude,
					position.coords.longitude);
		}
	}

	function loadGoogleMap(start, end) {
		// alert("here!!!!");
		var s_point = start.split('/');
		var e_point = end.split('/');

		var latlng = new google.maps.LatLng(s_point[0], s_point[1]);
		var end_latlng = new google.maps.LatLng(e_point[0], e_point[1]);

		// alert("lat["+lat+"] lng["+lng+"]");     
		map = new google.maps.Map(document.getElementById('map_control'), {
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			center : latlng,
			zoom : 15
		});

		var marker = new google.maps.Marker(
				{
					url : 'http://google-maps-icons.googlecode.com/files/walking-tour.png',
					map : map,
					position : latlng
				});

		var e_marker = new google.maps.Marker(
				{
					url : 'http://google-maps-icons.googlecode.com/files/walking-tour.png',
					map : map,
					position : end_latlng
				});

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

</head>
<body>
	<center>
	
		<c:if test="${count == 0}">
		<table class="bordered" width="800">
			<tr>
				<td align="center">
					게시판에 저장된 글이 없습니다.
				</td>	
			</tr>
		</table>
		
		</c:if>
		
		<c:if test="${count != 0}">
		<table class="bordered" width="80%" height="40%" style="font-size: 16px">
			<thead>
				<tr>
					<th>자녀이름</th>
					<th>업체명</th>
					<th>승차시간</th>
					<th>하차시간</th>
					<th>위치보기</th>
				</tr>
			</thead>

			<c:forEach var="sche" items="${list}">
				<tr>
					<td>${sche.s_id}</td>
					<td>${sche.e_name}</td>

					<td><fmt:formatDate value="${sche.start_time}"  pattern="yy-MM-dd hh:mm"/></td>
					<td><fmt:formatDate value="${sche.end_time}"  pattern="yy-MM-dd hh:mm"/></td>

					<td><a href="#" class="big-link" data-reveal-id="myModal"
						onclick="watchLocation('${sche.startpoint}','${sche.endpoint}')"
						data-animation="fade" id="myMap"> 위치보기 </a></td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
	</center>
	<div id="myModal" class="reveal-modal">

		<div id="map_control" style="width: 100%; height: 500px;"></div>
	</div>

</body>
</html>