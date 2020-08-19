<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberInfo.jsp</title>
<!-- 	<meta http-equiv="Refresh" Content="0; URL=reject"> -->
</head>
<body>
<form:form commandName = "member">
	<h1> 회원정보 </h1>
	<table border = "1">
	<tr>
		<td>
			회원번호 
		</td>
		<td>
			${usermember.mem_num}
		</td>
	</tr>
	<tr>
		<td>
			아이디
		</td>
		<td>
			${usermember.mem_id}
		</td>
	</tr>
	<tr>
		<td>
			암호
		</td>
		<td>
			${usermember.mem_pw}
		</td>
	</tr>
	<c:choose>
		<c:when test="${usermember.mem_auth=='1'}">
		<tr>
			<td>
				계좌번호
			</td>
			<td>
				${usermember.bank} ${usermember.account}
			</td>
		</tr>
		
		</c:when>
	
	</c:choose>
	
	<tr>
		<td>
			이름
		</td>
		<td>
			${usermember.mem_name}
		</td>
	</tr>
	<tr>
		<td>
			우편번호
		</td>
		<td>
			${usermember.mem_post}
		</td>
	</tr>
	<tr>
		<td>
			주소
		</td>
		<td>
			${usermember.mem_addr}
		</td>
	</tr>
	<tr>
		<td>
			전화번호
		</td>
		<td>
			${usermember.mem_phone}
		</td>
	</tr>
	<tr>
		<td>
			이메일
		</td>
		<td>
			${usermember.mem_email}
		</td>
	</tr>
	<tr>
		<td>
			성별
		</td>
		<td>
			${usermember.mem_gender}
		</td>
	</tr>
	<tr>
		<td>
			등급
		</td>
		<td>
			<c:choose>
				<c:when test="${usermember.mem_auth=='0'}">관리자</c:when>
				<c:when test="${usermember.mem_auth=='1'}">디자이너</c:when>
				<c:when test="${usermember.mem_auth=='2'}">정회원</c:when>
		  	</c:choose>
		</td>
	</tr>
	
	</table>
	
<%-- 	태어난 해 : ${member.birthYear}<br/> --%>
	
	<br/>

<c:choose>
	<c:when test="${member.mem_auth=='0'}">
	
	<input type = "button" value = "정보수정" onClick = "window.location ='updateMember?mem_id=${usermember.mem_id}'">
	<input type = "button" value = "회원삭제"onClick = "window.location = 'deleteMember?mem_id=${usermember.mem_id}'"><br/>
	<input type = "button" value = "회원목록" onClick = "window.location = 'memberList'">
	
	</c:when>
	<c:when test="${member.mem_auth=='1' || member.mem_auth=='2'}">

	<input type = "button" value = "정보수정" onClick = "window.location ='updateMember?mem_id=${usermember.mem_id}'">
	<input type = "button" value = "회원탈퇴"onClick = "window.location = 'deleteMember?mem_id=${usermember.mem_id}'"><br/>
	
	</c:when>
</c:choose>

	<br/>
	<input type = "button" value = "MAIN" onClick = "window.location = 'main'">	

</form:form>	
</body>
</html>