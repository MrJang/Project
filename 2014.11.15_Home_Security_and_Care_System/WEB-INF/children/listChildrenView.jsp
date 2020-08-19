<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
.bordered {
	border: solid #ccc 1px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 1px 1px #ccc;
	-moz-box-shadow: 0 1px 1px #ccc;
	box-shadow: 0 1px 1px #ccc;
}

.bordered tr:hover {
	background: #fbf8e9;
	-o-transition: all 0.1s ease-in-out;
	-webkit-transition: all 0.1s ease-in-out;
	-moz-transition: all 0.1s ease-in-out;
	-ms-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

.bordered td,.bordered th {
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

.bordered th {
	background-color: #dce9f9;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc),
		to(#dce9f9));
	background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: linear-gradient(top, #ebf3fc, #dce9f9);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	border-top: none;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
}

.bordered td:first-child,.bordered th:first-child {
	border-left: none;
}

.bordered th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.bordered th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.bordered th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}

</style>
<script>
		function Entersuccess(id,e_id,num,ch_name,ch_pass){
			var url = "../safe/Entersuccess?num="+num+"&id="+id+ "&e_id="+e_id +"&ch_name="+ch_name + "&ch_pass=" + ch_pass;
			open(url, "Entersuccess", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=500,height=500");
			
		}
		
		function Enterdelete(num){
			var url = "../safe/Enterdelete?num="+num;
			open(url, "Enterdelete", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=500,height=500");
			
		}
		
</script>

	<center>
	<c:set var = "crime" value="${fn:split(c.crime_time,'/')}"/>
	<table class="bordered" width="500">
		<thead>
			<th colspan="2">상세보기</th>
		</thead>
		
		<tr>
			<td width="100">Id :</td>
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
		
		<c:if test="${c.e_id == s.id && c.notice == 0}">
			<tr>
				<td colspan="2"><button class="login" onclick= "Entersuccess('${c.id}','${c.e_id}',${c.num},'${c.ch_name}','${c.ch_pass}')">확인</button>/<button onclick="Enterdelete(${c.num})" class="login">취소</button></td>
			
			</tr>
		</c:if>
			
		

	</table>
</center>