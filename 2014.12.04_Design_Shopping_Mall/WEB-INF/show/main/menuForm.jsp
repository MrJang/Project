<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardForm.jsp</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<style type="text/css">
	  a:link { color: red; text-decoration: none;} 
	  a:visited { color: black; text-decoration: none;} 
	  a:hover { color: blue; text-decoration: none;}
</style>
<script type="text/javascript">
// 	var mmain;
// 	mmain = window();
	function req_mainn(){
		req_main = window.open("req_Dlist?pageNum=1", "name=_blank", 'width=800px height=780px toolbar=0 location=0 status=0 menubar=0 scrollbars=0 resizable=0 titlebar=0 left=550');
// 		req_main = window.open("req_main?selected_designer=none", "name=_blank", 'width=800px height=780px toolbar=0 location=0 status=0 menubar=0 scrollbars=0 resizable=0 titlebar=0 left=550');
		req_main.focus();
	}	
	
</script>
</head>
<body>
<center>
<div style = "background: black; width:1200px; height : 40px;">
	
<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 	<span onClick = "window.location = 'intro'"> -->
<!-- 		<input type = "image"  class="MenuForm" src="resources/Nbutton/메뉴_디마켓.png" onmouseover='this.src="resources/Obutton/메뉴_디마켓_N.png"' onmouseout='this.src="resources/Nbutton/메뉴_디마켓.png"'> -->
<!-- 	</span> -->
<!-- style = "-moz-border-radius:20px; -webkit-border-radius:20px;" -->
<div style = "float : left; width : 20%">
	<span onClick = "window.location = 'canvas'">
		<input type = "image"  class="MenuForm"  src="resources/Nbutton/메뉴_티셔츠제작_N.png" onmouseover='this.src="resources/Obutton/메뉴_티셔츠제작.png"' onmouseout='this.src="resources/Nbutton/메뉴_티셔츠제작_N.png"'>
	</span>
</div>
<div style = "float : left; width : 20%">
	<span onClick = "window.location = 'shop_main'">
		<input type = "image"  class="MenuForm"  src="resources/Obutton/메뉴_디자인쇼핑_N.png" onmouseover='this.src="resources/Obutton/메뉴_디자인쇼핑.png"' onmouseout='this.src="resources/Obutton/메뉴_디자인쇼핑_N.png"' >
	</span>

</div>
<div style = "float : left; width : 20%">
	<span onClick = "window.location = 'board1?pageNum=1'">
		<input type = "image"  class="MenuForm"  src="resources/Obutton/메뉴_디자인게시판_N.png" onmouseover='this.src="resources/Obutton/메뉴_디자인게시판.png"' onmouseout='this.src="resources/Obutton/메뉴_디자인게시판_N.png"' >
	</span>

</div>
<div style = "float : left; width : 20%">
	<span onClick = "window.location = 'board2?pageNum=1'">
		<input type = "image"  class="MenuForm"  src="resources/Nbutton/메뉴_자유게시판_N.png" onmouseover='this.src="resources/Obutton/메뉴_자유게시판.png"' onmouseout='this.src="resources/Nbutton/메뉴_자유게시판_N.png"'>
	</span>
</div>
<div style = "float : left; width : 20%">
<!-- 	<span onClick = "window.open('req_main?selected_designer=none', 'req_main', 'width=800px height=780px  left=550');req_main();"> -->
	<span onClick = "req_mainn();">
		<input type = "image"  class="MenuForm" src="resources/Nbutton/메뉴_디자인의뢰_N.png" onmouseover='this.src="resources/Obutton/메뉴_디자인의뢰.png"' onmouseout='this.src="resources/Nbutton/메뉴_디자인의뢰_N.png"' >
	</span>
</div>
	
<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
	
<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
	
<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
	
<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->

	
	</div>
	</center>
</body>
</html>