<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href = "../d_shop.css" type="text/css" rel = "stylesheet">
</head>
<body>
<h3>글정보</h3>
<center>
<div  style= "width:1024px;height:800px;">
<form:form >
	<table width="500px"height="600px">
		<tr>
			<td class="board_color";width="150px">
				작성자
			</td>
			<td class="board_list">
				${d_gongji_info.dsh_writer }
			</td>
			
		</tr>
		<tr>
			<td class="board_color";width="150px">
				날짜
			</td>
			<td class="board_list">
				${d_gongji_info.dsh_date }
			</td>
		</tr>
		<tr>
			<td class="board_color";width="150px">
				제목
			</td>
			<td class="board_list">
				${d_gongji_info.dsh_title }
			</td>
		</tr>
		
		<tr>
			<td class="board_color";width="150px"height="60%">
				내용
			</td>
			<td class="board_list">
				${d_gongji_info.dsh_content }
			</td>
		</tr>
		<tr>
			<td colspan="2">

			<c:choose>
			<c:when test = "${re_des_num==cu_des_num }">
			<div class="subButton"onClick="window.location='d_gongji_delete?dsh_boardnum=${d_gongji_info.dsh_boardnum}'">DeletE</div>
			<div class="subButton"onClick="window.location='d_gongji_upDate?dsh_boardnum=${d_gongji_info.dsh_boardnum}'">UpdatE</div>
			</c:when>
			</c:choose>
			<c:choose>
				<c:when test= "${d_gongji_info.dsh_category == 1}">
				<td><div class="subButton"onClick="window.location='d_gongji'">List</div> 
				</c:when>
				<c:otherwise>
				<td><div class="subButton"onClick="window.location='d_qna'">List</div> 
				</c:otherwise>
				
			</c:choose>
			
			</td>
		</tr>
	</table>


</form:form>
</div>
</center>
</body>
</html>