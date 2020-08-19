<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<center>
<b>��û �Խ��� (��ü�� : ${pageInfo.numOfChildrens})</b> <br>
<a href="../safe/m_childrenreview_u">�ı��ۼ�</a>

<c:if test="${pageInfo.numOfChildrens==0}">
		<table>
			<tr>
				<td align="center">
					�Խ��ǿ� ����� ���� �����ϴ�.
				</td>	
			</tr>
		</table>
	
	
	</c:if>

	<table border="1" align="center">
		<c:forEach var="review" items="${pageInfo.childrens}">


			<tr align="center">
				
				<td>���̵�</td>
				<td>����</td>
			</tr>

			<tr align="center">
			<form:form>
				
				<td>${review.id}</td>
				<td>
					${review.subject}
				</td>
				<td><a href="../safe/m_reViewView?num=${review.num}">�󼼺���</a></td>
			</form:form>
			</tr>

		</c:forEach>
	</table>
	${pageInfo.bottomPartOfHtml} <br>
	
	</center>
