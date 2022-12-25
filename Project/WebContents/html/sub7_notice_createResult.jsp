<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/join.css" rel="stylesheet" type="text/css" />
<link href="../css/notice.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
</style>
</head>
<body>

	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<div class="page_content">
			<%
			request.setCharacterEncoding("utf-8");
			%>
			<jsp:useBean id="notice" class="my.model.Project_Notice" />
			<jsp:setProperty property="*" name="notice" />

			<%
			Connection conn = ConnectionProvider.getConnection();

			try {
				Project_NoticeDao dao = new Project_NoticeDao();
				notice.setNotice_date(new java.util.Date());
				notice.setUserid((String) session.getAttribute("LOGINID"));
				dao.insert(conn, notice);
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			%>
			<div class="rightcon">
				<div class="tablestyle">
					<h3>게시글 작성이 완료되었습니다.</h3>
					<br> <br> <a href="sub7_notice_list.jsp">[게시글 리스트]</a>
				</div>
			</div>
		</div>


		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>

</body>
</html>