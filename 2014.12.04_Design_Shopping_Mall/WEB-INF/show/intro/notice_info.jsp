<%@page import="yjc.spring.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>articleInfo.jsp</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<link href = "../button.css" type="text/css" rel = "stylesheet">
<style>
td{
	text-align : center;
}
</style>
</head>
<body>

<form:form commandName = "board">
<table style = "width : 700px; border : 1px solid black;">
	<tr>
		<td align = "center" style = "background : #CFCFC3; font-family: bold;">
			<b>글번호 : ${board.bod_num}</b>	
		</td>
		<td align = "center" style = "background : #CFCFC3; font: bold;">
			<b>제목 : ${board.bod_title}</b>
		</td>
		<td rowspan = "2" align = "center" style = "background : #CFCFC3; ">
			<b>작성자 : ${board.mem_id}</b>	
		</td>
	</tr>
	<tr>
		<td align = "center" style = "background : #CFCFC3; ">
			<b>조회수 : ${board.bod_readcount}</b>	
		</td>
		<td align = "center" style = "background : #CFCFC3; ">
			<b>날짜 : ${board.bod_date}</b>	
		</td>
		
	</tr>
	
	
<!-- 		<td> -->
<%-- 		ip : ${board.ip}	 --%>
<!-- 		</td> -->	
		<c:choose>
			<c:when test="${board.bod_img == 'null.jpg'}">
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan = "5" align = "center">
						<img src = "../upload/${board.bod_img}" alt = "이미지 로딩중" width="515px" style = "height:550px;">
					</td>
				</tr>	
			</c:otherwise>
		</c:choose>
	<tr>
		<td colspan = "5" class = content>
		<pre>${board.bod_content}</pre>
		</td>
	</tr>
	
	<tr>
		<td colspan = "5">
		recommend : ${board.bod_recommend}	
		</td>
	</tr>
<c:choose>
	<c:when test="${member.mem_auth=='0' || member.mem_id==board.mem_id}">
			<tr>
				<td align = "center" colspan = "3" style = "width : 100%; border : 1px solid black;">
					<div style = "float : left;">
						<input type = "button" class = "board_modify" value = "수정" onClick = "window.location ='update_intro?num=${board.bod_num}&pageNum=${param.pageNum}'">
						<input type = "button" class = "board_delete" value = "삭제" onClick = "window.location = 'delete_intro?num=${board.bod_num}&pageNum=${param.pageNum}'">
					</div>
						<div style = "float : right;">
						<input type = "button" class = "board_list" value = "목록" onClick = "window.location = 'intro?pageNum=${param.pageNum}'">
					</div>	
				</td>
			</tr>
	</c:when>
	
	<c:otherwise>
			<tr>
				<td colspan = "3" width = "100%">
					<div style = "float : right; text-align:right;">
						<input type = "button" class = "board_list" value = "목록" onClick = "window.location = 'intro?pageNum=${param.pageNum}'">
					</div>
				</td>
			</tr>
	</c:otherwise>
	
</c:choose>
</table>
</form:form>
</body>
</html>