<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script type="text/javascript">
$(document).ready(function($) {
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month'
		},
		editable : true,
		
		dayClick: function(date){
			
			var formDate = $.fullCalendar.formatDate(date, 'yyyy-MM-dd');
			var url = "../safe/selectDate?sche_date="+formDate;
			
			open(url,"selectdate", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=1000,height=700");
			
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
<center>
<div id='calendar' style='margin: 3em 0; font-size: 15px'></div>
</center>