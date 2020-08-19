<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	  <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
   <!-- 그래프 -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="../js/jquery.flot.js"></script>
	
	<link rel="stylesheet" href="../jqwidgets/jqx.base.css" type="text/css" />
    
    <script type="text/javascript" src="../jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="../jqwidgets/jqxswitchbutton.js"></script>
    <script type="text/javascript" src="../jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="../jqwidgets/demos.js"></script>
 
    
<style type="text/css">

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




#settings-panel
        {
            background-color: #fff;
            padding: 20px;
            display: inline-block;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
            position: relative;
        }
        .settings-section
        {
            background-color: #f7f7f7;
            height: 45px;
            width: 500px;
            border: 1px solid #b4b7bc;
            border-bottom-width: 0px;
        }
        .settings-section-top
        {
            border-bottom-width: 0px;
            -moz-border-radius-topleft: 10px;
            -webkit-border-top-left-radius: 10px;
            border-top-left-radius: 10px;
            -moz-border-radius-topright: 10px;
            -webkit-border-top-right-radius: 10px;
            border-top-right-radius: 10px;            
        }
        .sections-section-bottom
        {
            border-bottom-width: 1px;
            -moz-border-radius-bottomleft: 10px;
            -webkit-border-bottom-left-radius: 10px;
            border-bottom-left-radius: 10px;
            -moz-border-radius-bottomright: 10px;
            -webkit-border-bottom-right-radius: 10px;
            border-bottom-right-radius: 10px;            
        }
        .sections-top-shadow
        {
            width: 500px;
            height: 1px;
            position: absolute;
            top: 21px;
            left: 21px;
            height: 30px;
            border-top: 1px solid #e4e4e4;
            -moz-border-radius-topleft: 10px;
            -webkit-border-top-left-radius: 10px;
            border-top-left-radius: 10px;
            -moz-border-radius-topright: 10px;
            -webkit-border-top-right-radius: 10px;
            border-top-right-radius: 10px;  
        }
        .settings-label
        {
            font-weight: bold;
            font-family: Sans-Serif;
            font-size: 14px;
            margin-left: 14px;
            margin-top: 15px;
            float: left;
        }
        .settings-melody
        {
            color: #385487;
            font-family: Sans-Serif;
            font-size: 14px;
            display: inline-block;
            margin-top: 7px;
        }
        .settings-setter
        {
            float: right;
            margin-right: 14px;
            margin-top: 8px;
        }
        .events-container
        {
            margin-left: 20px;
        }
        #theme
        {
            margin-left: 20px;
            margin-bottom: 20px;
        }

</style>

<script type="text/javascript">


function getNowDate() {
	  now = new Date();
	  year = "" + now.getFullYear();
	  month = "" + (now.getMonth() + 1); if (month.length == 1) { month = "0" + month; }
	  day = "" + now.getDate(); if (day.length == 1) { day = "0" + day; }
	  hour = "" + now.getHours(); if (hour.length == 1) { hour = "0" + hour; }
	  minute = "" + now.getMinutes(); if (minute.length == 1) { minute = "0" + minute; }
	  second = "" + now.getSeconds(); if (second.length == 1) { second = "0" + second; }
	  return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
}




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

	
	var label = {
        'button1': 'Light',
        'button2': 'Door',
        'button3': 'Security'
    	};
	$('#button1').jqxSwitchButton({ height: 27, width: 81,  checked: false });
	$('#button2').jqxSwitchButton({ height: 27, width: 81,  checked: false });
	$('#button3').jqxSwitchButton({ height: 27, width: 81,  checked: false });

	
	
	$('.jqx-switchbutton').on('checked', function (event) {
	if(label[event.target.id][0] == 'L'){
		$.ajax({
			url :"http://192.168.0.10?led=OFF"	
			});
		
		$.ajax({
			url:"homeRightOff",
			success: function(){
			$(".hom").text(getNowDate());
			$(".ho").text("OFF");

				alert("Right off");
			}
		});
		
		
	}else if(label[event.target.id][0] == 'D'){
		$.ajax({
			url :"http://192.168.0.10?door=OFF"	
			});
		
		$.ajax({
			url:"homeDoorClose",
			success: function(){
			$(".hom").text(getNowDate());
			$(".ho").text("CLOSE");

			
			}
		});
		
	}else{
		$.ajax({
			url :"http://192.168.0.10?security=OFF"	
			});
		
		$.ajax({
			url:"homeSecurityOff",
			success: function(){
			$(".hom").text(getNowDate());
			$(".ho").text("MODE OFF");

			
			}
		});
		
	}	
    	
	});
    
    $('.jqx-switchbutton').on('unchecked', function (event) {
		if(label[event.target.id][0] == 'L'){
    		
    		$.ajax({
				url :"http://192.168.0.10?led=ON"	
				});
    		
    		$.ajax({
				url:"homeRightOn",
				success: function(){
					var target = $("#boar").find("tbody");
					var str = "<tr>";
					str += "<td class='ho'>ON</td>";
					str += "<td>" + getNowDate() + "</td>";
					str += "<td class='hom'></td>";
					str += "</tr>";
					target.append(str);
				}
				
			});
		}else if(label[event.target.id][0] == 'D'){
    		$.ajax({
				url :"http://192.168.0.10?door=ON"	
				});
    		
    		$.ajax({
				url:"homeDoorOpen",
				success: function(){
					var target = $("#boar2").find("tbody");
					var str = "<tr>";
					str += "<td class='ho'>OPEN</td>";
					str += "<td>" + getNowDate() + "</td>";
					str += "<td class='hom'></td>";
					str += "</tr>";
					target.append(str);
				}
				
			});
    		
    	}else{
    		$.ajax({
				url :"http://192.168.0.10?security=ON"	
				});
    		
    		$.ajax({
				url:"homeSecurityOn",
				success: function(){
					var target = $("#boar3").find("tbody");
					var str = "<tr>";
					str += "<td class='ho'>MODE ON</td>";
					str += "<td>" + getNowDate() + "</td>";
					str += "<td class='hom'></td>";
					str += "</tr>";
					target.append(str);
				}
				
			});
    	}
    	
    	
    });
	
	
	});
	

   
    function homeSe(id){
		
	 	location.href = "homeSe?id="+id;
	}
	
