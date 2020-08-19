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

function mouseOver2(tableRow, mouse){
    if (mouse) {
        tableRow.style.cursor = 'pointer';
        tableRow.style.backgroundColor = '#b7e1e6';
        // b7e1e6 하늘색
        // cdd4da 연한하늘색
        // d9a07f 연한갈색
    } else {
    	tableRow.style.backgroundColor = '#89E7D0';
    }
}



</script>
</head>
<body>
<center>
<table width = "100%" style = "height : 100%; ">
	<tr>
		<td colspan = "6" class = "b0px">
			<center>
				<h2>자유 게시판</h2>
			</center>
		</td>
	</tr>
	<tr style="vertical-align: top;">
					<td class="b0px" width="100px" height="1px"></td>

					<td class="b0px" width="100px" height="1px"></td>

					<td class="b0px" width="100px" height="1px"></td>

					<td class="b0px" width="100px" height="1px"></td>

					<td class="b0px" width="100px" height="1px"></td>
				</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1))*10}" end = "${((param.pageNum-1)*10)+4}">
			<td align = "center" onmouseover='mouseOver2(this, true);' onmouseout='mouseOver2(this, false);' onClick = "window.location = 'getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" style = "background :#89E7D0; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
				${board.bod_title}<br/>
				조회수 :	${board.bod_readcount}
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1))*10}" end = "${((param.pageNum-1)*10)+4}">
			<td align = "center"  onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);' onClick = "window.location = 'getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" style = "background : #FFFFFF; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;"> 
			<img src = "../upload/sm_${board.bod_img}" style = "-moz-border-radius:40px; -webkit-border-radius:40px; width :100px; height : 100px;"  alt = "이미지 로딩중">
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1))*10}" end = "${((param.pageNum-1)*10)+4}">    
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" style = "background :#FFFFFF; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
			 	작성자 : ${board.mem_id}<br/>
			 	${board.bod_date}
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
		<td align = "center" onmouseover='mouseOver2(this, true);' onmouseout='mouseOver2(this, false);'
			onClick = "window.location = 'getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" style = "background :#89E7D0; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
			제목 : ${board.bod_title}<br/>
			조회수 :	${board.bod_readcount}
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1)*10)+5}" end = "${((param.pageNum-1)*10)+9}">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" style = "background :#FFFFFF; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
			<img src = "../upload/sm_${board.bod_img}" style = "width :100px; height : 100px;" alt = "X">
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "board" items = "${list}" begin = "${((param.pageNum-1)*10)+5}" end = "${((param.pageNum-1)*10)+9}">       
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
				onClick = "window.location = 'getArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'" style = "background :#FFFFFF; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
			 	작성자 : ${board.mem_id}<br/>
			 	${board.bod_date}
			</td>
		</c:forEach>
	</tr>	
	<tr>
		<td colspan = "6">
	
	<c:choose>
	<c:when test="${member.mem_auth=='0'||member.mem_auth=='1'||member.mem_auth=='2'}">
		<div style=text-align:right>
			<input type = "button" class = "board_write" id = "writeArticle" value = "글쓰기" onClick = "window.location = 'insertArticle2?pageNum=${param.pageNum}'">
		</div>
	</c:when>
<c:otherwise>
		<div style=text-align:right>

		</div>
</c:otherwise>
</c:choose>
		</td>
		</tr>
	</table>
	
	<br/>
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
					<span style="cursor :pointer; text-align: center; font-size: 50px;" onClick="location.href = 'board2?pageNum=${((param.pageNum)-5)}'">◀</span>
				</c:when>
			</c:choose>
			<%
				for (i = (e + pg) - 5; i < j; i++) {
					if (i == pg) {
			%>

			<span style="cursor :pointer; text-align: center; font-size: 50px;" onClick="location.href = 'board2?pageNum=<%=i%>'"><%=i%></span>
			<%
				} else {
			%>
			<span style="cursor :pointer; text-align: center; font-size: 30px;" onClick="location.href = 'board2?pageNum=<%=i%>'"><%=i%></span>
			<%
				}
				}
				if (e + pg <= pageCount) {
			%>
			<span style="cursor :pointer; text-align: center; font-size: 50px;" onClick="location.href = 'board2?pageNum=<%=e + pg%>'">▶</span>
			<%
				}
			%>
			<!-- 		</td> -->
			<!-- 	</tr> -->
		</div>
		<br />
		<%-- <%=pg%><br/> --%>
		<%-- f: <%=f%><br/> --%>
		<%-- <%=startPage%><br/> --%>
		<%-- <%=endPage%><br/> --%>
		<%-- <%=pageCount%><br/> --%>
		<%-- e : <%=e%><br/> --%>
		<%-- j : <%=j%><br/> --%>
</center>
</body>
</html>