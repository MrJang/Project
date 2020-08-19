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
	
	alert("�Է��� �Ǿ� ���� �ʽ��ϴ�.");
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
			if(confirm("������� �Է� �Ͻðڽ��ϱ�?") == true){
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
			<input type="radio" name="chk_info" onclick="selectRadio('${s.id}')" value="p">ȸ������ �˻�
			<input type="radio" name="chk_info" value="c" checked="checked" onclick="selectRadio('${s.id}')">�ֱ� ��û
			</p>
			</c:if>
			<br><br>
			<p>
				<label>Id:</label>
				<form:input path="id" value="${s.id}" readonly="true" class="text"/>
			</p>
			<br>
			<p>
				<label>�����:</label>
				<form:input path="departure" class="text" value = "�뱸 �ϱ� ������"/>
				<input type="button" value ="�ּ�ã��" onclick="zipcodebtn1();">
			</p>
			<br>
			<p>
				<label>������:</label>
				<form:input path="destination" class="text" value="�뱸 �ϱ� ������"/>
				<input type="button" value ="�ּ�ã��" onclick="zipcodebtn2();">
			</p>
				<br>	
			<p>
					<label>��߽ð� :</label>
					<form:select path="start_time" >
					<form:option value="09:00"/></form:select>
			</p>
			<br>
			<p>
					<label>�����ð� :</label>
					<form:select path="stop_time" value ="10:00">
					<form:option value="10:00"/></form:select>
			</p>
			<br>
			
				
			<br>
			<c:choose>

			<c:when test='${s.category==1}'>
				<p>
				<label>�ڳ�ID:</label>
				<form:input path="ch_name" class="text"/>
				</p>
				
				<br>
			
				<p>
				<label>��й�ȣ:</label>
				<form:password path="ch_pass" class="text"/>
				</p>
				<br>
				<p>
				<label>start :</label>
				<form:select path="start_year">
					<form:option value="2014"/>
				</form:select>
				��
				<form:select path="start_month">
					<form:option value="10"/>
				</form:select>
				��
				<form:select path="start_day">
					<form:option value="20"/>
				</form:select>
				��
				</p>
			
				<br>
				
				
				<p>
				<label>end :</label>
				<form:select path="end_year">
					<form:option value="2014"/>
				</form:select>
				��
				<form:select path="end_month" >
					<form:option value="11"/>
				</form:select>
				��
				<form:select path="end_day" >
					<form:option value="20"/>
				</form:select>
				��
				</p>
			
				<br>
				<p>
				<label>��ü����:</label>
				<form:input path="e_id" class="text"/>
				<input type="button" value ="��üã��" onclick="selectEnter();">
				</p>
				
				<br>
				<p>
				<label>Ư�̻���:</label>
				<form:textarea path="report" class="textarea"/>
				</p>
			</c:when>
			
			<c:when test='${s.category=="2"}'>
				<p>
					<label>���з� :</label>
						    ��ü��
				</p>
				<br>
				<p>
				<label>�ο��� :</label>
				<form:textarea path="member_count" class="text"/>
				</p>
				<br>
				<p>
				<label>��ü��:</label>
				<form:input path="request" value="${s.e_name}" readonly="true" class="text"/>
				</p>
				<br>
				<p>
				<label>��ü�Ұ�:</label>
				<form:textarea path="report" class="textarea"/>
				</p>
				
			</c:when>
			</c:choose>
			<p>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="���"/>
				<input type="reset" class="btn" value="����">
			</p>

</form:form>
