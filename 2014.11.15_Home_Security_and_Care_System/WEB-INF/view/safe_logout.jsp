<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" media="screen, projection"
   href="http://www.blueprintcss.org/blueprint/screen.css"/>
   <link rel="stylesheet" type="text/css" media="screen, projection"
   href="http://www.blueprintcss.org/blueprint/plugins/buttons/screen.css"/>
   <link rel="stylesheet" type="text/css" media="print"
   href="http://www.blueprintcss.org/blueprint/print.css"/>
   
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
   
   <style type="text/css">
   
   #loginContent {widtg:250px; margin: 50px;}
   button[type] {margin: 2.0em 2;}
   </style>
   <script type = "text/javascript">
   function moveJoin() {
	   location.href="../safe/joinMemberSelect";
   }
   </script>

   
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="loginContent" class="container">
<center>
<a href="../safe/safe_Main"><img src = "../images/logo.jpg" style="width: 30%; height:30%;"></a>
</center>


 </div>
<div id="loginResult" style="display:none;">
</div>
 <fieldset>
   <form:form commandName="s">
     
         <legend>Enter information</legend>
         <p>
         <label for="username">UserId</label>
         <br/>
         <form:input path="id" class="text" size="20"/>
         </p>
         <p>
         <label for="password">Password</label>
         <br/>
         <form:password path="password" class="text" size="20"/>
         </p>
         <p>
         <button type="submit" class= "button positive">
         <img alt="ok" src="http://www.blueprintcss.org/blueprint/plugins/buttons/icons/tick.png"/>
         로그인
         </button>
          </p>
        </form:form>
         &nbsp;&nbsp;&nbsp;&nbsp;
          
     <button class="button positive" onclick="moveJoin();">
         <img alt="ok" src="http://www.blueprintcss.org/blueprint/plugins/buttons/icons/tick.png"/>
         회원가입
         </button>
        
         
      </fieldset>
   
    
</body>
</html>