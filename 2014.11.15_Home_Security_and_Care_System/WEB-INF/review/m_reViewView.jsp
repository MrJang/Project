<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table>
		<tr>
			<td>Id :</td>
			<td>${c.id}</td>
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
				
				<a href="../safe/m_listreview">�������</a>
			<c:if test="${s.id == c.id}">
				<a href="../safe/m_Reviewupdate?num=${c.num}">�����ϱ�</a>
				<a href="../safe/m_Reviewdelete?num=${c.num}">�����ϱ�</a>
			</c:if>	
			</td>
				
		</tr>

	</table>
