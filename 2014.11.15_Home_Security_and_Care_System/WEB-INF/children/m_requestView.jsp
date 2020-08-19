<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	function requestDel(id){
		if(confirm('해지하시겠습니까?')){
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
			<td>출발지 :</td>
			<td>${c.departure}</td>
		</tr>

		<tr>
			<td>도착지 :</td>
			<td>${c.destination}</td>
		</tr>

		<tr>
			<td>출발시간 : </td>
			<td>${crime[0]}</td>
		</tr>
		
		<tr>
			<td>도착시간 : </td>
			<td>${crime[1]}</td>
		</tr>
		
		<tr>
			<td colspan="2">
			
				<a href="../safe/m_childrenreview?re_id=${c.id}&id=${s.id}">추천하기</a>
				<a href="#" onclick="requestDel('${s.id}')">해지하기</a>
			
			</td>
				
		</tr>

	</table>

