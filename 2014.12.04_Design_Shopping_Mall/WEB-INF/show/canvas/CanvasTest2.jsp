<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://reali.kr/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/jscolor/jscolor.js"></script>
<script type="text/javascript"
	src="http://d3lp1msu2r81bx.cloudfront.net/kjs/js/lib/kinetic-v5.0.1.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>
<!-- <script type="text/javascript" src="http://www.nihilogic.dk/labs/canvas2image/canvas2image.js"></script> -->
<!-- <script type="text/javascript" src="http://www.nihilogic.dk/labs/canvas2image/base64.js"></script> -->
<link href='http://fonts.googleapis.com/css?family=Oswald'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lobster'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Shadows+Into+Light'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Indie+Flower'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Gloria+Hallelujah' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Coming+Soon' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Orbitron:700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Rock+Salt' rel='stylesheet' type='text/css'>
<style>
body {

 overflow-y:scroll;  

} 
#tmp_canvas {
	position: absolute;
	left: 0px;
	right: 0;
	bottom: 0;
	top: 0;
	margin-left: 340px;
	margin-top: 370px;
	cursor: crosshair;
}

#text_tool {
	position: absolute;
	border: 1px dashed black;
	outline: 0;
	display: none;
	font: 10px Verdana;
	overflow: hidden;
	white-space: nowrap;
}

#canvas {
	border: 5px dashed #a7a7a7;
}

#redo {
	background: url(resources/Icon/UndoICon.png);
	width: 50px;
	height: 50px;
}

#undo {
	background: url(resources/Icon/RedoICon.png);
	width: 50px;
	height: 50px;
}

#pen {
	background: url(resources/Icon/PanICon.png);
	width: 50px;
	height: 50px;
}

#rect {
	background: url(resources/Icon/RectICon.png);
	width: 50px;
	height: 50px;
}

#Neighbor {
	background: url(resources/Icon/NeighborICon.png);
	width: 50px;
	height: 50px;
}

#Point-based {
	background: url(resources/Icon/PointBasedICon.png);
	width: 50px;
	height: 50px;
}

#Brush-Fur {
	background: url(resources/Icon/BrushFurICon.png);
	width: 50px;
	height: 50px;
}

#Neighbor-points {
	background: url(resources/Icon/PointBasedICon.png);
	width: 50px;
	height: 50px;
}

#Eraser {
	background: url(resources/Icon/EraserICon.png);
	width: 50px;
	height: 50px;
}

#TextInput {
	background: url(resources/Icon/TextICon.png);
	width: 50px;
	height: 50px;
}
#Round {
	background: url(resources/Icon/RoundICon.png);
	width: 50px;
	height: 50px;
}

