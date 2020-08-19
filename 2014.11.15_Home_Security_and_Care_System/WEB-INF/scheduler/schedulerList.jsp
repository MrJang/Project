<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link rel='stylesheet' type='text/css'
	href='http://arshaw.com/css/main.css?6' />
<link rel='stylesheet' type='text/css'
	href='http://arshaw.com/css/fullcalendar.css?3' />

<link rel='stylesheet' type='text/css'
	href='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.css' />
<script type='text/javascript'
	src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-1.10.2.min.js'></script>
<script type='text/javascript'
	src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-ui-1.10.3.custom.min.js'></script>
<script type='text/javascript'
	src='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.min.js'></script>

<script type="text/javascript">
$(document).ready(function($) {
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		editable : true,
		
		dayClick: function(date){
			
			var formDate = $.fullCalendar.formatDate(date, 'yyyy-MM-dd');
			var url = "../safe/selectDate?sche_date="+formDate;
			
			open(url,"selectdate", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=950,height=700");
			
		}
		
	});
	
});

 function selectEnter(num){
	var url = "../safe/listchildrenView?num="+num;
	open(url,
			"Enter",
			"toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=500,height=450");
}
</script>
<div>
	<table class="bordered" width="100%">
		<thead>
			<tr>
				<th>�ڳ��̸�</th>
				<th>�����</th>
				<th>������</th>
				<th width="10%">��Ȳ</th>
				<th width="15%">���/���� �ð�</th>
				<th width="10%">���۳�¥/������¥</th>
				<th width="5%">��üID</th>
				<th width="10%">�׷��̵�</th>
				
			</tr>
		</thead>
		<c:forEach var="ch" items="${list}">

		<c:if test="${ch.finish == null}">
			<tr align="center">

				<td>${ch.ch_name}</td>
				
				<td>${ch.departure}</td>
				<td>${ch.destination}</td>

				<c:if test="${ch.notice == 0}">
					<td>��û��</td>
				</c:if>
				<c:if test="${ch.notice == 1}">
					<td>��û�Ϸ�</td>
				</c:if>
				<td>${ch.crime_time}</td>
				<td>${ch.start_date}/${ch.end_date}</td>
				<td><a href="#" onclick="selectEnter(${ch.e_num})">${ch.e_id}</a></td>
				<c:if test="${ch.notice == 1}">
				<td><a href="../safe/group_Home?num=${ch.e_num}&id=${ch.id}&category=${ch.category}">�̵�</a></td>
				</c:if>	
			</tr>
		</c:if>

		</c:forEach>
	</table>
</div>

<div id='calendar' style='margin: 3em 0; font-size: 15px'></div>
