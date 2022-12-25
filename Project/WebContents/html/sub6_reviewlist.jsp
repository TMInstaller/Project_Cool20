<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<section class="notice">
			<div class="page-title">
				<div class="container">
					<h4>
						<b>REVIEW</b>
					</h4>
				</div>
			</div>

			<%
			String loginid = "";
			loginid = (String) session.getAttribute("LOGINID");
			if (loginid == "") {
			%>
			<script>
				alert('로그인 후 이용하실 수 있습니다');
				history.go(-1);
			</script>
			<%
			}
			%>

			<!-- board list area -->
			<div id="board-list">
				<div class="container">
					<table class="board-table">
						<thead>
							<tr>
								<th scope="col" class="th-num">NO.</th>
								<th scope="col" class="th-title">제목</th>
								<th scope="col" class="th-date">작성자</th>
								<th scope="col" class="th-date">작성일</th>
							</tr>
						</thead>
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
							<tbody>
								<tr>
									<td>${r.id}</td>
									<th><a href="sub6_review_modify.jsp?rid=${r.id}">${r.title}</a></th>
									<td name="username">${r.username}</td>
									<td>${r.created_at}</td>
								</tr>

							</tbody>
						</c:forEach>
						<%
						}
						%>
					</table>
					<table class="board-table">
						<tr align="center">
							<td colspan="5"><input type="button" value="게시글 작성" onclick="location.href='sub6_review_create.jsp'"></td>
						</tr>
					</table>
				</div>
			</div>

		</section>


		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>

</body>
</html>