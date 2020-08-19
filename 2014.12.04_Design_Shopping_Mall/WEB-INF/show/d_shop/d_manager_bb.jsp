<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "../d_shop_style.css" type="text/css" rel = "stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>

<body>
<div class="d_sub" style= "width:1024px;height:800px;">
<form:form commandName = "d_shop" enctype = "multipart/form-data">
<table>

<tr>
	<td width="300px"style="background-color:white;border:5px dotted black">
		<h3>Logo</h3><img src="../d_shop_img/${logo}" width=300px >
	</td>
	<td width="300px"style="background-color:white;border:5px dotted black">
		<h3>BackGround</h3><img src="../d_shop_img/${back}" width=300px >
	</td>
</tr>

<tr>	
	<td colspan="2">
		<select name="cate">
			<option value=1>로고등록</option>
			<option value=2>배경등록</option>
		</select>
			<form:input path = "mem_id" value = "${member.mem_id}" type = "hidden"/>
		<form:input path = "des_num" type = "hidden" value = "${cu_des_num}"/>
		<form:input path = "uploadfile" type = "file" cols = "30" />
 		<input class="subButton"type = "submit" value = "ReGist"/>
		<input class="subButton"type = "reset" value = "ReSet"/>
	
 	</td>
 </tr>		

</table>
</form:form>
</div>
</body>

</html>