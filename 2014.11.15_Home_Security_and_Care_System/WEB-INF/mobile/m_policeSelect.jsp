<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reveal.css">	
<link rel="stylesheet" href="../css/button.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="../js/jquery.reveal.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<style type="text/css">
			body { font-family: "HelveticaNeue","Helvetica-Neue", "Helvetica", "Arial", sans-serif; }
			.big-link { display:block; text-align: center; font-size: 14; color: #06f; }
</style>

<script type="text/javascript">
function m_crearFemle() {
	alert("귀가가 완료되었습니다.");
	location.href="m_crearPolice";
}


</script>

</head>


<body>
<center>	
				<h1>예약자현황</h1>
			
			
		
			<form:form commandName="female" data-ajax="false" >
			<table id="tab" border="1" cellspacing="0" cellpadding="5" align="center" >
			<tr>
				<td>사용자이름:</td>
				<td><form:input path="name" readonly="true"/></td>
			</tr>
			<tr>
				<td>사용자연락처:</td>
				<td><form:input path="phone" readonly="true" /></td>
			</tr>
			<tr>
				<td>시간:</td>
				<td><form:input path="crime_time" readonly="true"/></td>
			</tr>
			
				
			
				
				
				
				
			
				<form:hidden path="m_success"/>
				</table>
				<h2><label id="submit"></label></h2>
						<c:if test="${female.m_success==2}">
					 <button id="gosubmit" type="submit" data-theme="a">귀가시작하기</button>
						</c:if>
						<c:if test="${female.m_success==3}">
							<input type="button" onClick="m_crearFemle()" value="귀가완료하기" data-theme="a">
						</c:if>
			</form:form>
			
			
		
						<h2><label id="message"></label></h2>
									
		

</center>
</body>
</html>