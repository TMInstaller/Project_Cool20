<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>상의</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/Pants.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="content">
		<%
		Connection conn = ConnectionProvider.getConnection();
		List<Project_Items> list = null;
		try {
			Project_ItemsDao dao = new Project_ItemsDao();
			list = dao.selectCloth(conn);
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
					</a> <a onclick="window.close()">${p.name}</a>
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

	<script type="text/javascript">
		var openWin;

		function openChild() {
			// window.name = "부모창 이름"; 
			window.name = "parentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			openWin = window.open("Child.html", "childForm",
					"width=570, height=350, resizable = no, scrollbars = no");
		}

		function setChildText() {
			openWin.document.getElementById("cInput").value = document
					.getElementById("pInput").value;
		}

		function getParentText() {
			document.getElementById("cInput").value = opener.document
					.getElementById("pInput").value;
		}
	</script>
</body>
</html>