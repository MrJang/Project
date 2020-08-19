<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">


	function setZipcode(gugun,sido,dong,ri,bunji){
		
		var zipcode = gugun + " " + sido + " " + " " + dong + " " + ri + " " + bunji;
		opener.document.getElementById("c").destination.value=zipcode;
		self.close();
	}

</script>
</head>
<body>
<form:form commandName="d_zipcode">
	지역명 : <form:input path="dong"/><br>
	<input type="submit" value="검색">
</form:form>

<table width="500" border="1" cellspacing="0" cellpadding="5">
		<tr height="35">
			<td align="center" colspan="7">--검색결과--</td>		
		</tr>
		<tr align="center">
				
				<td colspan="7">주소</td>
			</tr>
		<c:forEach var="d_zipcode" items="${list}">


			

			<tr align="center">
			
			<form:form>
				<td><a href="#" onclick="setZipcode('${d_zipcode.gugun}','${d_zipcode.sido}','${d_zipcode.dong}','${d_zipcode.ri}','${d_zipcode.bunji}')">${d_zipcode.id}</a></td>
				<td colspan="6">${d_zipcode.zipcode}&nbsp;${d_zipcode.gugun}&nbsp;${d_zipcode.sido}&nbsp;${d_zipcode.dong}&nbsp;${d_zipcode.ri}&nbsp;${d_zipcode.bunji}</td>	
			</form:form>
				

			
			</tr>

		</c:forEach>
	</table>


</body>
</html>