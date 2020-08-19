<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<link href = "../button.css" type="text/css" rel = "stylesheet">
<link href="../jquery.mCustomScrollbar.css" rel="stylesheet">
<script src="../jquery.mCustomScrollbar.concat.min.js"></script>



<script type = "text/javascript">
window.onload=function JsSetCntt(obj, type){
	jsSetCntt(req_content, 'off');
	jsSetSub(req_name, 'off');
	$('#sizetable1').hide(0);
	$('#sizetable2').hide(0);
	$('#sizetable3').hide(0);
	$('#sizetable4').hide(0);
	$('#sizetablebefore').show(0);
	
	$('#sizeinfotable').hide(0);
	$('#dummytable').show(0);

	
	var sizeinfo = document.getElementById("scroll_skin");
	sizeinfo.innerHTML = "<img alt='' src='../resources/image/null.jpg' id = 'skin' width = '100%' style = 'height :310px;'>";
	
};


// function jsSetSub (obj, type){
// 	if(type == "on"){
// 		if(obj.value == "의뢰명"){
// 	   	obj.value = "";
// 		}
// 	} 
// 	if(type == "off"){
// 	    if(obj.value == ""){
// 	    obj.value = "의뢰명";
// 	    }
// 	}
// }
function jsSetCntt (obj, type){
	
	if(type == 'on'&&obj.value == "\n\n\n\n                 기타 요구사항을 적어주세요"){
	   	obj.value = "";
		
	}else if(type == 'off'&&obj.value == ""){
	    obj.value = "\n\n\n\n                 기타 요구사항을 적어주세요";
	}
}

function jsSetSub (obj, type){
	
	if(type == 'on'&&obj.value == "제목"){
	   	obj.value = "";
		
	}else if(type == 'off'&&obj.value == ""){
	    obj.value = "제목";
	}
}


function jsSetsize (obj, type){
	
	if       (type == 1&&obj.value == "　사이즈 1"){
	   	obj.value = "";
	}else if(type == 11&&obj.value == ""){
	    obj.value = "　사이즈 1";
	}else if(type == 2&&obj.value == "　사이즈 2"){
		obj.value = "";
	}else if(type == 22&&obj.value == ""){
	    obj.value = "　사이즈 2";
	}else if(type == 3&&obj.value == "　사이즈 3"){
		obj.value = "";
	}else if(type == 33&&obj.value == ""){
	    obj.value = "　사이즈 3";
	}else if(type == 4&&obj.value == "　사이즈 4"){
		obj.value = "";
	}else if(type == 44&&obj.value == ""){
	    obj.value = "　사이즈 4";
	}else if(type == 5&&obj.value == "　사이즈 5"){
		obj.value = "";
	}else if(type == 55&&obj.value == ""){
	    obj.value = "　사이즈 5";
	}else if(type == 6&&obj.value == "　사이즈 6"){
		obj.value = "";
	}else if(type == 66&&obj.value == ""){
	    obj.value = "　사이즈 6";
	}
		
	
}


</script>

