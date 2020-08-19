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
	  td{
	  	text-align: center;
	  }
</style>

<script type = "text/javascript">

	window.onload=function(){
		
		var URL = location.href.substring(location.href.lastIndexOf("/"), 99);
		var Obj = document.getElementById("url");
		Obj.value = URL;
		
	};
	
	
	function myFunction() {
	    setInterval(
	    		function(){
	    			alert("Hello");
	    			window.location = 'req_alert';
	    			}, 3000
	    );
	}
	
	var req_main;

	function logout() {
		window.location = 'logout';
		req_main.close();
	}
	
	function request(){
		req_main = window.open('req_Dmain', 'as', 'width=800px height=780px toolbar=0 location=0 status=0 menubar=0 scrollbars=0 resizable=0 titlebar=0 left=550');
		req_main.focus();
	}
	
	function new_request(){
// 		window.location="main";
		req_main = window.open('req_Dreceive?pageNum=1', 'as', 'width=800px height=780px toolbar=0 location=0 status=0 menubar=0 scrollbars=0 resizable=0 titlebar=0 left=550');
		req_main.focus();
	}
	
	function new_req_mod1(){
		req_main = window.open('req_Dreceive?pageNum=1', 'as', 'width=800px height=780px toolbar=0 location=0 status=0 menubar=0 scrollbars=0 resizable=0 titlebar=0 left=550');
		req_main.focus();
	}
	function new_req_mod2(){
		req_main = window.open('req_Dlist?pageNum=1', 'as', 'width=800px height=780px toolbar=0 location=0 status=0 menubar=0 scrollbars=0 resizable=0 titlebar=0 left=550');
		req_main.focus();
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
<body style = "vertical-align: -50px;">
<div style = "vertical-align:-50px;  float: left; width : 100%; height : 390px; background: ;">
<c:choose>
	<c:when test="${member.mem_auth=='1'}">
		<table align = "center" width = "100%" style = "vertical-align:top; margin-bottom : 0px; height : 98%; background : #FFFFFF; border:0px solid #000000; -moz-border-radius:42px; -webkit-border-radius:42px;"> 
			<form:form commandName = "member">
				<tr>
					<td colspan = "2" width = "100%" height = "1%" class = "b0px">
						
							<span style = "padding-left : 10%; padding-right : 10%;float : center;  background : #000000; color : #FFFFFF; font-family:Times New Roman; font-size:20px; border:1px solid #000000; -moz-border-radius:42px; -webkit-border-radius:42px;">
								${member.mem_id}
							</span>
							<div style = "margin-bottom : 0px;  width :100%;  color : #FFFFFF; font-family:Times New Roman;   border:0px solid #000000; -moz-border-radius:42px; -webkit-border-radius:42px;">
							<table width = "100%" align = "center">
								<tr>
									<c:choose>
										<c:when test="${modified_req_count1>0 || new_req_count>0}">
											<td style = " font-family:Times New Roman; border:0px solid #000000; cursor : pointer; -moz-border-radius:42px; -webkit-border-radius:42px;" onClick = "new_req_mod1();">
											<img alt="" src="../resources/Icon/new.jpg" height = "40%" width = "50%" class = "blinkk4" style = "-moz-border-radius:42px; -webkit-border-radius:42px;">
<!-- 												R<br/> --> 	
<%-- 												${modified_req_count1+new_req_count}건 --%>
											</td>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${modified_req_count2>0}">
											<td style = " font-family:Times New Roman; border:0px solid #000000; cursor : pointer; -moz-border-radius:42px; -webkit-border-radius:42px;" onClick = "new_req_mod2();">
											<img alt="" src="../resources/Icon/new.jpg" height = "40%" width = "50%" class = "blinkk4" style = "-moz-border-radius:42px; -webkit-border-radius:42px;">
<!-- 												S<br/> 	 -->
<%-- 												${modified_req_count2}건 --%>
											</td>
										</c:when>
									</c:choose>
								</tr>
							</table>
							</div>			
					</td>
			</tr>
			<tr>
				<td width = "100%" style = "padding : 0px; margin: 0px; vertical-align: top;  height : 1%;" colspan = "2" class = "b0px">
					<img src = "../profile/${member.mem_img}" style =" width :140px; height : 150px; margin-bottom : 0px; -moz-border-radius:15px; -webkit-border-radius:15px; border : 3px solid #000000;"><br/><br/>
					<div style = "width :100%; float : center;">
						<div style = "float : left; width :50%;">
							<div class="myButton" onClick = "window.location = 'd_shop?des_num='+${cu_des_num}">MyShop</div>
						</div>
						<div style = "float : right; width :50%;">
							<div class="myButton2" onClick = "window.location ='cart_list?pageNum=1&category_num=5'">Mycart</div><br/>						
						</div>
					</div>
					<div style = "width :100%; float : center;">
						<div style = "float : left; width :50%;">
							<div class="myButton" onClick = "window.location = 'p_info'">Mypage</div>	
						</div>
						<div style = "float : right; width :50%;">
							<div class="myButton2" onClick = "logout();">Logout</div>	
						</div>
					</div>
				</td>
			</tr>	
		</form:form>
		</table>
	</c:when>
	<c:when test="${member.mem_auth=='2'}">
		
		<table align = "center" width = "100%" style = "vertical-align:top; margin-bottom : 0px; height : 98%; background : #FFFFFF; border:0px solid #000000; -moz-border-radius:42px; -webkit-border-radius:42px;"> 
			<form:form commandName = "member">
			
				<tr>
					<td align = "center" colspan = "2" style = "height : 5%;">
					<span style = "font-family:Times New Roman;  padding-left : 10%; padding-right : 10%;float : center;  background : #000000; color : #FFFFFF; font-family:Times New Roman; font-size:25px; -moz-border-radius:42px; -webkit-border-radius:42px;">
							<b style = "margin-bottom : 10%;">${member.mem_id}</b>
					</span>
					</td>
				</tr>
				<c:choose>
					<c:when test="${modified_req_count2>0}">
						<tr>
							<td colspan = "2"  style = "height : 10%; color :white; font-family:Times New Roman; border:0px solid #000000; cursor : pointer; -moz-border-radius:42px; -webkit-border-radius:42px;" onClick = "new_req_mod2();">
								<img alt="" src="../resources/Icon/new.jpg" width = "35%" class = "blinkk4" style = "-moz-border-radius:42px; -webkit-border-radius:42px;">
<!-- 								<b>의뢰 업데이트<br/> 	 -->
<%-- 								${modified_req_count2}건 --%>
<!-- 								</b> -->
							</td>
						</tr>
					</c:when>
				</c:choose>	
				<tr>
					<td width = "100%" colspan = "2" class = "b0px">
						<img src = "../profile/${member.mem_img}"  style ="width :140px; height : 150px; margin-bottom : 0px; -moz-border-radius:15px; -webkit-border-radius:15px; border : 3px solid #000000;"><br/><br/>
						<div style = "width :100%; float : center;">
							<div style = "float : left; width :50%;">
								<div class="myButton3" onClick = "window.location ='customer_purchase_list?pageNum=1&category_num=6'">Order</div>
							</div>
							<div style = "float : right; width :50%;">
								<div class="myButton4" onClick = "window.location ='cart_list?pageNum=1&category_num=5'">Cart</div>
							</div>
						</div>				
						<div style = "width :100%; float : center;">
							<div style = "float : left; width :50%;">
								<div class="myButton" onClick = "window.location = 'p_info'">Mypage</div>
							</div>
							<div style = "float : right; width :50%;">
								<div class="myButton2" onClick = "logout();">Logout</div>
							</div>
						</div>
					</td>
				</tr>
			</form:form>
		</table>		
	</c:when>	
	<c:when test="${member.mem_auth=='0'}">
	
	<table border = "0" align = "center">
	<form:form commandName = "member">
		<tr>
			<td align = "center">${member.mem_id}<br/>
			(관리자)<br/></td>
		</tr>
		<tr>
			<td align = "center">
<%-- 				<div class="myButton" onClick = "window.location = 'd_shop?des_num='+${cu_des_num}">Request</div> --%>
				<div class="myButton2" onClick = "window.location = 'memberList'">Member Management</div><br/>
				<div class="myButton" onClick = "window.location = 'p_info'">Mypage</div>
				<div class="myButton2" onClick = "logout();">Logout</div>
				 
	
				
			<!--<input type = "button" value = "목록" onClick = "location.href= 'memberList'">-->
			</td>
			
		</tr>
	</form:form>
	</table>
		 			
	</c:when>
	<c:otherwise>
	<br/><br/><br/><br/><br/>
	
	<table align = "center" width = "100%" style = "vertical-align: bottom;  height : 200px; background : #FFFFFF; border:2px solid #000000; -moz-border-radius:40px; -webkit-border-radius:40px;">
	<form:form commandName = "member"  action="/INNO/spring/main" method = "POST">
		<tr>
			<td id = "login_td1" align = "center" style = "height : 100px;" >
			<br/>
			<form:input path = "mem_id" type = "text" id = "userFormbutton" onFocus="jsSetId(this, 'on')" onBlur ="jsSetId(this, 'off')" value="  아이디"   style = "-moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;"/><br/><br/>
			<form:input path = "mem_pw" type = "text" id = "userFormbutton" onFocus="jsSetPw(this, 'on')" onBlur ="jsSetPw(this, 'off')" value="  비밀번호" style = "-moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;"/><br/><br/>
			<div style = "width:100%;">
				<div style = "float : left; width:50%; ">
					<input type = "image" width = "90px" height = "20px" src="resources/Nbutton/로그인.png" onmouseover='this.src="resources/Obutton/로그인_N.png"' onmouseout='this.src="resources/Nbutton/로그인.png"'onClick = "submit"style = "-moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;">	
				</div>
				<div style = "float : right; width:50%;">
					<input type = "image" width = "90px" height = "20px" src="resources/Nbutton/가입.png" onmouseover='this.src="resources/Obutton/가입_N.png"' onmouseout='this.src="resources/Nbutton/가입.png"'onClick = "window.location = 'addMember'; return false;" style = "-moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;">	
				</div>
			</div>
			
<%-- 			<form:input path = "url" name = "url" value = "" id = "url" type = "hidden"/> --%>
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td rowspan = "2" id = "login_td2" align = "center" style = "height : 100px;"> -->
			
			
<!-- 			<div    -->
<!-- 			onClick = "window.location = 'addMember'; return false;" style = " background-color : #000000;width : 190px; height : 20px; margin-top: 5px; -moz-border-radius:40px; -webkit-border-radius:40px; border:1px solid #000000;"> -->
<!-- 			</div> -->
			
<!-- 				<input type = "image" width = "150px" src="resources/MainImage/공지사항.png" onclick = "window.location = 'notice'"> -->
			
<!-- 			</td> -->
			
<!-- 		</tr> -->
	</form:form>
	
	</table>
	
	</c:otherwise>
	</c:choose>
	</div>
</body>
</html>