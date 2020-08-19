<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
function EnterView(e_id,e_num){
	location.href="../safe/EnterView?e_id="+e_id + "&e_num="+e_num;
}

function childrenView(num,id){
	var url = "../safe/listchildrenView?num="+num + "&id="+id;
	open(url,"childrenView", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=500,height=500");
}

function group(id,num,category){
	
	location.href="../safe/group_Home?id="+id+"&num="+num+"&category="+category;
	
}
</script>
<style>
.enter {
	-moz-box-shadow:inset 0px 1px 0px 0px #dcecfb;
	-webkit-box-shadow:inset 0px 1px 0px 0px #dcecfb;
	box-shadow:inset 0px 1px 0px 0px #dcecfb;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #bddbfa), color-stop(1, #80b5ea) );
	background:-moz-linear-gradient( center top, #bddbfa 5%, #80b5ea 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bddbfa', endColorstr='#80b5ea');
	background-color:#bddbfa;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #84bbf3;
	display:inline-block;
	color:#ffffff;
	font-family:Arial Black;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:100px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 0px 0px #528ecc;
}
.enter:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #80b5ea), color-stop(1, #bddbfa) );
	background:-moz-linear-gradient( center top, #80b5ea 5%, #bddbfa 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#80b5ea', endColorstr='#bddbfa');
	background-color:#80b5ea;
}.enter:active {
	position:relative;
	top:1px;
}


</style>



<div style="float:left; width:30%">
 
<c:set var = "crime" value="${fn:split(c.crime_time,'/')}"/>
	<table class="bordered" width="300" >
		
		<tr>
			<td width="100">Id</td>
			<td>${c.id}</td>
		</tr>
		
		<tr>
			<td>��ü�� </td>
			<td>${c.request}</td>
		</tr>

		<tr>
			<td>��߽ð�  </td>
			<td>${crime[0]}</td>
		</tr>
		
		<tr>
			<td>�����ð�  </td>
			<td>${crime[1]}</td>
		</tr>
		
		
		<tr style=" font-size: 8pt">
			<td>����� </td>
			<td>${c.departure}</td>
		</tr>

		<tr style=" font-size: 8pt">
			<td>������</td>
			<td>${c.destination}</td>
		</tr>
		
		
		<tr style=" font-size: 8pt">
			<td>�ο��� </td>
			<td>${c.current_count}/${c.member_count}</td>
		</tr>
		
		<c:if test='${c.category==2}'>
		<tr style=" font-size: 8pt">
			<td>��õ���� </td>
			<td>${c.star_average}</td>
		</tr>
		</c:if>
		<tr style=" font-size: 8pt">
			<td>�ۼ���¥ </td>
			<td>${c.reg_date}</td>
		</tr>
		

		<tr style=" font-size: 8pt">
			<td>��ȸ�� </td>
			<td>${c.readcount}</td>
		</tr>
		
		</table>
	</div>
	
	<div style="float:left; width:60%">
	<c:if test="${s.category == 2 && s.id == c.id}">
	<a href="#" onclick="EnterView('${c.id}',${c.num})" style="text-decoration:none" class="enter">��û��Ȳ</a>
	<a href="#" onclick="group('${c.id}',${c.num},${c.category})" style="text-decoration:none" class="enter">group</a>
	<br><br>
	<table class="bordered" width="800">
		<thead>
    	<tr >
       	  <th>ID</th>        
      	  <th width="200">�����</th>
      	  <th>������</th>
      	  <th>��û��Ȳ</th>
     	  <th>�󼼺���</th>
     	 </tr>
   		</thead>
		
		
	<c:forEach var="e_list" items="${e_list}">	
		<tr>
		<td>${e_list.id}</td>
		<td>${e_list.departure}</td>
		<td>${e_list.destination}</td>
		<c:if test='${e_list.notice == "0"}'>
		<td>��û��</td>
		</c:if>
		<c:if test='${e_list.notice == "1"}'>
		<td>������</td>
		</c:if>
		<td><a href="#" onclick="childrenView(${e_list.num},'${e_list.id}')">�󼼺���</a></td>
		
		</tr>
	</c:forEach>	
	</table>
	</c:if>
	</div>