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
<div class="shopping" style= "width:1024px;height:800px;">
	<h3>공지사항</h3>
	<table class = "board_table"   align="center">
	
		<tr>
			<td class="board_color"width="">
				글번호
			</td>
			
			<td class="board_color" width="60%">
				제목
			</td>
			<td class="board_color">
				작성자
			</td>
			<td class="board_color">
				작성일자
			</td>
			
		</tr>
	
		<c:forEach var="bbs" items="${d_gongji}" varStatus="i">
			<tr>
				<td class="board_list">

					${m_size-(i.count-1) }

				</td>	
				<td class="board_list">
					<a href="/INNO/spring/d_gongji_info?dsh_boardnum=${bbs.dsh_boardnum }">${bbs.dsh_title }</a>
				</td>
				<td class="board_list">
					${bbs.dsh_writer }
				</td>
				<td class="board_list">
					${bbs.dsh_date }
				</td>
				
		 	</tr>
		</c:forEach>	
		
	</table>
	<table width="100%">
	<tr>
	<c:choose>
	<c:when test="${member.mem_auth==1&&re_des_num==cu_des_num }">
	<td align="right">
	<div class="subButton"onClick="window.location='d_gongji_insert'">WritE</div>
	</td>
	</c:when>
	</c:choose>
	
	</tr>
	</table>
	
	</div>
</body>

</html>