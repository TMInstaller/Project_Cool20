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
<title>로그인</title>
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


		<div id="login_content">
			<div class="login-wrapper">
				<% request.setCharacterEncoding("utf-8"); %>
				<jsp:useBean id="user" class="my.model.Project_User" />
				<jsp:setProperty property="*" name="user" />
				<%
					Connection conn = ConnectionProvider.getConnection();
				try{
					Project_UserDao dao = new Project_UserDao();
					if(dao.selectById(conn, user.getUsername()) == null){
						%>
						<script type="text/javascript">
								alert("아이디 혹은 패스워드가 다릅니다. 다시 입력해주세요");
								history.go(-1);
							</script>
						<%
					}else if(dao.checkPassword(conn, user.getUsername(), user.getPassword())){
						session.setAttribute("LOGINID", user.getUsername());
						session.setAttribute("LOGINNAME", user.getP_name());
						response.sendRedirect("/Project/html/project.jsp");
					}else{
				%>
				<script type="text/javascript">
						alert("아이디 혹은 패스워드가 다릅니다. 다시 입력해주세요");
						history.go(-1);
					</script>
				<%
					}
				}catch(SQLException e){}
					finally{
						JdbcUtil.close(conn);
				}
				%>
			</div>
		</div>


		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>


</body>

</html>



