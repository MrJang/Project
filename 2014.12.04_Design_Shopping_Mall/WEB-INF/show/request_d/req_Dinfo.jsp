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
<link href="../jquery.mCustomScrollbar.css" rel="stylesheet">
<script src="../jquery.mCustomScrollbar.js"></script>
<script>
	function request_check(){
		$(scroll_skin).scrollTop(1200);
// 		$('#scroll_skin').scrollTop(1200);
		
		$('#req_p').val('${request.req_process}');
		var a = document.getElementById('${request.req_process}');
		
		var req_category = '${request.req_category}';
		if(req_category==1){
// 	    	 alert(selectedid);
	    	 $("#req_category").val(1);
	     }else if(req_category==2){
// 	    	 alert(selectedid);
	    	 $("#req_category").val(2);
	     }
// 		var b = document.getElementById("req_p");
// 		var c=  b.options[b.selectedIndex].value;
// 		alert(c);
// 		$('#${request.req_process}').attr('disabled','disabled');
	}
	function req_del(){
		var req_num = $("#req_num").val();   
// 		   alert(req_num);
   
		window.location='req_del1?req_num='+req_num;
	}
	
 	function scroll_skin_load(){
// 		$("#scroll_skin").mCustomScrollbar({
// 			autoHideScrollbar:false,
// 			theme:"dark",
// 			setTop:"500px"
			
// 		});
// 		$('#scroll_skin').scrollTop(200);
	}

	
	function chat_active(event){
		   
		if(event==1){
// 			alert('1');
			$("#chat_view").attr("height", "140px");
			$("#chat_cell").attr("height", "78px");
			$("#feedback_1").removeClass("blinkk2").addClass("");
			$("#feedback_1").attr('style','background: aliceblue; width : 97%; height : 100%;');
			$(scroll_skin).scrollTop(1200);
			
		}else if(event==2){
// 			alert('2');
			$("#chat_view").attr("height", "190px");
			$("#chat_cell").attr("height", "28px");
			$("#feedback_1").attr('style','background: #C2FFC2; width : 97%; height : 100%;');
			$("#feedback_1").addClass("blinkk2");
			$(scroll_skin).scrollTop(1200);
		}
		
	}
	
	
	
	function changeFunc() {
	    var uploadimg = document.getElementById("uploadimg");
	    var selectedValue = uploadimg.options[uploadimg.selectedIndex].value;
	    var selectedid = uploadimg.options[uploadimg.selectedIndex].id;
	    var req_img1 = document.getElementById("1").value;
	    var req_img2 = document.getElementById("2").value;
	    if(selectedid==1){
		     $("#img").attr("src","../upload/"+selectedValue);
		     $("#req_category").val(1);
		     $("#req_img").val(req_img1);
	     }else if(selectedid==2){
	    	 $("#img").attr("src", selectedValue);
	    	 $("#req_category").val(2);
	    	 $("#req_img").val(req_img2);
	     }
	    
	    $("#req_img").val('${request.req_img}');
	     
	    	 
// 	     $('#imgselect').attr('disabled','disabled');
	}
	
	function changeFunc2() {
		var b = document.getElementById("req_p");
		var c=  b.options[b.selectedIndex].value;
		if(c==3){
			$("#req_p").attr("style","color:#29A329");
		}else if(c==2){
			$("#req_p").attr("style","color:#FF0000");
		}
		
	}
	
// 	function process_submit(i) {
// 		if(i==1){
// 			var b = document.getElementById("req_p");
// 			var c=  b.options[b.selectedIndex].value;
// 			if(c=="3"){
// 				var r = confirm("의뢰를 수락하시겠습니까?");
// 				if(r==true){
// 					request.submit();
// 				}
				
				
// 			}else if(c=="2"){
// 				var r = confirm("의뢰를 거절하시겠습니까?");
// 				if(r==true){
// 					request.submit();
// 				}
				
// 			}
				
// 		}else if(i==3){
// 			var b = document.getElementById("req_p");
// 			var c=  b.options[b.selectedIndex].value;
// 			 if(c=="4"){
// 				var r = confirm("제작 수락 및 입금이 완료되면 제작을 시작하시면 됩니다.");
// 				if(r==true){
// 					request.submit();
// 				}
			
// 		}else if (i==5){
// 			var b = document.getElementById("req_p");
// 			var c=  b.options[b.selectedIndex].value;
// 			 if(c=="6"){
// 				var r = confirm("제작을 시작합니다.");
// 				if(r==true){
// 					request.submit();
// 				}
// 		}
			
			
			
// 		}else if(i==6){
			
