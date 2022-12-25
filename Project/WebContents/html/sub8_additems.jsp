<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="my.dao.Project_ItemsDao"%>
<%@page import="my.model.Project_Items"%>
<%@page import="my.util.JdbcUtil"%>
<%@page import="com.mysql.cj.jdbc.JdbcConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="my.util.ConnectionProvider"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>상품관리</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/review.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<div class="page_content">

			<%
			String location = "C:\\Users\\백동열\\git\\repository\\Project\\WebContents\\downloadImage";
			int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트   
			MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String name = multi.getParameter("name");

			String memo = multi.getParameter("memo");
			int price = Integer.parseInt(multi.getParameter("price"));
			String image = multi.getFilesystemName("image");
			int fav = 0;

			Connection conn = ConnectionProvider.getConnection();
			java.util.Date created_at = new java.util.Date();
			Project_Items items = new Project_Items(0, name, memo, image, price, fav, created_at, created_at);
			try {
				Project_ItemsDao dao = new Project_ItemsDao();
				dao.insert(conn, items);
			} catch (SQLException e) {
			}
			%>
			<div class="rightcon">
				<div class="tablestyle">
					파일이 업로드 되었습니다.!! 상품명 =
					<%=name%>
					<br> 종류 = <%=memo%> <br> 가격 = <%=price%> <br> 이미지 = <%=image%> <br>
				</div>
				<a href="sub8_additemsform.jsp">상품 더 추가하기</a>
			</div>
		</div>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>
</body>
</html>
