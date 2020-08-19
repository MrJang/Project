<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateMemberForm.jsp</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<style type="text/css">
	  a:link { color: white; text-decoration: none;} 
	  a:visited { color: white; text-decoration: none;} 
	  a:hover { color: black; text-decoration: none;}
</style>
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
<body style = "vertical-align: top;" onload = "$('#phone_1').val('${member.phone_1}');$('#post1').val('${member.post1}');$('#post2').val('${member.post2}');$('#bank').val('${member.bank}');$('#account').val('${member.account}');">
<center>
	<form:form commandName = "member" enctype = "multipart/form-data">
	
	<table width = "85%" border = "1" align = "right">
	
	
<!-- 	<tr> -->
<!-- 		<td>아이디</td> -->
<!-- 		<td> -->
<%-- 		<form:input path = "id" cssClass = "normal" cssErrorClass = "errors"/> --%>
<%-- 		<form:errors path = "id" cssClass = "errors"/> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
	<tr>
	<td rowspan = "5" width = "150px">
	<center><img src = "../profile/${member.mem_img}" alt = "이미지 없음" width="220px" height = "220px"></center>
	</td>
	
	
		<td width = "300px"><center>이름</center></td>
		<td> 
		<form:input path = "mem_name"/>
		</td>
	</tr>
	<tr><td colspan = "2">　</td></tr>
	<tr>
		<td><center>암호</center></td>
		<td>
		<form:input path = "mem_pw" type = "password" />
		</td>
	</tr>
		<tr>	
			<c:choose>
				<c:when test="${member.mem_auth==1}">
					<td align = "center">입금받는 통장</td>
					<td>
						<form:select path="bank">
							<option value = "농협">  농협  </option>
							<option value = "대구은행">대구은행</option>
							<option value = "국민은행">국민은행</option>
							<option value = "신한은행">신한은행</option>
						</form:select>
						
						<form:input path = "account" size = "35"/>
					</td>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>　
		</tr>
	<tr>
		<td><center>주소</center></td>
		<td>
		<input type = "button"  value = "우편번호 찾기" onClick = "openDaumPostcode();"/>
		<input type = "text" id = "post1" name = "post1" size ="4"/>-<input type = "text" id = "post2" name = "post2" size ="4"/><br/>
		<form:input path = "mem_addr" type = "text" id = "addr" size = "55"/>
		</td>
	</tr>
	<tr>
		<td width = "120px" align = "center">
		<form:input path = "mem_uploadfile" type = "file" /></td>
		<td colspan = "2" class = "blank">　</td>
	</tr>
	<tr>

		<td rowspan = "5">ddddddddddddd</td>
		<td><center>휴대폰 번호</center></td>
		<td align = "center">
		<form:select path = "phone_1" name = "phone_1" id = "phone_1">
			<option value = "010">010</option>
			<option value = "011">011</option>
			<option value = "016">016</option>
			<option value = "017">017</option>
			<option value = "019">019</option>
		</form:select>
		 - <form:input path = "phone_2" name = "phone_2" size = "1" maxlength = "4"/> - <form:input path = "phone_3" name = "phone_3" size = "1" maxlength = "4"/>
		</td>
	</tr>	
	<tr><td colspan = "2" class = "blank">　</td></tr>
	<tr>
		<td><center>이메일</center></td>
		<td>
		<form:input path = "mem_email"/>
		</td>
	</tr>
		
	<tr>
		<td colspan = "2">　</td>
	</tr>
	
	<tr>
		<td><center>성별</center></td>
		<td><center>
			<form:radiobutton path = "mem_gender" value = "M" label = "남"/>	
			<form:radiobutton path = "mem_gender" value = "F" label = "여"/><br/>
			</center>
		</td>
	</tr>
	<tr>
		<td align = "center"><input type = "button" value = "업적"></td>
		<td colspan = "2">
		<center>
			<form:radiobutton path = "mem_auth" value = "0" label = "관리자"/>
			<form:radiobutton path = "mem_auth" value = "1" label = "디자이너"/>	
			<form:radiobutton path = "mem_auth" value = "2" label = "정회원"/>
		</center>
		</td>
	</tr>
	<tr>
		<td colspan = "3" align = "center"  class = "blank">
			<input type = "submit" value = "등록"/><input type = "reset" value = "리셋"/>
		</td>
	</tr>
	</table>		
	</form:form>
</center>
</body>

</html>