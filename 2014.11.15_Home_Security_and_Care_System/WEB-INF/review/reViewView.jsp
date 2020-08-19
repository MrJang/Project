<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table>
		<tr>
			<td>ID :</td>
			<td>${c.id}</td>
		</tr>
		
		<tr>
			<td>추천ID :</td>
			<td>${c.e_id}</td>
		</tr>

		<tr>
			<td>제목 :</td>
			<td>${c.subject}</td>
		</tr>

		<tr>
			<td>내용</td>
			<td>${c.content}</td>
		</tr>

		<tr>
			<td>추천 :</td>
			<td>${c.s_star}</td>
		</tr>

		<tr>
			<td>작성날짜 :</td>
			<td>${c.reg_date}</td>
		</tr>

		<tr>
			<td>조회수 :</td>
			<td>${c.readcount}</td>
		</tr>
		<tr>
			<td colspan="2">
				
				<a href="../safe/listreview?cafe_num=${c.cafe_num}&board_cate=1">목록으로</a>
			<c:if test="${s.id == c.id}">
				<a href="../safe/Reviewupdate?num=${c.num}">수정하기</a>
				<a href="../safe/deleteReview?num=${c.num}">삭제하기</a>
			</c:if>	
			</td>
				
		</tr>

	</table>
