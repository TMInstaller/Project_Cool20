<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="my.dao.Project_ReviewDao"%>
<%@page import="my.model.Project_Review"%>
<%@page import="my.util.JdbcUtil"%>
<%@page import="com.mysql.cj.jdbc.JdbcConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="my.util.ConnectionProvider"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>리뷰</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<%
		String loginid = null;
		loginid = (String) session.getAttribute("LOGINID");
		if (loginid == null) {
		%>
		<script>
			alert('로그인 후 이용하실 수 있습니다');
			history.go(-1);
		</script>
		<%
		}
		%>
		<div class="page_content">

			<%
			String location = "C:\\Users\\백동열\\git\\repository\\Project\\WebContents\\reviewImage";
			int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트
			int count = 0;
			MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String title = multi.getParameter("title");
			String item_name = multi.getParameter("item_name");
			String content = multi.getParameter("content");
			String image = multi.getFilesystemName("image");
			int score = Integer.parseInt(multi.getParameter("score"));

			Connection conn = ConnectionProvider.getConnection();
			java.util.Date now = new java.util.Date();
			java.util.Date unow = null;
			Project_Review review = new Project_Review(loginid, title, item_name, content, score, image, now, now);

			Project_Items item = new Project_Items();
			Project_ItemsDao idao = new Project_ItemsDao();
			item = idao.selectByName(conn, item_name);
			if (item.getName().equals(null)) {
			%>
			<script type="text/javascript">
				alert("판매중인 상품명이 아닙니다");
				history.go(-1);
			</script>
			<%
			}
			try {
			Project_ReviewDao dao = new Project_ReviewDao();
			count = dao.possible(conn, item.getName());
			} catch (SQLException e) {
			}
			if (count > 1) {
			%>
			<script type="text/javascript">
				alert("이미 해당 제품에 대해 리뷰를 작성하셨습니다");
				history.go(-1);
			</script>
			<%
			}
			try {
			Project_ReviewDao dao = new Project_ReviewDao();
			dao.insert(conn, review);
			} catch (SQLException e) {
			} finally {
			JdbcUtil.close(conn);
			}
			%>
			<div class="rightcon">
				<div class="tablestyle">
					리뷰 작성이 완료되었습니다.!! 상품명 =
					<%=title%>
					<br> 종류 = <%=item_name%> <br> 가격 = <%=score%> <br> 이미지 = <%=image%> <br>
				</div>
				<a href="sub6_reviewlist.jsp">리뷰 구경하러 가기</a>
			</div>
		</div>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>
</body>
</html>
