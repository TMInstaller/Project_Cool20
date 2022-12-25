<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@page import="my.util.ConnectionProvider"%>
<!-- jstl 명시 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html
   PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>로그아웃</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/login.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
</style>
</head>

<body>

	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<%
			session.removeAttribute("LOGINID");
			response.sendRedirect("/Project/html/project.jsp");
		%>

		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>


</body>

</html>



