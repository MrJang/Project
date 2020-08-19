<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<link href="/SafeProject/css/default.css" rel="stylesheet" type="text/css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>

	
<script type="text/javascript">

function zipcodebtn1() {
    new daum.Postcode({
        oncomplete: function(data) {
           
            document.getElementById('departure').value = data.address;
        }
    }).open();
}

function zipcodebtn2() {
    new daum.Postcode({
        oncomplete: function(data) {
           
            document.getElementById('destination').value = data.address;
        }
    }).open();
}


function selectEnter(){
	
	var start =  $("#departure").get(0).value;
	var end = $("#destination").get(0).value;
	
	
	if(start == "" || end == ""){
	
	alert("입력이 되어 있지 않습니다.");
	return;
		
	}else{
	var url = "../safe/selectEnter?start="+start+"&end="+end;
	
	open(url,"selectEnter",
			"toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=550,height=300");
	}
}

function selectRadio(id){
	var radio = document.getElementsByName("chk_info");
	
	for(var i = 0; i<radio.length;i++){
	if(radio[i].checked == true){
		
		if(radio[i].value == "p"){
			if(confirm("출발지에 입력 하시겠습니까?") == true){
			var url = "../safe/radioMember?id="+id+"&val="+radio[i].value;
			open(url,"selectEnter",
			"toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=500,height=500");
			}
		}else{
			var url = "../safe/radioMember?id="+id+"&val="+radio[i].value;
			open(url,"selectEnter",
			"toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=500,height=500");
			}
		}
	}
	
}


</script>

<form:form commandName="c" class="blocks">
			<c:if test='${s.category==1}'>
			<p>
			<input type="radio" name="chk_info" onclick="selectRadio('${s.id}')" value="p">회원정보 검색
			<input type="radio" name="chk_info" value="c" checked="checked" onclick="selectRadio('${s.id}')">최근 신청
			</p>
			</c:if>
			<br><br>
			<p>
				<label>Id:</label>
				<form:input path="id" value="${s.id}" readonly="true" class="text"/>
			</p>
			<br>
			<p>
				<label>출발지:</label>
				<form:input path="departure" class="text" value = "대구 북구 읍내동"/>
				<input type="button" value ="주소찾기" onclick="zipcodebtn1();">
			</p>
			<br>
			<p>
				<label>목적지:</label>
				<form:input path="destination" class="text" value="대구 북구 복현동"/>
				<input type="button" value ="주소찾기" onclick="zipcodebtn2();">
			</p>
				<br>	
			<p>
					<label>출발시간 :</label>
					<form:select path="start_time" >
					<form:option value="09:00"/></form:select>
			</p>
			<br>
			<p>
					<label>도착시간 :</label>
					<form:select path="stop_time" value ="10:00">
					<form:option value="10:00"/></form:select>
			</p>
			<br>
			
				
			<br>
			<c:choose>

			<c:when test='${s.category==1}'>
				<p>
				<label>자녀ID:</label>
				<form:input path="ch_name" class="text"/>
				</p>
				
				<br>
			
				<p>
				<label>비밀번호:</label>
				<form:password path="ch_pass" class="text"/>
				</p>
				<br>
				<p>
				<label>start :</label>
				<form:select path="start_year">
					<form:option value="2014"/>
				</form:select>
				년
				<form:select path="start_month">
					<form:option value="10"/>
				</form:select>
				월
				<form:select path="start_day">
					<form:option value="20"/>
				</form:select>
				일
				</p>
			
				<br>
				
				
				<p>
				<label>end :</label>
				<form:select path="end_year">
					<form:option value="2014"/>
				</form:select>
				년
				<form:select path="end_month" >
					<form:option value="11"/>
				</form:select>
				월
				<form:select path="end_day" >
					<form:option value="20"/>
				</form:select>
				일
				</p>
			
				<br>
				<p>
				<label>업체선택:</label>
				<form:input path="e_id" class="text"/>
				<input type="button" value ="업체찾기" onclick="selectEnter();">
				</p>
				
				<br>
				<p>
				<label>특이사항:</label>
				<form:textarea path="report" class="textarea"/>
				</p>
			</c:when>
			
			<c:when test='${s.category=="2"}'>
				<p>
					<label>고객분류 :</label>
						    업체고객
				</p>
				<br>
				<p>
				<label>인원수 :</label>
				<form:textarea path="member_count" class="text"/>
				</p>
				<br>
				<p>
				<label>업체명:</label>
				<form:input path="request" value="${s.e_name}" readonly="true" class="text"/>
				</p>
				<br>
				<p>
				<label>업체소개:</label>
				<form:textarea path="report" class="textarea"/>
				</p>
				
			</c:when>
			</c:choose>
			<p>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="등록"/>
				<input type="reset" class="btn" value="리셋">
			</p>

</form:form>
