<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>design_req</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.js"></script>
<script>

	function bodyOnload(){
		$(scroll_skin).scrollTop(1200);
		var req_category = '${request.req_category}';
		if(req_category==1){
// 	    	 alert(req_category);
	    	 $("#req_category").val(1);
	     }else if(req_category==2){
// 	    	 alert(req_category);
	    	 $("#req_category").val(2);
	     }
	}
	
	function req_del(){
		var req_num = $("#req_num").val();   
// 		   alert(req_num);
   
		window.location='req_del?req_num='+req_num;
	}
	
	function buy(){
		$("#req_process").val(10);
		req_form.submit();
	}
	function visit_designer_shop(){
		window.opener.location='d_shop?des_num=${req_receiver_des_num}';
	
	}
	
	function chat_active(event){
		   
		if(event==1){
			$("#chat_view").attr("height", "140px");
			$("#chat_cell").attr("height", "78px");
			$("#req_content_1").removeClass("blinkk2").addClass("");
			$("#req_content_1").attr('style','background: aliceblue; width : 97%; height : 100%;');
			$(scroll_skin).scrollTop(1200);
		}else if(event==2){
			$("#chat_view").attr("height", "190px");
			$("#chat_cell").attr("height", "28px");
			$("#req_content_1").attr('style','background: #C2FFC2; width : 97%; height : 100%;');
			$("#req_content_1").addClass("blinkk2");
			$(scroll_skin).scrollTop(1200);
		}
		
	}
	
	function changeFunc() {
	    var uploadimg = document.getElementById("uploadimg");
	    var selectedValue = uploadimg.options[uploadimg.selectedIndex].value;
	    var selectedid = uploadimg.options[uploadimg.selectedIndex].id;
	    var req_img1 = document.getElementById("1").value;
	    var req_img2 = document.getElementById("2").value;
// 	    alert('req_img1'+'req_img2');
	    
	     $("#img").attr("src",selectedValue);
	     if(selectedid==1){
		     $("#img").attr("src","../upload/"+selectedValue);
		     $("#req_category").val(1);
// 		     $("#req_img").val('1');
		     $("#req_img").val(req_img1);
	     }else if(selectedid==2){
	    	 $("#img").attr("src", selectedValue);
	    	 $("#req_category").val(2);
// 	    	 $("#req_img").val('2');
	    	 $("#req_img").val(req_img2);
	     }

	}
	
	function allow_and_pay(){
		$("#req_process").val(5);
		req_form.submit();
	}
</script>
<style>
	td{
		text-align: center;
	}
</style>
</head>
<body onload = "bodyOnload();">
<form:form commandName = "request" id = "req_form">
<form:hidden path = "req_img" id = "req_img" value =""/>
<form:hidden path = "req_num" id = "req_num" value ="${request.req_num}"/>
<form:hidden path = "req_process" id = "req_process" value ="${request.req_process}"/>
<form:hidden path = "req_category" id = "req_category" value ="${request.can_category}"/>
<div style = "width : 100%; height : 718px; ">
<div style = "width : 100%; height : 40px; ">
<table width = "100%" height = "100%">
	<tr>
		<td width = "10%" height = "100%" style = "background: black; color : white;" align = "center" class = "board_skin">
			TITLE 		
		</td>
		<td width = "40%" align = "center"  class = "board_skin">
			${request.req_name}		
		</td>
		<td width = "13%" align = "center" style = "background: black; color : white;" class = "board_skin">
			DESIGNER 		
		</td>
		<td width = "37%" align = "center" class = "board_skin">
			 ${request.req_receiver}		
		</td>
	</tr>
</table>

</div>
<div style = "float : left; width : 100%; height : 40px; ">
<table width = "100%" height = "100%">
	<tr>
		<td width = "10%" align = "center" style = "background: black; color : white;" class = "board_skin">
			DATE
		</td>
		<td width = "40%" colspan = "2" align = "center" class = "board_skin">
			${request.req_date}
		</td>
		<td align = "center" width = "13%" style = "background: black; color : white; height : 30px;" class = "board_skin">
			<c:choose>
				<c:when test="${request.req_process < 4 }">
					현재 가격
				</c:when>
				<c:when test="${request.req_process == 4||request.req_process == 5}">
					최종 가격
				</c:when>
				<c:when test="${request.req_process > 5 }">
					가격
				</c:when>
			</c:choose>
					
		</td>
			<c:choose>
				<c:when test="${request.req_process < 4 }">
					<td align = "center" class = "board_skin" style = "width : 50%;">
						${request.req_price}
					</td>		
				</c:when>
				<c:when test="${request.req_process == 4||request.req_process == 5}">
					<td align = "center" class = "blinkk3" style = "width : 50%;">
						${request.req_price}
					</td>
				</c:when>
				<c:when test="${request.req_process > 5 }">
					<td align = "center" class = "board_skin" style = "width : 50%;">
						<b>${request.req_price}</b>
					</td>
				</c:when>
			</c:choose>
			
		
	</tr>
</table>
</div>