<script type="text/javascript">

   
	function changeCategory() {
	
		var selectedValue = '${board.bod_des_category}';
		


		if(selectedValue==1){
			
			$('#sizetable2').hide(0);
			$('#sizetable3').hide(0);
			$('#sizetable4').hide(0);
			$('#dummytable').hide(0);
			$('#sizetablebefore').hide(0);
			$('#sizetable1').show(500);
			$('#sizeinfotable').show(0);
			$('#skin').attr("src","../resources/image/t_size.gif");
			scroll_skin_load();
			
		}else if(selectedValue==2){
			
			$('#sizetable1').hide(0);
			$('#sizetable3').hide(0);
			$('#sizetable4').hide(0);
			$('#dummytable').hide(0);
			$('#sizetablebefore').hide(0);
			$('#sizetable2').show(500);
			$('#sizeinfotable').show(0);
			$('#skin').attr("src","../resources/image/pants_size.png");
			scroll_skin_load();
			
		}else if(selectedValue==3){
			
			$('#sizetable1').hide(0);
			$('#sizetable2').hide(0);
			$('#sizetable4').hide(0);
			$('#sizetablebefore').hide(0);
			$('#sizetable3').show(500);
			$('#skin').attr("src","../resources/image/null2.jpg");	
			scroll_skin_load();
			
		}else if(selectedValue==4){
			
			$('#sizetable1').hide(0);
			$('#sizetable2').hide(0);
			$('#sizetable3').hide(0);
			$('#sizetablebefore').hide(0);
			$('#sizetable4').show(500);
			$('#skin').attr("src","../resources/image/null2.jpg");
			scroll_skin_load();
			
		}else if(selectedValue==0){
			
			
			$('#sizetable1').hide(0);
			$('#sizetable2').hide(0);
			$('#sizetable4').hide(0);
			$('#sizetablebefore').hide(0);
			$('#sizetable4').show(500);
			$('#skin').attr("src","../resources/image/null2.jpg");	
			scroll_skin_load();
			
			
		};
	}
   
	
	function req_1_submit(){
		
		var selectedValue = '${board.bod_des_category}';
		
		if(selectedValue==1){
			
			for(var i=6;i<24;i++){
				var to_bl = document.getElementById("to_bl"+i);
				to_bl.innerHTML = "";
			}
			
			request.submit();
			
		} else if(selectedValue==2){
			
			for(var i=0;i<6;i++){
				var to_bl = document.getElementById("to_bl"+i);
				to_bl.innerHTML = "";
			}
			for(var i=12;i<24;i++){
				var to_bl = document.getElementById("to_bl"+i);
				to_bl.innerHTML = "";
			}
			
			request.submit();
			
		} else if(selectedValue==3){
			
			for(var i=0;i<12;i++){
				var to_bl = document.getElementById("to_bl"+i);
				to_bl.innerHTML = "";
			}
			for(var i=18;i<24;i++){
				var to_bl = document.getElementById("to_bl"+i);
				to_bl.innerHTML = "";
			}
			
			request.submit();
			
		} else if(selectedValue==4||selectedValue==0){
			
			for(var i=0;i<18;i++){
				var to_bl = document.getElementById("to_bl"+i);
				to_bl.innerHTML = "";
			}
			
			request.submit();
		};
	
		
	}
   function color(obj, type){
	   if(type==1){
// 		   obj.style.background = "#FFFFFF";   
	   }else if(type==0){
// 		   obj.style.background = "#A4FFE1";
	   }
	   
   }
   
   function scroll_skin_load(){
		$("#scroll_skin").mCustomScrollbar({
			autoHideScrollbar:true,
			theme:"rounded-dots-dark"
		});
	}
   
   function T_size(size){
	   if(size==85){
		   $('#T_size1').val(33.7);
		   $('#T_size2').val(75.7);
		   $('#T_size3').val(79.7);
		   $('#T_size4').val(59);
		   $('#T_size5').val(29.1);
		   $('#T_size6').val(58.4);
	   } else if(size==90){
		   $('#T_size1').val(35);
		   $('#T_size2').val(82);
		   $('#T_size3').val(86);
		   $('#T_size4').val(60);
		   $('#T_size5').val(31);
		   $('#T_size6').val(59);
	   } else if(size==95){
		   $('#T_size1').val(36.3);
		   $('#T_size2').val(88.3);
		   $('#T_size3').val(92.3);
		   $('#T_size4').val(61);
		   $('#T_size5').val(32.9);
		   $('#T_size6').val(59.6);
	   } else if(size==100){
		   $('#T_size1').val(37.6);
		   $('#T_size2').val(94.6);
		   $('#T_size3').val(98.6);
		   $('#T_size4').val(62);
		   $('#T_size5').val(34.8);
		   $('#T_size6').val(60.2);
	   } else if(size==105){
		   $('#T_size1').val(38.9);
		   $('#T_size2').val(100.9);
		   $('#T_size3').val(104.9);
		   $('#T_size4').val(63);
		   $('#T_size5').val(36.7);
		   $('#T_size6').val(60.8);
	   } else if(size==110){
		   $('#T_size1').val(40.2);
		   $('#T_size2').val(107.2);
		   $('#T_size3').val(111.2);
		   $('#T_size4').val(64);
		   $('#T_size5').val(38.6);
		   $('#T_size6').val(61.4);
	   }
		
   }
   
   function P_size(size){
	   if(size==28){
		   $('#P_size1').val(74);
		   $('#P_size2').val(95);
		   $('#P_size3').val(36);
		   $('#P_size4').val(102);
		   $('#P_size5').val(350);
		   $('#P_size6').val(41);
	   } else if(size==30){
		   $('#P_size1').val(79);
		   $('#P_size2').val(99);
		   $('#P_size3').val(37);
		   $('#P_size4').val(104);
		   $('#P_size5').val(52);
		   $('#P_size6').val(42);
	   } else if(size==32){
		   $('#P_size1').val(84);
		   $('#P_size2').val(103);
		   $('#P_size3').val(38);
		   $('#P_size4').val(106);
		   $('#P_size5').val(54);
		   $('#P_size6').val(43);
	   } else if(size==34){
		   $('#P_size1').val(91);
		   $('#P_size2').val(107);
		   $('#P_size3').val(39);
		   $('#P_size4').val(106);
		   $('#P_size5').val(57);
		   $('#P_size6').val(44);
	   } else if(size==36){
		   $('#P_size1').val(94);
		   $('#P_size2').val(111);
		   $('#P_size3').val(40);
		   $('#P_size4').val(107);
		   $('#P_size5').val(58);
		   $('#P_size6').val(45);
	   } else if(size==38){
		   $('#P_size1').val(99);
		   $('#P_size2').val(115);
		   $('#P_size3').val(41);
		   $('#P_size4').val(107);
		   $('#P_size5').val(59);
		   $('#P_size6').val(46);
	   }
		
   }

  </script>
 <style>
 	td{
 		text-align: center;
 	}
 </style>
