<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script type="text/javascript">

</script>




<table>
		<tr height="35">
			<td align="center" colspan="2">--검색결과--</td>		
		</tr>
		
		<c:forEach var="search" items="${pageInfo.childrens}">


			<tr align="center">
				
				<td>id</td>
				<td>출발지</td>
				<td>도착지</td>
				<td>보기</td>
			</tr>

			<tr align="center">
			
				<td>${search.id}</td>
				<td>${search.departure}</td>
				<td>${search.destination}</td>
				<td><a href="../safe/m_listchildrenView?num=${search.num}&id=${search.id}">상세보기</a></td>
			
				

			
			</tr>

		</c:forEach>
	</table>

