<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>layout2</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<link href = "../button.css" type="text/css" rel = "stylesheet">
<link rel="stylesheet" href="../example.css">
<link rel="stylesheet" href="../font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../jquery.slides.min.js"></script>
<style>
	  body {

 overflow-y:scroll;  

}

input:focus {
    background-color: aliceblue;
}

td{
 text-align: center;
}
b{
word-break : break-all;
}
.my-window{
/*     position: fixed; */
/*     overflow-y:scroll; */

}
 
</style>
<script type="text/javascript">
	window.addEventListener("resize", scroll_resizing);
	function scroll_resizing() {
		if($(window).width()>800)
			$(window).scrollLeft(1200);
			var winow_scroll_center = $(window).scrollLeft()/2;
			$(window).scrollLeft(winow_scroll_center);		
			var a = $(window).width();
// 		alert(window.innerWidth);
	}
</script>
</head>
<body onload = "scroll_resizing();">
<center>
<c:choose>
	<c:when test=""></c:when>
</c:choose>

<table width = "1200px">
	<tr>
		<td width = "1200px" height = "20px" >
		</td>
	</tr>
</table>
	<table width = "1200px" align = "center" >
		<tr>
			<td width = "100%">
				<tiles:insertAttribute name="logo"/>
			</td>
		</tr>
	</table>
	<table width = "1200px">
	<tr>
		<td width = "1200px" height = "20px"></td>
	</tr>
	</table>
	<div style = "width : 100%; background: black;">
<!-- 		<table width = "100%"  align = "center" > -->
<!-- 			<tr> -->
<!-- 				<td width = "100%"> -->
					<tiles:insertAttribute name="menuForm"/>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
	</div>
	<br/>
	<div style = "width : 1200px;  height : 370px; border:0px solid #000000; margin-top : 0px; align :center; vertical-align: bottom;">
		<div style = "float : left; margin-left : 12%; margin-right : 0px; width : 15%;  height : 390px; background : ">
		
		</div>
		<div style = "float : left; width : 40%; margin-left : 3.3%; border-top : 2px solid black;border-right : 2px solid black;border-left : 2px solid black;border-bottom : 2px solid black;">
			
						<tiles:insertAttribute name="slide"/>
					
		</div>
		<div style = "  float : left; width : 15%; height : 390px; margin-left : 3.3%; ">
			<tiles:insertAttribute name="userForm"/>
		</div>
	</div>
	<br/><br/>
	<div style = " float: center; margin-left : 3.3%;  width : 1200px; height : 250px; margin-top : 0px; -moz-border-radius:40px; -webkit-border-radius:40px; border:0px solid #000000;">
		<div style = " float: left; z-index: -1;   width : 45%; height : 250px; margin-top : 0px; border:0px solid #000000;">
