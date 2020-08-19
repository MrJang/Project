<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
   function list(){
      history.go(-1);
   }
   
   function deletemessage(write_num){
      alert('�����Ͻðڽ��ϱ�?');
      location.href = "../safe/Messagedelete?write_num=" + write_num;
   }
   
   function requestSuccess(write_id,board_num,send_id){
      
      
      location.href = "../safe/selectchildren?write_id=" + write_id + "&board_num="+board_num + "&send_id="+send_id;
   }
   function requestSuccess1(write_id,send_id,category){
      var r = confirm("��û�����ðڽ��ϱ�?");
      if( r == true) {
         location.href = "../safe/selectFemale?write_id=" + write_id + "&send_id="+send_id + "&category="+category;   
      }else {
         return;
      }
      
   }
</script>
</head>
<body>
   <table>
      <tr>
         <td>���� ��� :</td>
         <td>${message.write_id}</td>
      </tr>

      <tr>
         <td>�޴»�� :</td>
         <td>${message.send_id}</td>
      </tr>

      <tr>
         <td>����</td>
         <td>${message.m_content}</td>
      </tr>

      <tr>
         <td>�ۼ���¥ :</td>
         <td>${message.reg_date}</td>
      </tr>

      <tr>
         <td colspan="2">
         <a href="#" onclick="list()">�������</a> 
         <a href="#" onclick="deletemessage(${message.write_num})">�����ϱ�</a>
         </td>

      </tr>
      
      <c:if test="${message.category == 1}">
      <tr align="center">
      
      <td colspan="2">
      
         <a href="#" onclick="requestSuccess('${message.write_id}',${message.board_num},'${message.send_id}')">��ûȮ��</a> 
      
      </td>
      
      </tr>
      </c:if>
      <c:if test="${message.category==2 }">
      <tr align="center">
         <td colspan="2">
            <a href="#" onclick="requestSuccess1('${message.write_id}','${message.send_id}','${message.category}')">������ûȮ��</a>
         </td>
      </tr>
      </c:if>
   </table>

</body>
</html>