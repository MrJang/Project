<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/SafeProject/css/default.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: 'trebuchet MS', 'Lucida sans', Arial;
    font-size: 18px;
    color: #444;
    }
</style>
</head>
<body>

	<div class="blocks">
<p>
		<label>ID:</label>
			${Message.write_id}
			</p>
			<br>
			<p>
				<label>받는사람 :</label>
				${Message.send_id}
				
			</p>
		</div>
		<br>

<form:form commandName="Message" class="blocks">

			
			
			<c:choose>

			<c:when test='${s.category=="1"}'>
				
				<p>
				<label>고객분류 :</label>
				개인고객
				</p>
			</c:when>
			
			<c:when test='${s.category=="2"}'>
				<p>
					<label>고객분류 :</label>
						    업체고객
				</p>
			</c:when>
			</c:choose>
			<br>
			<p>
				<label>내용:</label>
				<form:textarea path="m_content" class="textarea"/>
				</p>
			
			<p>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="등록"/>
				<input type="reset" class="btn" value="리셋">
			</p>
</form:form>


</body>
</html>