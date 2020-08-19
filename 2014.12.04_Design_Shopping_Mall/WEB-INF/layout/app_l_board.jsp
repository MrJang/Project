<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	  }
</style>
</head>
<body>
<center>
	<table width = "240px"  align = "center" style = " height : 100%;">
		<tr>
			<td width = "240px" height = "400px" class = "nopdnomg2" >
				<tiles:insertAttribute name="body" />
			</td>
		</tr>
		</table>
<!-- 	<div style = "width : 100%; height : 20px; border-top:0px solid #000000;border-left:0px solid #000000;border-right:0px solid #000000;border-bottom:2px solid #000000;"></div> -->
	</center>
</body>
</html>