<!-- 			<div style = " float : left; background: #EEEEEE; width : 100%; height : 20px; overflow: hidden; "> -->
			<table border = "0" width = "100%">
				<tr>
					<td align = "center" onClick = "window.location = 'intro?pageNum=1'" style = "cursor : pointer;">
						<b><font color="black">공지사항</font></b>
					</td>
				</tr>
			</table>
			<table width = "100%" >
				<tr >
					<td width = "8%" style = "border : 0px solid black; background:#5CADFF;">
						 <b style = "color: white;">번호</b>
					</td>
					<td width = "47%" style = "border : 0px solid black; background:#5CADFF;" >
						 <b style = "color: white;">제목</b>
					</td>
					<td width = "20%" style = "border : 0px solid black; background:#5CADFF;" >
						<b style = "color: white;">글쓴이</b>
					</td>
					<td width = "25%" style = "border : 0px solid black; background:#5CADFF;" align = "center">
						<b style = "color: white;">날짜</b>
					</td>
				</tr>
			</table>
			<table width = "100%" >
				<tr>
					<td><b style = "color : gray;">-</b></td><td><b style = "color : gray;">디자이너 승급 방법</b></td><td><b style = "color : gray;">manager</b></td><td><b style = "color : gray;">-</b></td>
				</tr>
				<c:forEach var="board" items="${list3}" varStatus="status" begin="0" end="4">
				<tr>
				
					<td width = "8%" align = "center" style="cursor :pointer; background : ; border-bottom:2px solid #CCCCCC;" ><b>${list3size-status.index}</b></td>
					<td width = "47%" height="30px" align="center" style="cursor :pointer; background : ; border-bottom:2px solid #CCCCCC;" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);' onClick="window.location = 'get_intro?num=${board.bod_num}&pageNum=1'">
						<b>${board.bod_title}</b>
					</td>
					<td width = "20%" height="30px" align="center" style="cursor :pointer; background : ; border-bottom:2px solid #CCCCCC;" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);' onClick="window.location = 'get_intro?num=${board.bod_num}&pageNum=1'" ><b>${board.mem_id}</b></td>
					<td width = "25%" height="30px" align="center" style="cursor :pointer; background : ; border-bottom:2px solid #CCCCCC;" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);' onClick="window.location = 'get_intro?num=${board.bod_num}&pageNum=1'" ><b>${board.bod_date}</b></td>
				
				</tr>
				</c:forEach>
				
	
				
			</table>
<!-- 			</div> -->
		</div>
		
		<div style = " float: left; z-index: -1; width : 45%; height : 250px; margin-top : 0px; margin-left : 4%;  border:0px solid #000000; ">
			<table border = "0" width = "100%" align = "center">
				<tr>
					<td align = "center" >
						<b><font color="black">TOP 디자이너</font></b>
					</td>
				</tr>
			</table>
			<table border = "0" width = "100%" align = "center">
				<tr >
					<td width = "33%" style = "border : 0px solid black; background:#db2cdb;" align = "center">
						 <font style = "color: white;"><b>판매</b></font>
					</td>
					<td width = "33%" style = "border : 0px solid black; background:#db2cdb;" align = "center">
						<font style = "color: white;"><b>디자인</b></font>
					</td>
					<td width = "33%" style = "border : 0px solid black; background:#db2cdb;" align = "center">
						<font style = "color: white;"><b>의뢰</b></font>
					</td>
				</tr>
			</table>
			<div style = "margin-left : 1px; margin-right : 2px; float : left; width : 33%; height : 50%; background: ;">
				<table width = "100%" align = "left" border = "0">
			<c:forEach var="member" items="${ps_list}" varStatus="status" begin="0" end="2">
				<tr>
					<td width = "13%" height="30px" style="background : ; border-bottom:2px solid #CCCCCC;" align = "center">
						<c:choose>
							<c:when test="${status.count==1 }">
								<b style = "color : #ffd700;">${status.count}</b>
							</c:when>
							<c:when test="${status.count==2 }">
								<b style = "color : #AAAAAA;">${status.count}</b>
							</c:when>
							<c:when test="${status.count==3 }">
								<b style = "color : #cd7f32;">${status.count}</b>
							</c:when>
						</c:choose>
						
					</td>
					<td width = "70%" height="30px" style="background : ; border-bottom:2px solid #CCCCCC;" align = "center">
						<c:choose>
							<c:when test="${status.count==1 }">
								<b>${member.mem_id}</b>
							</c:when>
							<c:when test="${status.count==2 }">
								<b>${member.mem_id}</b>
							</c:when>
							<c:when test="${status.count==3 }">
								<b>${member.mem_id}</b>
							</c:when>
						</c:choose>
					</td>
					<td width = "13%" height="30px"  style="background : ;  border-bottom:2px solid #CCCCCC;" align = "center">
						<c:choose>
							<c:when test="${status.count==1 }">
								<b>${member.p_count}</b>
							</c:when>
							<c:when test="${status.count==2 }">
								<b>${member.p_count}</b>
							</c:when>
							<c:when test="${status.count==3 }">
								<b>${member.p_count}</b>
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			</table>
			</div>
			<div style = "margin-right : 2px; float : left; width : 32.8%; height : 50%; background: ;">
			<table width = "100%" align = "left" border = "0" >
			<c:forEach var="canvas" items="${c_list}" varStatus="status" begin="0" end="2">
				<tr>
					<td width = "13%" height="30px" style="background : ; border-bottom:2px solid #CCCCCC;" align = "center">
						<c:choose>
							<c:when test="${status.count==1 }">
								<b style = "color : #ffd700;">${status.count}</b>
							</c:when>
							<c:when test="${status.count==2 }">
								<b style = "color : #AAAAAA;">${status.count}</b>
							</c:when>
							<c:when test="${status.count==3 }">
								<b style = "color : #cd7f32;">${status.count}</b>
							</c:when>
						</c:choose>
					</td>
					<td width = "70%" height="30px" style="background : ; border-bottom:2px solid #CCCCCC;" align = "center">
						<c:choose>
							<c:when test="${status.count==1 }">
								<b>${canvas.mem_id}</b>
							</c:when>
							<c:when test="${status.count==2 }">
								<b>${canvas.mem_id}</b>
							</c:when>
							<c:when test="${status.count==3 }">
								<b>${canvas.mem_id}</b>
							</c:when>
						</c:choose>
					</td>
					<td width = "13%" height="30px" style=" background : ; border-bottom:2px solid #CCCCCC;" align = "center">
						<c:choose>
							<c:when test="${status.count==1 }">
								<b>${canvas.can_count}</b>
							</c:when>
							<c:when test="${status.count==2 }">
								<b>${canvas.can_count}</b>
							</c:when>
							<c:when test="${status.count==3 }">
								<b>${canvas.can_count}</b>
							</c:when>
						</c:choose>
					</td>
