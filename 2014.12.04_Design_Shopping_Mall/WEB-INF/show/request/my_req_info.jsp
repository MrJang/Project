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
	
	function changeFunc() {
	    var uploadimg = document.getElementById("uploadimg");
	    var selectedValue = uploadimg.options[uploadimg.selectedIndex].value;
	    var selectedid = uploadimg.options[uploadimg.selectedIndex].id;
	    var req_img1 = document.getElementById("1").value;
	    var req_img2 = document.getElementById("2").value;
	    
	     $("#img").attr("src",selectedValue);
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

	}
	
	function allow_and_pay(){
		$("#req_process").val(5);
		req_form.submit();
	}
</script>
</head>
<body onload = "bodyOnload();">
<form:form commandName = "request" id = "req_form">
<form:hidden path = "req_img" id = "req_img" value ="${request.req_img}"/>
<form:hidden path = "req_num" id = "req_num" value ="${request.req_num}"/>
<form:hidden path = "req_process" id = "req_process" value ="${request.req_process}"/>
<form:hidden path = "req_category" id = "req_category" value ="${request.can_category}"/>
<div style = "width : 100%; height : 718px; ">
<div style = "width : 100%; height : 40px; ">
<table width = "100%" height = "100%">
	<tr>
		<td width = "10%" height = "100%" align = "center" class = "board_skin">
			TITLE 		
		</td>
		<td width = "40%" align = "center" class = "board_skin">
			${request.req_name}		
		</td>
		<td width = "13%" align = "center" class = "board_skin">
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
	
	<td width = "50%" align = "center" class = "board_skin">
	<form:select path="uploadimg" id = "uploadimg" onchange="changeFunc();" onfocus="changeFunc();"  style="width :100%; color : grey;">
				<c:choose>
					<c:when test="${request.req_category=='1'}">
						<form:option value="../upload/${request.req_img}" id = "imgselect" selected="selected">
							------------------------------업데이트 이미지 선택------------------------------
						</form:option>				
					</c:when>
					<c:when test="${request.req_category=='2'}">
						<form:option value="${request.req_img}" id = "imgselect" selected="selected">
							------------------------------업데이트 이미지 선택------------------------------
						</form:option>
					</c:when>
				</c:choose>
					
				<c:forEach  var = "canvas" items = "${list}">
					<c:choose>
						<c:when test="${canvas.can_category=='1'}">
							<form:option id = "1" value="${canvas.can_img}" style = "color : #FF00FF;"> ${canvas.can_title}　　${canvas.can_date}</form:option>						
						</c:when>
						<c:when test="${canvas.can_category=='2'}">
							<form:option id = "2" value="${canvas.can_img}" style = "color : #33CC33;"> ${canvas.can_title}　　${canvas.can_date}</form:option>
						</c:when>
					</c:choose>
				</c:forEach>
			</form:select>
	
	</td>
	
		<td width = "13%" align = "center" class = "board_skin">
			DATE
		</td>
		<td width = "37%" colspan = "2" align = "center" class = "board_skin">
			${request.req_date}
		</td>
<!-- 		<td width = "25%" align = "center" class = "board_skin"> -->
<!-- 			의뢰 진행상황 		 -->
<!-- 		</td> -->
<!-- 		<td width = "25%" align = "center" class = "board_skin"> -->
				

					
<!-- 		</td> -->
		
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
		<td align = "center" style = "height : 20px;" class = "board_skin">
			디자이너 피드백 최근 수정일 : ${request.feedback_date} 		
		</td>
	</tr>
	<tr>
		<td align = "center" style = "height : 218px;" class = "board_skin">
			${request.feedback}
		</td>
	</tr>
</table>

</div>
<div style = "float : left; width : 50%; height : 253px;">
<table width = "100%">
	<tr>
		<td align = "center" style = "height : 20px;" class = "board_skin">
			기타 요구사항 최근 수정일 : ${request.req_content_date}	
		</td>
	</tr>
	<tr>
		<td align = "center" style = "height : 218px;" class = "board_skin">
		<form:textarea path="req_content" cols="50" rows="13"/>
		</td>
	</tr>
</table>
</div>
<center>
		<input type = "button" class = "receive_list" value = "　의뢰 목록으로　" onclick = "window.location = 'req_list?pageNum=1'">
<!-- 		<input type = "button" class = "feedback" value = "　요구사항 UPDATE  " onclick = "window.location = 'req_content_update'"> -->
		<input type = "submit" class = "feedback1" value = "　요구사항 UPDATE  " >
	</center>
</div>
	

	
</form:form>
</body>
</html>