#sketch {
	float: left;
	margin: 10px;
}
</style>
<title>그림판</title>
</head>
<body>
	<div>
		<div id="header" style="font-family: Shadows Into Light;">
			<table>
				<tr>
					<td><font style="font-family: Shadows Into Light">Dress  Selection</font><select id="selecter" onchange="imgChange()">
						<option disabled="disabled">-----상의-----</option>
						<option value="T">반판티</option>
						<option value="VT">브이넥 티셔츠</option>
						<option value="LT">긴판 티셔츠</option>
						<option value="LVT">브니넥 긴팔티셔츠</option>
						<option disabled="disabled">-----하의-----</option>
						<option value="Pans">일반 바지</option>
						<option value="SPans">반 바지</option>
						<option disabled="disabled">-----모자-----</option>
						<option value="Cap">일반 모자</option>
						<option value="BCap">빵 모자</option>
						<option disabled="disabled">-----악세서리-----</option>
						<option value="Card">카드지갑</option>
						<option value="Bro">브로치</option>
						<option disabled="disabled">-----가져온 이미지-----</option>
						<option value="cap_Img">캡처이미지</option>
			</select>&nbsp;&nbsp;<input type="button" value="" id="undo" onclick="Undo()"> <input
				type="button" value="" id="redo" onclick="Redo()"><br /></td>
				</tr>
			</table>
			Text Color<input class="color" id="textFillColor" value="#000000" />&nbsp;&nbsp;&nbsp;&nbsp;FontStyle<select
				id="Ftselecter" onchange="FontStyleChange()">
				<option disabled="disabled">-----폰트-----</option>
				<option value="Oswald" >Oswald</option>
				<option value="Lobster" >Lodster</option>
				<option value="Shadows" >Shadows</option>
				<option value="Flower" >Flower</option>
				<option value="Gloria" >Gloria</option>
				<option value="Pacifico" >Pacifico</option>
				<option value="ComingSoon" >Coming Soon</option>
				<option value="Orbitron:700" >Orbitron:700</option>
				<option value="RockSalt" >Rock Salt</option>
				
			</select>&nbsp;&nbsp;&nbsp;&nbsp; FontSize<select id="Fselecter"
				onchange="FontSizeChange()">
				<option value="10">10</option>
				<option value="12">12</option>
				<option value="14">14</option>
				<option value="16">16</option>
				<option value="18">18</option>
				<option value="20">20</option>
				<option value="22">22</option>
				<option value="24">24</option>
				<option value="26">26</option>
				<option value="28">28</option>
				<option value="100">30</option>
			</select>
		</div>
		<div>
			<div id="sketch">
				<canvas id="canvas" width="600" height="400"></canvas>
			</div>
			<div id="controler">
				<table style="font-family: Shadows Into Light">
					<tr>
						<td>mode :</td>
						<td><span id="mode"></span></td>
					</tr>
					<tr>
						<td>Brush Size</td>
						<td><input id="brush_size" type="range" value="1" min="0"
							max="20" name="brush_size"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td><input type="button" value="" onclick="changeMode(0)"
							id="pen"> <input type="button" value=""
							onclick="changeMode(2)" id="rect"></td>
					</tr>
					<tr>
						<td><input type="button" value="" onclick="changeMode(3)"
							id="Neighbor"> <input type="button" value=""
							onclick="changeMode(5)" id="Point-based"></td>
					</tr>
					<tr>
						<td><input type="button" value="" onclick="changeMode(7)"
							id="Neighbor-points"> <input type="button" value=""
							onclick="changeMode(6)" id="Brush-Fur"></td>
					</tr>
					<tr>
						<td><input type="button" value="" onclick="changeMode(8)"
							id="Round"> <input type="button" value=""
							onclick="changeMode(4)" id="Eraser"></td>
					</tr>
					<tr>
						<td COLSPAN="2"><input type="button" value=""
							onclick="textInput();" id="TextInput"></td>
					</tr>
					<tr>
						<td>
						<input type="button" class = "myButton2" value="저장소로 가기" onclick="openCapture()">
