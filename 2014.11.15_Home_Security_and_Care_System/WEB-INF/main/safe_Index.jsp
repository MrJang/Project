<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>


	<link rel="stylesheet" type="text/css" href="/SafeProject/bootstrap/css/bootstrap.min.css" />


    <script type="text/javascript" src="/SafeProject/bootjs/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/SafeProject/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src='http://code.jquery.com/jquery-latest.js'></script>
<link href="/SafeProject/css/dcmegamenu.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type='text/javascript'
	src='/SafeProject/js/jquery.hoverIntent.minified.js'></script>
<script type='text/javascript'
	src='/SafeProject/js/jquery.dcmegamenu.1.2.js'></script>

<script type='text/javascript' src='../scripts/jquery.min.js'></script>
<script type='text/javascript'
	src='../scripts/jquery.mobile.customized.min.js'></script>
<script type='text/javascript' src='../scripts/jquery.easing.1.3.js'></script>

<script type="text/javascript">
	$(document).ready(function($) {
		

		$('#mega-menu-4').dcMegaMenu({
			rowItems : '3',
			speed : 'fast',
			effect : 'fade'
		});
		
		

	});

	
	function init(num) {
		
		if(num == 4) {	
			var url = "policeSelect";
			  $("#overlay").load("policeSelect");
			
		}
	}
		
	
	
	

	function join() {
		location.href = "../safe/joinMemberSelect";
	}
</script>

<style type="text/css">




.login {
	-moz-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5) );
	background:-moz-linear-gradient( center top, #79bbff 5%, #378de5 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5');
	background-color:#79bbff;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #84bbf3;
	display:inline-block;
	color:#ffffff;
	font-family:Arial Black;
	font-size:13px;
	font-weight:normal;
	font-style:normal;
	height:24px;
	line-height:24px;
	width:68px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #528ecc;
}
.login:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff) );
	background:-moz-linear-gradient( center top, #378de5 5%, #79bbff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff');
	background-color:#378de5;
}.login:active {
	position:relative;
	top:1px;
}




#children {
	position: relative;
	width: 500px;
	margin: 0;
	padding: 0;
	list-style: none;
	*zoom: 1;
	top: 50px;
}

#c_tr {
	height: 50px;
	font-size: 20px;
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

ul li {
	list-style: none;
}

body,html {
	font-family: 'trebuchet MS', 'Lucida sans', Arial;
	
	font-size: 16px;
	color: #444;
	height: 100%;
	width: 100%;
}
body{
overflow-x: hidden;
	overflow-y: scroll;
}

#logo {
	
}

#header {
	position: absolute;
	top: 17%;
	width: 100%;
	height: 35%;
}

#left {
	position: absolute;
	top: 27%;
	width: 10%;
	height: 90%;
	background: #fffff;
	/* 	border-style : solid; */
	/* 	border-width : 1px; */
	/* 	border-color : blue; */
}

#calendar {
	position: absolute;
	width: 80%;
	height: 90%;
}

#safe_body {
	position: absolute;
	top: 30%;
	width: 80%;
	height: 90%;
	left: 16%;
	background: #fffff;
}

#all_body {
	position: absolute;
	top: 27%;
	width: 80%;
	height: 90%;
	/* 	background: #fffff; */
	/* 	border-style : solid; */
	/* 	border-width : 1px; */
	/* 	border-color : blue; */
}

#menu5 {
	float: left;
	width: 28%;
	height: 60px;
	position: absolute;
	top: 5%;
	left: 80%;
	background: white;
}

a {
	color: #09f;
}

a:hover {
	text-decoration: none;
}

.fluid_container {
	margin: 0 auto;
	max-width: 80%;
	width: 90%;
}



</style>



<link href="/SafeProject/css/skins/blue.css" rel="stylesheet" type="text/css" />


<body style="background-color:white;" onload="init(${s.category});" class='default'>

	<div id="logo" align="center">
		<a href="../safe/safe_Main"><img src="../images/logo.jpg"
			style="width: 13%; height: 10%;"></a>
	</div>



	<div id="menu5">
		<c:choose>


			<c:when test="${s.id==null}">

				<form:form commandName="s">
					<table>
						<tr>
							<td><img src="/SafeProject/images/id.jpg" width=30 height=15></td>
							<td><form:input path="id" /><br></td>
						</tr>
						<tr>
							<td><img src="/SafeProject/images/password.jpg" width=66
								height=15></td>
							<td><form:password path="password" /><br></td>
						</tr>
						
						<tr>
						
							<td><input type="submit" value="Login" class="login"></td>

							<td><input type="button" value="Join" onclick="join();" class="login">
							</td>
						</tr>
					</table>

				</form:form>
			</c:when>

			<c:when test="${s.id!=null}">

				<table>

					<tr>
						<td colspan="4"><font color="blue" face="HY견고딕">${s.id} 님 
						반갑습니다.</font></td>
					</tr>

					<tr>

						<td><a href="../safe/safe_logout"
							style="text-decoration: none"> <img
								src="/SafeProject/images/logout.jpg" width="70" height="22"></a>
						<td>
						<td><a href="../safe/safe_Mypage"
							style="text-decoration: none"> <img
								src="/SafeProject/images/mypage.jpg" width="70" height="22"></a>
						</td>

						<td><a href="../safe/MessageList"
							style="text-decoration: none" target="blank"
							onClick="window.open(this.href, '', 'width=600, height=500'); return false;">
								<img src="/SafeProject/images/msg.JPG" width="70" height="22">
						</a></td>
					</tr>
				</table>
			</c:when>
		</c:choose>
	</div>
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>

	<div id="all_body">
		<tiles:insertAttribute name="all_body" />
	</div>

	<div id="safe_body">
		<tiles:insertAttribute name="safe_body" />
	</div>
	<div id="left">
		<tiles:insertAttribute name="left" />
	</div>
	
	<div id="overlay" class="overlay" >
    
 	</div>

</body>
</html>