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

		<div class="rightcon">
			<div class="tablestyle">


				<%
				Connection conn = ConnectionProvider.getConnection();
				String userId = (String) session.getAttribute("LOGINID");
				int rid = Integer.parseInt(request.getParameter("rid"));
				Project_Review review = new Project_Review();
				try {
					String owner = (String) review.getUsername();
					Project_ReviewDao dao = new Project_ReviewDao();
					review = dao.selectById(conn, rid);

				} catch (SQLException e) {
				} finally {
					JdbcUtil.close(conn);
				}
				if (review != null) {
				%>
				<c:set var="r" value="<%=review%>" />
				<div class="rightcon">
					<div class="tablestyle">
						<form action="sub6_review_update.jsp" method="post" enctype="multipart/form-data">
							<%
							if (userId.equals(review.getUsername())) {
							%>
							<table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
								<input type="hidden" name="rid" value="${r.id}">
								<input type="hidden" name="item_name" value="${r.item_name}">
								<input type="hidden" name="score" value="${r.score}">
								<tr>
									<th><label for="titlefield">제 목</label></th>
									<td><input name="title" type="text" value="${r.title}" size="70"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${r.username}</td>
								</tr>
								<tr>
									<th><label for="namefield">제 품 명</label></th>
									<td>${r.item_name}</td>
								</tr>
								<tr>
									<th><label for="memo">본 문</label></th>
									<td><textarea name="content" cols="70" rows="10" id="memo">${r.content}</textarea></td>
								</tr>
								<tr>
									<th><label for="scorefield">점 수</label></th>
									<td>${r.score}</td>
								</tr>
								<tr>
									<th><label for="image">현재 이미지</label></th>

									<td><label for="image"><img src="/Project/reviewImage/${r.image}" width=300, height=300>현재 사진<br></label> <!-- <input type="file" name="image" id="image"> --></td>
								</tr>
								<tr>
									<th><label for="image">변경될 이미지</label></th>

									<!-- <input type="file" name="image" id="image"> -->
									<td>
										<form runat="server">
											<img id="blah" src="#" alt="your image" /> <input accept="image/*" type='file' id="imgInp" name="image" />
										</form>
									</td>
								</tr>
								<tr>
									<td height="30" colspan="2" align="center" class="btnstyle"><input type="submit" name="send" id="send" value="리뷰 수정"> <input type="button" value="리뷰 삭제" onclick="location.href='sub6_review_delete.jsp?rid=${r.id}'"> <input type="button" value="리뷰 목록으로" onclick="location.href='sub6_reviewlist.jsp'"></td>
								</tr>
							</table>

							<%
							} else {
							%>
							<table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
								<tr>
									<th>제 목</th>
									<td>${r.title}</td>
								</tr>
								<tr>
									<th>* 작성자</th>
									<td>${r.username}</td>
								</tr>
								<tr>
									<th>제 품 명</th>
									<td>${r.item_name}</td>
								</tr>
								<tr>
									<th>본 문</th>
									<td>${r.content}</td>
								</tr>
								<tr>
									<th><label for="scorefield">점 수</label></th>
									<td>${r.score}</td>
								</tr>
								<tr>
									<th>사 진</th>
									<td><img src="/Project/reviewImage/${r.image}" width=500, height=500></td>
								</tr>
							</table>
							<input type="button" value="리뷰 목록으로" onclick="location.href='sub6_reviewlist.jsp'">
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
			<script>
imgInp.onchange = evt => {
  const [file] = imgInp.files
  if (file) {
    blah.src = URL.createObjectURL(file)
  }
}
</script>
</body>
</html>