<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
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
			Connection conn = ConnectionProvider.getConnection();
			Project_Review review = new Project_Review();
			String loginid = (String) session.getAttribute("LOGINID");
			String location = "C:\\Users\\백동열\\git\\repository\\Project\\WebContents\\reviewImage";
			int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트
			MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8", new DefaultFileRenamePolicy());
			int rid = Integer.parseInt(multi.getParameter("rid"));
			String title = multi.getParameter("title");
			String item_name = multi.getParameter("item_name");
			String content = multi.getParameter("content");
			String image = multi.getFilesystemName("image");
			if (image == null) {
				Project_ReviewDao dao = new Project_ReviewDao();
				review = dao.selectById(conn, rid);
				image = review.getImage();
			}
			int score = Integer.parseInt(multi.getParameter("score"));

			java.util.Date now = new java.util.Date();
			java.util.Date unow = null;
			review = new Project_Review(rid, loginid, title, item_name, content, score, image, now, now);

			Project_Items item = new Project_Items();
			Project_ItemsDao idao = new Project_ItemsDao();
			item = idao.selectByName(conn, item_name);
			if (item == null) {
			%>
			<script type="text/javascript">
				alert("판매중인 상품명이 아닙니다");
				history.go(-1);
			</script>
			<%
			}
			try {
			Project_ReviewDao dao = new Project_ReviewDao();
			dao.deleteById(conn, rid);
			} catch (SQLException e) {
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
					<h3>게시글 수정이 완료되었습니다.</h3>
					<br> <br> <a href="sub6_reviewlist.jsp">[리뷰 리스트]</a>
				</div>
			</div>
		</div>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>

</body>
</html>