<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<section class="notice">
			<div class="page-title">
				<div class="container">
					<h4>
						<b>상품 관리</b>
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
								<th scope="col" class="th-title">상품명</th>
								<th scope="col" class="th-date">종류</th>
								<th scope="col" class="th-date">등록일</th>
								<th scope="col" class="th-num">가격</th>
								<th scope="col" class="th-num">누적 구매수량</th>
								<th scope="col" class="th-num">수정</th>
							</tr>
						</thead>
						<%
						Connection conn = ConnectionProvider.getConnection();
						List<Project_Items> list = null;
						try {
							Project_ItemsDao dao = new Project_ItemsDao();
							list = dao.selectLike(conn, "");
						} catch (SQLException e) {
						} finally {
							JdbcUtil.close(conn);
						}
						if (list != null) {
						%>
						<c:forEach var="i" items="<%=list%>">
							<tbody>
								<tr>
									<td>${i.id}</td>
									<th><a href="sub8_additems_modify.jsp?iid=${i.id}">${i.name}</a></th>
									<td>${i.memo}</td>
									<td>${i.created_at}</td>
									<td>${i.price}</td>
									<td>${i.favorite}</td>
									<td><input type="button" value="수정" onclick="location.href='sub8_additems_modify.jsp?iid=${i.id}'"></td>
								</tr>
							</tbody>
						</c:forEach>
						<%
						}
						%>
						<tr align="center">
							<td colspan="5"><input type="button" value="상품 추가" onclick="location.href='sub8_additemsform.jsp'"></td>
						</tr>
					</table>
				</div>
			</div>

		</section>
	</div>


	<!-- page_footer 삽입 위치 -->
	<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>

</body>
</html>