<div style = "float : left; width : 50%; height : 330px; ">
<table width = "100%">
	<tr>
		<td class = "board_skin">
				<c:choose>
				<c:when test="${request.req_category==1}">
					<img src = '../upload/${request.req_img}' id = "img" alt='이미지 로딩 실패' width='100%' height = '330px'>				
				</c:when>
				<c:when test="${request.req_category==2}">
					<img src = '${request.req_img}' id = "img" alt='이미지 로딩 실패' width = '100%' height = '330px'>				
				</c:when>
			</c:choose>
		</td>
	</tr>
</table>
</div>
<div style = "float : left; width : 50%; height : 340px;">
	<table width = "100%" height = "340px">
		<tr>
			<td align = "center" width = "50%" class = "board_skin" onClick = "visit_designer_shop()" style = "cursor : pointer; background: black;">
				<b style = "color : white;">디자이너 샵 방문</b>
			</td>
			<td align = "center" width = "50%" class = "board_skin">
				<c:choose>
					<c:when test="${request.req_process==0}">
					의뢰 요청중
					<input type = "button"  value = "의뢰 취소" onClick = "req_del();">
					</c:when>
					<c:when test="${request.req_process==1}">디자이너 의뢰확인</c:when>
					<c:when test="${request.req_process==2}">
						디자이너 의뢰거절
						<input type = "button"  value = "의뢰 취소" onClick = "req_del();">
					</c:when>
					<c:when test="${request.req_process==3}">디자이너 의뢰수락</c:when>
					<c:when test="${request.req_process==4}">
						<input type = "button" value = "최종 확인 및 입금" onClick = "allow_and_pay();">
					</c:when>
					<c:when test="${request.req_process==5}">입금완료</c:when>
					<c:when test="${request.req_process==7}">
						제작중
<!-- 						제작완료 -->
					</c:when>
					<c:when test="${request.req_process==8}">
						상품 배송중
						<input type = "button" value = "수취확인" onClick = "buy();">
					</c:when>
					<c:when test="${request.req_process==10}">
						거래완료
						<input type = "button" style = "width : 30px;" value = "X" onClick = "req_del();">
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td align = "center" width = "50%" class = "board_skin">size1</td>
			<td align = "center" width = "50%" class = "board_skin">${request.size1}</td>
		</tr>
		<tr>
			<td align = "center" width = "50%" class = "board_skin">size2</td>
			<td align = "center" width = "50%" class = "board_skin">${request.size2}</td>
		</tr>
		<tr>
			<td align = "center" width = "50%" class = "board_skin">size3</td>
			<td align = "center" width = "50%" class = "board_skin">${request.size3}</td>
		</tr>
		<tr>
			<td align = "center" width = "50%" class = "board_skin">size4</td>
			<td align = "center" width = "50%" class = "board_skin">${request.size4}</td>
		</tr>
		<tr>
			<td align = "center" width = "50%" class = "board_skin">size5</td>
			<td align = "center" width = "50%" class = "board_skin">${request.size5}</td>
		</tr>
		<tr>
			<td align = "center" width = "50%" class = "board_skin">size6</td>
			<td align = "center" width = "50%" class = "board_skin">${request.size6}</td>
		</tr>
	</table>
</div>

<div style = "float : left; width : 50%; height : 253px;">
<table width = "100%">
	<tr>
		<td align = "center" style = "background:black;color:white; height : 20px;" class = "board_skin">
			<div style = "float: left">　　FEEDBACK</div><div style = "float: right">${request.feedback_date}　　</div> 		
		</td>
	</tr>
	<tr>
		<td align = "center" style = "word-break:break-all; height : 218px;" class = "board_skin">
		<div style = "width : 100%; height : 100%; overflow-y :scroll;" id = "scroll_skin">
		${request.feedback}
		</div>
			
		</td>
	</tr>
</table>

</div>
<div style = "float : left; width : 50%; height : 253px;">
<table width = "100%">
	<tr>
		<td align = "center" style = "background:black;color:white; height : 20px;" class = "board_skin">
			 <div style = "float: left">　　추가 요구사항</div><div style = "float: right">${request.req_content_date}　　</div>	
		</td>
	</tr>
	<tr>
		<td class = "board_skin" height = "190px" style = "word-break:break-all;" id = "chat_view">
		<div style = "width : 100%; height : 100%;" id="scroll_skin" class="scroll_skin"> 
		${request.req_content}
		</div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin" height = "28px" id = "chat_cell">
		<textarea class = "blinkk2" onfocus="chat_active(1);" onblur="chat_active(2);" style = "background: #C2FFC2; width : 97%; height : 100%;"  id = "req_content_1" name = "req_content_1"></textarea>
		</td>
	</tr>
</table>
</div>
<center>
	<div style="float: left; width: 385px; height: 35px; background: #DDDDDD;">
		<input type = "button" class = "receive_list" value = "　의뢰 목록으로　" onclick = "window.location = 'req_Dlist?pageNum=1'">
	</div>
	<div style="float: left; width: 385px; height: 35px; background: #DDDDDD;">
		<input type = "submit" class = "feedback1" value = "　요구사항 UPDATE  " >
	</div>
</center>

</div>
	

	
</form:form>
</body>
</html>
