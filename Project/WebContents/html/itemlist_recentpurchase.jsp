<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>최근 구매 상품</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/Pants.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<%
	String username = (String) session.getAttribute("LOGINID");
	Connection conn = ConnectionProvider.getConnection();
	List<Project_Purchase> list = null;
	int count = 1;
	try {
		Project_PurchaseDao dao = new Project_PurchaseDao();
		list = dao.showPurchase(conn, username);
	} catch (SQLException e) {
	} finally {
		JdbcUtil.close(conn);
	}
	if (list != null) {
	%>
	<c:forEach var="p" items="<%=list%>">
		<div class="prolist">
			<%=count%>: ${p.item_name}
		</div>
		<%
		count += 1;
		%>
	</c:forEach>
	<%
	} else {
	%>
	<div><%=list%>가 비어있습니다
	</div>
	<%
	}
	%>

</body>
</html>