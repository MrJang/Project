<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href = "../d_shop.css" type="text/css" rel = "stylesheet">

</head>
<body>
<div class="d_sub" style="height:800px">
<%-- <div class="d_sub" style= "width:200px;height:800px;background-image:url('../d_shop_img/${back}');"> --%>
<table width="200px"height="400px" >
	<tr>
		<td><a href="d_shop?des_num=${re_des_num }"><img src="../d_shop_img/${logo}" width=200px ></a></td>
	</tr>
	<tr>
		<td><div class="subButton1"onClick = "window.location = 'd_gongji'">Notice</div></td>
	</tr>
		
	<tr>
		<td><div class="subButton1"onClick = "window.location = 'd_shopping'">AllProduct</div></td>
	</tr>
	<tr>
		
		<td><div class="subButton9"onClick = "window.location = 'd_shopping_cate?category_num=1'">Top</div></td>
	</tr>
	<tr>
		<td><div class="subButton9"onClick = "window.location = 'd_shopping_cate?category_num=2'">Bottom</div></td>
	</tr>
	<tr>
		<td><div class="subButton9"onClick = "window.location = 'd_shopping_cate?category_num=3'">Accessory</div></td>
	</tr>
	<tr>
		<td><div class="subButton9"onClick = "window.location = 'd_shopping_cate?category_num=4'">Etc.</div></td>
	</tr>
	
	<tr>
		<td><div class="subButton1"onClick = "window.location = 'd_qna'">Q&A</div></td>
	</tr>
	
				
			<c:choose>
			
				<c:when test= "${member.mem_auth == 1}">
				<tr>
					<td>
					<c:choose>
						<c:when test="${re_des_num==cu_des_num}">
							<div class="managebutton"onClick = "window.location = 'd_manager'">Management</div>
						</c:when>
					</c:choose>
					</td>
				</tr>
				</c:when>
				
			
				
			</c:choose>
				
		
</table>
</div>
</body>
</html>