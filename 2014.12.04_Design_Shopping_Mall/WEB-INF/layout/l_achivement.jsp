<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>achivement</title>
</head>
<link href="../style.css" type="text/css" rel="stylesheet">
<link href="../button.css" type="text/css" rel="stylesheet">
<body>
<table style = "width : 784px;  border-color : black; border-style : outset; ">
	<tr>
		<td style = "height : 750px; vertical-align: top; ">
			<tiles:insertAttribute name="body"/>
		</td>
	</tr>

</table>


</body>
</html>


