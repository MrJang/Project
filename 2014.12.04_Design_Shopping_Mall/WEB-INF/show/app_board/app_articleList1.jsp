<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>articleList.jsp</title>
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
<center>
<table width = "100%" style = "height : 100%; ">
	<tr>
		<td colspan = "6" class = "b0px">
		
<c:choose>

	<c:when test="${member.mem_auth=='0'||member.mem_auth=='1'}">
	
	<div>디자이너 보드　　　　&nbsp;&nbsp;<input type = "button" class="myButton3" id = "writeArticle" value = "글쓰기" onClick = "window.location = 'app_insertArticle'"></div>
	<table  align="right" style="margin-top: 5px;"><tr><td><font size="1px">총게시글 수${listsize}</font></td></tr></table>
	
	
	</c:when>

</c:choose>


		</td>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1))*10}" end = "${((param.pageNum-1)*10)+2}">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_getArticle?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
		${board.bod_title}<br/>
		<font size="1px">조회수 :	${board.bod_readcount}</font>
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1))*10}" end = "${((param.pageNum-1)*10)+2}">
			<td align = "center"  onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_getArticle?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px"> 
			<img src = "../upload/sm_${board.bod_img}" style = "width :100px; height : 100px;"  alt = "이미지 로딩중">
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1))*10}" end = "${((param.pageNum-1)*10)+2}">    
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_getArticle?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
			 	작성자 : ${board.mem_id}<br/>
			 	<font size="1px">${board.bod_date}</font>
			</td>
		</c:forEach>
	</tr>
	<tr>
		<td>
			<br/>	
		</td>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1)*10)+3}" end = "${((param.pageNum-1)*10)+5}">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_getArticle?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
			제목 : ${board.bod_title}<br/>
			<font size="1px">조회수 :	${board.bod_readcount}</font>
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1)*10)+3}" end = "${((param.pageNum-1)*10)+5}">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_getArticle?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
			<img src = "../upload/sm_${board.bod_img}" style = "width :100px; height : 100px;" alt = "X">
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1)*10)+3}" end = "${((param.pageNum-1)*10)+5}">       
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
				onClick = "window.location = 'app_getArticle?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
			 	작성자 : ${board.mem_id}<br/>
			 	<font size="1px" id ="date">${board.bod_date}</font>
			</td>
		</c:forEach>
	</tr>
	</table>
	
	<br/>
<%-- 	<%if(currentPage>2){%> --%>
<%-- 	<a href = "board1?pageNum=<%=pagesize-1%>">이전</a> --%>
<%-- 	<%}else{%> --%>
<%-- 	<%}%> --%>
<%-- 	<c:forEach begin = "1" end = "${maxPageNum}"  varStatus = "status"> --%>
<%-- 	<c:forEach begin = "1" end = "2"  varStatus = "status"> --%>
<%-- 	<a href = "board1?pageNum=${status.index}">${status.index}</a> --%>
<%-- 	</c:forEach> --%>
<%-- 	</c:forEach> --%>
<%-- 		<%if(currentPage<3){%> --%>
<%-- 		<a href = "board1?pageNum=<%=pagesize+1%>" onClick = "<%i=i*2;%>">다음</a> --%>
<%-- 		<%}else{%> --%>
<%-- 		<%}%> --%>

<c:set var = "i" value= "0"/>
<c:set var = "k" value= "${listsize/10}"/>

<%-- <c:choose> --%>
<%-- 	<c:when test="${listsize%10==0}"><script>alert('3');</script></c:when> --%>
<%-- 	<c:when test="${listsize>40}"><script>alert('1');</script></c:when> --%>
<%-- 	<c:when test="${listsize<40}"><script>alert('2');</script></c:when> --%>
<%-- </c:choose> --%>
<c:choose>
	<c:when test="${listsize%10==0}"><c:set var = "j" value="${k-1}"/></c:when>
	<c:when test="${listsize<40}"><c:set var = "j" value = "${listsize/10}"/></c:when>
	<c:when test="${listsize>40}"><c:set var = "j" value = "4"/></c:when>
<%-- 	<c:when test="${listsize>40}"><c:set var = "j" value="${(listsize/10)-1}"/></c:when> --%>
	

<%-- 	<c:when test="${listsize<50&&listsize%10==0}"><c:set var = "j" value="${(listsize/10)-1}"/></c:when> --%>
</c:choose>
<c:choose>
	<c:when test="${(param.pageNum-1)%4>=0&&(param.pageNum-1)/5>=1}">
	<c:set var = "i" value = "${i+5}"/>
	<c:choose>
		<c:when test="${j+5>listsize/10&&listsize%10==0}"><c:set var = "j" value="${(listsize/10)-1}"/></c:when>
		<c:when test="${j+5>listsize/10}"><c:set var = "j" value="${(listsize/10)-1}"/></c:when>
		<c:when test="${j+5<listsize/10}"><c:set var = "j" value = "${j+5}"/></c:when>
	</c:choose>
	</c:when>
	
	
	
</c:choose>
<c:choose>
	<c:when test="${param.pageNum>5}">
		<span style = "font-size :40px;" onClick = "location.href = 'app_board?pageNum=${((param.pageNum)-5)}'">◀</span>
	</c:when>
</c:choose>
<c:forEach begin="${i}" end="${j}" varStatus="status">
<%-- ${status.index} --%>
<%-- ${status.count} --%>

<c:choose>
	<c:when test="${status.index+1==param.pageNum}">
		<span style = "font-size :40px;" onClick = "location.href = 'app_board?pageNum=${status.index+1}'">${status.index+1}</span>
	</c:when>
	<c:otherwise>
		<span style = "font-size :20px;" onClick = "location.href = 'app_board?pageNum=${status.index+1}'">${status.index+1}</span>
		
	</c:otherwise>
</c:choose>

</c:forEach>
<c:choose>
	<c:when test="${listsize>50}">
			<span style = "font-size :40px;" onClick = "location.href = 'app_board?pageNum=${(((param.pageNum)+6)-param.pageNum)}'">▶</span>
	</c:when>
</c:choose>

</center>
</body>
</html>