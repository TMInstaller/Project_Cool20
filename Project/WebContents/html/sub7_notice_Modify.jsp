<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
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

		<div class="rightcon">
			<div class="tablestyle">


				<%
				Connection conn = ConnectionProvider.getConnection();
				String userId = (String) session.getAttribute("LOGINID");
				int nid = Integer.parseInt(request.getParameter("notice_id"));
				Project_Notice notice = null;
				try {
					Project_NoticeDao dao = new Project_NoticeDao();
					notice = dao.selectById(conn, nid);

				} catch (SQLException e) {
				} finally {
					JdbcUtil.close(conn);
				}
				if (notice != null) {
				%>
				<c:set var="b" value="<%=notice%>" />
				<div class="rightcon">
					<div class="tablestyle">
						<form action="sub7_notice_update.jsp" method="post">
							<%
							if (userId.equals("admin")) {
							%>
							<table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
								<input type="hidden" name="notice_id" value="${b.notice_id}">
								<tr>
									<th><label for="titlefield">* 제 목</label></th>
									<td><input name="notice_title" type="text" value="${b.notice_title}" size="70"></td>
								</tr>
								<tr>
									<th>* 작성자</th>
									<td>${b.userid}</td>
								</tr>
								<tr>
									<th><label for="memo">* 게시글</label></th>
									<td><textarea name="notice_content" cols="70" rows="10" id="memo">${b.notice_content}</textarea></td>
								</tr>
								<tr>
									<td height="30" colspan="2" align="center" class="btnstyle"><input type="submit" name="send" id="send" value="게시글 수정"> <input type="button" value="리스트 보기" onclick="location.href='sub7_notice_list.jsp'"></td>
								</tr>
							</table>
							<%
							} else {
							%>
							<table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
								<tr>
									<th>제 목</th>
									<td>${b.notice_title}</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${b.userid}</td>
								</tr>
								<tr>
									<th>게시글</th>
									<td>${b.notice_content}</td>
								</tr>
							</table>
							<%
							}
							%>
						</form>
					</div>
				</div>
				<%
				}
				%>

				<!-- page_footer 삽입 위치 -->
				<jsp:include page="../global/page_footer.jsp" flush="false" />
			</div>
</body>
</html>