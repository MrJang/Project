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
<!-- data-role�� jQuery mobile���� �ش� ������Ʈ�� � UI������ �����Ѵ�. �Ʒ� page�� �� ������Ʈ�� ���� ū ������ ���������� �ǹ��Ѵ�. -->
<div data-role="page">

        <!-- ����� �۷ι� �޴��� ǥ���ϴ� ������Ʈ�� ���� -->
    <div data-role="header" align = "center">
<!--         <h1>Design market</h1> -->
        <tiles:insertAttribute name="logo"/>
    </div>
    
        <!-- �������� ǥ�õǴ� ������ ���� -->
    <div data-role="content"> 
<!--         <p>Hello world</p>       -->
<tiles:insertAttribute name="menuForm"/>
    </div>
    
</div>

</body>
</html>