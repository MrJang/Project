<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link href="/SafeProject/css/default.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
$(document).ready(function(){
	$('#joinidcheck').click(function(){
			
		$.getJSON('checkjoinid/'+$('#id').val(), function(ajaxDao){
			
		if(ajaxDao.duplicated == true) { //�ߺ����� true���� ������
			alert('�̹� ��ϵ� �α��� ID �Դϴ�.');
		}else {
			alert('����� �� �ִ� �α��� ID �Դϴ�.');
			}
		});
	});
});
	
	function zipcodebtn() {
		var url = "../safe/zipcode";
		open(url,"zipcode", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=600");
	}
	
 
 	
	
 		

</script>


	<form:form commandName="s" class="blocks" enctype="multipart/form-data">
			<p>
				<label>Id:</label>
				<form:input path="id" class="text"/>
				<input id="joinidcheck" type="button" value="�ߺ��˻�"/>
			</p>
			<br>
			<p>
				<label>PassWord:</label>
				<form:password path="password" class="text"/>
			</p>
			<br>
			<p>
				<label>Name:</label>
				<form:input path="name" class="text"/>
			</p>
			<br>
			<c:if test="${s.category ==2}">
			<p>
				<label>��ü��:</label>
				<form:input path="e_name" class="text"/>
			</p>
			<br>
			</c:if>
			
			<p>
				<label>Phone:</label>
				<form:input path="phone" class="text"/>
			</p>
			<br>
			<p>
				<label>email:</label>
				<form:input path="email" class="text"/>
			</p>
			<br>
			<p>
				<label>address:</label>
				<form:input path="address" class="text"/>
				<input type="button" value ="�ּ�ã��" onclick="zipcodebtn();">
				
			</p>
			
			<br>
			<p>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="���"/>
				<input type="reset" class="btn" value="����">
			</p>
		
		

	</form:form>

