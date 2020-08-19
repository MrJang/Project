<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/popup.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
   <script type="text/javascript" src="../js/jquery.reveal.js"></script>
   <script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
   <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<style>
.box {
    background-color: #ffffff;
    color: #000000;
    height: auto;
    left: 100%;
    padding: 20px;
    position: fixed;
    right: 30%;
    top: 25%;
    width: 555px;
    z-index: 101;
   border:5px solid #888888;
   border-radius:10px;
   -moz-border-radius:10px;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
   if($('#m_success').val() == 3) {
      
      $("#message").text("귀가완료하기");
      $("#message").click(function() {location.href='crearPolice';});
   }else {
      $("#submit").text("예약 접수");
      $("#submit").click(function() {document.getElementById('female').submit(); alert('귀가를 시작합니다.');});
   }
   $('#overlay').css('background', '#000000');
   $('#overlay').css('bottom', '0');
   $('#overlay').css('left', '0');
   $('#overlay').css('position', 'fixed');
   $('#overlay').css('right', '0');
   $('#overlay').css('top', '0');
   $('#overlay').css('z-index', '100');
   $('#overlay').css('opacity', '0.9');
   
   $('#overlay').fadeIn('fast', function() {
      $('#boxpopup').css('display','block');
        $('#boxpopup').animate({'left':'30%'},500);
    });
   
    
   
});
function closeOffersDialog(prospectElementID) {
   $(function($) {
      $(document).ready(function() {
         $('#' + prospectElementID).css('position','absolute');
         $('#' + prospectElementID).animate({'left':'-100%'}, 500, function() {
            $('#' + prospectElementID).css('position','fixed');
            $('#' + prospectElementID).css('left','100%');
            $('#overlay').fadeOut('fast');
         });
      });
   });
}
</script>

</head>


<body>
<div id="overlay" class="overlay">
<div id="boxpopup" class="box">
<a onclick="closeOffersDialog('boxpopup');" class="boxclose"><img src="../images/cancel.png" class="btn_close" title="Close Window" alt="Close"/></a>
<center>   
            <h1>예약자현황</h1>
            <br/>
         
      
         <form:form commandName="female">
         <table id="tab" border="1" cellspacing="0" cellpadding="5" align="center" class="bordered" style="font-weight:bold;">
         <tr>
            <td>사용자이름:</td>
            <td style="font-weight:bold;"><form:input path="name" readonly="true"/></td>
         </tr>
         <tr>
            <td>사용자연락처:</td>
            <td style="font-weight:bold;"><form:input path="phone" readonly="true" /></td>
         </tr>
         <tr>
            <td>시간:</td>
            <td style="font-weight:bold;"><form:input path="crime_time" readonly="true"/></td>
         </tr>
         
            
         
            
            
            
            
         
            <form:hidden path="m_success"/>
            </table>
         
         </form:form>
         
      
               
                           
         <h2><label id="submit" style="font-weight:bold;"></label></h2>
            <h2><label id="message" style="font-weight:bold;"></label></h2>

</center>
</div>
</div>
</body>
</html>