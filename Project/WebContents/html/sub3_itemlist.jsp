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
<link href="../css/Pants.css" rel="stylesheet" type="text/css" />
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
      Connection conn = ConnectionProvider.getConnection();
      String keyword = request.getParameter("frm1");
      if(keyword==null){
    	  keyword = "";
      }
      ItemListView listView = null;
      try{
         Project_ItemsDao dao = new Project_ItemsDao();
         listView = dao.getItemList(conn, pageNumber, keyword);
      }catch(SQLException e){}
      finally{JdbcUtil.close(conn);}
      if (listView != null){
   %>
			<form method="post">
				<div class="list_wrap">
					<c:set var="listView" value="<%= listView %>" />
					<c:forEach var="p" items="${listView.itemList}">
						<div class="prolist">
							<a href="sub9_purchase.jsp?iid=${p.id}"> <img src="/Project/downloadImage/${p.image}" width=360px height=360px />
							</a> ${p.name}&nbsp; ${p.price}원<br> <br>
						</div>
					</c:forEach>
					<div id="number">
						[${listView.currentPageNumber}/${listView.pageTotalCount}]
						<c:set var="k" value="<%= keyword %>" />
						<c:forEach var="i" begin="1" end="${listView.pageTotalCount}">
							<a href="sub3_itemlist.jsp?page=${i}&frm1=${k}">[${i}]</a>
						</c:forEach>
					</div>
				</div>
			</form>

			<%
      }
	%>

		</div>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>
</body>
</html>