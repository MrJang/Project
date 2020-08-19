<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	function requestDel(id){
		if(confirm('�����Ͻðڽ��ϱ�?')){
			location.href = "../safe/m_requestDelete?id=" + id;
		}else{
			
		}
			
	}
</script>


<c:set var = "crime" value="${fn:split(c.crime_time,'/')}"/>
	<table>
		<tr>
			<td>Id :</td>
			<td>${c.id}</td>
		</tr>

		<tr>
			<td>����� :</td>
			<td>${c.departure}</td>
		</tr>

		<tr>
			<td>������ :</td>
			<td>${c.destination}</td>
		</tr>

		<tr>
			<td>��߽ð� : </td>
			<td>${crime[0]}</td>
		</tr>
		
		<tr>
			<td>�����ð� : </td>
			<td>${crime[1]}</td>
		</tr>
		
		<tr>
			<td colspan="2">
			
				<a href="../safe/m_childrenreview?re_id=${c.id}&id=${s.id}">��õ�ϱ�</a>
				<a href="#" onclick="requestDel('${s.id}')">�����ϱ�</a>
			
			</td>
				
		</tr>

	</table>

