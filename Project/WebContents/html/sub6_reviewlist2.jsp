<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>REVIEW</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/Pants.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<div class="rightcon">
			<div class="tablestyle">
				<table width="700" id="registerform">
					<tr>
						<td colspan="5"><input type="button" value="리뷰 작성" onclick="location.href='sub6_review_create.jsp'"></td>
					</tr>
					<tr>
						<th scope="col">NO.</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일자</th>
					</tr>
					<%
					String loginid = "";
					loginid = (String) session.getAttribute("LOGINID");
					if (loginid == "") {
					%>
					<script type="text/javascript">
						alert('로그인 후 이용하실 수 있습니다');
						history.go(-1);
					</script>
					<%
					}
					%>

					<%
					Connection conn = ConnectionProvider.getConnection();
					List<Project_Review> list = null;
					try {
						Project_ReviewDao dao = new Project_ReviewDao();
						list = dao.selectList(conn);
					} catch (SQLException e) {
					} finally {
						JdbcUtil.close(conn);
					}
					if (list != null) {
					%>
					<c:forEach var="r" items="<%=list%>">
						<tr>
							<td>${r.id}</td>
							<td><a href="sub6_review_modify.jsp?rid=${r.id}">${r.title}</a></td>
							<td name="username">${r.username}</td>
							<td>${r.created_at}</td>

						</tr>
					</c:forEach>
					<%
					}
					%>

				</table>
			</div>
		</div>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>
</body>
</html>
