<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>상품목록</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/itemlist.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />
		<div class="content">
			<%
			request.setCharacterEncoding("utf-8");
			String pageNumberStr = request.getParameter("page");
			int pageNumber = 1;
			if (pageNumberStr != null) {
				pageNumber = Integer.parseInt(pageNumberStr);
			}
			String target = "";
			Connection conn = ConnectionProvider.getConnection();
			ItemListView listView = null;
			String keyword = request.getParameter("frm1");
			List<Project_Items> list = null;
			try {
				Project_ItemsDao dao = new Project_ItemsDao();
				list = dao.selectLike(conn, keyword);
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			if (list != null) {
			%>
			<form method="post">
				<c:forEach var="p" items="<%=list%>">
					<table border="1" width="50%" height=200 bgcolor=#11a9c1 bordercolor="white" cellspacing="5">
						<tr align="center" bgcolor="white">
							<td rowspan="3"><a href="sub9_purchase.jsp?iid=${p.id}"> <img src="/Project/downloadImage/${p.image}" width=240px height=240px />
							</a></td>
							<td colspan="2">${p.name}</td>
						</tr>
						<tr align="center" bgcolor="white">
							<td colspan="4">Cool20</td>
						</tr>
						<tr align="center" bgcolor="white">
							<td colspan="4">${p.price}원</td>
						</tr>
						<tr align="center" bgcolor="white">
							<td colspan="4">colspan 사용</td>
						</tr>
					</table>
				</c:forEach>
			</form>
			<div id="number">
				<c:forEach var="i" begin="1" end="${listView.itemTotalCount}">
					<a href="sub3_itemlist.jsp?page=${i}">[${i}]</a>
				</c:forEach>

			</div>

			<%
			} else {
			%>
			<div><%=list%>가 비어있습니다
			</div>
			<%
			}
			%>

		</div>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>
</body>
</html>