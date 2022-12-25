<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<link href="../css/project.css" rel="stylesheet" type="text/css" />
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
			<%
			String username = (String) session.getAttribute("LOGINID");
			Project_Items item = new Project_Items();
			Connection conn = ConnectionProvider.getConnection();
			String location = "C:\\Users\\백동열\\git\\repository\\Project\\WebContents\\downloadImage";
			int maxSize = 1024 * 10;
			MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8", new DefaultFileRenamePolicy());
			int iid = Integer.parseInt(multi.getParameter("iid"));
			String name = multi.getParameter("name");
			String memo = multi.getParameter("memo");
			int price = Integer.parseInt(multi.getParameter("price"));
			String image = multi.getFilesystemName("image");

			Project_ItemsDao dao = new Project_ItemsDao();
			item = dao.selectById(conn, iid);
			if (image == null) {
				image = item.getImage();
			}

			java.util.Date now = item.getCreated_at();
			java.util.Date unow = new java.util.Date();
			item = new Project_Items(iid, name, memo, image, price, now, unow);

			try {
				dao.deleteById(conn, iid);
			} catch (SQLException e) {
			}
			try {
				dao.insert(conn, item);
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			%>
			<div class="rightcon">
				<div class="tablestyle">
					<h3>상품 정보 수정이 완료되었습니다.</h3>
					<br> <br> <a href="sub8_additems_list.jsp">[상품 리스트]</a>
				</div>
			</div>
		</div>

		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>

</body>
</html>