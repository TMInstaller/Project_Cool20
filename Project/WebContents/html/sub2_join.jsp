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

<style type="text/css">
</style>
</head>

<body>

	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<div class="rightcon">
			<div class="tablestyle">
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
				<div class="chuka_joinComplete">
					<div class="joinComplete">
						<h3>
							<img src="images/폭죽.png" width=300px height=300px />
						</h3>
						<p class="desc">가입완료!!!</p>
						<p class="desc">쿨20 회원가입을 진심으로 환영합니다.</p>
					</div>
					<div class="button">
						<a href="sub1_loginform.jsp"><img src="images/login.gif" alt="로그인" width=150 height=60px /></a> <a href="project.jsp"><img src="images/main.gif" alt="메인으로 이동" width=200 height=60px /></a>
					</div>
				</div>
			</div>
		</div>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>

</body>

</html>