</script>	


<c:if test="${s.home == ''}"> 
신청 후 이용해 주세요.

<button value="신청" onclick="homeSe('${s.id}')">신청</button>

</c:if>



<c:if test="${s.home != ''}">

<div style="float: left; width: 650px">
 <div id="settings-panel">
        <div class="sections-top-shadow"></div>
        <div class="settings-section-top settings-section">
            <div class="settings-label">Home Security</div>
            <div class="settings-setter">
                <div class="settings-melody"></div>
            </div>
        </div>
        <div class="settings-section">
            <div class="settings-label">Light</div>
            <div class="settings-setter">
                <div id="button1"></div>
            </div>
        </div>
        <div class="settings-section">
            <div class="settings-label">door</div>
            <div class="settings-setter">
                <div id="button2"></div>
            </div>
        </div>
       
        <div class="sections-section-bottom settings-section">
            <div class="settings-label">Security</div>
            <div class="settings-setter">
                <div id="button3"></div>
            </div>
        </div>
    </div>
    
    
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
 </div> 
 
 <div> 
 
  
<form:form commandName="female">
	<div id="first"> 
	<h3>사용전력양: ${female.walt}W &nbsp;&nbsp;
		     금액: ${female.price}원</h3>
		     <br>
		
		
		<table class="bordered" id="boar">
		<thead>
		<th colspan="3">형광등</th>
			
		</thead>
			
		
		<tbody>
			<tr>
				<td>상태</td>
				<td>켜진시각</td>
				<td>꺼진시각</td>
			</tr>	
		
			
			<c:forEach var="p" items="${home}">
			
			
			<tr>
				<td id="hom">${p.notice}</td>
				<td><fmt:formatDate value="${p.reg_date}" type="both" pattern="yyyy-MM-dd hh:mm"/></td>
				<td><fmt:formatDate value="${p.regdate}" type="both" pattern="yyyy-MM-dd hh:mm"/></td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
		
	</div>
</form:form>
<br><br>

<form:form commandName="female2">
	<div id="second">
	
		<table class="bordered" id="boar2">
		
		<thead>
		<th colspan="3">현관문 on/off</th>
			
		</thead>
			
		
			<tbody>
			<tr>
				<td>상태</td>
				<td>켜진시각</td>
				<td>꺼진시각</td>
			</tr>
			<c:forEach var="p1" items="${home1}">
			
			
			<tr>
				<td>${p1.notice}</td>
				<td><fmt:formatDate value="${p1.reg_date}" type="both" pattern="yyyy-MM-dd hh:mm"/></td>
				<td><fmt:formatDate value="${p1.regdate}" type="both" pattern="yyyy-MM-dd hh:mm"/></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</form:form>

<br><br>
<form:form commandName="female3">
	
	<div id="thrid">
	
	<table class="bordered" id="boar3">
	<thead>
		<th colspan="3">보안모드</th>
			
		</thead>
			<tbody>
			<tr>
				<td>상태</td>
				<td>켜진시각</td>
				<td>꺼진시각</td>
			</tr>
			<c:forEach var="p2" items="${home2}">
			
			
			<tr>
				<td>${p2.notice}</td>
				<td><fmt:formatDate value="${p2.reg_date}" type="both" pattern="yyyy-MM-dd hh:mm"/></td>
				<td><fmt:formatDate value="${p2.regdate}" type="both" pattern="yyyy-MM-dd hh:mm"/></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</form:form>
 </div> 


</c:if>