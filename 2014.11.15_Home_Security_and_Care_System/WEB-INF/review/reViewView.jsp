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
			<td>��õID :</td>
			<td>${c.e_id}</td>
		</tr>

		<tr>
			<td>���� :</td>
			<td>${c.subject}</td>
		</tr>

		<tr>
			<td>����</td>
			<td>${c.content}</td>
		</tr>

		<tr>
			<td>��õ :</td>
			<td>${c.s_star}</td>
		</tr>

		<tr>
			<td>�ۼ���¥ :</td>
			<td>${c.reg_date}</td>
		</tr>

		<tr>
			<td>��ȸ�� :</td>
			<td>${c.readcount}</td>
		</tr>
		<tr>
			<td colspan="2">
				
				<a href="../safe/listreview?cafe_num=${c.cafe_num}&board_cate=1">�������</a>
			<c:if test="${s.id == c.id}">
				<a href="../safe/Reviewupdate?num=${c.num}">�����ϱ�</a>
				<a href="../safe/deleteReview?num=${c.num}">�����ϱ�</a>
			</c:if>	
			</td>
				
		</tr>

	</table>
