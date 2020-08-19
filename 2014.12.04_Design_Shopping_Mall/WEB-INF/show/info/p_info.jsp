<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
</head> 
<style>
td{
	text-align: center;	
}
</style>
<script type="text/javascript">
// 	function ach(ach_num){
// 		var ach;
// 		ach = window.open('select_achivement?ach_num='+ach_num, 'ach', 'width=800px height=780px toolbar=0 location=0 status=0 menubar=0 scrollbars=0 resizable=0 titlebar=0 left=550');
// 		ach.focus();
// 	}

</script>
<body>
<form:form commandName = "member" enctype = "multipart/form-data">
<div style = "float : left; width : 80%; height: 500px; background : #EEEEEE;">
	<div style = "float : left; width : 100%; height: 100%; background : #DDDDDD;">
		
	
		<c:choose>
			<c:when test="${member.mem_auth==1}">
			<table border = "1" width = "100%" height = "50%">
			<tr align = "center">
				<td colspan = "5" height = "5%"><input type = "button" class = "nopdnomg3" value = "업적"></td>
			</tr>
			<tr>
				<td style="height : 10%; width : 20%;">로그인</td>
				<td style="width : 20%;">게시글 등록</td>
				<td style="width : 20%;">상품 등록</td>
				<td style="width : 20%;">판매</td>
				<td style="width : 20%;">받은 의뢰</td>
<!-- 				<td style="height : 40px; width : 20%;">받은 추천</td> -->
			</tr>
			<tr>
				<td style="height : 40%;">${getlogincheck}회</td>
				<td >
				${my_article1_count}개<br/>
				</td>
				<td>${my_product_count}개</td>
				<td>${my_sell_count}개</td>
				<td>${my_request_count}개</td>
<!-- 				<td style="height : 170px;">받은 추천</td> -->
			</tr>
			</table>
			
			<table border = "1" width = "100%" height = "50%">
			<tr>
				<td width = "25%" height = "50%">
					자기소개
				</td>
				<td width = "50%">
					<form:textarea path = "des_introduce"  rows="13" cols="45"/>
				</td>
				<td width = "25%">
				<input type = "submit" value = "등록">
				</td>
			</tr>
			</table>
			
			</c:when>
			<c:when test="${member.mem_auth==2}">
			<table border = "1" width = "100%" height = "100%">
			<tr align = "center">
				<td colspan = "3" height = "20%"><input type = "button" class = "nopdnomg3" value = "업적"></td>
			</tr>
			<tr>
				<td style="height : 40px; width : 33%;" >로그인  횟수</td>
				<td style="height : 40px; width : 33%;">게시글 등록 개수</td>
				<td style="height : 40px; width : 33%;">구매 개수</td>
			</tr>				
			<tr>
				<td>
					${getlogincheck}회
				</td>
				<td>
					${my_article1_count}개<br/>
				</td>
				<td>
					${my_buy_count}
				</td>
			</tr>
			</table>
			</c:when>
		</c:choose>
		
	

</div>
</div>
<!-- <div style = "float : left; width : 80%; height: 80px; background : #EEEEEE;"> -->
<!-- <div style = "float : left; width : 100%; height: 100%; background : #BBBBBB;"> -->
<!-- <table border = "1" width = "100%" height = "100%"> -->
<!-- 	<tr> -->
<%-- 		<td align = "center"><input type = "button" class = "nopdnomg3" value = "개인정보관리" onClick = "window.location ='updateMember?mem_id=${m.mem_id}'"></td> --%>
<!-- 	</tr> -->
<!-- </table> -->
<!-- </div> -->
<!-- </div> -->



</form:form>


</body>
</html>