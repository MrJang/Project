<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>articleList.jsp</title>
<link href="../style.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	function mouseOver(tableRow, mouse) {
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
	function mouseOver2(tableRow, mouse) {
		if (mouse) {
			tableRow.style.cursor = 'pointer';
			tableRow.style.backgroundColor = '#cdd4da';
			// b7e1e6 하늘색
			// cdd4da 연한하늘색
			// d9a07f 연한갈색
		} else {
			tableRow.style.backgroundColor = 'black';
		}
	}
</script>
</head>
<body>
	<%
		// 		int u1 = pg*12;
		// 		int u2 = u1+5;
		// 		int d1 = u1+6;
		// 		int d2 = d1+5;

		// 		0	a	00 ~ 05		(12 * 0) ~ (a+5)
		// 			b	06 ~ 11		(a  + 6) ~ (b+5)

		// 		1	a	12 ~ 17		(12 * 1) ~ (a+5)
		//	 		b	18 ~ 23		(a  + 6) ~ (b+5)

		// 		2	a	24 ~ 29		(12 * 2) ~ (a+5)
		// 			b	30 ~ 35		(a  + 6) ~ (b+5)
	%>
	<center>
		<div style="width: 797px; vertical-align: top; height: 40px; float: left;">
		<table align="center" style="vertical-align: top; width: 697px; height: 100%; margin-right: 150px;" border="0">
			<tr style="vertical-align: top;">
				<td align = "center" colspan="6" class="b0px" height="10px">
					<h2>디자이너 보드</h2>
<%-- 					전체 : (${listsize}) --%>
				</td>
			</tr>
		</table>
		</div>
		<div style="width: 797px; vertical-align: top; height: 550px; float: left;">
			<table align="center" style="vertical-align: top; width: 697px; height: 100%; margin-right: 150px;" border="0">
				
				<tr style="vertical-align: top;">
					<td class="b0px" width="100px" height="1px"></td>

					<td class="b0px" width="100px" height="1px"></td>

					<td class="b0px" width="100px" height="1px"></td>

					<td class="b0px" width="100px" height="1px"></td>

					<td class="b0px" width="100px" height="1px"></td>
				</tr>

				<%-- ${status.current}   현재의 for문에 해당하는 번호 --%>
				<%-- ${status.index} 초기값 0 --%>
				<%-- ${status.count} 초기값 1 --%>
				<%-- ${status.first}  현재 루프가 처음인지 확인 --%>
				<%-- ${status.last}  현재 루프가 마지막인지 확인 --%>
				<%-- ${status.begin} for문의 시작 값 --%>
				<%-- ${status.end}   for문의 끝 값 --%>
				<%-- ${status.step}  for문의 증가값 --%>
				<!-- </table> -->
				<!-- 		<td class = "b1px" width ="5%">조회<br/>제목</td> -->
				<!-- 	<div style = "float: center;"> -->
				<!-- 	<td colspan = "5" align = "center"> -->
				<tr style="">
					<c:forEach var="board" items="${list}" varStatus="status" begin="${((param.pageNum-1))*10}" end="${((param.pageNum-1)*10)+4}">
						<td width="100px" height="50px" align="center"  onmouseover='mouseOver2(this, true);' onmouseout='mouseOver2(this, false);' 
						onClick="window.location = 'getArticle1?num=${board.bod_num}&pageNum=${param.pageNum}'"
						style = "background : black; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
							<b style = "color : white;">${board.bod_title}