// 			var b = document.getElementById("req_p");
// 			var c=  b.options[b.selectedIndex].value;
// 			if(c=="7"){
// 				var r = confirm("제작이 완료되었습니까?");
// 				if(r==true){
// 					request.submit();
// 				}
			
			
// 		}else if(i==7){
// 			var b = document.getElementById("req_p");
// 			var c=  b.options[b.selectedIndex].value;
// 			if(c=="8"){
// 				var r = confirm("제품을 배송하셨습니까?");
// 				if(r==true){
// 					request.submit();
// 				}
// 			}
// 	}
</script>
<style>
	td{
		text-align: center;
	}
</style>
</head>
<body onload="request_check();scroll_skin_load();">
<form:form commandName = "request">
<form:hidden path = "req_img" id = "req_img" value ="${request.req_img}"/>
<form:hidden path = "req_num" id = "req_num" value ="${request.req_num}"/>
<form:hidden path = "req_category" id = "req_category" value ="${canvas.can_category}"/>
<div style = "width : 100%; height : 718px; ">
<!-- <div style = "width : 100%; height : 40px; "> -->
<table  width = "100%">
	<tr>
		<td width = "10%" class = "board_skin" style = "background:black;color:white; height : 30px;">
			TITLE 		
		</td>
		<td width = "40%" class = "board_skin" style = "height : 30px;">
			${request.req_name}		
		</td>
<!-- 		<td></td> -->
		<td width = "10%" class = "board_skin" style = "background:black;color:white; height : 30px;">
			CLIENT 		
		</td>
		<td width = "40%" class = "board_skin" style = "height : 30px;">
			 ${request.req_sender}		
		</td>
	</tr>
</table>
<!-- </div> -->
<div style = "float : left; width : 100%; height : 40px; ">
<table  width = "100%">
	<tr>
		<td class = "board_skin" style = "width : 10%; background:black;color:white; height : 30px;">
			DATE
		</td>
		<td class = "board_skin" style = "width : 40%; height : 30px;">
			${request.req_date}
		</td>
<!-- 		<td></td> -->
		<td width = "10%" class = "board_skin" style = " background:black;color:white; height : 30px;">
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
		<td class = "board_skin" style = "width : 50%;">
			<c:choose>
				<c:when test="${request.req_process < 4 }">
					<form:input path="req_price" style = "text-align : center;"/>
				</c:when>
				<c:when test="${request.req_process >= 4 }">
					${request.req_price}
				</c:when>
			</c:choose>
		</td>		
	</tr>
</table>
</div>


<div style = "float : left; width : 50%; height : 330px;">
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
		<td class = "board_skin" width = "50%"  style = "background:black; color: white; height : 30px;">
			PROCESS 		
		</td>
		<td class = "board_skin" width = "50%"  style = " height : 30px;">
			<c:choose>
				<c:when test="${request.req_process==1}">
					<form:select path = "req_process"  style = " width :100%;" onchange="changeFunc2();" onfocus="changeFunc2();" id = "req_p">
						<option id = "1" value = "1" selected="selected" disabled="disabled">-----------  의뢰 대기  -----------</option>
						<option id = "3" value = "3" style = "color : #29A329;">●---------  의뢰 수락  ----------●</option>
						<option id = "2" value = "2" style = "color : #FF0000;">■---------  의뢰 거절  ----------■</option>
					</form:select>
<!-- 					<input type = "button" value = "확인" onClick = "process_submit(1);"> -->
				</c:when>
				<c:when test="${request.req_process==2}">
					<form:select path = "req_process" style = "width :100%;" id = "req_p">
						<option id = "2" value = "2" selected="selected" disabled="disabled" style = "color : #FF0000;">■---------  의뢰 거절  ----------■</option>
						<option id = "3" value = "3" style = "color : #29A329;">●---------  의뢰 수락  ----------●</option>
					</form:select>
<!-- 					<input type = "button" value = "확인" onClick = "process_submit(2);"> -->
				</c:when>
				<c:when test="${request.req_process==3}">
					<form:select path = "req_process" style = " width :100%;" id = "req_p">
						<option id = "3" value = "3" style = "color : black;" disabled="disabled">●---------  의뢰 수락  ----------●</option>
						<option id = "4" value = "4">●-최종확인 및 입금요청 -●</option>
					</form:select>
<!-- 					<input type = "button" value = "확인" onClick = "process_submit(3);"> -->
				</c:when>
				<c:when test="${request.req_process==4}">
					최종확인 및 입금대기중
				</c:when>
				<c:when test="${request.req_process==5}">
					<form:select path = "req_process" style = "width :70%;" id = "req_p">
						<option id = "5" value = "5" disabled="disabled">--------입금완료--------</option>
						<option id = "7" value = "7">--------제작중--------</option>
					</form:select>
