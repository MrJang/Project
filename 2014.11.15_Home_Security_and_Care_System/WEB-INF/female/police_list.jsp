<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/button.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script><script type="text/javascript">
 </script>
 
<script>
$(document).ready(function(){
	
	$("#er").hide();
	$.getJSON('selectFemale/'+$('#id').val(), function(result){
	
		
		if(result== true) {
					
				if($('#e_num').val() !="0" ) {
					
					
				}else{
					$("#message").text("신청완료되었습니다.");
					$("#message1").text("경찰관이름:"+$("#e_id").val());
					$("#message2").text("휴대폰번호:"+$("#phone").val());
					$("#er").show();
					
				}
		}	
	});
	
});
function clearFemale() {
	   location.href="crearFemale";
	}

</script>

</head>


<body>
<center>	
				<h1>경찰매칭확인</h1>
			
			
		
			<form:form commandName="female">
				<form:hidden path="id"/>
				시간:
				<form:input path="crime_time" readonly="true"/>


				지역:
				<form:input path="content" id="content" readonly="true" />
				<form:hidden path="phone"/>
				<form:hidden path="e_id"/>
				<form:hidden path="e_num"/>
			
			</form:form>
						
						<h2><label id="message">예약중입니다</label></h2>
							
							<h2><label id="message1"></label></h2>
							<h2><label id="message2"></label></h2>		
				<input type="button" id="er" onClick="clearFemale();" value="귀가완료하기" class="asd-blue">
				

</center>
</body>
</html>