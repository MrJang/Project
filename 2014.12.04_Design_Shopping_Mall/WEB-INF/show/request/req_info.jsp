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
	function request_check(){
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
// 				var r = confirm("�Ƿڸ� �����Ͻðڽ��ϱ�?");
// 				if(r==true){
// 					request.submit();
// 				}
				
				
// 			}else if(c=="2"){
// 				var r = confirm("�Ƿڸ� �����Ͻðڽ��ϱ�?");
// 				if(r==true){
// 					request.submit();
// 				}
				
// 			}
				
// 		}else if(i==3){
// 			var b = document.getElementById("req_p");
// 			var c=  b.options[b.selectedIndex].value;
// 			 if(c=="4"){
// 				var r = confirm("���� ���� �� �Ա��� �Ϸ�Ǹ� ������ �����Ͻø� �˴ϴ�.");
// 				if(r==true){
// 					request.submit();
// 				}
			
// 		}else if (i==5){
// 			var b = document.getElementById("req_p");
// 			var c=  b.options[b.selectedIndex].value;
// 			 if(c=="6"){
// 				var r = confirm("������ �����մϴ�.");
// 				if(r==true){
// 					request.submit();
// 				}
// 		}
			
			
			
// 		}else if(i==6){
			
// 			var b = document.getElementById("req_p");
// 			var c=  b.options[b.selectedIndex].value;
// 			if(c=="7"){
// 				var r = confirm("������ �Ϸ�Ǿ����ϱ�?");
// 				if(r==true){
// 					request.submit();
// 				}
			
			
// 		}else if(i==7){
// 			var b = document.getElementById("req_p");
// 			var c=  b.options[b.selectedIndex].value;
// 			if(c=="8"){
// 				var r = confirm("��ǰ�� ����ϼ̽��ϱ�?");
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
<body onload="request_check();">
<form:form commandName = "request">
<form:hidden path = "req_img" id = "req_img" value ="${request.req_img}"/>
<form:hidden path = "req_num" id = "req_num" value ="${request.req_num}"/>
<form:hidden path = "req_category" id = "req_category" value ="${canvas.can_category}"/>
<div style = "width : 100%; height : 718px; ">
<div style = "width : 100%; height : 40px; ">
<table  width = "100%">
	<tr>
		<td width = "10%" class = "board_skin" style = "height : 30px;">
			TITLE 		
		</td>
		<td width = "40%" class = "board_skin" style = "height : 30px;">
			${request.req_name}		
		</td>
		<td width = "10%" class = "board_skin" style = "height : 30px;">
			CLIENT 		
		</td>
		<td width = "40%" class = "board_skin" style = "height : 30px;">
			 ${request.req_sender}		
		</td>
	</tr>
</table>

</div>
<div style = "float : left; width : 100%; height : 40px; ">
<table  width = "100%">
	
	<tr>
		<td width = "50%" class = "board_skin">			
			<form:select path="uploadimg" id = "uploadimg" onchange="changeFunc();" onfocus="changeFunc();"  style="width :100%;">
				<c:choose>
					<c:when test="${request.req_category=='1'}">
						<form:option value="../upload/${request.req_img}" id = "imgselect" selected="selected">
							------------------------------������Ʈ �̹��� ����------------------------------
						</form:option>				
					</c:when>
					<c:when test="${request.req_category=='2'}">
						<form:option value="${request.req_img}" id = "imgselect" selected="selected">
							------------------------------������Ʈ �̹��� ����------------------------------
						</form:option>
					</c:when>
				</c:choose>
					
				<c:forEach  var = "canvas" items = "${list}">
					<c:choose>
						<c:when test="${canvas.can_category=='1'}">
							<form:option id = "1" value="${canvas.can_img}" style = "color : #FF00FF;"> ${canvas.can_title}����${canvas.can_date}</form:option>						
						</c:when>
						<c:when test="${canvas.can_category=='2'}">
							<form:option id = "2" value="${canvas.can_img}" style = "color : #33CC33;"> ${canvas.can_title}����${canvas.can_date}</form:option>
						</c:when>
					</c:choose>
				</c:forEach>
			</form:select>
		</td>
		<td class = "board_skin" width = "10%" style = "height : 30px;">
			DATE
		</td>
		<td class = "board_skin" width = "40%" style = "height : 30px;">
			${request.req_date}
		</td>
	</tr>
</table>
</div>


<div style = "float : left; width : 50%; height : 330px; ">
<table width = "100%">
	<tr>
		<td class = "board_skin">
			<c:choose>
				<c:when test="${request.req_category==1}">
					<img src = '../upload/${request.req_img}' id = "img" alt='�̹��� �ε� ����' width='100%' height = '330px'>				
				</c:when>
				<c:when test="${request.req_category==2}">
					<img src = '${request.req_img}' id = "img" alt='�̹��� �ε� ����' width = '100%' height = '330px'>				
				</c:when>
			</c:choose>
		</td>
	</tr>
</table>
</div>
<div style = "float : left; width : 50%; height : 340px;">
	<table width = "100%" height = "340px">
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
		<tr>
		<td class = "board_skin" width = "50%"  style = " height : 30px;">
			PROCESS 		
		</td>
		<td class = "board_skin" width = "50%"  style = " height : 30px;">
			<c:choose>
				<c:when test="${request.req_process==1}">
					<form:select path = "req_process"  style = " width :100%;" onchange="changeFunc2();" onfocus="changeFunc2();" id = "req_p">
						<option id = "1" value = "1" selected="selected" disabled="disabled">-----------  �Ƿ� ���  -----------</option>
						<option id = "3" value = "3" style = "color : #29A329;">��---------  �Ƿ� ����  ----------��</option>
						<option id = "2" value = "2" style = "color : #FF0000;">��---------  �Ƿ� ����  ----------��</option>
					</form:select>
<!-- 					<input type = "button" value = "Ȯ��" onClick = "process_submit(1);"> -->
				</c:when>
				<c:when test="${request.req_process==2}">
					<form:select path = "req_process" style = "width :100%;" id = "req_p">
						<option id = "2" value = "2" selected="selected" disabled="disabled" style = "color : #FF0000;">��---------  �Ƿ� ����  ----------��</option>
						<option id = "3" value = "3" style = "color : #29A329;">��---------  �Ƿ� ����  ----------��</option>
					</form:select>
<!-- 					<input type = "button" value = "Ȯ��" onClick = "process_submit(2);"> -->
				</c:when>
				<c:when test="${request.req_process==3}">
					<form:select path = "req_process" style = " width :100%;" id = "req_p">
						<option id = "3" value = "3" style = "color : black;" disabled="disabled">��---------  �Ƿ� ����  ----------��</option>
						<option id = "4" value = "4">��-����Ȯ�� �� �Աݿ�û -��</option>
					</form:select>
<!-- 					<input type = "button" value = "Ȯ��" onClick = "process_submit(3);"> -->
				</c:when>
				<c:when test="${request.req_process==4}">
					����Ȯ�� �� �Աݴ����
				</c:when>
				<c:when test="${request.req_process==5}">
					<form:select path = "req_process" style = "width :70%;" id = "req_p">
						<option id = "5" value = "5" disabled="disabled">--------�ԱݿϷ�--------</option>
						<option id = "7" value = "7">--------������--------</option>
					</form:select>
<!-- 					<input type = "button" value = "Ȯ��" onClick = "process_submit(5);">		 -->
				</c:when>
				<c:when test="${request.req_process==6}">
					<form:select path = "req_process" style = "width :70%;" id = "req_p">
						<option id = "6" value = "6" disabled="disabled">--------������--------</option>
						<option id = "7" value = "7">--------���ۿϷ�--------</option>
					</form:select>
<!-- 					<input type = "button" value = "Ȯ��" onClick = "process_submit(6);">		 -->
				</c:when>
				<c:when test="${request.req_process==7}">
					<form:select path = "req_process" style = "width :70%;" id = "req_p">
						<option id = "7" value = "7">--------������--------</option>
<!-- 						<option id = "7" value = "7" disabled="disabled">--------���ۿϷ�--------</option> -->
						<option id = "8" value = "8">--------��ǰ�߼�--------</option>
					</form:select>
<!-- 					<input type = "button" value = "Ȯ��" onClick = "process_submit(7);"> -->
				</c:when>
				<c:when test="${request.req_process==8}">
					����Ȯ����
				</c:when>
				<c:when test="${request.req_process==10}">
					�ŷ��Ϸ�
<!-- 					<input type = "button" style = "width : 30px;" value = "X" onClick = "req_del();"> -->
				
				</c:when>
				<c:otherwise>
<%-- 					<form:select path = "req_process" style = "width :70%;"> --%>
<!-- 						<option id = "1" value = "1">--------�Ƿ�Ȯ��--------</option> -->
<!-- 						<option id = "3" value = "3">--------�Ƿڼ���--------</option> -->
<!-- 						<option id = "2" value = "2">--------�Ƿڰ���--------</option> -->
<!-- 						<option id = "4" value = "4">---------������---------</option> -->
<!-- 						<option id = "5" value = "5">--------���ۿϷ�--------</option> -->
<!-- 						<option id = "7" value = "7">--------��ǰ�߼�--------</option> -->
<%-- 					</form:select> --%>
					
				</c:otherwise>			
			</c:choose>

					
		</td>
	</tr>
	</table>
</div>
<div style = "float : left; width : 50%; height : 253px;">
<table width = "100%">
	<tr>
		<td class = "board_skin" style = "height : 20px;">
			�䱸���ס����������������� ${request.req_content_date} 		
		</td>
	</tr>
	<tr>
		<td class = "board_skin" style = "height : 218px;">
			${request.req_content}
		</td>
	</tr>
</table>
</div>
<div style = "float : left; width : 50%; height : 253px;">
<table width = "100%">
	<tr>
		<td class = "board_skin" style = "height : 20px;">
			FEEDBACK��������������${request.feedback_date} 		
		</td>
	</tr>
	<tr>
		<td class = "board_skin" style = "height : 218px;">
			<form:textarea path="feedback" cols="50" rows="13"/>
		</td>
	</tr>
</table>
</div>
<center>
	<div style = "float :left;">
		<input type = "button" class = "receive_list" value = "�����Ƿ� �������" onclick = "window.location = 'req_receive?pageNum=1'">
	</div>
	<div style = "float :left;">
		<input type = "submit" class = "feedback" value = "�����Ȳ ������Ʈ" >
	</div>
		
	</center>
</div>
	
</form:form>
</body>
</html>
