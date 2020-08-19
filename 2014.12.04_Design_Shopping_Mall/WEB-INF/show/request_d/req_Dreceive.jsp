<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>design_req</title>
<link href="../style.css" type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<form:form commandName="request">
	<table border = "0" width = "100%">
			<tr><td><center><b>의뢰받은 디자인</b></center></td></tr>
		</table>
	<div style = "float : ; width : 100%; height : 625px; background: ;">
		<table width="100%">
			<tr>
				<td style = "background : #94B8FF; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="20%" align="center">
					<b>의뢰인</b>
				</td>
				<td style = "background : #94B8FF; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="20%" align="center">
					<b>의뢰날짜</b>
				</td>
				<td style = "background : #94B8FF; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="20%" align="center">
					<b>의뢰명</b>
				</td>
				<td style = "background : #94B8FF; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="20%" align="center">
					<b>이미지</b>
				</td>
				<td style = "background : #94B8FF; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="20%" align="center">
					<b>진행상황</b>
				</td>
			</tr>
			<c:forEach var="request" items="${list}" begin = "${((param.pageNum-1))*5}" end = "${((param.pageNum-1)*5)+4}">
				<tr align="center">
					<c:choose>
						<c:when test="${request.sender_mod==1}">
							<td class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								
								<b>${request.req_sender}</b>
							</td>
							<td class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<b>${request.req_date}</b>
							</td>
							<td class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<b>${request.req_name}</b>
							</td>
							<c:choose>
								<c:when test="${request.req_category=='1'}">
									<td class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="10%" align="center" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
										<img src='../upload/sm_${request.req_img}' alt='이미지 로딩 실패' width='100px' height='100px'>
									</td>
								</c:when>
								<c:when test="${request.req_category=='2'}">
									<td class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="10%" align="center" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
										<img src='${request.req_img}' alt='이미지 로딩 실패' width='100px' height='100px'>
									</td>
								</c:when>
								<c:when test="${request.req_category=='3'}">
									<td class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="10%" align="center" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
										<img src='${request.req_img}' alt='첨부된 이미지 없음' width='100px' height='100px'>
									</td>
								</c:when>
							</c:choose>
							<td class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<c:choose>
									<c:when test="${request.req_process==0}">
										<b>미확인 의뢰</b><b style = "color: red;"> UPDATE</b>
									</c:when>
									<c:when test="${request.req_process==1}">
										<b>의뢰확인</b><b style = "color: red;"> UPDATE</b>
									</c:when>
									<c:when test="${request.req_process==2}">
										<b>의뢰거절</b><b style = "color: red;"> UPDATE</b>
									</c:when>
									<c:when test="${request.req_process==3}">
										<b>의뢰수락</b><b style = "color: red;"> UPDATE</b>
									</c:when>
									<c:when test="${request.req_process==4}">
										<b>입금 대기중</b><b style = "color: red;"> UPDATE</b>
									</c:when>
									<c:when test="${request.req_process==5}">
										<b>입금 완료</b><b style = "color: red;"> UPDATE</b>
									</c:when>
									<c:when test="${request.req_process==6}">
										<b>제작중</b><b style = "color: red;"> UPDATE</b>
									</c:when>
									<c:when test="${request.req_process==7}">
										<b>제작중</b><b style = "color: red;"> UPDATE</b>				
