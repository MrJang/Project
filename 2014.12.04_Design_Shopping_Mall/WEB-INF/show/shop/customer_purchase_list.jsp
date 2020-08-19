<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="purchase_list_title" style="float:left;"><img src="resources/shop_image/purchase_list_title.png"></div>
   <div class="product_list_search_bar">
      <form name="search_form" method="post" action="select_purchase?pageNum=1&category_num=6&mode=select">
         <div class="search_bar_title">검색</div>
         <div class="search_category">
         <select name="search_category">
            <option value="pro_name">상품 이름</option>
            <option value="p_price" >상품 가격</option>
            <option value="mem_name" >판매자</option>
         </select>
         </div>
         <div class="search_content">
            <input type="text" name='search_content'/>
         </div>
         <input type=submit class="search_button" value="검색"/>
      </form>
      </div>
      <div class="purchase_list_content">
      <div class="purchase_list_content_title">
               <div class="purchase_title_item"><img src="resources/shop_image/purchase_title_1.png"></div>
               <div class="purchase_title_item1"><img src="resources/shop_image/purchase_title_2.png"></div>
               <div class="purchase_title_item1"><img src="resources/shop_image/purchase_title_3.png"></div>
               <div class="purchase_title_item1"><img src="resources/shop_image/purchase_title_4.png"></div>
               <div class="purchase_title_item2"><img src="resources/shop_image/purchase_title_5.png"></div>
               <div class="purchase_title_item2"><img src="resources/shop_image/purchase_title_6.png"></div>
         
      </div>
      <c:choose>
      <c:when test="${list_exist=='yes'}">
      <c:forEach var="Purchase" items="${purchase_list}" begin="${start_row_num}" end="${start_row_num+7}">
         <div class='list_item_frame2'>
            <c:choose>
            <c:when test="${mode=='select'}">
            <div class='product_list_image2'>   
            <img src = "../shop_item/${Purchase.pro_img}" width = "50px" height = "40px" alt = "X">                  
           
            </div>
            <div class="purchase_content_wrap">
            <div class="Pruchase_list_wrap" onClick = "window.location = 'select_purchase_view?pageNum=${pageNum}&pro_num=${Purchase.pro_num}&p_num=${Purchase.p_num}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'" ></div>
               <div class="purchase_list_item1">${Purchase.pro_name}</div>
               <div class="purchase_list_item2">${Purchase.mem_name}</div>
               <div class="purchase_list_item3">${Purchase.p_amount}</div>
               <div class="purchase_list_item4">${Purchase.p_price} 원</div>
               <div class="purchase_list_item5">${Purchase.p_date}</div>
               <div class="purchase_list_item6">${Purchase.p_status}</div>
            </div>
            <c:choose>
                  <c:when test="${Purchase.p_status=='입금대기'}">
                     <div class="purchase_delete" onclick="window.location='purchase_delete?p_num=${Purchase.p_num}'">구매취소</div>
                  </c:when>
                  <c:when test="${Purchase.p_status=='배송중'}">
                     <div class="deliver_confirm" onclick="window.location='purchase_complete?p_num=${Purchase.p_num}'">수취확인</div>
                  </c:when>
            </c:choose>
            </c:when>
            <c:otherwise>
            <div class='product_list_image2'>   
            <img src = "../shop_item/${Purchase.pro_img}" width = "50px" height = "40px" alt = "X">                 
            </div>
            <div class="purchaset_content_wrap">
            <div class="Pruchase_list_wrap" onClick = "window.location = 'purchase_view?pageNum=${pageNum}&p_num=${Purchase.p_num}&category_num=${category_num}'" >
               <div class="purchase_list_item1">${Purchase.pro_name}</div>
               <div class="purchase_list_item2">${Purchase.mem_name}</div>
               <div class="purchase_list_item3">${Purchase.p_amount}</div>
               <div class="purchase_list_item4">${Purchase.p_price} 원</div>
               <div class="purchase_list_item5">${Purchase.p_date}</div>
               <div class="purchase_list_item6">${Purchase.p_status}</div>
            </div>   
               <c:choose>
                  <c:when test="${Purchase.p_status=='입금대기'}">
                     <div class="purchase_delete" onclick="window.location='purchase_delete?p_num=${Purchase.p_num}'">구매취소</div>
                  </c:when>
                  <c:when test="${Purchase.p_status=='배송중'}">
                     <div class="deliver_confirm" onclick="window.location='purchase_complete?p_num=${Purchase.p_num}'">수취확인</div>
                  </c:when>
               </c:choose>
            
            </div>
            </c:otherwise>
            </c:choose>   
         </div>
         </c:forEach>
      </c:when>
      <c:otherwise>
         <center>등록된 제품이없습니다.</center>
      </c:otherwise>
      </c:choose>
      </div>
      <div class="page_num">
      <c:choose>
      <c:when test="${list_exist=='yes'}">
       <c:choose>
        <c:when test="${mode=='select'}">
           <a href='#' onClick="window.location='select_purchase?pageNum=${start_pageNum}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'"><img src="resources/shop_image/start_page_img.png" style="float:left;"></a>
         <c:forEach var="page_list" items="${page_list}">
            <a class="page_num_wrap"  onClick="window.location='select_purchase?pageNum=${page_list}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'">   
               ${page_list}
            </a>   
         </c:forEach>   
         <a href='#' onClick="window.location='select_purchase?pageNum=${end_pageNum}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'"><img src="resources/shop_image/end_page_img.png" style="float:left;"></a>
        
        </c:when>
        <c:when  test="${mode=='nomal'}">   
         <a href='#' onClick="window.location='customer_purchase_list?pageNum=${start_pageNum}&category_num=${category_num}'"><img src="resources/shop_image/start_page_img.png" style="float:left;"></a>
         <c:forEach var="page_list" items="${page_list}">
            <a class="page_num_wrap"  onClick="window.location='customer_purchase_list?pageNum=${page_list}&category_num=${category_num}'">   
               ${page_list}
            </a>   
         </c:forEach>   
         <a href='#' onClick="window.location='customer_purchase_list?pageNum=${end_pageNum}&category_num=${category_num}'"><img src="resources/shop_image/end_page_img.png" style="float:left;"></a>
        </c:when>
        </c:choose>
      </c:when>
      </c:choose>
      </div>
      <div class="button_wrap">
            <a class="product_list_button" onClick = "window.location = 'customer_purchase_list?pageNum=1&category_num=6'">목록</a>
      </div>
      
   
</body>
</html>