<!-- 					<input type = "button" value = "확인" onClick = "process_submit(5);">		 -->
				</c:when>
				<c:when test="${request.req_process==6}">
					<form:select path = "req_process" style = "width :70%;" id = "req_p">
						<option id = "6" value = "6" disabled="disabled">--------제작중--------</option>
						<option id = "7" value = "7">--------제작완료--------</option>
					</form:select>
<!-- 					<input type = "button" value = "확인" onClick = "process_submit(6);">		 -->
				</c:when>
				<c:when test="${request.req_process==7}">
					<form:select path = "req_process" style = "width :70%;" id = "req_p">
						<option id = "7" value = "7">--------제작중--------</option>
<!-- 						<option id = "7" value = "7" disabled="disabled">--------제작완료--------</option> -->
						<option id = "8" value = "8">--------상품발송--------</option>
					</form:select>
<!-- 					<input type = "button" value = "확인" onClick = "process_submit(7);"> -->
				</c:when>
				<c:when test="${request.req_process==8}">
					수취확인중
				</c:when>
				<c:when test="${request.req_process==10}">
					거래완료
<!-- 					<input type = "button" style = "width : 30px;" value = "X" onClick = "req_del();"> -->
				</c:when>
				<c:otherwise>
<%-- 					<form:select path = "req_process" style = "width :70%;"> --%>
<!-- 						<option id = "1" value = "1">--------의뢰확인--------</option> -->
<!-- 						<option id = "3" value = "3">--------의뢰수락--------</option> -->
<!-- 						<option id = "2" value = "2">--------의뢰거절--------</option> -->
<!-- 						<option id = "4" value = "4">---------제작중---------</option> -->
<!-- 						<option id = "5" value = "5">--------제작완료--------</option> -->
<!-- 						<option id = "7" value = "7">--------상품발송--------</option> -->
<%-- 					</form:select> --%>
					
				</c:otherwise>			
			</c:choose>
		</td>
		</tr>
		<tr>
			<td class = "board_skin" width = "50%">size1</td>
			<td class = "board_skin" width = "50%" >${request.size1}</td>
		</tr>
		<tr>
			<td class = "board_skin" width = "50%">size2</td>
			<td class = "board_skin" width = "50%">${request.size2}</td>
		</tr>
		<tr>
			<td class = "board_skin" width = "50%">size3</td>
			<td class = "board_skin" width = "50%">${request.size3}</td>
		</tr>
		<tr>
			<td class = "board_skin" width = "50%">size4</td>
			<td class = "board_skin" width = "50%">${request.size4}</td>
		</tr>
		<tr>
			<td class = "board_skin" width = "50%">size5</td>
			<td class = "board_skin" width = "50%">${request.size5}</td>
		</tr>
		<tr>
			<td class = "board_skin" width = "50%">size6</td>
			<td class = "board_skin" width = "50%">${request.size6}</td>
		</tr>
		
	</table>
</div>
<div style = "float : left; width : 50%; height : 253px;">
<table width = "100%">
	<tr>
		<td class = "board_skin" style = "background:black;color:white; height : 20px;">
			<div style = "float: left">　　CLIENT</div><div style = "float: right">${request.req_content_date}　　</div> 		
		</td>
	</tr>
	<tr>
		<td class = "board_skin" style = "height : 218px;">
		<div style = "width : 100%; height : 100%; overflow-y :scroll;" id = "scroll_skin">
			${request.req_content}
		</div>
		</td>
	</tr>
</table>
</div>
<div style = "float : left; width : 50%; height : 253px;">
<table width = "100%">
	<tr>
		<td class = "board_skin" style = "background:black;color:white;height : 20px;">
			<div style = "float: left">　　FEEDBACK</div><div style = "float: right">${request.feedback_date}　　</div> 		
		</td>
	</tr>
	<tr>
		<td class = "board_skin" height = "190px" style = "word-break:break-all;" id = "chat_view">
		<div style = "width : 100%; height : 100%; " id="scroll_skin" class="scroll_skin"> 
		${request.feedback}
		</div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin" height = "28px" id = "chat_cell">
		<textarea class = "blinkk2" onfocus="chat_active(1);" onblur="chat_active(2);" style = "background: #C2FFC2; width : 97%; height : 100%;"  id = "feedback_1" name = "feedback_1"></textarea>
		</td>
	</tr>
</table>
</div>
<center>
	<div style = "float :left;">
		<input type = "button" class = "receive_list" value = "받은의뢰 목록으로" onclick = "window.location = 'req_Dreceive?pageNum=1'">
	</div>
	<div style = "float :left;">
		<input type = "submit" class = "feedback" value = "진행상황 업데이트" >
	</div>
		
	</center>
</div>
	
</form:form>
</body>
</html>
