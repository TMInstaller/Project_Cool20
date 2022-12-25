<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div id="page_header">
      <div id="header_menu">
         <div id="header_menu_right">
            <%
               String loginid = null;
               String loginname = null;
                 //세션의 값을 가져오기
                 loginid = (String)session.getAttribute("LOGINID");
                 loginname = (String)session.getAttribute("LOGINNAME");
               String admin = "admin";
            %>
            <% if(loginid==null){ %>
            <a style="cursor:default;" href="sub1_loginform.jsp">비로그인 유저입니다</a>&nbsp;&nbsp;&nbsp;
            <a href=sub2_joinform.jsp>회원가입</a> &nbsp;&nbsp;&nbsp; 
            <a href=sub1_loginform.jsp>로그인</a>
            <% }else if(loginid!=null){%>
            <a>[<%= session.getAttribute("LOGINID") %>]님 환영합니다</a> &nbsp;&nbsp;&nbsp; 
            <a href=sub9_cartview_main.jsp?>장바구니</a> &nbsp;&nbsp;&nbsp; 
            <a href=sub1_logout.jsp>로그아웃</a>
            <% }; %>
         </div>
         <div id="header_menu_left">
         <% if(loginid!=null){ %>
            <a href="sub6_reviewlist.jsp">REVIEW</a> &nbsp;&nbsp;&nbsp;
            <a href="sub7_notice_list.jsp">NOTICE</a> &nbsp;&nbsp;&nbsp;
            <% if(loginid.equals("admin")){ %>
               <a href="sub8_additems_list.jsp">상품 관리</a>&nbsp;&nbsp;&nbsp;
            <% } %>
         <% }else{ %>
           <a onclick="service()" style="cursor:pointer">REVIEW &nbsp;&nbsp;&nbsp;</a>
           <a onclick="service()" style="cursor:pointer">NOTICE &nbsp;&nbsp;&nbsp;</a>
         <% } %>
         </div>
      </div>
      <div id="search">
         <section></section>
      </div>
      <div id="page_header_logo">
         <div class="logo_top">
            <a href="project.jsp"> <img src="images/쿨20.png" width="167" height="97" />
            </a>
         </div>
      </div>

   </div>
   <%
      Connection conn = ConnectionProvider.getConnection();
      List<Project_Items> list = null;
      try{
         Project_ItemsDao dao = new Project_ItemsDao();
         list = dao.selectName(conn);
      }catch(SQLException e){}
      finally{JdbcUtil.close(conn);}
   %>
   <div id="menubar1">
      <div class="menubar_left">
         <div class="dropdown">
            <span class="dropbtn"><b>인기 구매상품&nbsp;</b></span>
            <div class="dropdown-content">
            <%
            if (list != null){
            %>
               <c:forEach var="p" items="<%= list %>">
                  <a href="sub9_purchase.jsp?iid=${p.id}">${p.name} </a>
               </c:forEach>
            <%
            }
            %>
            </div>
         </div>
      
         <div class="animated-text">
         <%
            if (list != null){
         %>
         <c:forEach var="p" items="<%= list %>">
            <div class="line">${p.name}</div>
         </c:forEach>
         <%
            }
         %>
            
         </div>
      </div>
      <div class="search">
         <form method="post">
            <input type="text" name="keyword"onkeypress="if(event.keyCode==13){searchCheck(form);}"> 
            <input type="button" value="상품검색" onclick="searchCheck(form)">
         </form>
      </div>
   </div>
   <div id="menubar2">
      <a href="sub3_itemlist.jsp">All</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="sub3_itemlist.jsp?frm1=상의">TOP</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="sub3_itemlist.jsp?frm1=하의">PANTS</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="sub3_itemlist.jsp?frm1=모자">HAT</a>
   </div>
   
   
      <script type="text/javascript">
      function service(){
          let loginId= "${LOGINID}";
          if(loginId ==""){
             alert("로그인 후 사용하실 수 있습니다");
             location.href="/Project/html/sub1_loginform.jsp";
          }
       }
      
      function searchCheck(frm1){
         if (frm1.keyword.value==""){
            alert("검색어를 입력하세요.");
            //경고문
            frm1.keyword.focus();
            //깜빡이는 상태 적용
            return;
         } else {
            frm1.submit();
            var key = frm1.keyword.value.trim();
            window.open("sub3_itemlist.jsp?frm1="+key);

            //제출
         }
      }
</script>
</body>
</html>