<!-- 						<input type="button" value="저장소로 가기" onclick="window.location='canvas1'"> -->
						</td>
					</tr>
				</table>
				<br />
				<br />
				<br />
				<br />
				<table style = "margin-left : 160px;">
					<tr>
						<td colspan="2">
							<input type="file" id="loadImg" name="loadImg" class = "myButton2">
						</td>
					</tr>
					<tr>
						<td colspan="2" >
							<form ACTION="canvas" method="post">
								<input name="can_title" id="imgDataTitle" value="" /> 
								<input type="button" value="SAVE" onClick="save()" class = "myButton2"/> 
								<input type="submit" value="확인" class = "myButton2"><br /> 
								<input type="hidden" id="can_img" name="can_img">
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var picture = {
			canvas : null,
			context : null,
			canvas2 : null,
			context2 : null

		};
		var eventObject = {
			mode : 0,
			click : false,
			x : 0,
			y : 0,
			Color : null,
			text : null,
			scale : 1.0,
			scaleMultiplier : 0.8,
			img : new Image(),
			Step : -1,
			fontSize : 0,
			fontStyle : null,
			cap_img : false,
			cap_load : null
		};

		var mouse = {
			x : 0,
			y : 0
		};
		var start_mouse = {
			x : 0,
			y : 0
		};
		var last_mouse = {
			x : 0,
			y : 0
		};

		var PushArray = new Array();
		var points = [];
		var isDrawing, lastPoint;

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

		window.onload = function() {
			// 		eventObject.img.src = "image/T.png";
			document.getElementById("loadImg").addEventListener("change",
					loadImg, false);

			eventObject.cap_load = document.getElementById("paraValue").value;

			picture.canvas = document.getElementById("canvas");
			picture.context = picture.canvas.getContext("2d");
			$("#brush_size").change(function(e) {
				eventObject.BrushChange = $(this).val();
			});
			$('#textFillColor').change(function(e) {
				eventObject.Color = $(this).val();
			});
			var translatePos = {
				x : picture.canvas.width / 2,
				y : picture.canvas.height / 2
			};

			// 			document.getElementById("plus").addEventListener("click",
			// 					function() {
			// 						eventObject.scale /= eventObject.scaleMultiplier;
			// 						drawCanvas();
			// 					}, false);

			// 			document.getElementById("minus").addEventListener("click",
			// 					function() {
			// 						eventObject.scale *= eventObject.scaleMultiplier;
			// 						drawCanvas();
			// 					}, false);

			eventObject.img.addEventListener("load", drawCanvas, false);
			mouseListener();

		};
		function imgChange() {
			var test = document.getElementById("selecter").value;
			eventObject.img.src = "resources/image/T.png";
			if (test == "T") {
				eventObject.img.src = "resources/image/T.png";
			} else if (test == "LT") {
				eventObject.img.src = "resources/image/LT.jpg";
			} else if (test == "VT") {
				eventObject.img.src = "resources/image/VT.jpg";
			} else if (test == "LVT") {
				eventObject.img.src = "resources/image/LVT.jpg";
			} else if (test == "Pans") {
				eventObject.img.src = "resources/image/Pans.jpg";
			} else if (test == "SPans") {
				eventObject.img.src = "resources/image/SPans.jpg";
			} else if (test == "Cap") {
				eventObject.img.src = "resources/image/Cap.jpg";
			} else if (test == "BCap") {
				eventObject.img.src = "resources/image/BCap.jpg";
			} else if (test == "cap_Img") {
// 				alert(eventObject.cap_load);
// 				alert(eventObject.cap_load.length);
				if(eventObject.cap_load.length>5000){
					eventObject.img.src = eventObject.cap_load;
				}else if(eventObject.cap_load.length<5000){
					eventObject.img.src = "../upload/" + eventObject.cap_load;	
				}
			} else if (test == "Bro") {
				eventObject.img.src = "resources/image/Bro.jpg";
			} else if (test == "Card") {
				eventObject.img.src = "resources/image/Card.jpg";
			}
			drawCanvas();
		}
		function FontStyleChange() {
			var test = document.getElementById("Ftselecter").value;
			test = "Oswald";
			if (test == "Oswald") {
				eventObject.fontStyle = "Oswald";
			} else if (test == "Lodster") {
				eventObject.fontStyle = "Lodster";
			} else if (test == "Shadows") {
				eventObject.fontStyle = "Shadows Into Light";
			} else if (test == "Flower") {
				eventObject.fontStyle = "Indie Flower";
			} else if(test == "Gloria"){
				eventObject.fontStyle = "Gloria Hallelujah";
			} else if(test == "Pacifico"){
				eventObject.fontStyle = "Pacifico";
			} else if(test == "ComingSoon"){
				eventObject.fontStyle = "Coming Soon";
			} else if(test == "Orbitron:700"){
				eventObject.fontStyle = "Orbitron:700";
			} else if(test == "RockSalt"){
				eventObject.fontStyle = "Rock Salt";
			}
		}
		function Push() {
			eventObject.Step++;
			if (eventObject.Step < PushArray.length) {
				PushArray.length = eventObject.Step;
			}
			PushArray.push(document.getElementById('canvas').toDataURL());
		}
		function Undo() {
			if (eventObject.Step > 0) {
				eventObject.Step--;
				var canvasPic = new Image();
				canvasPic.src = PushArray[eventObject.Step];
				canvasPic.onload = function() {
					picture.context.drawImage(canvasPic, 0, 0);
				};
			}
		}
		function Redo() {
			if (eventObject.Step < PushArray.length - 1) {
				eventObject.Step++;
				var canvasPic = new Image();
				canvasPic.src = PushArray[eventObject.Step];
				canvasPic.onload = function() {
					picture.context.drawImage(canvasPic, 0, 0);
				};
			}
		}
		function drawCanvas() {
			picture.context.save();
			picture.context.clearRect(0, 0, picture.canvas.width,
					picture.canvas.height);
			picture.context.scale(eventObject.scale, eventObject.scale);
			picture.context.drawImage(eventObject.img, 0, 0,600,400);
			picture.context.restore();
			Push();
		}
		function setClickTrue(evnet) {
			points = [];
			eventObject.click = true;
			points.push({
				x : event.layerX,
				y : event.layerY
			});
			lastPoint = {
				x : evnet.layerX,
				y : evnet.layerY
			};
			Push();
		}
		function setClickFalse() {
			eventObject.click = false;
			points.length = 0;
			Push();
		}
		function dragEvent(e) {
			if (!eventObject.click)
				return;
			points.push({
				x : e.layerX,
				y : e.layerY
			});
			var g = picture.context;
			g.strokeStyle = "#" + eventObject.Color;
			g.beginPath();
			g.moveTo(points[0].x, points[0].y);

			g.lineWidth = eventObject.BrushChange;

			for (var i = 1; i < points.length; i++) {
				g.shadowBlur = 0;
				g.shadowColor = 'rgb(0, 0, 0)';
				g.lineTo(points[i].x, points[i].y);
			}
			g.stroke();
		}
		function dragNeig(event) {
			if (!eventObject.click)
				return;
			var g = picture.context;
			//ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
			points.push({
				x : event.layerX,
				y : event.layerY
			});

			g.beginPath();
			g.shadowBlur = 0;
			g.moveTo(points[points.length - 2].x, points[points.length - 2].y);
			g.lineTo(points[points.length - 1].x, points[points.length - 1].y);
			g.lineWidth = eventObject.BrushChange;
			g.strokeStyle = "#" + eventObject.Color;
			g.stroke();

			for (var i = 0, len = points.length; i < len; i++) {
				dx = points[i].x - points[points.length - 1].x;
				dy = points[i].y - points[points.length - 1].y;
				d = dx * dx + dy * dy;

				if (d < 1000) {
					g.beginPath();
					g.moveTo(points[points.length - 1].x + (dx * 0.2),
							points[points.length - 1].y + (dy * 0.2));
					g
							.lineTo(points[i].x - (dx * 0.2), points[i].y
									- (dy * 0.2));
					g.stroke();
				}
			}
		}
		function point_based(e) {
			if (!eventObject.click)
				return;
			points.push({
				x : e.layerX,
				y : e.layerY
			});
			var g = picture.context;
			g.strokeStyle = "#" + eventObject.Color;
			g.beginPath();
			g.moveTo(points[0].x, points[0].y);

			g.lineWidth = eventObject.BrushChange;

			for (var i = 1; i < points.length; i++) {
				g.shadowBlur = 3;
				g.shadowColor = "#" + eventObject.Color;
				g.lineTo(points[i].x, points[i].y);
			}
			g.stroke();
		}
		function Sliced(e) {
			if (!eventObject.click)
				return;
			var g = picture.context;

			g.beginPath();
			g.shadowBlur = 0;
			g.lineWidth = eventObject.BrushChange;
			g.globalAlpha = 1;
			g.strokeStyle = "#" + eventObject.Color;

			g.moveTo(lastPoint.x, lastPoint.y);
			g.lineTo(e.offsetX, e.offsetY);
			g.stroke();

			g.moveTo(lastPoint.x - 4, lastPoint.y - 4);
			g.lineTo(e.offsetX - 4, e.offsetY - 4);
			g.stroke();

			g.moveTo(lastPoint.x - 2, lastPoint.y - 2);
			g.lineTo(e.offsetX - 2, e.offsetY - 2);
			g.stroke();

			g.moveTo(lastPoint.x + 2, lastPoint.y + 2);
			g.lineTo(e.offsetX + 2, e.offsetY + 2);
			g.stroke();

			g.moveTo(lastPoint.x + 4, lastPoint.y + 4);
			g.lineTo(e.offsetX + 4, e.offsetY + 4);
			g.stroke();

			lastPoint = {
				x : e.layerX,
				y : e.layerY
			};
		}
		function Neighbor_points(e) {
			if (!eventObject.click)
				return;
			var g = picture.context;
			g.strokeStyle = "#" + eventObject.Color;
			points.push({
				x : e.layerX,
				y : e.layerY
			});
			g.shadowBlur = 0;
			g.beginPath();
			g.moveTo(points[0].x, points[0].y);
			for (var i = 1; i < points.length; i++) {
				g.lineTo(points[i].x, points[i].y);
				var nearPoint = points[i - 5];
				if (nearPoint) {
					g.moveTo(nearPoint.x, nearPoint.y);
					g.lineTo(points[i].x, points[i].y);
				}
			}
			g.stroke();
		}
		function dragEraser(e) {
			if (!eventObject.click)
				return;
			var g = picture.context;

			g.beginPath();
			g.fillStyle = "#ffffff";
			var Str = eventObject.BrushChange;
			// 			g.lineWidth = eventObject.BrushChange;
			g.fillRect(e.layerX, e.layerY, Str, Str);
		}
		function printXY(e) {
			var g = picture.context;
		}
		function setBeforeXY(e) {
			var g = picture.context;
			eventObject.x = e.layerX;
			eventObject.y = e.layerY;
			g.moveTo(e.layerX, e.layerY);
			Push();
		}
		function drawLine(e) {
			var g = picture.context;
			g.beginPath();
			g.shadowBlur = 0;
			g.strokeStyle = "#" + eventObject.Color;
			g.lineWidth = eventObject.BrushChange;
			g.lineTo(e.layerX, e.layerY);
			g.stroke();
		}
		function drawRect(e) {
			var g = picture.context;
			g.beginPath();
			g.shadowBlur = 0;
			g.strokeStyle = "#" + eventObject.Color;
			g.lineWidth = eventObject.BrushChange;
			g.rect(eventObject.x, eventObject.y, e.offsetX - eventObject.x,
					e.offsetY - eventObject.y);
			g.stroke();
		}
		function drawRound(e) {
			var g = picture.context;
			g.beginPath();
			g.shadowBlur = 0;
			g.strokeStyle = "#" + eventObject.Color;
			g.lineWidth = eventObject.BrushChange;
			g.arc(eventObject.x, eventObject.y, e.offsetX - eventObject.x,
					e.offsetY - eventObject.y, Math.PI * 2, true);
			g.fillStyle = "#" + eventObject.Color;
			g.fill();
			g.stroke();
		}
		function FontSizeChange() {
			eventObject.fontSize = document.getElementById("Fselecter").value;
		}
		function textInput() {
			FontSizeChange();
			var tmp_canvas = document.createElement('canvas');
			var tmp_ctx = tmp_canvas.getContext('2d');
			tmp_canvas.id = 'tmp_canvas';
			tmp_canvas.width = canvas.width;
			tmp_canvas.height = canvas.height;
			sketch.appendChild(tmp_canvas);
			var sprayIntervalID;

			var textarea = document.createElement('textarea');
			textarea.id = 'text_tool';
			sketch.appendChild(textarea);
			// Text tool's text container for calculating
			// lines/chars
			var tmp_txt_ctn = document.createElement('div');
			tmp_txt_ctn.style.display = 'none';
			sketch.appendChild(tmp_txt_ctn);
			textarea.addEventListener('mouseup', function(e) {
				tmp_canvas.removeEventListener('mousemove', onPaint, false);
			}, false);

			tmp_canvas.addEventListener('mousemove',
					function(e) {
						mouse.x = typeof e.layerX !== 'undefined' ? e.layerX
								: e.layerX;
						mouse.y = typeof e.layerY !== 'undefined' ? e.layerY
								: e.layerY;
					}, false);

			/* Drawing on Paint App */
			tmp_ctx.lineWidth = eventObject.fontSize;
			tmp_ctx.lineJoin = 'round';
			tmp_ctx.lineCap = 'round';
			tmp_ctx.strokeStyle = "#" + eventObject.Color;
			tmp_ctx.fillStyle = "#" + eventObject.Color;
			tmp_ctx.font = eventObject.fontSize+"px";
			
			tmp_canvas.addEventListener('mousedown',
					function(e) {
						tmp_canvas
								.addEventListener('mousemove', onPaint, false);
						// 						alert(mouse.x);
						mouse.x = typeof e.layerX !== 'undefined' ? e.layerX
								: e.layerX;
						mouse.y = typeof e.layerY !== 'undefined' ? e.layerY
								: e.layerY;

						start_mouse.x = mouse.x;
						start_mouse.y = mouse.y;

						// onPaint();
						// sprayIntervalID = setInterval(onPaint, 50);
					}, false);

			tmp_canvas.addEventListener('mouseup', function() {
				tmp_canvas.removeEventListener('mousemove', onPaint, false);
				var lines = textarea.value.split('\n');
				var processed_lines = [];

				for (var i = 0; i < lines.length; i++) {
					var chars = lines[i].length;

					for (var j = 0; j < chars; j++) {
						var text_node = document.createTextNode(lines[i][j]);
						tmp_txt_ctn.appendChild(text_node);
						// Since tmp_txt_ctn is not taking any space
						// in layout due to display: none, we gotta
						// make it take some space, while keeping it
						// hidden/invisible and then get dimensions
						tmp_txt_ctn.style.position = 'absolute';
						tmp_txt_ctn.style.visibility = 'hidden';
						tmp_txt_ctn.style.display = 'block';
						var width = tmp_txt_ctn.offsetWidth;
						var height = tmp_txt_ctn.offsetHeight;

						tmp_txt_ctn.style.position = '';
						tmp_txt_ctn.style.visibility = '';
						tmp_txt_ctn.style.display = 'none';
						// Logix
						// console.log(width, parseInt(textarea.style.width));
						if (width > parseInt(textarea.style.width)) {
							break;
						}
					}

					processed_lines.push(tmp_txt_ctn.textContent);
					tmp_txt_ctn.innerHTML = '';
				}

				var ta_comp_style = getComputedStyle(textarea);
				var fs = eventObject.fontSize + "px";
				// 				ta_comp_style.setProperty("font-family",eventObject.fontStyle);
				// 				$('#text_tool').cs
// 				var ff = ta_comp_style.getPropertyValue('font-family'); //폰트 글시체 바꾸는 곳
				tmp_ctx.font = fs + ' ' + eventObject.fontStyle;
				tmp_ctx.textBaseline = 'top';

				for (var n = 0; n < processed_lines.length; n++) {
					var processed_line = processed_lines[n];
					tmp_ctx.fillText(processed_line,
							parseInt(textarea.style.left),
							parseInt(textarea.style.top) + n * parseInt(fs));
				}

				// Writing down to real canvas now
				picture.context.drawImage(tmp_canvas, 0, 0);
				// Clearing tmp canvas
				tmp_ctx.clearRect(0, 0, tmp_canvas.width, tmp_canvas.height);

				// clearInterval(sprayIntervalID);
				textarea.style.display = 'none';
				textarea.value = '';
				document.getElementById("sketch").removeChild(textarea);
				document.getElementById("sketch").removeChild(tmp_canvas);
				document.getElementById("sketch").removeChild(tmp_txt_ctn);

			}, false);
			var onPaint = function(e) {
				// Tmp canvas is always cleared up before drawing.
				tmp_ctx.clearRect(0, 0, tmp_canvas.width, tmp_canvas.height);

				mouse.x = e.pageX;
				mouse.y = e.pageY;

				start_mouse.x = e.offsetX;
				start_mouse.y = e.offsetY;

				var x = Math.min(mouse.x, start_mouse.x);
				var y = Math.min(mouse.y, start_mouse.y);
				var width = Math.abs(mouse.x - start_mouse.x);
				var height = Math.abs(mouse.y - start_mouse.y);

				textarea.style.left = x + 'px';
				textarea.style.top = y + 'px';
				textarea.style.width = width + 'px';
				textarea.style.height = height + 'px';

				textarea.style.display = 'block';
			};
			Push();
		}
		function mouseListener() {
			var mode = Number(eventObject.mode);
			picture.canvas.addEventListener("mousemove", printXY, false);

			switch (mode) {
			case 0:
				document.getElementById("mode").innerHTML = "pen";
				picture.canvas.addEventListener("mousedown", setClickTrue,
						false);
				picture.canvas.addEventListener("mousemove", dragEvent, false);
				picture.canvas
						.addEventListener("mouseup", setClickFalse, false);
				break;
			case 1:
				document.getElementById("mode").innerHTML = "line";
				picture.canvas.addEventListener("mouseup", drawLine, false);
				picture.canvas
						.addEventListener("mousedown", setBeforeXY, false);
				break;
			case 2:
				document.getElementById("mode").innerHTML = "rect";
				picture.canvas
						.addEventListener("mousedown", setBeforeXY, false);
				picture.canvas.addEventListener("mouseup", drawRect, false);
				break;
			case 3:
				document.getElementById("mode").innerHTML = "Neighbor";
				picture.canvas.addEventListener("mousedown", setClickTrue,
						false);
				picture.canvas.addEventListener("mousemove", dragNeig, false);
				picture.canvas
						.addEventListener("mouseup", setClickFalse, false);
				break;
			case 4:
				document.getElementById("mode").innerHTML = "Eraser";
				picture.canvas.addEventListener("mousedown", setClickTrue,
						false);
				picture.canvas
						.addEventListener("mouseup", setClickFalse, false);
				picture.canvas.addEventListener("mousemove", dragEraser, false);
				break;
			case 5:
				document.getElementById("mode").innerHTML = "Point-based";
				picture.canvas.addEventListener("mousedown", setClickTrue,
						false);
				picture.canvas
						.addEventListener("mousemove", point_based, false);
				picture.canvas
						.addEventListener("mouseup", setClickFalse, false);
				break;
			case 6:
				document.getElementById("mode").innerHTML = "Sliced";
				picture.canvas.addEventListener("mousedown", setClickTrue,
						false);
				picture.canvas.addEventListener("mousemove", Sliced, false);
				picture.canvas
						.addEventListener("mouseup", setClickFalse, false);
				break;
			case 7:
				document.getElementById("mode").innerHTML = "Neighbor-points";
				picture.canvas.addEventListener("mousedown", setClickTrue,
						false);
				picture.canvas.addEventListener("mousemove", Neighbor_points,
						false);
				picture.canvas
						.addEventListener("mouseup", setClickFalse, false);
				break;
			case 8:
				document.getElementById("mode").innerHTML = "Round";
				picture.canvas
						.addEventListener("mousedown", setBeforeXY, false);
				picture.canvas.addEventListener("mouseup", drawRound, false);
				break;
			default:
				break;
			}
		}
		function removeEvent() {
			picture.canvas
					.removeEventListener("mousedown", setClickTrue, false);
			picture.canvas.removeEventListener("mouseup", setClickFalse, false);
			picture.canvas.removeEventListener("mousemove", dragEvent, false);

			picture.canvas
					.removeEventListener("mousedown", setClickTrue, false);
			picture.canvas.removeEventListener("mouseup", setClickFalse, false);
			picture.canvas.removeEventListener("mousemove", point_based, false);

			picture.canvas
					.removeEventListener("mousedown", setClickTrue, false);
			picture.canvas.removeEventListener("mouseup", setClickFalse, false);
			picture.canvas.removeEventListener("mousemove", Sliced, false);

			picture.canvas
					.removeEventListener("mousedown", setClickTrue, false);
			picture.canvas.removeEventListener("mouseup", setClickFalse, false);
			picture.canvas.removeEventListener("mousemove", Neighbor_points,
					false);

			picture.canvas.removeEventListener("mousedown", setBeforeXY, false);
			picture.canvas.removeEventListener("mouseup", drawLine, false);

			picture.canvas.removeEventListener("mouseup", drawRect, false);
			picture.canvas.removeEventListener("mouseup", drawRound, false);

			picture.canvas.removeEventListener("mousemove", dragNeig, false);
			picture.canvas.removeEventListener("mousemove", dragEraser, false);

		}
		function changeMode(mode) {
			removeEvent();
			eventObject.mode = mode;
			mouseListener();
		}
		function loadImg(e) {
			var file = e.target.files[0];
			var fileReader = new FileReader();
			fileReader.readAsDataURL(file);
			fileReader.onload = function() {
				output = new Image();
				output.src = fileReader.result;
				picture.context.drawImage(output, 0, 0, 600, 400);
				picture.context.stroke();
			};
			Push();
		}
		function save() {
			var image = picture.canvas.toDataURL("image/png",
					"image/octet-stream");
			document.getElementById("can_img").value = image;

		}
		function openCapture() {
			location.href = "canvas1";
		}
	</script>
	<%
		String name = (String) request.getAttribute("capture_img");
	%>
	<input type="hidden" id="paraValue" value="<%=name%>" />
</body>
</html>
