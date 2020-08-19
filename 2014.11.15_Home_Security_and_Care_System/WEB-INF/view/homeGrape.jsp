<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="../js/jquery.flot.js"></script>

<style>
/* Resets */
.graph-container,
.graph-container div,
.graph-container a,
.graph-container span {
    margin: 0;
    padding: 0;
}
.graph-container, #tooltip, .graph-info a {
    background: #ffffff;
    background: -moz-linear-gradient(top, #ffffff 0%, #f9f9f9 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#f9f9f9));
    background: -webkit-linear-gradient(top, #ffffff 0%,#f9f9f9 100%);
    background: -o-linear-gradient(top, #ffffff 0%,#f9f9f9 100%);
    background: -ms-linear-gradient(top, #ffffff 0%,#f9f9f9 100%);
    background: linear-gradient(to bottom, #ffffff 0%,#f9f9f9 100%);
 
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
/* Graph Container */
.graph-container {
    position: relative;
    width: 550px;
    height: 300px;
    padding: 20px;
 
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,.1);
    -moz-box-shadow: 0px 1px 2px rgba(0,0,0,.1);
    box-shadow: 0px 1px 2px rgba(0,0,0,.1);
}
 
.graph-container > div {
    position: absolute;
    width: inherit;
    height: inherit;
    top: 10px;
    left: 25px;
}
 
.graph-info {
    width: 590px;
    margin-bottom: 10px;
}
.graph-info a {
    position: relative;
    display: inline-block;
    float: left;
    height: 20px;
    padding: 7px 10px 5px 30px;
    margin-right: 10px;
    text-decoration: none;
    cursor: default;
}
/* Color Circles */
.graph-info a:before {
    position: absolute;
    display: block;
    content: '';
    width: 8px;
    height: 8px;
    top: 13px;
    left: 13px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
}
 
.graph-info .visitors { border-bottom: 2px solid #71c73e; }
.graph-info .returning { border-bottom: 2px solid #77b7c5; }
 
.graph-info .visitors:before { background: #71c73e; }
.graph-info .returning:before { background: #77b7c5; }
/* Lines & Bars Buttons */
#lines, #bars {
    width: 34px;
    height: 32px;
    padding: 0;
    margin-right: 0;
    margin-left: 10px;
    border-bottom: 2px solid #71c73e;
    float: right;
    cursor: pointer;
}
 
#lines.active, #bars.active {
    background: #82d344;
    background: -moz-linear-gradient(top, #82d344 0%, #71c73e 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#82d344), color-stop(100%,#71c73e));
    background: -webkit-linear-gradient(top, #82d344 0%,#71c73e 100%);
    background: -o-linear-gradient(top, #82d344 0%,#71c73e 100%);
    background: -ms-linear-gradient(top, #82d344 0%,#71c73e 100%);
    background: linear-gradient(to bottom, #82d344 0%,#71c73e 100%);
}
 
#lines span, #bars span {
    display: block;
    width: 34px;
    height: 32px;
    background: url('../img/lines.png') no-repeat 9px 12px;
}
 
#bars span { background: url('../imgages/bars.png') no-repeat center 10px; }
 
#lines.active span { background-image: url('../img/lines_active.png'); }
 
#bars.active span { background-image: url('../img/bars_active.png'); }
/* Clear Floats */
.graph-info:before, .graph-info:after,
.graph-container:before, .graph-container:after {
    content: '';
    display: block;
    clear: both;
}
#tooltip, .graph-info a {
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    font-weight: bold;
    font-size: 12px;
    line-height: 20px;
    color: #646464;
}
 
.tickLabel {
    font-weight: bold;
    font-size: 12px;
    color: #666;
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
}
.yAxis .tickLabel:first-child,
.yAxis .tickLabel:last-child { display: none; }
#tooltip {
    position: absolute;
    display: none;
    padding: 5px 10px;
    border: 1px solid #e1e1e1;
}
</style>
<script>


$(document).ready(function () {
	var walt =$("#walt").val();
	var price=$("#price").val();
	
	var graphData = [{
        // Visits
       data: [ [1, 49280], [2, 31872], [3, 27843], [4, 19092], [5, 60890], [6, 59080], [7, 29790], [8, 13409 ], [9, walt] ],
        color: '#71c73e'
    }, {
        // Returning Visits
        data: [ [1, 3902], [2, 3381], [3, 2835], [4, 1590], [5, 5908], [6, 4989], [7, 3092], [8, 1809], [9, price], ],
        color: '#77b7c5',
        points: { radius: 4, fillColor: '#77b7c5' }
    }
];
	// Lines
	$.plot($('#graph-lines'), graphData, {
	    series: {
	        points: {
	            show: true,
	            radius: 5
	        },
	        lines: {
	            show: true
	        },
	        shadowSize: 0
	    },
	    grid: {
	        color: '#646464',
	        borderColor: 'transparent',
	        borderWidth: 20,
	        hoverable: true
	    },
	    xaxis: {
	        tickColor: 'transparent',
	        tickDecimals: 0
	    },
	    yaxis: {
	        tickSize: 10000
	    }
	});
	 
	// Bars
	$.plot($('#graph-bars'), graphData, {
	    series: {
	        bars: {
	            show: true,
	            barWidth: .9,
	            align: 'center'
	        },
	        shadowSize: 0
	    },
	    grid: {
	        color: '#646464',
	        borderColor: 'transparent',
	        borderWidth: 20,
	        hoverable: true
	    },
	    xaxis: {
	        tickColor: 'transparent',
	        tickDecimals: 2
	    },
	    yaxis: {
	        tickSize: 10000
	    }
	});
	$('#graph-bars').hide();
	 
	$('#lines').on('click', function (e) {
	    $('#bars').removeClass('active');
	    $('#graph-bars').fadeOut();
	    $(this).addClass('active');
	    $('#graph-lines').fadeIn();
	    e.preventDefault();
	});
	 
	$('#bars').on('click', function (e) {
	    $('#lines').removeClass('active');
	    $('#graph-lines').fadeOut();
	    $(this).addClass('active');
	    $('#graph-bars').fadeIn().removeClass('hidden');
	    e.preventDefault();
	});
	
	
	function showTooltip(x, y, contents) {
	    $('<div id="tooltip">' + contents + '</div>').css({
	        top: y - 16,
	        left: x + 20
	    }).appendTo('body').fadeIn();
	}
	 
	var previousPoint = null;
	 
	$('#graph-lines, #graph-bars').bind('plothover', function (event, pos, item) {
	    if (item) {
	        if (previousPoint != item.dataIndex) {
	            previousPoint = item.dataIndex;
	            $('#tooltip').remove();
	            var x = item.datapoint[0],
	                y = item.datapoint[1];
	                showTooltip(item.pageX, item.pageY, x + ' 월 사용량' + y);
	        }
	    } else {
	        $('#tooltip').remove();
	        previousPoint = null;
	    }
	});
});
</script>

<div id="graph-wrapper">
    <div class="graph-info">
        <a href="javascript:void(0)" class="visitors">전력량</a>
        <a href="javascript:void(0)" class="returning">금액</a>
  
        <a href="#" id="bars"><span></span></a>
        <a href="#" id="lines" class="active"><span></span></a>
    </div>
  
    <div class="graph-container">
        <div id="graph-lines"></div>
        <div id="graph-bars"></div>
    </div>
</div>
<form:form commandName="female">
<form:hidden path="walt"/>
<form:hidden path="price"/>
</form:form>
