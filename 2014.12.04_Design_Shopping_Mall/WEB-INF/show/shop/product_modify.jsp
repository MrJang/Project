<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script>
	  function changeFunc(event) {
		   var input = event.target;

		    var reader = new FileReader();
		    reader.onload = function(){
		      var dataURL = reader.result;
		      var img = document.getElementById('img');
		      img.innerHTML = "<img src = '"+dataURL+"' id= 'img'  alt = '이미지 로딩 실패' width = '300px' height = '280px'>";
		    };
	      
		    reader.readAsDataURL(input.files[0]);       
	   }
	   function changeFunc2(event) {
		   var input = event.target;

		    var reader = new FileReader();
		    reader.onload = function(){
		      var dataURL = reader.result;
		      var img = document.getElementById('img2');
		      img.innerHTML = "<img src = '"+dataURL+"' id= 'img'  alt = '이미지 로딩 실패' width = '600px' height = '480px'>";
		    };
	      
		    reader.readAsDataURL(input.files[0]);       
	   }
	   function changeFunc3(event) {
		   var input = event.target;

		    var reader = new FileReader();
		    reader.onload = function(){
		      var dataURL = reader.result;
		      var img = document.getElementById('img3');
		      img.innerHTML = "<img src = '"+dataURL+"' id= 'img'  alt = '이미지 로딩 실패' width = '600px' height = '480px'>";
		    };
	      
		    reader.readAsDataURL(input.files[0]);       
	   }
	</script>
</head>
<body>
		<div class="product_regist_title"><img src="resources/shop_image/product_modify_title.png"></div>
		<form:form commandName = "product"  name="product" action="product_modify?pageNum=${pageNum}&category_num=${category_num}" method="post" enctype = "multipart/form-data">
		<div class="product_regist_content">
		<c:forEach var="product" items="${pro_list}">
		<div class="product_regist_img">
            <div class="regist_content1">상품 이미지</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            <div class="img_content" id="img"><img src = "../shop_item/${product.pro_img}" id= 'img'  alt = '이미지 로딩 실패' width = '300px' height = '200px'></div>
            <div class="img_regist">
          	<form:input path="img_stream_1" type = "file" onChange="changeFunc(event)" />
            </div>
         </div>
			<div class="regist_product2">
			<div id="img_type"></div>
			 <input type="hidden" name="pro_num" value="${product.pro_num}"/>
			<div class="regist_content1">카테고리</div>	
			<div class="product_regist_category">
				<select name = "pro_category">
				<c:choose>
					<c:when test="${product.pro_category==1}">
					<option value="1" selected>상의</option>
					<option value="2">하의</option>
					<option value="3">악세사리</option>
					<option value="4">기타</option>	
					</c:when>
					<c:when test="${product.pro_category==2}">
					<option value="1">상의</option>
					<option value="2" selected>하의</option>
					<option value="3">악세사리</option>
					<option value="4">기타</option>	
					</c:when>
					<c:when test="${product.pro_category==3}">
					<option value="1">상의</option>
					<option value="2">하의</option>
					<option value="3" selected>악세사리</option>
					<option value="4">기타</option>	
					</c:when>
					<c:when test="${product.pro_category==4}">
					<option value="1">상의</option>
					<option value="2">하의</option>
					<option value="3">악세사리</option>
					<option value="4" selected>기타</option>	
					</c:when>
				</c:choose>
				</select>
			</div> 
			<div class="regist_content1">상품 이름</div>
			<div class="product_regist_name">
				<form:input path = "pro_name" cssClass = "input_text" cssErrorClass = "errors" value="${product.pro_name}"/>	
			</div>
			<div class="regist_content1">가격</div>
			<div class="product_regist_price">
				<form:input path = "pro_price" cssClass = "input_text" cssErrorClass = "errors" value="${product.pro_price}"/>	
			</div>
			<div class="regist_content1">사이즈</div>
			<div class="product_regist_size">
				<form:input path = "pro_size" cssClass = "input_text" cssErrorClass = "errors" value="${product.pro_size}"/>
			</div>
			<div class="regist_content1">상품 수량</div>
			<div class="product_regist_amount">
				<form:input path = "pro_amount" cssClass = "input_text" cssErrorClass = "errors" value="${product.pro_amount}"/>	
			</div>
			</div>
			
		 <div class="product_regist_img_2">
            <div class="regist_content1">상품 상세 이미지 1</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            <div class="img_regist">
          	<form:input path="img_stream_2" type = "file" onChange="changeFunc2(event)" />
            </div>
            <div class="img_content2" id="img2"><img src="../shop_item/${product.pro_img_2}" width = '600px' height = '480px'></div>
         </div>
         <div class="product_regist_img_3">
            <div class="regist_content1">상품 상세 이미지 2</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            <div class="img_regist">
          	<form:input path="img_stream_3" type = "file" onChange="changeFunc3(event)" />
            </div>
            <div class="img_content3" id="img3"><img src="../shop_item/${product.pro_img_3}" width = '600px' height = '480px'></div>
         </div>
			
			<div class="regist_product3">
				<div class="regist_content1">상품 상세 설명 </div>
				<div class="product_regist_explain">
				<textarea name = "pro_explain" rows="8" cols="55" >${product.pro_explain}</textarea>
				</div>
			</div>
			</c:forEach>
			<div class="button_wrap">
				<input type="submit" class="product_enroll_button" value="수정"/>
				<a class="product_list_button">취소</a>
			</div>
		</div>
		</form:form>
</body>
</html>