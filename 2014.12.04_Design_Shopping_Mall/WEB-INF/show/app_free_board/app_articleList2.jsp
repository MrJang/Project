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
    } else {
    	tableRow.style.backgroundColor = 'white';
    }
}

</script>
</head>
<body>
<center>
<table width = "100%" style = "height : 100%;">
	<tr>
		<td colspan = "6">
<c:choose>
	<c:when test="${member.mem_auth=='0'||member.mem_auth=='1'||member.mem_auth=='2'}">
	<div>자유게시판　　　　　&nbsp;&nbsp;&nbsp;<input class = "myButton3" type = "button" id = "writeArticle" value = "글쓰기" onClick = "window.location = 'app_free_insertArticle2'"></div>
	<table  align="right" style="margin-top: 5px;"><tr><td><font size="1px">총게시글 수${listsize}</font></td></tr></table>
	</c:when>
</c:choose>
		</td>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1))*10}" end = "${((param.pageNum-1)*10)+4}">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_free_getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
		${board.bod_title}<br/>
		<font size="1px">조회수 :	${board.bod_readcount}</font>
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1))*10}" end = "${((param.pageNum-1)*10)+4}">
			<td align = "center"  onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_free_getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px"> 
			<img src = "../upload/sm_${board.bod_img}" style = "width :100px; height : 100px;"  alt = "이미지 로딩중">
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1))*10}" end = "${((param.pageNum-1)*10)+4}">    
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_free_getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
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
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1)*10)+5}" end = "${((param.pageNum-1)*10)+9}">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_free_getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
			제목 : ${board.bod_title}<br/>
			<font size="1px">조회수 :	${board.bod_readcount}</font>
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1)*10)+5}" end = "${((param.pageNum-1)*10)+9}">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'app_free_getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
			<img src = "../upload/sm_${board.bod_img}" style = "width :100px; height : 100px;" alt = "X">
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1)*10)+5}" end = "${((param.pageNum-1)*10)+9}">       
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
				onClick = "window.location = 'app_free_getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" class = "b0px">
			 	작성자 : ${board.mem_id}<br/>
			 	<font size="1px">${board.bod_date}</font>
			</td>
		</c:forEach>
	</tr>
	</table>
<%
			String listsize = String.valueOf(session.getAttribute("listsize"));
			// 		TODO ls
			int ls = (Integer.parseInt(listsize));
			String pageNum = request.getParameter("pageNum");
			int pg = (Integer.parseInt(pageNum));
			int i = 1;
			int j = 0;
			int e = 0;

			if (pg % 5 == 1) {
				e = 5;
			} else if (pg % 5 == 2) {
				e = 4;
			} else if (pg % 5 == 3) {
				e = 3;
			} else if (pg % 5 == 4) {
				e = 2;
			} else if (pg % 5 == 0) {
				e = 1;
			}

			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10;
			int count = ls;
			double dblArticleCount = count * 1.0;
			int pageCount = (int) Math.ceil((dblArticleCount * 1.0 / pageSize));
			int startPage = (int) (currentPage / 10) * 10 + 1;
			int pageBlock = 5;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}

			if ((e + pg) > pageCount && ls % 10 != 0) {
				j = pageCount + 1;
			} else if ((e + pg) > pageCount && ls % 10 == 0) {
				j = pageCount + 1;
			} else if (ls > (pageSize*4)) {
				j = (e + pg);
			}
		%>
		<div style="float: center; width: 70%; height: 20px;">
			<c:choose>
				<c:when test="${param.pageNum>5}">
					<span onmouseover='mouseOver2(this, true);'
						onmouseout='mouseOver2(this, false);'
						style="text-align: center; font-size: 50px;"
						onClick="location.href = 'app_free_board2?pageNum=${((param.pageNum)-5)}'">◀</span>
				</c:when>
			</c:choose>
			<%
				for (i = (e + pg) - 5; i < j; i++) {
					if (i == pg) {
			%>

			<span onmouseover='mouseOver2(this, true);'
				onmouseout='mouseOver2(this, false);'
				style="text-align: center; font-size: 50px;"
				onClick="location.href = 'app_free_board2?pageNum=<%=i%>'"><%=i%></span>
			<%
				} else {
			%>
			<span onmouseover='mouseOver2(this, true);'
				onmouseout='mouseOver2(this, false);'
				style="text-align: center; font-size: 30px;"
				onClick="location.href = 'app_free_board2?pageNum=<%=i%>'"><%=i%></span>
			<%
				}
				}
				if (e + pg <= pageCount) {
			%>
			<span onmouseover='mouseOver2(this, true);'
				onmouseout='mouseOver2(this, false);'
				style="text-align: center; font-size: 50px;"
				onClick="location.href = 'app_free_board2?pageNum=<%=e + pg%>'">▶</span>
			<%
				}
			%>
			<!-- 		</td> -->
			<!-- 	</tr> -->
		</div>
</center>
</body>
</html>