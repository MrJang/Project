<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>layout4</title>	<!--  -->
<link href = "../style.css" type="text/css" rel = "stylesheet">
<link href = "../button.css" type="text/css" rel = "stylesheet">
<link rel="stylesheet" href="../example.css">
<link rel="stylesheet" href="../font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../jquery.slides.min.js"></script>
<style>
	.aasub{
		/* 	  background-color: #cccccc; */
	  		background : url('../resources/sub/sub_back.png')  width = '100px' no-repeat;
	 	 
	  }
	 body {
			overflow-y:scroll;  
 	}
	input:focus {
    	background-color: aliceblue;
	} 
	textarea:focus{
    	background-color: aliceblue;
	}
</style>
</head>
<body>
<center>
<table width = "1200px">
	<tr>
		<td width = "100%" height = "20px" style = "background:"></td>
	</tr>
</table>
	<table width = "1200px" class = "b0px" border = "0" align = "center" style = "background: ">
		<tr>
			<td width = "100%" align = "center">
				<tiles:insertAttribute name="logo"/>
			</td>
		</tr>
	</table>
	<table width = "1200px">
	<tr>
		<td width = "100%" height = "20px" style = "background:"></td>
	</tr>
	</table>
	<div style = "width : 100%; background: black;">
		<tiles:insertAttribute name="menuForm"/>
	</div>

	<div style = "height : 620px; ">
	<table width = "1000px"  align = "center" style = " height : 500px;">
		<tr>
			<td width = "15%" height = "100%" class = "nopdnomg2" style = "border : 0px solid #000000;">
				<div style =" float : left; width :15%; height : 100%; border : 0px solid #000000;">
				<tiles:insertAttribute name="sub" />
				</div>
				<div style =" width : 1000px; border : 0px solid #000000; height : 100%; ">
				<tiles:insertAttribute name="body" />
				</div>
			</td>
		</tr>
		</table>
	</div>
<!-- 	<div style = "width : 100%; height : 20px; border-top:0px solid #000000;border-left:0px solid #000000;border-right:0px solid #000000;border-bottom:2px solid #000000;"></div> -->
	</center>
</body>
</html>