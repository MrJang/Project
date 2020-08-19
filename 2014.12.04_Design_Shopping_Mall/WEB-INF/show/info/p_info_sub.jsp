<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<link href = "../button.css" type="text/css" rel = "stylesheet">
<style type="text/css">
	  a:link { color: white; text-decoration: none;} 
	  a:visited { color: white; text-decoration: none;} 
	  a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
<center>
<div style = "width : 100%; height : 650px; background: ;">
<div class="myinfo1" onClick = "window.location ='updateMember?mem_id=${member.mem_id}'">개인정보관리</div>
<div class="myinfo3" onClick = "window.location = 'p_info'">업적</div>
<!-- <div class="myinfo2">상담목록</div> -->
<!-- <div class="myinfo4">판매목록</div> -->
<!-- <div class="myinfo5" onClick = "window.location ='my_design'">디자인관리</div> -->
</div>

		
			

</center>
</body>
</html>