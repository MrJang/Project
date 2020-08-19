<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head> 
<title></title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
 
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script src="../jquery.mobile-1.1.0.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../cordova-1.9.0.js"></script>

</head> 

<body> 
<!-- data-role는 jQuery mobile에서 해당 엘리먼트가 어떤 UI인지를 지정한다. 아래 page는 이 엘리먼트가 가장 큰 단위인 페이지임을 의미한다. -->
<div data-role="page">

        <!-- 제목과 글로벌 메뉴를 표시하는 엘리먼트를 지정 -->
    <div data-role="header" align = "center">
<!--         <h1>Design market</h1> -->
        <tiles:insertAttribute name="logo"/>
    </div>
    
        <!-- 컨텐츠가 표시되는 영역을 지정 -->
    <div data-role="content"> 
<!--         <p>Hello world</p>       -->
<tiles:insertAttribute name="menuForm"/>
    </div>
    
</div>

</body>
</html>