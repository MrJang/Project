<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.cafe {
	-moz-box-shadow:inset 0px 1px 0px 0px #dcecfb;
	-webkit-box-shadow:inset 0px 1px 0px 0px #dcecfb;
	box-shadow:inset 0px 1px 0px 0px #dcecfb;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #bddbfa), color-stop(1, #80b5ea) );
	background:-moz-linear-gradient( center top, #bddbfa 5%, #80b5ea 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bddbfa', endColorstr='#80b5ea');
	background-color:#bddbfa;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #84bbf3;
	display:inline-block;
	color:#ffffff;
	font-family:Arial Black;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:200px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 0px 0px #528ecc;
}
.cafe:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #80b5ea), color-stop(1, #bddbfa) );
	background:-moz-linear-gradient( center top, #80b5ea 5%, #bddbfa 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#80b5ea', endColorstr='#bddbfa');
	background-color:#80b5ea;
}.cafe:active {
	position:relative;
	top:1px;
}




#cf{
font-size:17px;
font-family:HY울릉도M;
width:200;
border-width : 1px;
}
#cm{
font-size : 11px;
}




</style>

<table>

<tr>
<td width="200">
<img src="../images/APT.png" width="200" height="200">
</td>

</tr>
<tr id="cf"><td>
${cafe.c_name}
</td>
</tr>
<tr>
<td id="cf">매니저:${cafe.id}
</td>



</tr>
	<tr>
	<td id="cf">회원 수 : ${cafe.c_member}</td>
	</tr>

<tr>
<td id="cf">카페 생성일<br/>
<fmt:formatDate value="${cafe.since_date}" type="both" pattern="yyyy년 MM월 dd일 [E]"/>
</td>
</tr>
<tr>

</tr>
<tr>
<td>
	<c:if test="${s.category==2}">
		
		<a href="cafeJoin?c_num=${cafe.c_num}&id=${cafe.id}&board_num=${cafe.board_num}" class="cafe">그룹 가입</a><br/>
		
	</c:if>
<a href="../safe/messageinsert" onClick="window.open(this.href, '', 'width=600, height=500'); return false;" class="cafe">쪽지보내기</a><br/>
<a href="../safe/listreview?cafe_num=${cafe.c_num}&board_cate=1" class="cafe">후기 게시판</a><br/>

</td>
</tr>
</table>