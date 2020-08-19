<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
  	<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['annotationchart']}]}"></script>
    <script type='text/javascript'>
   

//     $(document).ready(function(){
        
//         $.ajax(
//            {
//               url:"check_sales",
//               method:"POST",
              
//            success:function(list){
//               list(list);
 					
//               alert("야호 성공");
              
//            },
//            error:function(){
//               alert("error");
//            }
//            });
//      });
    
//    function list(list){
// 	 alert(" 여긴 처음 펑션");
//            for(var i=0;i<result.length;i++){
//             alert(result[i].dsh_title);
//           alert(result[i].dsh_writer);
//             alert(result[i].mem_num);
//             alert(result[i].DSH_CONTENT);
// 	var listt = [];
    
//     <c:forEach var="list" items="${list}">
//     var arr = [];
//     arr.push("<c:out value="${list.dsh_date}"/>");
//     arr.push("<c:out value="${list.dsh_num}"/>");
//     arr.push("<c:out value="${list.dsh_title}"/>");
//     arr.push("<c:out value="${list.dsh_content}"/>");
//     listt.push(arr);
//     alert("야호 2차원배열 완료");
//     </c:forEach>
        
           
//       }
    
//     	  alert("1");
	
    google.load('visualization', '1', {'packages':['annotationchart']});
    google.setOnLoadCallback(drawChart);
    google.setOnLoadCallback(drawChart1);
     
      function drawChart() {
    	  var li = [];
    	  
          <c:forEach var="li" items="${list}">
          var arr = [];
          arr.push("<c:out value="${li.p_date}"/>");
          arr.push("<c:out value="${li.day_sales}"/>");
          li.push(arr);
          </c:forEach>

          
      	
          var data = new google.visualization.DataTable();
          data.addColumn('date', '날짜');
          data.addColumn('number', '일일 매출(원)');
         data.addColumn('string','제목');
          data.addColumn('string','단위');
        

        
          var i = 0;
          var p = 0;
         
          for(i=0;i<li.length;i++){
 		    p=(li[i][1]/150000)*100;
 		    
 		    data.addRows([
            [new Date(li[i][0]),(li[i][1]*1),'$',li[i][1]]
//            
                   
          ]);
        	

		}
         
        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

        var options = {
          displayAnnotations: true,thickness: 2,colors:['#0009FF']
          };
       

        chart.draw(data, options);
       
       
      }
      
      function drawChart1() {
    	  var li = [];
    	  
          <c:forEach var="li" items="${list}">
          var arr = [];
          arr.push("<c:out value="${li.p_date}"/>");
          arr.push("<c:out value="${li.day_sales}"/>");
          li.push(arr);
          </c:forEach>

          
      	
          var data = new google.visualization.DataTable();
          data.addColumn('date', '날짜');
         data.addColumn('number', '목표달성율(%)');
         data.addColumn('string','제목');
          data.addColumn('string','단위');

        
          var i = 0;
          var p = 0;
         
          for(i=0;i<li.length;i++){
 		    p=(li[i][1]/150000)*100;
 		    
 		    data.addRows([
            [new Date(li[i][0]), (li[i][1]/150000)*100 ,'','']
//            
                   
          ]);
        	

		}
         
        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div1'));

        var options = {
          displayAnnotations: true, thickness: 2, colors :[ '#FF0000']
          };
       

        chart.draw(data, options);
       
       
      }
      
      </script>
  </head>

  <body>
       <div id='chart_div' style='width: 1024px; height: 300px;'></div>
        <div id='chart_div1' style='width: 770px; height: 300px;'></div>
        
  </body>
</html>