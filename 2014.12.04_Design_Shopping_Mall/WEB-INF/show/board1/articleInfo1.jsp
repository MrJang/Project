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
<script type="text/javascript">
	function d_req(){
	
// 		alert('${board.mem_id}');
		req_main1 = window.open("req_Dmain?selected_designer=${board.mem_id}&bod_num=${board.bod_num}", "name=_blank", 'width=800px height=780px toolbar=0 location=0 status=0 menubar=0 scrollbars=0 resizable=0 titlebar=0 left=550');
		req_main1.focus();
	}
</script>
</head>
<body>

<form:form commandName = "board">
<br/>
<!-- <br/> -->

<table style = "width : 700px; border : 0px solid black;">
	<tr>
		<td class = "board_skin" align = "left" colspan = "3" style = " width : ; background : ; font-family: bold;">
			<b>${board.bod_title}</b>
		</td>
	</tr>
	<tr>
		<td class = "board_skin" align = "left" style = " width : 33%; background : black; font-family: bold;">
			<b style = "color : white;">조회수</b>	
		</td>
		<td class = "board_skin" align = "left" style = " width : 33%; background : black; font-family: bold;">
			<b style = "color : white;">작성자</b>
		</td>
		<td class = "board_skin" align = "left" style = " width : 33%; background : black; font-family: bold;">
<%-- 			<b style = "color : white; font-size: 20px;">${board.mem_id}</b> --%>
			<b style = "color : white;">날짜</b>	
		</td>
<!-- 		<td class = "board_skin" align = "left" style = " width : 35%; background : black; font-family: bold;"> -->
<!-- 			<b style = "color : white;">최소가격</b> -->
<!-- 		</td> -->

	</tr>
	<tr>
		<td align = "left" class = "board_skin" style = "font-family: bold;">
			<b>${board.bod_readcount}</b>
		</td>
		<td align = "left" class = "board_skin" style = "font-family: bold;">
			<b>${board.mem_id}</b>
		</td>
		<td align = "left" class = "board_skin" style = "font-family: bold;">
			<b>${board.bod_date}</b>
		</td>
<!-- 		<td align = "left" class = "board_skin" style = "font-family: bold;"> -->
<%-- 			<b>${board.bod_price}</b> --%>
<!-- 		</td> -->
		
	</tr>
	
	
<!-- 		<td> -->
<%-- 		ip : ${board.ip}	 --%>
<!-- 		</td> -->	
		<c:choose>
			<c:when test="${board.bod_img == 'null.jpg'}">
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan = "6" align = "center" width = "100%">
						<c:choose>
							<c:when test="${board.bod_img_category == '1'||board.bod_img_category == '3' }">
							<img src="../upload/${board.bod_img}" style="width: 515px; height: 550px;" alt="X">
							</c:when>
							<c:when test="${board.bod_img_category == '2'}">
							<img src="${board.bod_img}" style="width: 515px; height: 550px;" alt="X">
							</c:when>
						</c:choose>
					</td>
				</tr>	
			</c:otherwise>
		</c:choose>
	<tr>
		<td colspan = "6" class = content>
		<pre>${board.bod_content}</pre>
		</td>
	</tr>
<c:choose>
	<c:when test="${(member.mem_auth=='0' || member.mem_auth=='1' || member.mem_auth=='2')&&(member.mem_id!=board.mem_id)}">
	<tr>
		<td colspan = "6">
		<div onClick = "d_req();" style = "cursor : pointer; width : 100%; height : 100%; background: skyblue;"><b style = "color : white;">제작 의뢰하기</b></div>	
		</td>
	</tr>
	</c:when>
</c:choose>
	
	
<!-- 	#8AC007 -->
	<tr>
		<td colspan = "6">
<%-- 		recommend : ${board.bod_recommend}	 --%>
		</td>
	</tr>
<c:choose>
	<c:when test="${member.mem_auth=='0' || member.mem_id==board.mem_id}">
			<tr>
				<td align = "center" colspan = "6" style = "width : 100%; border : 0px solid black;">
					<div style = "float : left;">
						<input type = "button" class = "board_modify" value = "수정" onClick = "window.location ='updateArticle1?num=${board.bod_num}&pageNum=${param.pageNum}'">
						<input type = "button" class = "board_delete" value = "삭제" onClick = "window.location = 'deleteArticle1?num=${board.bod_num}&pageNum=${param.pageNum}'">
					</div>
						<div style = "float : right;">
						<input type = "button" class = "board_list" value = "목록" onClick = "window.location = 'board1?pageNum=${param.pageNum}'">
					</div>	
				</td>
			</tr>
	</c:when>
	
	<c:otherwise>
			<tr>
				<td colspan = "6" width = "100%">
					<div style = "float : right; text-align:right;">
						<input type = "button" class = "board_list" value = "목록" onClick = "window.location = 'board1?pageNum=${param.pageNum}'">
					</div>
				</td>
			</tr>
	</c:otherwise>
	
</c:choose>
</table>
</form:form>
</body>
</html>