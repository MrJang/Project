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
function cancel_button2(category_num,pageNum,search_category,search_content,mode){
	window.location="select_product?category_num="+category_num+"&pageNum="+pageNum+"&search_category="+search_category+"&search_content="+search_content+"&mode="+mode;
}
</script>
</head>
<body>
	
	<div class="product_regist_title"><img src="resources/shop_image/product_view_title.png"></div>
		<div class="product_view_content">
			<c:forEach var="product" items="${product_view}">
			<div class="product_regist_img">
				<div class="regist_content1">��ǰ �̹���</div>
				<div class="img_content" id="img">
				
						<img src = '../shop_item/${product.pro_img}' id= 'img'  width = '300px' height = '250px'>
			</div>
			</div>
			<div class="regist_product2">
			<div class="regist_content1">ī�װ�</div>	
			<div class="product_regist_category">
			<c:choose>
				<c:when test="${product.pro_category==1}">
				����
				</c:when>
				<c:when test="${product.pro_category==2}">
				����
				</c:when>
				<c:when test="${product.pro_category==3}">
				�Ǽ��縮
				</c:when>
				<c:when test="${product.pro_category==4}">
				��Ÿ
				</c:when>
			</c:choose>
			
			</div>
			<div class="regist_content1">�̸�</div>
			<div class="product_regist_name">
			${product.pro_name}
			</div>
			<div class="regist_content1">����</div>
			<div class="product_regist_price">
			${product.pro_price} ��
			</div>
			<div class="regist_content1">������</div>
			<div class="product_regist_size">
			${product.pro_size}
			</div>
			<div class="regist_content1">��ǰ ����</div>
			<div class="product_regist_amount">
			
			<c:choose>
			<c:when test="${product.pro_amount==0}">
					ǰ ��(��� ����)	
			</c:when>
			<c:otherwise>
					${product.pro_amount}
			</c:otherwise>
			</c:choose>
			</div>
			</div>
				<div class="product_regist_img_2">
            <div class="regist_content1">��ǰ �� �̹��� 1</div>
            <div class="img_content2" id="img2">
            	<img src = '../shop_item/${product.pro_img_2}' id= 'img'  width = '600px' height = '480px'>
            </div>
            </div>
            
            <div class="product_regist_img_3">
            <div class="regist_content1">��ǰ �� �̹��� 2</div>
            <div class="img_content3" id="img3">	
            	<img src = '../shop_item/${product.pro_img_3}' id= 'img'  width = '600px' height = '480px'>
            </div>
            </div>
			<div class="regist_product3">
				<div class="regist_content1">��ǰ �� ���� </div>
				<div class="product_regist_explain">
				${product.pro_explain}
				</div>
			</div>
			
			<div class="seller_wrap">
			<div class="seller_title">�Ǹ��� ����</div>
				<div class="seller_profile_title">
					<div class="profile_img">�Ǹ���</div>
					<div class="profile_name">�Ǹ��� �̸�</div>
					<div class="profile_phone">�Ǹ����� ����ó</div>
				</div>
				<div class="profile_img_item"><img src="profile/${product.mem_img}" width="120px" height="90px"></div>
				<div class="profile_name_item">${product.mem_name}</div>
				<div class="profile_phone_item">${product.mem_phone}</div>
				<div class="d_shop_button"><a href="#" onclick="window.location='d_shop?des_num=${product.des_num}'"><img src="resources/shop_image/d_shop_button.png"></a></div>
			</div>
			
			<div class="view_button_wrap">
			
			<c:choose>
			<c:when test="${product.pro_amount==0}">
					��ǰ�� ������ּż� �����մϴ�.
			</c:when>
			<c:when test="${((product.pro_amount!=0) && (des_num==My_design_num) && (des_num!=0))}">	
				<a href="#" class="product_purchase_button" onClick="window.location='product_purchase?pro_num=${product.pro_num}&pageNum=${pageNum}&category_num=${category_num}'">�����ϱ�</a>
				<a class="product_cart_button" onClick="window.location='cart_regist?pro_num=${product.pro_num}&category_num=5'">��ٱ���</a>
				<c:choose>
				<c:when test="${mode=='select'}">
					<a class="product_modify_button" onClick="window.location='product_modify?pro_num=${product.pro_num}&pageNum=${pageNum}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'">��ǰ����</a>
					<a class="product_list_button2" onClick="cancel_button2(${category_num},${pageNum},'${search_category}','${search_content}','${mode}')">���</a>
					<a class="product_delete_button" onclick="widnow.loaction='delete_product?pro_num=${product.pro_num}&category_num=${product.pro_category}'">��ǰ ����</a>
				</c:when>
				<c:otherwise>
					<a class="product_modify_button" onClick="window.location='product_modify?pro_num=${product.pro_num}&pageNum=${pageNum}&category_num=${category_num}'">��ǰ����</a>
					<a class="product_list_button2" onClick="cancel_button(${category_num},${pageNum})">���</a>
					<a class="product_delete_button" onclick="window.location='delete_product?pro_num=${product.pro_num}&category_num=${product.pro_category}'">��ǰ ����</a>
				</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<a href="#" class="product_purchase_button" onClick="window.location='product_purchase?pro_num=${product.pro_num}&pageNum=${pageNum}&category_num=${category_num}'">�����ϱ�</a>
				<a class="product_cart_button" onClick="window.location='cart_regist?pro_num=${product.pro_num}&category_num=5'">��ٱ���</a>
				<c:choose>
					<c:when test="${mode=='select'}">
						<a class="product_list_button2" onClick="cancel_button2(${category_num},${pageNum},'${search_category}','${search_content}','${mode}')">���</a>
					</c:when>
					<c:otherwise>
						<a class="product_list_button" onClick="cancel_button(${category_num},${pageNum})">���</a>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
			</c:choose>
			</div>
			</c:forEach>
	
			
		</div>
	
	
</body>
</html>