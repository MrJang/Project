<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js " type="text/javascript"></script>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<script type="text/javascript">
function close1(){
// 	window.opener.location.reload();
	window.close();
}
</script>
<style>
td{
	text-align: center;
}
</style>
</head>
<body>
<form action="boardCanvas" method="post">
<table id="CapctureValueTest"  width = "80%">
	<tr>
		<td colspan = "5">
			<h1><b>CAPTURE</b></h1>
		</td>
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">
		<c:choose>
		<c:when test="${canvas.can_category==1}">
		<td class = "b0px">
		<input type="checkbox" value="${canvas.can_img}" name="capture_img"/>
		${canvas.can_title}
		</td>
		</c:when>
		</c:choose>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">
		<c:choose>
		<c:when test="${canvas.can_category==1}">
			<td class = "b0px"> 
			<img src = "../upload/sm_${canvas.can_img}" alt = "X">
			</td>
			</c:when>
			</c:choose>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">    
		<c:choose>
		<c:when test="${canvas.can_category==1}">
			<td class = "b0px">
			 	작성자 : ${canvas.mem_id}<br/>
			 	${canvas.can_date}
			</td>
			</c:when>
			</c:choose>
		</c:forEach>
	</tr>	
	<tr>
		<td colspan = "5">
			<h1><b>CANVAS</b></h1>
		</td>
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">
		<c:choose>
		<c:when test="${canvas.can_category==2}">
		<td class = "b0px">
		<input type="checkbox" value="${canvas.can_img}" name="capture_img"/>
		${canvas.can_title}
		</td>
		</c:when>
		</c:choose>
		</c:forEach>
	</tr>
	<tr>
	
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">
		<c:choose>
		<c:when test="${canvas.can_category==2}">
			<td class = "b0px"> 
			<img src = "${canvas.can_img}" alt = "X" style = "width : 100px; height : 100px;">
			</td>
		</c:when>
		</c:choose>
		</c:forEach>
		
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">
			<c:choose>
			<c:when test="${canvas.can_category==2}">    
			<td class = "b0px">
			 	작성자 : ${canvas.mem_id}<br/>
			 	${canvas.can_date}
			</td>
			</c:when>
			</c:choose>
		</c:forEach>
	</tr>
	<c:choose>
		<c:when test="${member.mem_auth=='1'}">
		<tr>
		<td colspan = "5">
			<h1><b>RECEIVE_COMMISSION</b></h1>
		</td>
	</tr>
	<tr>
		<c:forEach var = "request" items = "${com_list}" begin = "0" end = "4">
		
		<td>
		<input type="checkbox" value="${request.req_img}" name="capture_img"/>
		${request.req_name}
		</td>
		
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "request" items = "${com_list}" begin = "0" end = "4">
		<c:choose>
		<c:when test="${request.req_category==1}">
			<td class = "b0px"> 
				<img src = "../upload/sm_${request.req_img}" alt = "X" style = "width : 100px; height : 100px;">
			</td>
		</c:when>
		<c:when test="${request.req_category==2}">
			<td class = "b0px"> 
				<img src = "${request.req_img}" alt = "X" style = "width : 100px; height : 100px;">
			</td>
		</c:when>
		</c:choose>
		</c:forEach>
		
	</tr>
	<tr>
		<c:forEach var = "request" items = "${com_list}" begin = "0" end = "4">
			    
			<td class = "b0px">
			 	작성자 : ${request.req_sender}<br/>
			 	${request.req_date}
			</td>
			
		</c:forEach>
	</tr>	
		
		</c:when>
	</c:choose>
	
	<tr>
		<td colspan = "5">
			<h1><b>MY_COMMISSION</b></h1>
		</td>
	</tr>
	<tr>
		<c:forEach var = "request" items = "${com_list2}" begin = "0" end = "4">
		
		<td width = "20%">
		<input type="checkbox" value="${request.req_img}" name="capture_img"/>
		${request.req_name}
		</td>
		
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "request" items = "${com_list2}" begin = "0" end = "4">
			<c:choose>
				<c:when test="${request.req_category==1}">
					<td width = "20%"> 
						<img src = "../upload/sm_${request.req_img}" alt = "X" style = "width : 100px; height : 100px;">
					</td>
				</c:when>
				<c:when test="${request.req_category==2}">
					<td width = "20%"> 
						<img src = "${request.req_img}" alt = "X" style = "width : 100px; height : 100px;">
					</td>
				</c:when>
			</c:choose>
		</c:forEach>
		
	</tr>
	<tr>
		<c:forEach var = "request" items = "${com_list2}" begin = "0" end = "4">
			    
			<td width = "20%">
			 	의뢰중인 디자이너 : ${request.req_receiver}<br/>
			 	${request.req_date}
			</td>
			
		</c:forEach>
	</tr>
	<tr>
		<td colspan = "5" align = "right" >
			<div style = "float :right; margin-top : 40px;">
				<input type="submit" class = "myButton4" value="확인" > <input type = "button" class = "myButton4" value="취소" id="close" onclick="close1();"/>
			</div>
				
		</td>
	</tr>	
	</table>
	
</form>
</body>
</html>