<!-- 					<td width = "6.6%" style="background : ; border-bottom:2px solid #CCCCCC;" align = "center"> -->
<%-- 						${canvas.can_count} --%>
<!-- 					</td> -->
					
				</tr>
			</c:forEach>
			</table>
			</div>
			<div style = "float : left; width : 32.9%; height : 50%; background: ;">
			<table width = "100%" align = "left" border = "0" >
			<c:forEach var="request" items="${r_list}" varStatus="status" begin="0" end="2">
				<tr>
					<td width = "13%" height="30px" style="background : ; border-bottom:2px solid #CCCCCC;" align = "center">
						<c:choose>
							<c:when test="${status.count==1 }">
								<b style = "color : #ffd700;">${status.count}</b>
							</c:when>
							<c:when test="${status.count==2 }">
								<b style = "color : #AAAAAA;">${status.count}</b>
							</c:when>
							<c:when test="${status.count==3 }">
								<b style = "color : #cd7f32;">${status.count}</b>
							</c:when>
						</c:choose>
					</td>
					<td width = "70%" height="30px" style="background : ; border-bottom:2px solid #CCCCCC;" align = "center">
						<c:choose>
							<c:when test="${status.count==1 }">
								<b>${request.req_receiver}</b> 
							</c:when>
							<c:when test="${status.count==2 }">
								<b>${request.req_receiver}</b> 
							</c:when>
							<c:when test="${status.count==3 }">
								<b>${request.req_receiver}</b> 
							</c:when>
						</c:choose>
					</td>
					<td width = "13%" height="30px" style=" background : ; border-bottom:2px solid #CCCCCC;" align = "center">
						<c:choose>
							<c:when test="${status.count==1 }">
								<b>${request.r_count}</b> 
							</c:when>
							<c:when test="${status.count==2 }">
								<b>${request.r_count}</b>
							</c:when>
							<c:when test="${status.count==3 }">
								<b>${request.r_count}</b>
							</c:when>
						</c:choose>
					</td>

				</tr>
			</c:forEach>
			</table>
			</div>
			
		
			
			
		</div>
	</div>
</center>
</body>
</html>