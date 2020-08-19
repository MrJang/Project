	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addArticleForm.jsp</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script type = "text/javascript">
function body_onload(){
// 	jsSetSub(bod_title, 'off');
	jsSetCntt(bod_content, 'off');
	$('#uploadfile').hide(0);
	$('#bod_img2').hide(0);
	$('#bod_img3').hide(0);
	
}
function reset(){
	
// 	$('#bod_title').val("　　　　　　　　　　　　　　　　　　　　　　제목");
// 	$('#bod_content').val("\n\n\n\n\n\n\n\n\n\n\n\n　　　　　　　　　　　　　　　　　　　　　　내용");
	$('#bod_title').val("");
	$('#bod_content').val("");
// 	jsSetSub(bod_title, 'on');
// 	jsSetCntt(bod_content, 'on');
	
}

function board1_submit(){
	var category = document.getElementById("bod_des_category");
	var selectedValue = category.options[category.selectedIndex].value;
	if(selectedValue==0){
		alert("의상 종류를 선택해 주세요.");
	}else{
		if($("#bod_img_category").val()==1){
			var file2 = document.getElementById("file2");
			var file3 = document.getElementById("file3");
			file2.innerHTML = "";
			file3.innerHTML = "";
			
		}else if($("#bod_img_category").val()==2){
			var file1 = document.getElementById("file1");
			var file3 = document.getElementById("file3");
			file1.innerHTML = "";
			file3.innerHTML = "";
			
		}else if($("#bod_img_category").val()==3){
			var file1 = document.getElementById("file1");
			var file2 = document.getElementById("file2");
			file1.innerHTML = "";
			file2.innerHTML = "";
		}
		
		
		board.submit();
	}
	
}
// function jsSetSub (obj, type){
// 	if(type == 'on'&&obj.value=="　　　　　　　제목"){
// 		obj.value = "";
// 	}else if(type == 'off'&&obj.value==""){
// 	    obj.value = "　　　　　　　제목";
// 	}
	
// }
function jsSetCntt (obj, type){
	if(type == 'on'&&obj.value=="\n\n\n\n\n\n\n\n\n\n\n\n　　　　　　　　　　　　　　　　　　　　　　내용"){
		obj.value = "";
	}else if(type == 'off'&&obj.value==""){
	    obj.value = "\n\n\n\n\n\n\n\n\n\n\n\n　　　　　　　　　　　　　　　　　　　　　　내용";
	}
}

function changeFunc(event) {
	
	
		
		var input = event.target;

	    var reader = new FileReader();
	    reader.onload = function(){
	      var dataURL = reader.result;
	      var img = document.getElementById('img');
	      img.innerHTML = "<img src = '"+dataURL+"' id= 'img' alt = '이미지 로딩 실패' width = '300px' height = '200px'>";
	    };

	    reader.readAsDataURL(input.files[0]);
	    
}

function changeFunc1(event) {
	
	if(event == 1){
		
		var bod_img2 = document.getElementById("bod_img2");
	    var selectedValue = bod_img2.options[bod_img2.selectedIndex].value;

	    var img = document.getElementById("img");
	    
	    if(selectedValue=='--'){
	    }else{
	    	img.innerHTML = "<img src = '"+selectedValue+"'  id= 'img' alt = '이미지 로딩 실패' width = '100%' height = '330px'>";
	    	$("#req_category").val("2");	
	    }	
		
	}else if (event == 2){
		var bod_img3 = document.getElementById("bod_img3");
	    var selectedValue = bod_img3.options[bod_img3.selectedIndex].value;

	    var img = document.getElementById("img");
	    
	    if(selectedValue=='--'){
	    }else{
	    	img.innerHTML = "<img src = '../upload/"+selectedValue+"'  id= 'img' alt = '이미지 로딩 실패' width = '100%' height = '330px'>";
    		$("#req_category").val("1");	
	    }
		
	}
		
}



function changeFunc2(i) {
	var how_upload = document.getElementById("how_upload");
	how_upload.innerHTML = "<div class = 'board__button2' style = 'width :32.8%; height :100%; float : left; border : 1px solid black; cursor : pointer' onClick = 'changeFunc2(1);'>CANVAS 이미지</div><div class = 'board__button2' style = 'width :32.8%; height :100%; float : left; border : 1px solid black; cursor : pointer' onClick = 'changeFunc2(2);'>CAPTURE 이미지</div><div class = 'board__button2' style = 'width :32.8%; height :100%; float : left; border : 1px solid black; cursor : pointer' onClick = 'changeFunc2(3);'>직접 업로드</div>";
	if(i==1){
		$('#bod_img2').show(500);
		$('#bod_img3').hide(0);
		$('#uploadfile').hide(0);
		$('#bod_img_category').val(2);
	}else if(i==2){
		$('#bod_img2').hide(0);
		$('#bod_img3').show(500);
		$('#uploadfile').hide(0);
		$('#bod_img_category').val(3);
	}else if(i==3){
		$('#bod_img2').hide(0);
		$('#bod_img3').hide(0);
		$('#uploadfile').show(500);
		$('#bod_img_category').val(1);
		
	}
	
	
	
	
	
}



</script>
</head>


<body onload ="body_onload();$('#bod_des_category').val('0');">
<div style="width: 797px; vertical-align: top; height: 50px; float: left;">
	<table align="center" style="vertical-align: top; width: 697px; height: 100%; margin-right: 150px;" border="0">
		<tr style="vertical-align: top;">
			<td align = "center" colspan="6" class="b0px" height="10px">
				<h2>디자이너 보드</h2>
			</td>
		</tr>
	</table>