</head>
<body onload="changeCategory();">
<form:form commandName = "request" enctype = "multipart/form-data">
<form:hidden path="req_price" value = "${board.bod_price}"/>
<table width = "99.9%" style = "border :1px solid black;">
	<tr>
		<td colspan = "4"  style = "background: #000000; color : #FFFFFF;">의뢰할 디자인 정보</td>
	</tr>
</table>
<table width = "50%"  align = "left" style = "border :1px solid black;">
	<tr>
		
		<td width = "100%" style = "height : 100%;">
			<form:input path = "req_name" size = "49" id ="req_name" name = "req_name"  onFocus="jsSetSub(this, 'on')" onBlur ="jsSetSub(this, 'off')" value="" style="text-align:center"/>
		</td>
	</tr>
	<tr>
		<td colspan = "2" height = "35px">
		<form:hidden path="uploadimg" id  = "uploadimg" value = "${board.bod_img}"/>
		</td>
	</tr>
</table>
<table width = "50%" align = "left" style = "border :1px solid black;">
	<tr>
		<td class = "board_skin" style = "height : 27px; width : 50%">
			의뢰 디자이너
		</td>
		<td class = "board_skin" style = "height : 27px; width : 50%;">
			${request.req_receiver}
		</td>
	</tr>
	<tr>	
		<td colspan = "2" style = "height :29px;">
		
		</td>
	</tr>
</table>
<table width = "50%" align = "left" style = "border :1px solid black;">
	<tr>
		<td colspan = "2" height = "380px">
			<div id = "img">
<%-- 			<img src = '../upload/${board.bod_img}' id= 'img' width = "310px"  alt = 	'이미지 ' style = " border : 0px solid #000000;"> --%>
				<c:choose>
					<c:when test="${board.bod_img_category == '1'||board.bod_img_category == '3' }">
					<img src="../upload/${board.bod_img}" style="width: 310px;" alt="X">
					<form:hidden path="req_category" value = "1"/>
					</c:when>
					<c:when test="${board.bod_img_category == '2'}">
					<img src="${board.bod_img}" style="width: 310px;" alt="X">
					<form:hidden path="req_category" value = "2"/>
					</c:when>
				</c:choose>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan = "2" style = "border:1px solid #000000; ">
			<form:textarea path = "req_content" id = "req_content"  class = "nopdnomg2" rows = "11" style = "width : 100%;" wrap="hard"  onFocus="jsSetCntt(this, 'on')" onBlur ="jsSetCntt(this, 'off')" value="" /><br/>
		</td>
	</tr>
