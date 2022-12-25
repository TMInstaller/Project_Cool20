<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>장바구니</title>
<!-- css파일 삽입 위치 -->
   <link href="../css/project.css" rel="stylesheet" type="text/css" />
   <link href="../css/purchase_style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrap">
      <!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false"/>
		
	<b><center> 장바구니 목록 </center></b>
   <br><br>
   <hr><br><br>
	<%   
		Integer pCount=(Integer)session.getAttribute("pCount");
		Project_Cart cart = null;
		if(pCount != null){
	    for(int i=1; i<= pCount.intValue(); i++) {
	    	cart = (Project_Cart)session.getAttribute("p" + i);
	%>
   		<img src = "/Project/downloadImage/<%= cart.getImage() %>" width=50, height=50> 
   		구매수량: <%= cart.getAmount() %> <br>
  		<%   }}    %>

   <hr>
   <a href= "/Project/html/project.jsp"> 메인 페이지로 돌아가기 </a>&nbsp;  
   <a onclick= "deleteCart()"> 카트 비우기 </a>
   <input type="button" value="전체 구매하기" onclick="purchaseCart()">
   <br><br>

      <!-- page_footer 삽입 위치 -->
      <jsp:include page="../global/page_footer.jsp" flush="false"/>
	</div>

<script>
   function purchaseCart() {
      var input = confirm('구매하시겠습니까?');
      if (input) {
         window.open("/Project/html/sub9_purchaseall.jsp","구매");
      }
   }
   
   function deleteCart(){
	   //pCount=null;
	   //for(int i=1; i<= pCount.intValue(); i++) {
	   // 	session.removeAttribute("p" + i);
	   //}
   }
   </script>

</body>
</html>
