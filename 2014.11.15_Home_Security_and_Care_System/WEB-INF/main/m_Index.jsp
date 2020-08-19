<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-type" name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width">
<title>Insert title here</title>
	<link rel="stylesheet" href="jquery.mobile/jquery.mobile-1.3.1.min.css"/>
    <script src = "jquery.mobile/jquery-1.7.2.min"></script>
    <script src = "jquery.mobile/jquery.mobile-1.3.1.min.js"></script>
	<script type="text/javascript" charset="EUC-KR" src="cordova/cordova-2.5.0.js"></script>
 
 

<!-- Ä¶¸°´õ --> 
 	<link rel='stylesheet' type='text/css'
	href='http://arshaw.com/css/main.css?6' />
<link rel='stylesheet' type='text/css'
	href='http://arshaw.com/css/fullcalendar.css?3' />

<link rel='stylesheet' type='text/css'
	href='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.css' />
<script type='text/javascript'
	src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-1.10.2.min.js'></script>
<script type='text/javascript'
	src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-ui-1.10.3.custom.min.js'></script>
<script type='text/javascript'
	src='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.min.js'></script>
 
 
<script type="text/javascript">


	


var watchid;

var test;
	function watchLocation(e_name) {
	
	 watchid = navigator.geolocation.getCurrentPosition(onSuccess, onError);  
	 test = e_name;
   
   }

   function onError(posError) {
      document.getElementById("message").innerHTML = "Error Code: " + posError.code + "Error Messge :" + posError.message;
   }
   
   
   
   function onSuccess(position) {
	
	 var lat = position.coords.latitude;
	 var lon = position.coords.longitude;
	
	 var s_id = window.localStorage.getItem("m_safe");
	location.href="../safe/getin_scheduler?s_id="+s_id+"&e_name="+test+"&lat="+lat+"&lon="+lon;
	   
   }
	

function init(Ivalue){

	
	window.localStorage.setItem("m_safe",Ivalue);
	
	var m_width = $(window).width();
	var m_height = $(window).height(); 
	
	$("#m_page").attr("width",m_width);
	$("#m_page").attr("height",m_height);

}

</script>

<style type="text/css">
	
	#calendar {
	position: absolute;
	width: 40%;
	height: 30%;
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
	
	

    /*this block should go in the styles.css file*/
    .ui-panel-inner {
		padding:0px; /*make the buttons flush edge to edge*/
		
		
    }
    .ui-controlgroup {
		margin:0; /*make the buttons flush to the top*/
	}
	.custom_icon .ui-btn  .ui-icon{
		width:100%; 
		height:60px;
		margin-left:-17px;
		background-color: 
	}
	span.ui-btn-inner{
		linear-gradient(top, #b7f2f4 0%,#7ce7ea 100%);
	}
	

	#bars-button1 .ui-icon-shadow{
		
		background: url(../images/mobile_children.jpg) 0% -15% no-repeat;
		background-size: 30px 30px;
		height:30px;
		width:30px;
	
	}
				  
	#bars-button2 .ui-icon-shadow{
	
	background: url(../images/mobile_female.jpg) 0% -15% no-repeat;
	background-size: 27px 27px;
	height:28px;
	width:28px;
	}
	
	#bars-button3 .ui-icon-shadow{
	
	background: url(../images/mobile_home.jpg) 0% -15% no-repeat;
	background-size: 27px 27px;
	height:28px;
	width:28px;
	}
		#main_logo{
		margin-top:5%;
		margin-bottom:2%;
		width:70%;
		height:40%;
		border-radius:20%;
	}
	.ui-input-text.ui-body-c{
		margin-top:10%;
	}
	.main_form1{
		border-radius:10%;
		height:35px;
		align:center;
		font-size:30px;
		font-weight:35px;
		font-style:italic;
	}
	
	

#menu5 {
	float: left;
	width: 90px;
	height: 80px;
	border: solid 3px black;
	position: absolute;
	top: 10px;
	left: 270px;
}



</style>
</head>
<body onload="init('${s.id}')" id="stage" class="theme" >
	
		<div data-role="page" id="m_page" data-theme="c" style="height:100%">
		
	
	
		<div id="m_header" data-role="header" style="height:15%" data-theme="c" data-position="fixed">
        	
       <tiles:insertAttribute name="m_header" />
    	</div>
    
   		 <div id="m_content" data-role="content" data-theme="c">
  		 <tiles:insertAttribute name="m_body"/>
  		  </div>
    
   		  <div id="m_footer" data-role="footer" style="height:10%" data-theme="c" data-position="fixed">
    	 <tiles:insertAttribute name="m_footer"/>	
  		  </div>

	</div>




</body>
</html>