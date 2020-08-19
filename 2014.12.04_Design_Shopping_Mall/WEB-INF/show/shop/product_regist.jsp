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
	      img.innerHTML = "<img src = '"+dataURL+"' id= 'img'  alt = '�̹��� �ε� ����' width = '300px' height = '200px'>";
	    };
      
	    reader.readAsDataURL(input.files[0]);       
   }
   function changeFunc2(event) {
	   var input = event.target;

	    var reader = new FileReader();
	    reader.onload = function(){
	      var dataURL = reader.result;
	      var img = document.getElementById('img2');
	      img.innerHTML = "<img src = '"+dataURL+"' id= 'img'  alt = '�̹��� �ε� ����' width = '600px' height = '480px'>";
	    };
      
	    reader.readAsDataURL(input.files[0]);       
   }
   function changeFunc3(event) {
	   var input = event.target;

	    var reader = new FileReader();
	    reader.onload = function(){
	      var dataURL = reader.result;
	      var img = document.getElementById('img3');
	      img.innerHTML = "<img src = '"+dataURL+"' id= 'img'  alt = '�̹��� �ε� ����' width = '600px' height = '480px'>";
	    };
      
	    reader.readAsDataURL(input.files[0]);       
   }
   function cancel_button(category_num,pageNum){
      if(category_num==1)
         window.location="top_product?category_num="+category_num+"&pageNum="+pageNum;
      else if(category_num==2)
         window.location="bottoms_product?category_num="+category_num+"&pageNum="+pageNum;
      else if(category_num==3)
         window.location="accessory_product?category_num="+category_num+"&pageNum="+pageNum;
      else if(category_num==4)
         window.location="others?category_num="+category_num+"&pageNum="+pageNum;
   }
   
   </script>
</head>
<body>
      <div class="product_regist_title"><img src="resources/shop_image/product_regist_title.png"></div>
      
      <form:form commandName = "product"  name="product_form" enctype = "multipart/form-data" >
      <div class="product_regist_content">
         <div class="product_regist_img">
            <div class="regist_content1">��ǰ �̹���</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            <div class="img_content" id="img">�̹��� �����</div>
            <div class="img_regist">
          	<form:input path="img_stream_1" type = "file" onChange="changeFunc(event)" />
            </div>
         </div>
         <div class="regist_product2">
         <div id="img_type"></div>
         <div class="regist_content1">ī�װ�</div>   
         <div class="product_regist_category">
            <form:select path = "pro_category" cssErrorClass = "errors">
               <form:option value="1">����</form:option>
               <form:option value="2">����</form:option>
               <form:option value="3">�Ǽ��縮</form:option>
               <form:option value="4">��Ÿ</form:option>   
            </form:select>
         </div>
         <div class="regist_content1">��ǰ �̸�</div>
         <div class="product_regist_name">
            <form:input path = "pro_name" cssClass = "input_text" cssErrorClass = "errors" />   
         </div>
         <div class="regist_content1">����</div>
         <div class="product_regist_price">
            <form:input path = "pro_price" cssClass = "input_text" cssErrorClass = "errors" />   
         </div>
         <div class="regist_content1">������</div>
         <div class="product_regist_size">
            <form:input path = "pro_size" cssClass = "input_text" cssErrorClass = "errors" />
         </div>
         <div class="regist_content1">��ǰ ����</div>
         <div class="product_regist_amount">
            <form:input path = "pro_amount" cssClass = "input_text" cssErrorClass = "errors" />   
         </div>
         </div>
         <div class="product_regist_img_2">
            <div class="regist_content1">��ǰ �� �̹��� 1</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            <div class="img_regist">
          	<form:input path="img_stream_2" type = "file" onChange="changeFunc2(event)" />
            </div>
            <div class="img_content2" id="img2">�̹��� �����</div>
         </div>
         <div class="product_regist_img_3">
            <div class="regist_content1">��ǰ �� �̹��� 2</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            <div class="img_regist">
          	<form:input path="img_stream_3" type = "file" onChange="changeFunc3(event)" />
            </div>
            <div class="img_content3" id="img3">�̹��� �����</div>
         </div>
       
         <div class="regist_product3">
            <div class="regist_content1">��ǰ �� ���� </div>
            <div class="product_regist_explain">
            <form:textarea path = "pro_explain" rows="9" cols="61" />
            </div>
         </div>
         <div class="button_wrap">
            <input type="submit" class="product_enroll_button" value="��ǰ ���"/>
            <a class="product_list_button" onClick="cancel_button('${category_num}','${pageNum}')">���</a>
         </div>
      </div>
      </form:form>
</body>
</html>