<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>구매</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/purchase_style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<%
		String userId = (String) session.getAttribute("LOGINID");
		Connection conn = ConnectionProvider.getConnection();

		int iid = Integer.parseInt(request.getParameter("iid"));
		int amount = Integer.parseInt(request.getParameter("amount"));

		Project_Items item = null;
		try {
			Project_ItemsDao dao = new Project_ItemsDao();
			item = dao.selectById(conn, iid);
			int fav = item.getFavorite() + amount;
			java.util.Date now = new java.util.Date();
			java.util.Date unow = null;
			Project_Purchase purchase = new Project_Purchase(userId, iid, item.getName(), amount, item.getPrice(), now, unow);
			Project_PurchaseDao purDao = new Project_PurchaseDao();
			purDao.insert(conn, purchase);
			dao.update(conn, fav, iid);
		} catch (SQLException e) {

		} finally {
		JdbcUtil.close(conn);
		}
		%>
		구매가 완료되었습니다 <a href="sub6_review_create.jsp">리뷰 쓰러가기</a> <a href="sub6_reviewlist.jsp">리뷰 보러가기</a>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>

</body>
</html>
