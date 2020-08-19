<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reveal.css">	
<link rel="stylesheet" href="../css/button.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="../js/jquery.reveal.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
</head>

<style type="text/css">
			body { font-family: "HelveticaNeue","Helvetica-Neue", "Helvetica", "Arial", sans-serif; }
			.big-link { display:block; text-align: center; font-size: 14; color: #06f; }
			.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;         
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;    
    
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;
    text-align: center;  
     
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
    
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}
		
		</style>
<script>

function PloList(list) {
	 var p_name= $("#p_name").val();
	

	var random = Math.floor(Math.random() * list)+1;

		if($("#police"+random).val() ==  null) {
			
			PloList(list);
		}else {
	var p = $("#police"+random).val();
    var name = p.split("/")[0];
    var phone = p.split("/")[1];
    var success= p.split("/")[2];
    var arg = prompt("이용하실 시간을 입력하세요: ex)14:00");
    if(arg== null) {
    	alert("취소하였습니다.");
    }else {
    var r = confirm("귀가 신청하기겠습니까?"+"\n경찰관이름:"+name+"경찰\n휴대폰번호:"+phone+"\n시간:"+arg+"시");
    
    if (r == true) {		       	
		 location.href="policelike?name="+name+"&phone="+phone+"&success="+success+"&arg="+arg+"&p_name="+p_name;
	} else {
		return;  			   
    		}
     
    }
		} 
}
function detalipolice(name) {
	
	$("#myModal").load("detalipolice?name="+ name);
		
		
	
}

</script> 
<body>
<div>
<form:form commandName="police">
<center>

<form:input path="p_name" readonly="true" STYLE="text-align:center;font-size: 25px;font-weight: bold"/>
<br/><br/>
<table width="800" id="tab" border="1" cellspacing="0" cellpadding="5" align="center" class="bordered">
<thead>
 <tr>
 	<th align="center">선택</th>
 	<th align="center">시간</th>
 	<th align="center">이름</th>
 	<th align="center">휴대폰번호</th>
 	<th align="center">예약가능상태</th>
  </tr>
 	 </thead>
 <c:forEach var="p" items="${list}">
 
 <tr> 
 <td align="center"><c:if test="${p.m_success !=1 }">x</c:if>
 <c:if test="${p.m_success ==1 }">
 <form:radiobutton path="police" value="${p.m_name}/${p.m_phone}/${p.m_success}"/></c:if>
 </td>
 <td align="center">
 <c:if test="${p.m_success !=1 }">x</c:if>
 <c:if test="${p.m_success ==1 }">
 <form:select path="crime_time">
					<form:options items="${t_list}" />
					</form:select>
					</c:if></td>
 <td align="center"><a href="#" class="big-link" onclick="detalipolice('${p.m_name}');" data-reveal-id="myModal" data-animation="fade" id ="myMap">${p.m_name}</a></td>
 <td align="center">${p.m_phone }</td> 
 <td align="center"><c:if test="${p.m_success==1 }">예약가능</c:if>
 	 <c:if test="${p.m_success ==3 }">예약불가능</c:if>
 	 <c:if test="${p.m_success ==2 }">예약중</c:if>
 </td>
	
</tr>
</c:forEach>

</table>
<c:if test="${submit == true }"><script>alert("귀가신청하시겠습니까?");</script></c:if>
<input type="submit" value="선택" class="asd asd-blue">
<input type="button" value="자동선택" onClick="PloList('${list.size()}')" class="asd asd-blue">
</center>
</form:form>

</div>



<div id="myModal" class="reveal-modal">

	
	<table>
	<tr>
	<td>
	등록된 후기가 없습니다.
	</td>
	</tr>
	
	</table>


</div>
경찰관들의 평가를 보실려면 이름을 클릭해주세요. 
</body>


</html>