<%-- 							 (${board.bod_readcount}) --%>
							 </b>
						</td>

						<%-- 		<c:choose> --%>
						<%-- 		<c:when test="${status.last==true&&(status.index)-(status.end)!=0}"> --%>
						<%-- 			<c:forEach begin="1" end="${(status.end)-(status.index)}"> --%>
						<!-- 				<td class = "b1px">as<td> -->
						<%-- 			</c:forEach> --%>
						<%-- 		</c:when> --%>
						<%-- 		</c:choose> --%>

					</c:forEach>
					<!-- 	</td> -->
					<!-- 	</div> -->
					<!-- <table style = "width : 800px; height : 100%;" border = "0"> -->
				</tr>
				<tr>
					<!-- 		<td class = "b1px">이미지</td> -->
					<c:forEach var="board" items="${list}" begin="${((param.pageNum-1))*10}" end="${((param.pageNum-1)*10)+4}">
						<td width="100px" align="center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);' onClick="window.location = 'getArticle1?num=${board.bod_num}&pageNum=${param.pageNum}'" style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
							<c:choose>
							<c:when test="${board.bod_img_category == '1'||board.bod_img_category == '3' }">
							<img src="../upload/sm_${board.bod_img}" style="width: 100px; height: 100px;" alt="Loading...">
							</c:when>
							<c:when test="${board.bod_img_category == '2'}">
							<img src="${board.bod_img}" style="width: 100px; height: 100px;" alt="X">
							</c:when>
							</c:choose>
						</td>
					</c:forEach>
				</tr>
				<tr>
					<!-- 		<td class = "b1px">작성자<br/>날짜</td> -->
					<c:forEach var="board" items="${list}"
						begin="${((param.pageNum-1))*10}"
						end="${((param.pageNum-1)*10)+4}">
						<td width="100px" height="50px" align="center"
							onmouseover='mouseOver(this, true);'
							onmouseout='mouseOver(this, false);'
							onClick="window.location = 'getArticle1?num=${board.bod_num}&pageNum=${param.pageNum}'"
							style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
							<b>${board.mem_id}<br /> ${board.bod_date}</b>
						</td>
					</c:forEach>
				</tr>
				<tr>
					<td colspan="6"><br /></td>	
				</tr>
				<tr>
					<td colspan="6"><br /></td>	
				</tr>
				<tr>
					<!-- 	<td class = "b1px" width ="3%">조회<br/>제목</td> -->
					<c:forEach var="board" items="${list}" varStatus="status"
						begin="${((param.pageNum-1)*10)+5}"
						end="${((param.pageNum-1)*10)+9}">

						<td width="100px" height="50px" align="center"
							onmouseover='mouseOver(this, true);'
							onmouseout='mouseOver(this, false);'
							onClick="window.location = 'getArticle1?num=${board.bod_num}&pageNum=${param.pageNum}'"
							style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
							<b>${board.bod_title} 
<%-- 							(${board.bod_readcount}) --%>
							</b>
							</td>
					</c:forEach>
				</tr>
				<tr>
					<!-- 		<td class = "b1px">이미지</td> -->
					<c:forEach var="board" items="${list}"
						begin="${((param.pageNum-1)*10)+5}"
						end="${((param.pageNum-1)*10)+9}">
						<td width="100px" align="center"onmouseover='mouseOver(this, true);'onmouseout='mouseOver(this, false);'onClick="window.location = 'getArticle1?num=${board.bod_num}&pageNum=${param.pageNum}'"style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
						<c:choose>
							<c:when test="${board.bod_img_category == '1'||board.bod_img_category == '3' }">
							<img src="../upload/sm_${board.bod_img}" style="width: 100px; height: 100px;" alt="X">
							</c:when>
							<c:when test="${board.bod_img_category == '2'}">
							<img src="${board.bod_img}" style="width: 100px; height: 100px;" alt="X">
							</c:when>
						</c:choose>	
						</td>
					</c:forEach>
				</tr>
				<tr>
					<!-- 		<td class = "b1px">작성자<br/>날짜</td> -->
					<c:forEach var="board" items="${list}"
						begin="${((param.pageNum-1)*10)+5}"
						end="${((param.pageNum-1)*10)+9}">
						<td width="100px" height="50px" align="center"
							onmouseover='mouseOver(this, true);'
							onmouseout='mouseOver(this, false);'
							onClick="window.location = 'getArticle1?num=${board.bod_num}&pageNum=${param.pageNum}'"
							style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
							${board.mem_id}<br /> ${board.bod_date}
						</td>
					</c:forEach>
				</tr>
				
				<tr style="vertical-align: top;">
					<td align = "center" colspan="6" class="b0px" height="10px">
						<c:choose>
							<c:when test="${member.mem_auth=='0'||member.mem_auth=='1'}">
								<div style="text-align: right">
									<input type="button" class = "board_write" value="글쓰기" onClick="window.location = 'insertArticle1?pageNum=${param.pageNum}'">
								</div>
							</c:when>
						</c:choose>
					</td>
				</tr>

			</table>
		</div>
		
		<%
	// 		TODO ls
			String listsize = String.valueOf(session.getAttribute("listsize"));
			
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
					<span style="cursor :pointer; text-align: center; font-size: 50px;" onClick="location.href = 'board1?pageNum=${((param.pageNum)-5)}'">◀</span>
				</c:when>
			</c:choose>
			<%for (i = (e + pg) - 5; i < j; i++) {
					if (i == pg) {
			%>
			<span style="cursor :pointer; text-align: center; font-size: 50px;" onClick="location.href = 'board1?pageNum=<%=i%>'"><%=i%></span>
			<%} else {%>
			<span style="cursor :pointer; text-align: center; font-size: 30px;" onClick="location.href = 'board1?pageNum=<%=i%>'"><%=i%></span>
			<%}
					}if (e + pg <= pageCount) {%>
			<span style="cursor :pointer; text-align: center; font-size: 50px;" onClick="location.href = 'board1?pageNum=<%=e + pg%>'">▶</span>
			<%}%>
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