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
	  a:link { color: white; text-decoration: none;} 
	  a:visited { color: white; text-decoration: none;} 
	  a:hover { color: black; text-decoration: none;}
</style>
<script type = "text/javascript">

	window.onload=function(){
		
		var URL = location.href.substring(location.href.lastIndexOf("/"), 99);
		var Obj = document.getElementById("url");
		Obj.value = URL;
		
	};
	
	
	
	var req_main;

	
	
	function logout() {
		window.location = 'app_logout';
		req_main.close();
	}
	
	function request(){
		req_main = window.open('req_main', 'as', 'width=800px height=780px toolbar=0 location=0 status=0 menubar=0 scrollbars=0 resizable=0 titlebar=0 left=550');
		req_main.focus();
// 		req_main = window.open('req_main');
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
<link href="../style.css" type="text/css" rel="stylesheet">
<link href="../button.css" type="text/css" rel="stylesheet">
</head>
<body style = "vertical-align: top;">
<c:choose>
	<c:when test="${member.mem_auth=='1'||member.mem_auth=='2'}">
		
		<table width = "100%" style = "margin-bottom : 15px; height : 98%; background : #EEEEEE; border:1px solid #000000; -moz-border-radius:42px; -webkit-border-radius:42px;" cellspacing="10px"> 
			<form:form commandName = "member"><tr><td width = "50%" class = "margin0px" colspan="2">
			<center>
			<c:choose>
			<c:when test="${member.mem_auth=='1'}">
					<div style = " width :90%; background : #000000; color : #FFFFFF; font-family:Times New Roman; height : 30px; font-size:20px; border:1px solid #000000; -moz-border-radius:42px; -webkit-border-radius:42px;">
					${member.mem_id}<font size="2px">님 환영합니다</font></div>
			</c:when>
			<c:when test="${member.mem_auth=='2'}">
					<div style = " width :90%; background : #000000; color : #FFFFFF; font-family:Times New Roman; height : 30px; font-size:20px; border:1px solid #000000; -moz-border-radius:42px; -webkit-border-radius:42px;">
					${member.mem_id}<font size="2px">님 환영합니다</font></div>
			</c:when>
			</c:choose>
			</center>
			</td>
			</tr>
			<tr>
				<td width="60%">
					<img src = "../profile/${member.mem_img}" alt = "" style =" width :140px; height : 150px; margin-bottom : 10px; -moz-border-radius:15px; -webkit-border-radius:15px; border : 3px solid #000000;">
				</td>
				<td width="40%">
					<div onclick="window.location='app_my_capture?pageNum=1'"><c:choose><c:when test="${member.mem_auth=='0'}"><font size="2px">등급 : 디자이너</font></c:when>
					<c:when test="${member.mem_auth=='1'}"><font size="2px">디자이너</font><br/>
					<font size="2px" style="font-family: monospace;">로그인 ${getlogincheck}회</font><br/>
					<font size="2px">상품${my_buy_count}개 판매</font><br/>
					<font size="2px">글작성${my_articleAll_count}회</font><br/><br/>
					</c:when>
					
					<c:when test="${member.mem_auth=='2'}"><font size="2px">정회원</font><br/>
					<font size="2px">로그인 ${getlogincheck}회</font><br/>
					
					</c:when>
					</c:choose></div>
					
					
<!-- 					<div class="myButton" onClick = "window.location = 'app_my_capture?pageNum=1'">Mypage</div> -->
					<div class="myButton2" onClick = "logout();">Logout</div>
				</td>
				</tr>
				</form:form>
		</table>
		
	</c:when>	
	<c:when test="${member.mem_auth=='0'}">
	
	<table border = "0">
	<form:form commandName = "member">
		<tr>
			<td>${member.mem_id}<br/>
			(관리자)<br/></td>
		</tr>
		<tr>
			<td>
				<div class="myButton" onClick = "req_main();">Request // </div>
				<div class="myButton2" onClick = "window.location ='cart_list?pageNum=1&category_num=5'">Mycart</div><br/>
				<div><c:choose><c:when test="${member.mem_auth=='0'}"><font size="2px">등급 : 관리자</font></c:when></c:choose></div>
				<div class="myButton2" onClick = "logout();">Logout</div>
				<input type = "button" value = "회원목록" onClick = "window.location = 'memberList'">
	
				
			<!--<input type = "button" value = "목록" onClick = "location.href= 'memberList'">-->
			</td>
			
		</tr>
	</form:form>
	</table>
		 			
	</c:when>
	<c:otherwise>
	<table id = "a" align = "center" width = "100%" style = "background : #EEEEEE; border:2px solid #000000; -moz-border-radius:42px; -webkit-border-radius:42px;">
	<form:form commandName = "member"  action="/INNO/spring/app_main" method = "POST">
		<tr>
			<td id = "login_td1" align = "center" >
			<br/>
			<form:input path = "mem_id" type = "text" id = "userFormbutton" onFocus="jsSetId(this, 'on')" onBlur ="jsSetId(this, 'off')" value="  아이디"   style = "-moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;"/><br/><br/>
			<form:input path = "mem_pw" type = "text" id = "userFormbutton" onFocus="jsSetPw(this, 'on')" onBlur ="jsSetPw(this, 'off')" value="  비밀번호" style = "-moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;"/><br/>
			</td>
		</tr>
		<tr>
			<td rowspan = "2" id = "login_td2" align = "center">
			<form:input path = "url" name = "url" value = "" id = "url" type = "hidden"/>
			
			<br/>
			
			<input type = "image" width = "90px" height = "20px" src="resources/Nbutton/로그인.png" 
			onmouseover='this.src="resources/Obutton/로그인_N.png"' 
			onmouseout='this.src="resources/Nbutton/로그인.png"'
			onClick = "submit"style = "-moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;" >
			
<!-- 			<input type = "image" width = "90px" height = "20px" src="resources/Nbutton/가입.png"  -->
<!-- 			onmouseover='this.src="resources/Obutton/가입_N.png"'  -->
<!-- 			onmouseout='this.src="resources/Nbutton/가입.png"' -->
<!-- 			onClick = "window.location = 'addMember'; return false;" style = "-moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;"> -->
			
			
<!-- 			<input type = "image" width = "185px" height = "20px" src="resources/Nbutton/가입.png"  -->
<!-- 			onmouseover='this.src="resources/Obutton/가입_N.png"'  -->
<!-- 			onmouseout='this.src="resources/Nbutton/가입.png"' -->
<!-- 			onClick = "window.location = 'addMember'; return false;" style = "margin-top: 5px; -moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;"> -->
			
			<br/><br/>
			</td>
			
		</tr>
	</form:form>
	
	</table>
	
	</c:otherwise>
	</c:choose>
	
</body>
</html>