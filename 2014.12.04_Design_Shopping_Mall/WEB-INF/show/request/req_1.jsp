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

function changeFunc() {
    var uploadimg = document.getElementById("uploadimg");
    var selectedValue = uploadimg.options[uploadimg.selectedIndex].value;

    var img = document.getElementById("img");

	if(selectedValue.length>500){
		img.innerHTML = "<img src = '"+selectedValue+"' id= 'img'  alt = '이미지 로딩 실패' width = '100%' height = '330px'>";
		$("#req_category").val("2");
	}else {
		img.innerHTML = "<img src = '../upload/"+selectedValue+"' id= 'img'  alt = '이미지 로딩 실패' width = '100%' height = '330px'>";
		$("#req_category").val("1");
	}
}
   
	function changeCategory() {
	
	   
		var selectCategory = document.getElementById("selectCategory");
		var selectedValue = selectCategory.options[selectCategory.selectedIndex].value;
		
		


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
			
			$('#dummytable').hide(0);
			$('#dummytable2').hide(0);
			$('#sizeinfotable').hide(0);
			$('#sizetable1').hide(0);
			$('#sizetable2').hide(0);
			$('#sizetable3').hide(0);
			$('#sizetable4').hide(0);
			$('#sizetablebefore').show(500);
			$('#sizeinfotable').show(500);
			$('#skin').attr("src","../resources/image/null.jpg");
			scroll_skin_load();
			
		}
	}
   
	
	function req_1_submit(){
		var selectCategory = document.getElementById("selectCategory");
		var selectedValue = selectCategory.options[selectCategory.selectedIndex].value;
		
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
			
		} else if(selectedValue==4){
			
			for(var i=0;i<18;i++){
				var to_bl = document.getElementById("to_bl"+i);
				to_bl.innerHTML = "";
			}
			
			request.submit();
			
		}
		
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
	   var t1 = document.getElementById("t1");
	   var t2 = document.getElementById("t2");
	   var t3 = document.getElementById("t3");
	   var t4 = document.getElementById("t4");
	   var t5 = document.getElementById("t5");
	   var t6 = document.getElementById("t6");
	   if(size==85){
		   t1.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'T_size(85);'>85</div>";
		   t2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(90);\">90</div>";
		   t3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(95);\">95</div>";
		   t4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(100);\">100</div>";
		   t5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(105);\">105</div>";
		   t6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(110);\">110</div>";
		   $('#T_size1').val(33.7);
		   $('#T_size2').val(75.7);
		   $('#T_size3').val(79.7);
		   $('#T_size4').val(59);
		   $('#T_size5').val(29.1);
		   $('#T_size6').val(58.4);
	   } else if(size==90){	
		   t1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(85);\">85</div>";
		   t2.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'T_size(90);'>90</div>";
		   t3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(95);\">95</div>";
		   t4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(100);\">100</div>";
		   t5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(105);\">105</div>";
		   t6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(110);\">110</div>";
		   $('#T_size1').val(35);
		   $('#T_size2').val(82);
		   $('#T_size3').val(86);
		   $('#T_size4').val(60);
		   $('#T_size5').val(31);
		   $('#T_size6').val(59);
	   } else if(size==95){
		   t1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(85);\">85</div>";
		   t2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(90);\">90</div>";
		   t3.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'T_size(95);'>95</div>";
		   t4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(100);\">100</div>";
		   t5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(105);\">105</div>";
		   t6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(110);\">110</div>";
		   $('#T_size1').val(36.3);
		   $('#T_size2').val(88.3);
		   $('#T_size3').val(92.3);
		   $('#T_size4').val(61);
		   $('#T_size5').val(32.9);
		   $('#T_size6').val(59.6);
	   } else if(size==100){
		   t1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(85);\">85</div>";
		   t2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(90);\">90</div>";
		   t3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(95);\">95</div>";
		   t4.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'T_size(100);'>100</div>";
		   t5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(105);\">105</div>";
		   t6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(110);\">110</div>";
		   $('#T_size1').val(37.6);
		   $('#T_size2').val(94.6);
		   $('#T_size3').val(98.6);
		   $('#T_size4').val(62);
		   $('#T_size5').val(34.8);
		   $('#T_size6').val(60.2);
	   } else if(size==105){
		   t1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(85);\">85</div>";
		   t2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(90);\">90</div>";
		   t3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(95);\">95</div>";
		   t4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(100);\">100</div>";
		   t5.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'T_size(105);'>105</div>";
		   t6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(110);\">110</div>";
		   $('#T_size1').val(38.9);
		   $('#T_size2').val(100.9);
		   $('#T_size3').val(104.9);
		   $('#T_size4').val(63);
		   $('#T_size5').val(36.7);
		   $('#T_size6').val(60.8);
	   } else if(size==110){
		   t1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(85);\">85</div>";
		   t2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(90);\">90</div>";
		   t3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(95);\">95</div>";
		   t4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(100);\">100</div>";
		   t5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"T_size(105);\">105</div>";
		   t6.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'T_size(110);'>110</div>";
		   $('#T_size1').val(40.2);
		   $('#T_size2').val(107.2);
		   $('#T_size3').val(111.2);
		   $('#T_size4').val(64);
		   $('#T_size5').val(38.6);
		   $('#T_size6').val(61.4);
	   }
		
   }
   
   function P_size(size){
	   var p1 = document.getElementById("p1");
	   var p2 = document.getElementById("p2");
	   var p3 = document.getElementById("p3");
	   var p4 = document.getElementById("p4");
	   var p5 = document.getElementById("p5");
	   var p6 = document.getElementById("p6");
	   if(size==28){
		   p1.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'P_size(28);'>28</div>";
		   p2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(30);\">30</div>";
		   p3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(32);\">32</div>";
		   p4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(34);\">34</div>";
		   p5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(36);\">36</div>";
		   p6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(38);\">38</div>";
		   $('#P_size1').val(74);
		   $('#P_size2').val(95);
		   $('#P_size3').val(36);
		   $('#P_size4').val(102);
		   $('#P_size5').val(350);
		   $('#P_size6').val(41);
	   } else if(size==30){
		   p1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(28);\">28</div>";
		   p2.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'P_size(30);'>30</div>";
		   p3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(32);\">32</div>";
		   p4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(34);\">34</div>";
		   p5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(36);\">36</div>";
		   p6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(38);\">38</div>";
		   $('#P_size1').val(79);
		   $('#P_size2').val(99);
		   $('#P_size3').val(37);
		   $('#P_size4').val(104);
		   $('#P_size5').val(52);
		   $('#P_size6').val(42);
	   } else if(size==32){
		   p1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(28);\">28</div>";		   
		   p2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(30);\">30</div>";
		   p3.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'P_size(32);'>32</div>";
		   p4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(34);\">34</div>";
		   p5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(36);\">36</div>";
		   p6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(38);\">38</div>";
		   $('#P_size1').val(84);
		   $('#P_size2').val(103);
		   $('#P_size3').val(38);
		   $('#P_size4').val(106);
		   $('#P_size5').val(54);
		   $('#P_size6').val(43);
	   } else if(size==34){
		   p1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(28);\">28</div>";		   
		   p2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(30);\">30</div>";
		   p3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(32);\">32</div>";
		   p4.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'P_size(34);'>34</div>";
		   p5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(36);\">36</div>";
		   p6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(38);\">38</div>";
		   $('#P_size1').val(91);
		   $('#P_size2').val(107);
		   $('#P_size3').val(39);
		   $('#P_size4').val(106);
		   $('#P_size5').val(57);
		   $('#P_size6').val(44);
	   } else if(size==36){
		   p1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(28);\">28</div>";		   
		   p2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(30);\">30</div>";
		   p3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(32);\">32</div>";
		   p4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(34);\">34</div>";
		   p5.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'P_size(36);'>36</div>";
		   p6.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(38);\">38</div>";
		   $('#P_size1').val(94);
		   $('#P_size2').val(111);
		   $('#P_size3').val(40);
		   $('#P_size4').val(107);
		   $('#P_size5').val(58);
		   $('#P_size6').val(45);
	   } else if(size==38){
		   p1.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(28);\">28</div>";		   
		   p2.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(30);\">30</div>";
		   p3.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(32);\">32</div>";
		   p4.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(34);\">34</div>";
		   p5.innerHTML = "<div class = 'board_skin2' onmouseover=\"style.background='#89E7D0'\" onmouseout=\"style.background='white'\" onClick = \"P_size(36);\">36</div>";
		   p6.innerHTML = "<div style = 'background :#FF3399; width : 100%; height : 100%; cursor:pointer;' onClick = 'P_size(38);'>38</div>";
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
<body>
<!--  onload = "$('#imgselect_none').attr('disabled','disabled');" -->
 

<form:form commandName = "request" enctype = "multipart/form-data">
<form:hidden path="req_category"/>
<table width = "99.9%" style = "border :1px solid black;">
	<tr>
		<td colspan = "4"  style = "background: #000000; color : #FFFFFF;">의뢰할 디자인 정보</td>
	</tr>
</table>
<table width = "50%"  align = "left" style = "border :1px solid black;">
	<tr>
		
		<td width = "100%">
			<form:input path = "req_name" size = "49" id ="req_name" name = "req_name"  onFocus="jsSetSub(this, 'on')" onBlur ="jsSetSub(this, 'off')" value="" style="text-align:center"/>
		</td>
	</tr>
	<tr>
		<td colspan = "2" height = "35px">
			<form:select path="uploadimg" id = "uploadimg" onchange="changeFunc();" onfocus="changeFunc();"  style="width :100%;">
				<form:option id = "imgselect_none" value="null.jpg" selected = "selected">---------------------------------첨부 이미지 선택---------------------------------</form:option>
				<c:forEach  var = "canvas" items = "${list}">
					<c:choose>
						<c:when test="${canvas.can_category=='1'}">
							<form:option value="${canvas.can_img}">CAPTURE　　 ${canvas.can_title}　　${canvas.can_date}</form:option>						
						</c:when>
						<c:when test="${canvas.can_category=='2'}">
							<form:option value="${canvas.can_img}">CANVAS　　　${canvas.can_title}　　${canvas.can_date}</form:option>
						</c:when>
					</c:choose>
				</c:forEach>
			</form:select>
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
			<select style="width :100%;" id = "selectCategory" onchange="changeCategory();" onfocus="changeCategory();" onblur="blur();">
				<option value="0">-------------------------------CATEGORY----------------------------------</option>
				<option value="1">　　　　　　　　　　　　 상의　　　　　　　　　　　　 </option>
				<option value="2">　　　　　　　　　　　 　하의　　　　　　　　　　　　 </option>
				<option value="3">　　　　　　　　 　　　악세사리　　　　　　　　　　　　 </option>
				<option value="4">　　　　　　　　　　　 　기타　　　　　　　　　　　　 </option>				
			</select>
		</td>
	</tr>
</table>
<table width = "50%" align = "left" style = "border :1px solid black;">
	<tr>
		<td colspan = "2" height = "370px">
			<div id = "img"><img src = '../resources/image/image_select.png' id= 'img' width = "310px"  alt = 	'이미지 ' style = " border : 0px solid #000000;"></div>
		</td>
	</tr>
	<tr>
		<td colspan = "2" style = "border:1px solid #000000; ">
			<form:textarea path = "req_content" id = "req_content" class = "nopdnomg2" wrap="hard" cols="51" rows="11" onFocus="jsSetCntt(this, 'on')" onBlur ="jsSetCntt(this, 'off')" value="" /><br/>
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
	<tr>
		<td class = "board_skin"  width = "30%" id = "t1">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "T_size(85);">
			85
		</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_1">어깨너비</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl0"><form:input path = "size1" style = "width :98%;" id = "T_size1"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "t2">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "T_size(90);">
			90
		</div>	
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_2">가슴너비</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl1"><form:input path = "size2" style = "width :98%;" id = "T_size2"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "t3">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "T_size(95);">
			95
		</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_3">밑단너비</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl2"><form:input path = "size3" style = "width :98%;" id = "T_size3"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "t4">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "T_size(100);">
			100
		</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_4">소매길이</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl3"><form:input path = "size4" style = "width :98%;" id = "T_size4"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "t5">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "T_size(105);">
			105
		</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_5">소매통</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl4"><form:input path = "size5" style = "width :98%;" id = "T_size5"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "t6">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "T_size(110);">
			110
		</div>
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
	<tr>
		<td class = "board_skin"  width = "30%" id = "p1">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "P_size(28);">
		28
		</div>	
		</td>
		<td class = "board_skin">
			<div id = "size_1">허리</div>
		</td>
		<td class = "board_skin">
			<div id = "to_bl6"><form:input path = "size1" style = "width :98%;" id = "P_size1"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "p2">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "P_size(30);">
			30
		</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_2">힙</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl7"><form:input path = "size2" style = "width :98%;" id = "P_size2"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "p3">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "P_size(32);">
			32
		</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_3">밑위</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl8"><form:input path = "size3" style = "width :98%;" id = "P_size3"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "p4">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "P_size(34);">
			34
		</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_4">총길이</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl9"><form:input path = "size4" style = "width :98%;" id = "P_size4"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "p5">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "P_size(36);">
			36
		</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "size_5">허벅지</div>
		</td>
		<td class = "board_skin" width = "30%">
			<div id = "to_bl10"><form:input path = "size5" style = "width :98%;" id = "P_size5"/></div>
		</td>
	</tr>
	<tr>
		<td class = "board_skin"  width = "30%" id = "p6">
		<div class = "board_skin2" onmouseover="style.background='#89E7D0'" onmouseout="style.background='white'" onClick = "P_size(38);">
			38
		</div>
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
		<td style = "height :328px;">
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
<center>
			<div style="float: left; width: 100%; height: 65px; background: #DDDDDD;">
						<input type = "button" onClick = "window.location = 'req_main?selected_designer=none'" class = "request" style = "width : 49.5%; height : 95%; font-size: 22px; font-weight: bold;" value = "디자이너 목록" />
						
<!-- 			</div> -->
<!-- 			<div style="float: left; width: 50%; height: 65px; background: #DDDDDD;"> -->
						<input type = "button" onClick = "req_1_submit();" class = "request" style = "width : 49.5%; height : 95%;font-size: 22px; font-weight: bold;" value = "의뢰하기" />
			</div>
		</center>
<!-- 	<div style = "float : left;" class = "request33"  onClick = "window.location = 'req_main?selected_designer=none'"><b style = "font-size: 22px;">디자이너 목록</b></div> -->
<!-- 	<div style = "float : left;" class = "request44"  onClick = "req_1_submit();"><b style = "font-size: 22px;">의뢰하기</b></div> -->
	
	
<!-- 	<div   class = "request5">1238109</div><br/> -->
</form:form>
</body>
</html>