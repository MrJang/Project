<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">
	function selectchildren(s_category,c_category,s_id,c_id,board_num){
		
		if(s_category == c_category) {
			alert('같은고객분류는 신청할 수 없습니다.');
			history.go(0);
		}else {
			
			self.location.href = "../safe/m_selectMessage?write_id="+s_id+"&send_id="+c_id+"&board_num=" + board_num;
		} 
	}
</script>

<body>
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
		<tr>
			<td colspan="2">
				<c:if test='${c.e_id == null}'>
				<a href="#" onclick="selectchildren(${s.category},${c.category},'${s.id}','${c.id}',${c.num})">선택하기</a>
				</c:if>
				<a href="../safe/m_listchildren">목록으로</a>
				<c:if test='${c.category == 2}'>
				<a href="../safe/m_childrenreview?re_id=${c.id}">추천하기</a>
				</c:if>
			<c:if test="${s.id == c.id}">
				<a href="../safe/m_childrenupdate?num=${c.num}">수정하기</a>
				<a href="../safe/m_deletechildren?num=${c.num}">삭제하기</a>
			</c:if>	
			</td>
				
		</tr>

	</table>
