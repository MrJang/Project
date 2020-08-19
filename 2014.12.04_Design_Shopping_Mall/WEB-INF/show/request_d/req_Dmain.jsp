<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>design_req</title>
<!--순서 ㅆㅂ.. -->
<!-- ../../../../../ -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link href="../style.css" rel="stylesheet">
<link href="../stylee.css" rel="stylesheet">
<link href="../button.css" rel="stylesheet">
<link href="../jquery.mCustomScrollbar.css" rel="stylesheet">
<script src="../jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">

window.onload=function(){
	if("${member.mem_id}"){
		}else{
		window.close();
		}
	
};
window.onunload=function(){
	if("${member.mem_id}"){
		}else{
		window.close();
		}
};

	function aam(){
			window.opener.location='d_shop?des_num=${des_num}';
		
	}

   function changeFunc() {
    var selectBox = document.getElementById("selectBox");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    var receiver_view = document.getElementById("receiver_view");
    receiver_view.innerHTML = selectedValue;
    $("#receiver").val(selectedValue);
//     alert(selectedValue);
    var selectedValue2 = selectedValue;
//     selectedValue = '../profile/'+selectedValue+'.jpg';

	
//     $("#img").attr("src",selectedValue);
    
    window.location = 'req_main?selected_designer='+selectedValue2;
    
//     $('#none').attr('selected',selected);
    $('#none').focus();
    

   }
   
//    function scroll_skin_load(){
// 		$("#scroll_skin").mCustomScrollbar({
// 			autoHideScrollbar:true,
// 			theme:"rounded-dots"
// 		});
// 	}
   
//    function aa(){
// 	   var selectBox = document.getElementById("selectBox");
// 	    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
// 	    var receiver_view = document.getElementById("receiver_view");
// 	    receiver_view.innerHTML = selectedValue;
	   
//    }
  
</script>
<style>
td {
	text-align: center;
}
</style>
</head>
<body onload="scroll_skin_load();">
	<form:form commandName="request">
		<table width="100%">
			<tr>
				<td colspan="3" style="background: #000000; color: #FFFFFF;">
					<center>디자이너 정보</center>
				</td>
			</tr>
			<tr>
				<td width="50%">
					<form:hidden path="req_receiver" value="${param.selected_designer}" id="receiver" />
					<div id="receiver_view" style="font-size: 15px; width : 99%; height: 20px; border: 3px solid #000000;">
						<c:choose>
							<c:when test="${param.selected_designer=='none'}">
								디자이너 이름
							</c:when>
							<c:otherwise>
								${param.selected_designer}
							</c:otherwise>
						</c:choose>
					</div>
				</td>
				<td class = "board_skin" width="15%">
					최소가격
				</td>
				<td class = "board_skin" width="35%">
					${board.bod_price}
				</td>
			</tr>
		</table>
		<table width="100%" style="height: 600px;">
			<tr>
				<td colspan="2" width="300px" style="border: 3px solid #000000;">
					<div id="scroll_skin" class="scroll_skin" style = "height :400px;">
						<img src='../profile/${param.selected_designer}.jpg' id='img' alt='디자이너 사진' width='100%'></img>
					</div>
				</td>
				<td width="50%" class="b1px">
				<input type = "hidden" value = "${board.bod_num}" id = "bod_num">
				<input type = "hidden" value = "${board.bod_img}" id = "bod_img">
					<c:choose>
						<c:when test="${board.bod_img_category == '1'||board.bod_img_category == '3' }">
						<img src="../upload/${board.bod_img}" style="width: 300px;" alt="X">
						</c:when>
						<c:when test="${board.bod_img_category == '2'}">
						<img src="${board.bod_img}" style="width: 300px;" alt="X">
						</c:when>
					</c:choose>
<%-- 				<img src = "../upload/${bod_img}" alt = "이미지 로딩중" width="300px" > --%>
				
				</td>
			</tr>
			<tr>
				<td colspan="3" style="height: 100%;">
					<div style="background: #CCCCCC; height: 100%; width: 50%; float: left;">
						<table width="100%" style="height: 30%;">
							<tr>
								<td width="50%" style="background: black;"> 
									<b style="color: white;">디자이너 소개</b>
								</td>
								<td width="50%" onClick="aam();" onmouseout="style.background='black'" onmouseover="style.background='white'" style="background: black; cursor : pointer;">
									<b onmouseout="style.color='white'" onmouseover="style.color='black'" style="color: white;">디자이너 샵 방문</b>
								</td>
							</tr>
						</table>
						<table width="100%" style="height: 70%;">
							<tr>
								<td class = "b1px" colspan="2">
									${des_introduce}
								</td>
							</tr>
						</table>
					</div>
					<div style="background: #DDDDDD; height: 100%; width: 50%; float: left;">
						<table width="100%" style = "height : 30%;">
							<tr>
								<td style = "background: black;" height = "100%" width="24%"><b style = "color: white; font-size: 22px;">출석</b></td>
								<td style = "background: black;" height = "100%" width="24%"><b style = "color: white; font-size: 20px;">상품등록</b></td>
								<td style = "background: black;" height = "100%" width="24%"><b style = "color: white; font-size: 22px;">판매</b></td>
								<td style = "background: black;" height = "100%" width="24%"><b style = "color: white; font-size: 22px;">의뢰</b></td>
							</tr>
						</table>
						<table width="100%" style="height: 70%;">
							<c:choose>
								<c:when test="${param.selected_designer!='none'}">
									<tr>
										<td class = "b1px" height = "100%" width="24%">${getlogincheck}회</td>
										<td class = "b1px" height = "100%" width="24%">${my_product_count}개</td>
										<td class = "b1px" height = "100%" width="24%">${my_sell_count}개</td>
										<td class = "b1px" height = "100%" width="24%">${my_request_count}개</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<center>
			<div style="float: left; width: 385px; height: 65px; background: #DDDDDD;">
						<input type = "button" class = "request" style = "width : 100%; height : 95%; font-size: 22px; font-weight: bold;" onclick = "window.location = 'req_Dlist?pageNum=1'"  value = "나의 의뢰 목록" />
						
			</div>
			<div style="float: left; width: 385px; height: 65px; background: #DDDDDD;">
						<input type = "submit" class = "request11" style = "width : 100%; height : 95%;font-size: 22px; font-weight: bold;" value = "디자이너 선택 완료" />
			</div>
		</center>
	</form:form>
</body>
</html>
