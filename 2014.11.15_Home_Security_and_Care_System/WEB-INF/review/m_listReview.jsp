<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<center>
<b>신청 게시판 (전체글 : ${pageInfo.numOfChildrens})</b> <br>
<a href="../safe/m_childrenreview_u">후기작성</a>

<c:if test="${pageInfo.numOfChildrens==0}">
		<table>
			<tr>
				<td align="center">
					게시판에 저장된 글이 없습니다.
				</td>	
			</tr>
		</table>
	
	
	</c:if>

	<table border="1" align="center">
		<c:forEach var="review" items="${pageInfo.childrens}">


			<tr align="center">
				
				<td>아이디</td>
				<td>제목</td>
			</tr>

			<tr align="center">
			<form:form>
				
				<td>${review.id}</td>
				<td>
					${review.subject}
				</td>
				<td><a href="../safe/m_reViewView?num=${review.num}">상세보기</a></td>
			</form:form>
			</tr>

		</c:forEach>
	</table>
	${pageInfo.bottomPartOfHtml} <br>
	
	</center>