</table>
<table width = "50%" style = "border :1px solid black;" align = "left" id = "sizetablebefore">
	<tr>
		<td height = "205px" style = "vertical-align: middle;">
			<img alt='' src='../resources/image/category_select.png' width = '80%' style = "height :150px;">
		</td>
	</tr>
</table>
<table width = "50%" style = "height :213px; border :1px solid black;" align = "left" id = "sizetable1" >
	<tr>
		<td class = "board_skin" style = "background: black;" width = "30%" >
			<b style = "color : white;">사이즈 선택</b>
		</td>
		<td colspan = "2" class = "board_skin" style = "background: black;" width = "30%">
		 	<b style = "color : white;">상세 사이즈 조정</b>
		</td>
	</tr>
	<tr id = "t1">
		<td class = "board_skin" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "T_size(85);">
			85
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_1">어깨너비</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl0"><form:input path = "size1" style = "width :98%;" id = "T_size1"/></div>
		</td>
	</tr>
	<tr id = "t2">
		<td class = "board_skin" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "T_size(90);">
			90
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_2">가슴너비</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl1"><form:input path = "size2" style = "width :98%;" id = "T_size2"/></div>
		</td>
	</tr>
	<tr id = "t3">
		<td class = "board_skin" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "T_size(95);">
			95
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_3">밑단너비</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl2"><form:input path = "size3" style = "width :98%;" id = "T_size3"/></div>
		</td>
	</tr>
	<tr id = "t4">
		<td class = "board_skin" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "T_size(100);">
			100
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_4">소매길이</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl3"><form:input path = "size4" style = "width :98%;" id = "T_size4"/></div>
		</td>
	</tr>
	<tr id = "t5">
		<td class = "board_skin" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "T_size(105);">
			105
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_5">소매통</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl4"><form:input path = "size5" style = "width :98%;" id = "T_size5"/></div>
		</td>
	</tr>
	<tr id = "t6">
		<td class = "board_skin" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "T_size(110);">
			110
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_6">총기장</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl5"><form:input path = "size6" style = "width :98%;" id = "T_size6"/></div>
		</td>
	</tr>
</table>
<table width = "50%" style = "height :213px; border :1px solid black;" align = "left" id = "sizetable2" >
	<tr>
		<td class = "board_skin" style = "background: black;" width = "30%" >
			<b style = "color : white;">사이즈 선택</b>
		</td>
		<td colspan = "2" class = "board_skin" style = "background: black;" width = "30%">
		 	<b style = "color : white;">상세 사이즈 조정</b>
		</td>
	</tr>
	<tr id = "t1">
		<td class = "board_skin"  onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "P_size(28);">
			28
		</td>
		<td class = "board_skin">
			<div id = "size_1">허리</div>
		</td>
		<td class = "board_skin">
			<div id = "to_bl6"><form:input path = "size1" style = "width :98%;" id = "P_size1"/></div>
		</td>
	</tr>
	<tr id = "t2">
		<td class = "board_skin" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "P_size(30);">
			30
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_2">힙</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl7"><form:input path = "size2" style = "width :98%;" id = "P_size2"/></div>
		</td>
	</tr>
	<tr id = "t3">
		<td class = "board_skin"  onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "P_size(32);">
			32
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_3">밑위</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl8"><form:input path = "size3" style = "width :98%;" id = "P_size3"/></div>
		</td>
	</tr>
	<tr id = "t4">
		<td class = "board_skin" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "P_size(34);">
			34
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_4">총길이</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl9"><form:input path = "size4" style = "width :98%;" id = "P_size4"/></div>
		</td>
	</tr>
	<tr id = "t5">
		<td class = "board_skin"  onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "P_size(36);">
			36
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_5">허벅지</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl10"><form:input path = "size5" style = "width :98%;" id = "P_size5"/></div>
		</td>
	</tr>
	<tr id = "t6">
		<td class = "board_skin"  onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" style = "cursor:pointer;" width = "30%" onClick = "P_size(38);">
			38
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_6">밑단</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl11"><form:input path = "size6" style = "width :98%;" id = "P_size6"/></div>
		</td>
	</tr>
