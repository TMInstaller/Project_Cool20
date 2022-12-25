<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
			String userId = (String)session.getAttribute("LOGINID");
        	int iid = Integer.parseInt(request.getParameter("iid"));
    		Project_Items item = null;
    		try {
    			Project_ItemsDao dao = new Project_ItemsDao();
    			item = dao.selectById(conn, iid);
    			
    		}catch(SQLException e){}
    		finally { JdbcUtil.close(conn); }
    		if (item != null) {
        %>
        <c:set var="i" value="<%= item %>"/>
        <div class="rightcon">
                <div class="tablestyle">
                  <form action="sub8_additems_update.jsp" method="post" enctype="multipart/form-data">
                    <table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
                    <input type="hidden" name="iid" value="${i.id}" >
                      <tr>
                        <th><label for="titlefield">* 상 품 명</label></th>
                        <td>
                        <input name="name" type="text" value="${i.name}" size="70"></td>
                      </tr>
                      <tr>
                        <th>* 종 류</th>
                        <td>
                        <input name="memo" type="text" value="${i.memo}" size="70"></td>
                      </tr>
                      <tr>
                        <th>* 가 격</th>
                        <td>
                        <input name="price" type="text" value="${i.price}" size="70"></td>
                      </tr>
                      <tr>
                        <th>현재 사진</th>
                        <td>
                        	<img src="/Project/downloadImage/${i.image}"  width = 360px height = 360px />
                        </td>
                      </tr>
                      <tr>
                        <th>변경할 사진</th>
                        <td>
                        	<form runat="server">
							  <img id="blah" src="#" alt="your image" width="360px" height="360px"/>
							  <input accept="image/*" type='file' name="image" id="imgInp" />
							</form>
                        </td>
                      </tr>
                      
                      <tr>
                        <td height="30" colspan="2" align="center" class="btnstyle">
                        	
                          <input type="submit" name="send" id="send" value="게시글 수정">
                          <input type="button" value="삭제" onclick="location.href='sub8_additems_delete.jsp?iid=${i.id}'">
                          <input type="button" value="리스트 보기" onclick="location.href='sub8_additems_list.jsp'">
                        
                        </td>
                      </tr>
                    </table>
                   </form>
			<% }  %>
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


function del(){
	if(confirm("정말 삭제하시겠습니까?")){
		
	} else return;
}
</script>
</body>
</html>