<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
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

		<section class="notice">
			<div class="page-title">
				<div class="container">
					<h4>
						<b>NOTICE</b>
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
								<%
								if (loginid.equals("admin")) {
								%>
								<th scope="col" class="th-date">수정</th>
								<th scope="col" class="th-date">삭제</th>
								<%
								}
								%>
							</tr>
						</thead>
						<%
						Connection conn = ConnectionProvider.getConnection();
						List<Project_Notice> list = null;
						try {
							Project_NoticeDao dao = new Project_NoticeDao();
							list = dao.selectList(conn);
						} catch (SQLException e) {
						} finally {
							JdbcUtil.close(conn);
						}
						if (list != null) {
						%>
						<c:forEach var="b" items="<%=list%>">
							<tbody>
								<tr>
									<td>${b.notice_id}</td>
									<th><a href="sub7_notice_Modify.jsp?notice_id=${b.notice_id}">${b.notice_title}</a></th>
									<td>${b.userid}</td>
									<td>${b.notice_date}</td>

									<%
									if (loginid.equals("admin")) {
									%>
									<td><input type="button" value="수정" onclick="location.href='sub7_notice_Modify.jsp?notice_id=${b.notice_id}'"></td>
									<td><input type="button" value="삭제" onclick="location.href='sub7_notice_delete.jsp?notice_id=${b.notice_id}'"></td>
									<%
									} else {
									%>
									<%
									}
									%>

								</tr>

							</tbody>
						</c:forEach>
						<%
						}
						%>
						<tr align="center">
							<%
							if (loginid.equals("admin")) {
							%>
							<td colspan="5"><input type="button" value="게시글 작성" onclick="location.href='sub7_notice_create.jsp'"></td>
							<%
							}
							%>
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