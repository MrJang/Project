<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addMemberForm.jsp</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
function openDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
  
            document.getElementById('post1').value = data.postcode1;
            document.getElementById('post2').value = data.postcode2;
            document.getElementById('addr').value = data.address;

        }
    }).open();
}
</script>
</head>
<body>

	<form:form commandName = "member">
	<table border = "1">
	<tr>
		<td align = "center">아이디</td>
		<td>
		<form:input path = "mem_id" cssClass = "normal" cssErrorClass = "errors"/>
		<form:errors path = "mem_id" cssClass = "errors"/>
		<input type = "button" value = "중복확인"/>
		</td>
	</tr>
	<tr>
		<td align = "center">이름</td>
		<td> 
		<form:input path = "mem_name" cssClass = "normal" cssErrorClass = "errors"/>
		<form:errors path = "mem_name" cssClass = "errors"/>
		</td>
	</tr>
	<tr>
		<td align = "center">암호</td>
		<td>
		<form:input path = "mem_pw" type = "password" cssClass = "normal" cssErrorClass = "errors"/>
		<form:errors path = "mem_pw" cssClass = "errors"/>
		</td>
	</tr>
	<tr>
		<td class = "blank"><center>주소</center></td>
		<td class = "blank">
		<input type = "button"  value = "우편번호 찾기" onClick = "openDaumPostcode();"/>
		<input type = "text" id = "post1" name = "post1" size ="4"/>-<input type = "text" id = "post2" name = "post2"  size ="4"/><br/>
		<form:input path = "mem_addr" type = "text" id = "addr" size = "60"/>
		</td>
	</tr>
	<tr>
		<td align = "center">휴대폰 번호</td>
		<td>
		<select name = "phone_1">
			<option value = "010">010</option>
			<option value = "016">016</option>
			<option value = "017">017</option>
			<option value = "018">018</option>
			<option value = "019">019</option>
		</select>
		 - <input type = "text" name = "phone_2" size = "6" maxlength = "4"/> - <input type = "text" name = "phone_3" size = "6" maxlength = "4"/>
		</td>
	</tr>	
	<tr>
		<td align = "center">이메일</td>
		<td>
		<form:input path = "mem_email" size = "13"/> @ 
		<select name = "mail">
			<option value = "naver.com">naver.com</option>
			<option value = "daum.net">daum.net</option>
			<option value = "gmail.com">gmail.com</option>
			<option value = "nate.com">nate.com</option>
			<option value = "hotmail.com">hotmail.com</option>
		</select>
		</td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td align = "center">출생 연도</td> -->
<!-- 		<td> -->
<%-- 			<form:select path = "birthYear"><br/> --%>
<%-- 					<form:options items = "${years}"/><br/> --%>
<%-- 				</form:select> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
	<tr>
		<td align = "center">성별</td>
		<td>
			<form:radiobutton path = "mem_gender" value = "M" label = "남"/>	
			<form:radiobutton path = "mem_gender" value = "F" label = "여"/><br/>
		</td>
	</tr>	
	<tr>
		<td align = "center">권한</td>
		<td>
			<form:radiobutton path = "mem_auth" value = "2" label = "정회원"/>	
			<form:radiobutton path = "mem_auth" value = "1" label = "디자이너"/>
			<form:radiobutton path = "mem_auth" value = "0" label = "관리자"/>
			
		</td>
	</tr>
	<tr>
		<td colspan = "2" align = "center">
			
			<input type = "submit" value = "등록"/><input type = "reset" value = "리셋"/>
		</td>
	</tr>
	</table>		
	</form:form>
</body>
</html>