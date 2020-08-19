<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/popup.css">
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
</head>
<script>
$(document).ready(function(){
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
<body>
<center>
<div id="overlay" title="경찰매칭" class="overlay">
<div id="boxpopup" class="box">

<a onclick="closeOffersDialog('boxpopup');" class="boxclose"><img src="../images/cancel.png" class="btn_close" title="Close Window" alt="Close"/></a>
<strong>
신청된 사항이 없습니다.
</strong>
</div>
</div>
</center>
</body>
</html>