<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
td{
	text-align: center;
}
</style>
</head>
<body>
<!-- <div style = "float : right; width : 85%; height : 15%; background: #CCCCCC;"> -->
<!-- <table border = "0" width = "100%" style = "height : 100%;"> -->
<!-- 	<tr> -->
<!-- 		<td><b>공지사항</b></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td style = "height :80px; vertical-align: top;" > -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${member.mem_auth=='0'}"> --%>
<!-- 				<div style="text-align: right"> -->
<!-- 					<input type="button" class = "board_write" value="글쓰기" onClick="window.location = 'insert_notice'"> -->
<!-- 				</div> -->
<%-- 			</c:when> --%>
<%-- 		</c:choose> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->
	
<!-- </div> -->
<!-- <div style = "width : 100%; height : 85%; background: #EEEEEE;"> -->
<!-- 	<div style = "float : right; width : 85%; height : 85%; background: #DDDDDD;"> -->
<!-- 		<table width = "100%" style = "border : 0px solid black;"> -->
<!-- 			<tr> -->
<!-- 				<td width = "10%" style = "border : 1px solid black;">번호</td><td width = "45%" style = "border : 1px solid black;">제목</td><td style = "border : 1px solid black;">글쓴이</td><td width = "25%" style = "border : 1px solid black;">날짜</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</div> -->
<!-- </div> -->


<center>
	<div style="width: 690px; height : 590px; vertical-align: top; float: left; background: aliceblue;">
		<table align="center" style="vertical-align: top; width: 100%; " border="0">
			<tr style="vertical-align: top;">
				<td align = "center" colspan="6" class="b0px" height="10px">
					<h2>공지사항</h2>
				</td>
			</tr>
		</table>
		<table align="center" style="vertical-align: top; width: 100%; " border="0">
			<tr style="vertical-align: top;">
				<td align = "center" colspan="6" class="b0px" height="10px">
					<c:choose>
						<c:when test="${member.mem_auth=='0'}">
							<div style="text-align: right">
								<input type="button" class = "board_write" value="글쓰기" onClick="window.location = 'insert_notice'">
							</div>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td width = "10%" style = "height : 10%; border : 1px solid black;">번호</td><td width = "45%" style = "border : 1px solid black;">제목</td><td style = "border : 1px solid black;">글쓴이</td><td width = "25%" style = "border : 1px solid black;">날짜</td>
			</tr>
				<c:forEach var="board" items="${list}" varStatus="status" begin="${((param.pageNum-1))*10}" end="${((param.pageNum-1)*10)+4}">
			<tr>
				
					<td class = "b1px">${listsize-status.index}</td>
					<td width="100px" height="30px" align="center" style="background : #EEEEEE;  border: 1px solid aliceblue;" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);' onClick="window.location = 'get_intro?num=${board.bod_num}&pageNum=${param.pageNum}'">
						${board.bod_title}
					</td>
					<td width="100px" height="30px" align="center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);' onClick="window.location = 'get_intro?num=${board.bod_num}&pageNum=${param.pageNum}'" class="b1px">${board.mem_id}</td>
					<td width="100px" height="30px" align="center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);' onClick="window.location = 'get_intro?num=${board.bod_num}&pageNum=${param.pageNum}'" class="b1px">${board.bod_date}</td>
				
			</tr>
				</c:forEach>
		</table>
	</div>
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
			} else if (ls > 40) {
				j = (e + pg);
			}
		%>
		<div style="float: left; width: 69%; height: 20px; background: ;">
			<c:choose>
				<c:when test="${param.pageNum>5}">
					<span onmouseover='mouseOver2(this, true);'
						onmouseout='mouseOver2(this, false);'
						style="text-align: center; font-size: 50px;"
						onClick="location.href = 'board1?pageNum=${((param.pageNum)-5)}'">◀</span>
				</c:when>
			</c:choose>
			<%
				for (i = (e + pg) - 5; i < j; i++) {
					if (i == pg) {
			%>

			<span onmouseover='mouseOver2(this, true);'
				onmouseout='mouseOver2(this, false);'
				style="text-align: center; font-size: 50px;"
				onClick="location.href = 'board1?pageNum=<%=i%>'"><%=i%></span>
			<%
				} else {
			%>
			<span onmouseover='mouseOver2(this, true);'
				onmouseout='mouseOver2(this, false);'
				style="text-align: center; font-size: 30px;"
				onClick="location.href = 'board1?pageNum=<%=i%>'"><%=i%></span>
			<%
				}
				}
				if (e + pg <= pageCount) {
			%>
			<span onmouseover='mouseOver2(this, true);'
				onmouseout='mouseOver2(this, false);'
				style="text-align: center; font-size: 50px;"
				onClick="location.href = 'board1?pageNum=<%=e + pg%>'">▶</span>
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