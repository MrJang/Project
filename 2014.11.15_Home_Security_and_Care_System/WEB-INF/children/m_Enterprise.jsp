<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
function EnterView(e_id,e_num){
	location.href="../safe/m_EnterView?e_id="+e_id + "&e_num="+e_num;
}

function childrenView(num,id){
	var url = "../safe/m_listchildrenView?num="+num + "&id="+id;
	open(url,"childrenView", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=500,height=500");
}

function group(id,num,category){
	
	location.href="../safe/group_Home?id="+id+"&num="+num+"&category="+category;
	
}
</script>


 <center>
<c:set var = "crime" value="${fn:split(c.crime_time,'/')}"/>
	<table class="bordered" width="300" style="font-size: 12px;">
		
		<tr>
			<td width="100">Id : </td>
			<td>${c.id}</td>
		</tr>
		
		<tr>
			<td>업체명 :</td>
			<td>${c.request}</td>
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
			<td>인원수 :</td>
			<td>${c.current_count}/${c.member_count}</td>
		</tr>
		
		<c:if test='${c.category==2}'>
		<tr>
			<td>추천점수 :</td>
			<td>${c.star_average}</td>
		</tr>
		</c:if>
		<tr>
			<td>작성날짜 :</td>
			<td>${c.reg_date}</td>
		</tr>
		

		<tr>
			<td>조회수 :</td>
			<td>${c.readcount}</td>
		</tr>
		
		</table>
		</center>

	
	