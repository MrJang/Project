	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
	<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>   
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>mainForm.jsp</title>
	
	<style type="text/css">
	  a:link { color: red; text-decoration: none;} 
	  a:visited { color: black; text-decoration: none;} 
	  a:hover { color: blue; text-decoration: none;}
	</style>
	
	<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
	</script>
	<script type = "text/javascript">
	window.onload=function(){
		var URL = location.href.substring(location.href.lastIndexOf("/"), 99);
		var Obj = document.getElementById("url");
		Obj.value = URL;
	}
	function jsSetId (obj, type){
		if("on" == type){
		   if(obj.value == "  아이디"){
		   obj.value = "";
		   }
		} else {
		    if(obj.value == ""){
		    obj.value = "  아이디";
		    }
		}
	}
	function jsSetPw (obj, type){
		if("on" == type){
		   if(obj.value == "  비밀번호"){
		   obj.value = "";
		   }
		   if(obj.type == "text"){
		   obj.type = "password";
		   }
		} else {
		    if(obj.value == ""){
		    obj.value = "  비밀번호";
		    obj.type = "text";
		    }
		}
	}		
	</script>
	<link href = "../style.css" type="text/css" rel = "stylesheet">
	</head>
	<body>
	
	<c:choose>
		<c:when test="${m.authority=='1'||m.authority=='2'}">
		
	<table border = "0" align = "center" width = "100%"> 
	<form:form commandName = "member">
		<tr>
			<td width = "50%">
			<center>
			<img src = "../upload/" alt = "이미지 로딩 실패" width="100%">
			</center>
			</td>
			<td colspan = "2">
			<center>
			${m.id}님<br/><br/>
			<input type = "button" class = "button3" value = "개인 정보" onClick = "window.location = 'p_info'"><br/><br/>
			<input type = "button" class = "button3" value = "장바구니" onClick = "window.location ='updateMember?id='"><br/>
			</center>
			</td>
			</tr>
		<tr>
			<td colspan = "3">
			<center>
			
			<input type = "button" class = "nopdnomg" value = "로그아웃" onClick = "window.location = 'logout'">
			
			</center>
			</td>
		</tr>
	</form:form>
	</table>
		 		
	</c:when>	
	<c:when test="${m.authority=='0'}">
	
	<table border = "0" align = "center">
	<form:form commandName = "member">
		<tr>
			<td>${m.id}님(관리자)<br/><br/></td>
		</tr>
		<tr>
			<td>
			<input type = "button" value = "회원목록" onClick = "window.location = 'memberList'">
			<input type = "button" value = "로그아웃" onClick = "window.location = 'logout'"/>
			
			<!--<input type = "button" value = "목록" onClick = "location.href= 'memberList'">-->
			</td>
			
		</tr>
	</form:form>
	</table>
		 			
	</c:when>
	<c:otherwise>
		
	<table border = "0" align = "center">
	<form:form commandName = "member" class = "member"  action="/INNO/spring/main">
		<tr>
			<td id = "login_td1" >
			<form:input path = "id" id = "userFormbutton" onFocus="jsSetId(this, 'on')" onBlur ="jsSetId(this, 'off')" value="  아이디"/><br/>
			<form:input path = "password" type = "text"  id = "userFormbutton" onFocus="jsSetPw(this, 'on')" onBlur ="jsSetPw(this, 'off')" value="  비밀번호"/><br/>
			</td>
		</tr>
		<tr>
			<td rowspan = "2" id = "login_td2">
			<form:input path = "url" name = "url" value = "" id = "url" type = "hidden"/>
			<input type = "submit" class = "userFormbutton1"  value = "로그인"/>
			<input type = "button" class = "userFormbutton1"  value = "회원가입" onClick = "window.location = 'addMember'">
			</td>
		</tr>
	</form:form>
	</table>
	
	</c:otherwise>
	</c:choose>
	
</body>
</html>