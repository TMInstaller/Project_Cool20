<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>모자</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/Pants.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />
		<div class="content">
			<%
			Connection conn = ConnectionProvider.getConnection();
			List<Project_Items> list = null;
			try {
				Project_ItemsDao dao = new Project_ItemsDao();
				list = dao.selectHat(conn);
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			if (list != null) {
			%>
			<form method="post">
				<c:forEach var="p" items="<%=list%>">
					<div class="prolist">
						<a href="sub9_purchase.jsp?iid=${p.id}"> <img src="/Project/downloadImage/${p.image}" width=360px height=360px />
						</a> ${p.name}&nbsp; ${p.price}원
					</div>
				</c:forEach>
			</form>


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