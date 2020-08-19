<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>layout3</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<style>
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
<table  align = "center">
<!-- 		<tr> -->
<!-- 			<td colspan = "2"> -->
<%-- 				<tiles:insertAttribute name="userForm2"/> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
		<tr>
			<td>
				<tiles:insertAttribute name="logo"  />
			</td>
<!-- 			<td class = "search" > -->
<%-- 				<tiles:insertAttribute name="search" /> --%>
<!-- 			</td> -->
		</tr>
	</table>
	<table align = "center">
	<tr>
		<td width = "100%" >
			<tiles:insertAttribute name="menuForm" />
		</td>
	</tr>
	</table>
	<table class = h250px align = "center">
		<tr>
			<td width = "100%" class = "h15"  align = "center">
				<tiles:insertAttribute name="body" />
			</td>
		</tr>
	</table>
</center>
</body>
</html>