<!-- 								<b>제작완료</b> -->
								</c:when>
								<c:when test="${request.req_process==8}">
									<b>상품발송</b><b style = "color: red;"> UPDATE</b>
								</c:when>
								<c:when test="${request.req_process==10}">
									<b>거래완료</b><b style = "color: red;"> UPDATE</b>
								</c:when>
							</c:choose>
							</td>
						</c:when>
						<c:when test="${request.sender_mod==0&&request.req_process!=0}">
							<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<b>${request.req_sender}</b>
							</td>
							<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<b>${request.req_date}</b>
							</td>
							<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<b>${request.req_name}</b>
							</td>
							<c:choose>
								<c:when test="${request.req_category=='1'}">
									<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="10%" align="center" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
										<img src='../upload/sm_${request.req_img}' alt='이미지 로딩 실패' width='100px' height='100px'>
									</td>
								</c:when>
								<c:when test="${request.req_category=='2'}">
									<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="10%" align="center" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
										<img src='${request.req_img}' alt='이미지 로딩 실패' width='100px' height='100px'>
									</td>
								</c:when>
								<c:when test="${request.req_category=='3'}">
									<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="10%" align="center" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
										<img src='${request.req_img}' alt='첨부된 이미지 없음' width='100px' height='100px'>
									</td>
								</c:when>
							</c:choose>
							<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<c:choose>
									<c:when test="${request.req_process==1}">
										<b>의뢰확인</b>
									</c:when>
									<c:when test="${request.req_process==2}">
										<b>의뢰거절</b>
									</c:when>
									<c:when test="${request.req_process==3}">
										<b>의뢰수락</b>
									</c:when>
									<c:when test="${request.req_process==4}">
										<b>입금 대기중</b>
									</c:when>
									<c:when test="${request.req_process==5}">
										<b>입금 완료</b>
									</c:when>
									<c:when test="${request.req_process==6}">
										<b>제작중</b>
									</c:when>
									<c:when test="${request.req_process==7}">
										<b>제작중</b>				
	<!-- 								<b>제작완료</b> -->
									</c:when>
									<c:when test="${request.req_process==8}">
										<b>상품발송</b>
									</c:when>
									<c:when test="${request.req_process==10}">
										<b>거래완료</b>
									</c:when>
								</c:choose>
							</td>
						</c:when>
						<c:when test="${request.req_process==0}">
							<td class = "blinkk3"style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<b>${request.req_sender}</b>
							</td>
							<td class = "blinkk3"style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<b>${request.req_date}</b>
							</td>
							<td class = "blinkk3"style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<b>${request.req_name}</b>
							</td>
							<c:choose>
								<c:when test="${request.req_category=='1'}">
									<td class = "blinkk3"style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="10%" align="center" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
										<img src='../upload/sm_${request.req_img}' alt='이미지 로딩 실패' width='100px' height='100px'>
									</td>
								</c:when>
								<c:when test="${request.req_category=='2'}">
									<td class = "blinkk3"style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="10%" align="center" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
										<img src='${request.req_img}' alt='이미지 로딩 실패' width='100px' height='100px'>
									</td>
								</c:when>
								<c:when test="${request.req_category=='3'}">
									<td class = "blinkk3" style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" width="10%" align="center" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
										<img src='${request.req_img}' alt='첨부된 이미지 없음' width='100px' height='100px'>
									</td>
								</c:when>
							</c:choose>
							<td class = "blinkk3" style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'req_Dinfo?sender=${request.req_sender}&req_num=${request.req_num}'">
								<b>미확인 의뢰</b>
							</td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
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
			int pageSize = 5;
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
	
		<table width = "100%" border = "0">
			<tr>
				<td align = "center">
				
			<c:choose>
				<c:when test="${param.pageNum>5}">
					<span style="text-align: center; font-size: 50px; cursor : pointer;"
						onClick="location.href = 'req_Dreceive?pageNum=${((param.pageNum)-5)}'">◀</span>
				</c:when>
			</c:choose>
			<%
				for (i = (e + pg) - 5; i < j; i++) {
					if (i == pg) {
			%>

			<span style="text-align: center; font-size: 50px; cursor:pointer;"
				onClick="location.href = 'req_Dreceive?pageNum=<%=i%>'"><%=i%></span>
			<%
				} else {
			%>
			<span style="text-align: center; font-size: 30px; cursor: pointer;"
				onClick="location.href = 'req_Dreceive?pageNum=<%=i%>'"><%=i%></span>
			<%
				}
				}
				if (e + pg <= pageCount) {
			%>
			<span style="text-align: center; font-size: 50px; cursor : pointer;"
				onClick="location.href = 'req_Dreceive?pageNum=<%=e + pg%>'">▶</span>
			<%
				}
			%>
		
			</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
