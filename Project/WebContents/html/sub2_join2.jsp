<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html
      PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회원가입</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/join.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
</style>
</head>

<body>

	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<div class="rightcon">
			<div class="tablestyle">
				<!-- Connection 연결 -->
				<%
				request.setCharacterEncoding("utf-8");
				%>
				<jsp:useBean id="username" class="my.model.Project_User" />
				<jsp:setProperty property="*" name="username" />
				<%
				Connection conn = ConnectionProvider.getConnection();
				try {
					Project_UserDao dao = new Project_UserDao();
					username.setCreated_at(new java.util.Date());
					dao.insert(conn, username);
				} catch (SQLException e) {
				} finally {
					JdbcUtil.close(conn);
				}
				%>
				<!-- 웹에서 출력되는 부분 -->
				회원가입을 축하합니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			</div>
		</div>

		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>
</body>

</html>