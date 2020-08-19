function openOffersDialog() {	
	
	$('#overlay').css('background', '#000000');
	$('#overlay').css('bottom', '0');
	$('#overlay').css('left', '0');
	$('#overlay').css('position', 'fixed');
	$('#overlay').css('right', '0');
	$('#overlay').css('top', '0');
	$('#overlay').css('z-index', '100');
	$('#overlay').css('opacity', '0.5');
	
	$('#overlay').fadeIn('fast', function() {
		$('#boxpopup').css('display','block');
        $('#boxpopup').animate({'left':'30%'},500);
    });
	
}


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