</div>
<center>
<div style="width: 797px; vertical-align: top; height: 500px; float: left;">
	<table align = "center" style="vertical-align: top; width: 697px; height: 100%; margin-right: 150px;" border="0">
		<tr>
			<td width = "100%"  class = "b0px">
				<form:form commandName = "board" enctype = "multipart/form-data">
					<form:hidden path = "bod_img_category" value = "" />
					<form:input path = "mem_id" value = "${member.mem_id}" type = "hidden"/>
				<div style = "width : 100%;">
					
					<div style = " width : 48%; height : 100%; float : left; background: ; border : 0px solid black;">
<%-- 					<center> --%>
<%-- 					<form:input path = "bod_title" id = "bod_title" size = "35" /> --%>
						제목 : 
<%-- 					<form:input path = "bod_title" id = "bod_title" size = "25" onFocus="jsSetSub(this, 'on')" onBlur="jsSetSub(this, 'off')" value = "　　　　　　　　　　　제목"/> --%>
					<form:input path = "bod_title" size = "25"  />
<%-- 					</center> --%>
					</div>
					<div style = " width : 32%; height : 100%; float : left; background: ; border : 0px solid black;" >
						예상 가격 : <form:input path = "bod_price" size = "10" />
					</div>
					<div style = " width : 20%; height : 100%; float : left; background: ; border : 0px solid black;">
						<div style = "float :right;">
						<select name = "bod_des_category" id = "bod_des_category">
	  						<option disabled="disabled" value = "0" >
	  							의상 종류 선택
	  						</option>
	  						<option value="1" selected="selected">
	  							상의
	  						</option>
	  						<option value="2">
	  							하의
	  						</option>
	  						<option value="3">
	  							악세사리
	  						</option>
	  						<option value="4">
	  							기타
	  						</option>
	  					</select>
	  					</div>
					</div>
					
				</div>
	  				

	  				
	  				<br/>
	  				<center>	
					<form:textarea path = "bod_content" id = "bod_content" wrap="hard"  style = "width : 99%;" rows="25" onFocus="jsSetCntt(this, 'on')" onBlur ="jsSetCntt(this, 'off')" value="내용"/><br/>
 					
 					
					<div id = "img" style = "border : 1px solid black; width : 99.5%;"></div>
<!-- 					<div id = "imm2"><div id = "img2" style = "border : 1px solid black; width : 99.5%;"></div></div> -->
<!-- 					<div id = "imm3"><div id = "img3" style = "border : 1px solid black; width : 99.5%;"></div></div> -->
					
 					<div style = "background: #EEEEEE; width : 100%;">
 					
 					
 					<div style = "width :20%; float : left; border : 1px solid black;">
<!--  						<span style = "float : left; text-align:left;"> -->
 							<input type = "button" value = "목록으로" class = "board_submit_button0" onClick = "window.location = 'board1?pageNum=${pageNum}'"/>
 <!--  							<input type = "button" value = "리셋" onClick = "reset();" class = "board_submit_button0"/>	 -->
<!--  						</span> -->
 					</div>
 					
 				
 					
 					<div style = "width :59%; float : left; border : 1px solid black;">	
 					
 						<div id = "how_upload">
 							<div class = "board__button" style = "width :32.8%; height :100%; float : left; border : 1px solid black; cursor : pointer" onClick = "changeFunc2(1);">
 								CANVAS 이미지
 							</div>
 							<div class = "board__button" style = "width :32.8%; height :100%; float : left; border : 1px solid black; cursor : pointer" onClick = "changeFunc2(2);">
 								CAPTURE 이미지
 							</div>
 							<div class = "board__button" style = "width :32.8%; height :100%; float : left; border : 1px solid black; cursor : pointer" onClick = "changeFunc2(3);">
 								직접 업로드
 							</div>
 						</div>
 					
						<div id = "file1">
 							<form:input path = "uploadfile" type = "file" cols = "30" class = "uploadfile"  onChange="changeFunc(event)" onfocus="changeFunc(event);"/>
 						</div>
 						
 						<div id = "file2">
 							<form:select path="bod_img2" onchange="changeFunc1(1);" onfocus="changeFunc1(1);"  style="width :100%;color:white;" class = "uploadfile">
							<form:option id = "imgselect_none" value="--" selected = "selected">-------------CANVAS 이미지 선택------------</form:option>
							<c:forEach  var = "canvas" items = "${list1}">
							<form:option value="${canvas.can_img}">　 ${canvas.can_title}　　${canvas.can_date}</form:option>						
							</c:forEach>
							</form:select>
						</div>
						
						<div id = "file3">
							<form:select path="bod_img3" onchange="changeFunc1(2);" onfocus="changeFunc1(2);"  style="width :100%;color:white;" class = "uploadfile">
							<form:option id = "imgselect_none" value="--" selected = "selected">------------CAPTURE 이미지 선택------------</form:option>
							<c:forEach  var = "canvas" items = "${list2}">
							<form:option value="${canvas.can_img}">　 ${canvas.can_title}　　${canvas.can_date}</form:option>						
							</c:forEach>
							</form:select>
						</div>
					
 					</div>
 					
 					<div style = "width :20%; float : left; border : 1px solid black;">
<!--  						<span style = "float : left; text-align:right;"> -->
							<input type = "button" value = "등록" class = "board_submit_button" onClick = "board1_submit();"/>
<!-- 						</span> -->
 					</div>
 					
					</div>
					<br/>
					</center>
				</form:form>
			</td>
		</tr>				
	</table>
</div>	
</center>
</body>
</html>