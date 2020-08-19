<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function join(){
	location.href="../safe/m_joinMemberSelect";
	}
</script>
<style>
	#bars-button1 .ui-icon-shadow{
		
		background: url(../images/mobile_children.jpg) 0% -15% no-repeat;
		background-size: 30px 30px;
		height:30px;
		width:30px;
	
	}
				  
	#bars-button2 .ui-icon-shadow{
	
	background: url(../images/mobile_female.jpg) 0% -15% no-repeat;
	background-size: 27px 27px;
	height:28px;
	width:28px;
	}
	
	#bars-button3 .ui-icon-shadow{
	
	background: url(../images/mobile_home.jpg) 0% -15% no-repeat;
	background-size: 27px 27px;
	height:28px;
	width:28px;
	}
	#main_logo{
		margin-top:5%;
		margin-bottom:2%;
		width:70%;
		height:40%;
		border-radius:20%;
	}
	.ui-input-text.ui-body-c{
		margin-top:10%;
	}

	
	.main_form1{
		border-radius:10%;
		height:35px;
		align:center;
		font-size:30px;
		font-weight:35px;
		font-style:italic;
	}

	
	
{
	transform: translate(0px,5px);
  -webkit-transform: translate(0px,5px);
	border-bottom: 1px solid;
}
	
	
</style>
<meta http-equiv="Content-type" name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width">
<title>Insert title here</title>
	<link rel="stylesheet" href="jquery.mobile/jquery.mobile-1.3.1.min.css"/>
    <script src = "jquery.mobile/jquery-1.7.2.min"></script>
    <script src = "jquery.mobile/jquery.mobile-1.3.1.min.js"></script>
	<script type="text/javascript" charset="EUC-KR" src="cordova/cordova-2.5.0.js"></script>
</head>
<body>
	<center>
			<div ><img src="../images/logo.jpg" id='main_logo'></div>
			<form:form commandName="s">
				<table id='login_table'  >
					<tr>
						<td><div class='main_form1'>ID</div></td>
						<td><form:input path="id"/><br></td>
					</tr>
					<tr>
						<td><div class='main_form1'>password</div></td>
						<td><form:password path="password"/><br></td>
					</tr>
					<tr>
						<td><input id='login'  type="submit" value="로그인"></td>
						
						<td><input id='join' type="button" value="회원가입" onclick="join();">
						</td>
					</tr>
				</table>
		
			</form:form>
	
</center>
		
	
</body>
</html>