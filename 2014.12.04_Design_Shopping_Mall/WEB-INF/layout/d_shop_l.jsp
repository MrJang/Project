<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>layout2</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../jquery.slides.min.js"></script>
</head>
<body>
<center>
<table width = "1200px">
	<tr>
		<td width = "100%" height = "8px" >
		
		</td>
	</tr>
	<tr>
		<td width = "100%" height = "1px" >
		</td>
	</tr>
</table>
	<table width = "1200px" class = "b0px" border = "0" align = "center">
		<tr>
			<td width = "100%" align = "center">
				<tiles:insertAttribute name="logo"/>
			</td>
		</tr>
	</table>
	<table width = "1200px">
	<tr>
		<td width = "100%" height = "20px" ></td>
	</tr>
	</table>
	<div style = "width : 100%; background: black;">
	<tiles:insertAttribute name="menuForm"/>
	</div>
	<br/>
	<table class = "d_shop" >
	   <tr>
			<td colspan="2" width = "100%">
					<tiles:insertAttribute name="d_header"/>
			</td>
	   </tr>
	   </table>
<div  style= "width:1250px;height:720px;background-image:url('../d_shop_img/${back}');">
	   <table align="center">
		<tr>
			<td >
				<tiles:insertAttribute name="d_sub"/>
			</td>
			<td >
				<tiles:insertAttribute name="d_body"/>
			</td>
		</tr>
		</table>
</div>
		

	</center>
</body>
</html>