</table>
<table width = "50%" style = "height :213px; border :1px solid black;" align = "left" id = "sizetable3" >
	
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 1)' onBlur ='jsSetsize(this, 11)' value = '　사이즈 1' name = 'custom_size_1'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl12"><form:input path = "size1" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 2)' onBlur ='jsSetsize(this, 22)' value = '　사이즈 2' name = 'custom_size_2'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl13"><form:input path = "size2" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 3)' onBlur ='jsSetsize(this, 33)' value = '　사이즈 3' name = 'custom_size_3'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl14"><form:input path = "size3" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 4)' onBlur ='jsSetsize(this, 44)' value = '　사이즈 4' name = 'custom_size_4'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl15"><form:input path = "size4" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 5)' onBlur ='jsSetsize(this, 55)' value = '　사이즈 5' name = 'custom_size_5'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl16"><form:input path = "size5" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 6)' onBlur ='jsSetsize(this, 66)' value = '　사이즈 6' name = 'custom_size_6'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl17"><form:input path = "size6" style = "width :98%;"/></div>
		</td>
	</tr>
</table>
<table width = "50%" style = "height :213px; border :1px solid black;" align = "left" id = "sizetable4" >
	
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 1)' onBlur ='jsSetsize(this, 11)' value = '　사이즈 1' name = 'custom_size_1'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl18"><form:input path = "size1" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 2)' onBlur ='jsSetsize(this, 22)' value = '　사이즈 2' name = 'custom_size_2'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl19"><form:input path = "size2" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 3)' onBlur ='jsSetsize(this, 33)' value = '　사이즈 3' name = 'custom_size_3'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl20"><form:input path = "size3" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 4)' onBlur ='jsSetsize(this, 44)' value = '　사이즈 4' name = 'custom_size_4'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl21"><form:input path = "size4" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 5)' onBlur ='jsSetsize(this, 55)' value = '　사이즈 5' name = 'custom_size_5'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl22"><form:input path = "size5" style = "width :98%;"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin">
			<input type = 'text' style = 'width : 80%; background : #FFFFFF;' onFocus='jsSetsize(this, 6)' onBlur ='jsSetsize(this, 66)' value = '　사이즈 6' name = 'custom_size_6'>
		</td>
		<td class = "board_skin">
			<div id = "to_bl23"><form:input path = "size6" style = "width :98%;"/></div>
		</td>
	</tr>
</table>
<table style = "border :1px solid black;" width ="50%" id = "sizeinfotable" >
	<tr>
		<td style = "height :338px;">
			<div id = "scroll_skin" class = "scroll_skin2" >
				<img alt='' src='../resources/image/null.jpg' id = 'skin' width = '100%' style = "height :325px;">
			</div>
		</td>
	</tr>
</table>
<table style = "border :1px solid black;" width ="50%"  id = "dummytable">
	<tr>
		<td style = "height :328px;">
<!-- 			<img alt='' src='../resources/image/null.jpg' id = 'skin' width = '100%'> -->
		</td>
	</tr>
</table>

<%-- 	<div style = "float : left;" class = "request33"  onClick = "window.location = 'req_mainD?selected_designer=${request.req_receiver}&bod_num=${board.bod_num}'"><b style = "font-size: 22px;">디자이너 확인</b></div> --%>
<!-- 	<div style = "float : left;" class = "request44"  onClick = "req_1_submit();"><b style = "font-size: 22px;">의뢰하기</b></div> -->
		<center>
			<div style="float: left; width: 100%; height: 65px; background: ;">
						<input type = "button" onClick = "window.location = 'req_mainD?selected_designer=${request.req_receiver}&bod_num=${board.bod_num}'" class = "request" style = "width : 14.5%; height : 95%; font-size: 26px; font-weight: bold;" value = "◁" />
						
<!-- 			</div> -->
<!-- 			<div style="float: left; width: 50%; height: 65px; background: #DDDDDD;"> -->
						<input type = "button" onClick = "req_1_submit();" class = "request" style = "width : 84.5%; height : 95%;font-size: 22px; font-weight: bold;" value = "의뢰하기" />
			</div>
		</center>
	
</form:form>
</body>
</html>