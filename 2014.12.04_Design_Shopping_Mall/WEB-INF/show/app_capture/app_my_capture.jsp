<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<script type="text/javascript">
function mouseOver(tableRow, mouse){
    if (mouse) {
        tableRow.style.cursor = 'pointer';
        tableRow.style.backgroundColor = '#b7e1e6';
        // b7e1e6 하늘색
        // cdd4da 연한하늘색
        // d9a07f 연한갈색
    } else {
    	tableRow.style.backgroundColor = 'white';
    }
}



</script>
</head>
<body>
	<div style="margin-left: 5px; margin-top:5px;">
	<form:form commandName = "canvas" enctype = "multipart/form-data">
<%-- 		<form:input path = "can_num" type = "hidden" cssClass = "normal" cssErrorClass = "errors"/> --%>
		<form:input path = "mem_num" value = "${member.mem_num}" type = "hidden"/>
  		<form:input path = "can_title" type="text" style="width:55%"/>	
  		<input type = "submit" class="myButton3"value = "등록"/><input class="myButton3" type = "reset" value = "리셋"/>
 		<form:input path = "uploadfile" type = "file"/>
	</form:form>	
	</div>
	<table style="margin-left: 5px;" cellspacing="10px">
	<tr>
	
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "2">
		<td onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_getCanvas?can_num=${canvas.can_num}&pageNum=${param.pageNum}'" class = "b0px" >
		${canvas.can_title}
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "2">
			<td onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_getCanvas?can_num=${canvas.can_num}&pageNum=${param.pageNum}'" class = "b0px"> 
			<img src = "../upload/sm_${canvas.can_img}" alt = "X">
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "2">    
			<td onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_getCanvas?can_num=${canvas.can_num}&pageNum=${param.pageNum}'" class = "b0px">
			 	작성자 : ${canvas.mem_id}<br/>
			 	${canvas.can_date}
			</td>
		</c:forEach>
	</tr>
	</table>
<center>
<%-- <c:set var = "i" value= "0"/> --%>
<%-- <c:set var = "k" value= "${listsize/10}"/> --%>

<%-- <c:choose> --%>
<%-- 	<c:when test="${listsize%10==0}"><c:set var = "j" value="${k-1}"/></c:when> --%>
<%-- 	<c:when test="${listsize<40}"><c:set var = "j" value = "${listsize/10}"/></c:when> --%>
<%-- 	<c:when test="${listsize>40}"><c:set var = "j" value = "4"/></c:when> --%>
<%-- </c:choose> --%>
<%-- <c:choose> --%>
<%-- 	<c:when test="${(param.pageNum-1)%4>=0&&(param.pageNum-1)/5>=1}"> --%>
<%-- 	<c:set var = "i" value = "${i+5}"/> --%>
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${j+5>listsize/10&&listsize%10==0}"><c:set var = "j" value="${(listsize/10)-1}"/></c:when> --%>
<%-- 		<c:when test="${j+5>listsize/10}"><c:set var = "j" value="${(listsize/10)-1}"/></c:when> --%>
<%-- 		<c:when test="${j+5<listsize/10}"><c:set var = "j" value = "${j+5}"/></c:when> --%>
<%-- 	</c:choose> --%>
<%-- 	</c:when> --%>
<%-- </c:choose> --%>
<%-- <c:choose> --%>
<%-- 	<c:when test="${param.pageNum>5}"> --%>
<%-- 		<span style = "font-size :40px;" onClick = "location.href = 'app_my_capture?pageNum=${((param.pageNum)-5)}'">◀</span> --%>
<%-- 	</c:when> --%>
<%-- </c:choose> --%>
<%-- <c:forEach begin="${i}" end="${j}" varStatus="status"> --%>

<%-- <c:choose> --%>
<%-- 	<c:when test="${status.index+1==param.pageNum}"> --%>
<%-- 		<span style = "font-size :40px;" onClick = "location.href = 'app_my_capture?pageNum=${status.index+1}'">${status.index+1}</span> --%>
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<%-- 		<span style = "font-size :20px;" onClick = "location.href = 'app_my_capture?pageNum=${status.index+1}'">${status.index+1}</span> --%>
		
<%-- 	</c:otherwise> --%>
<%-- </c:choose> --%>

<%-- </c:forEach> --%>
<%-- <c:choose> --%>
<%-- 	<c:when test="${listsize>50}"> --%>
<%-- 			<span style = "font-size :40px;" onClick = "location.href = 'app_my_capture?pageNum=${(((param.pageNum)+6)-param.pageNum)}'">▶</span> --%>
<%-- 	</c:when> --%>
<%-- </c:choose> --%>
</center>
</body>
</html>