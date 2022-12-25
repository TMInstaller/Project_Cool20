<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html
   PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>싸고 예쁜 쇼핑몰 쿨20</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style type="text/css">
</style>
</head>

<body>

	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<!-- project.jsp 프로모션 이미지 부분 -->
		<div id="page_content">
			<!-- class: slides == 하단 점으로 해당 순서의 사진으로 이동 -->
			<!-- class: nav == 이전 사진으로, 다음 사진으로 이동 -->
			<ul class="slides">
				<input type="radio" name="radio-btn" id="img-1" checked />
				<li class="slide-container">
					<div class="slide">
						<a href="/Project/html/advertisement/ad_movie.jsp"> <img src="images/EventPage1.png" />
						</a>
					</div>
					<div class="nav">
						<label for="img-6" class="prev">&#x2039;</label> <label for="img-2" class="next">&#x203a;</label>
					</div>
				</li>

				<input type="radio" name="radio-btn" id="img-2" />
				<li class="slide-container">
					<div class="slide">
						<a href="sub3_itemlist.jsp?frm1=상의"> <img src="images/cloth3_4.png" />
						</a>
					</div>
					<div class="nav">
						<label for="img-1" class="prev">&#x2039;</label> <label for="img-3" class="next">&#x203a;</label>
					</div>
				</li>
				<input type="radio" name="radio-btn" id="img-3" />
				<li class="slide-container">
					<div class="slide">
						<a href="sub3_itemlist.jsp?frm1=상의"> <img src="images/cloth5_6.png" />
						</a>
					</div>
					<div class="nav">
						<label for="img-2" class="prev">&#x2039;</label> <label for="img-4" class="next">&#x203a;</label>
					</div>
				</li>
				<input type="radio" name="radio-btn" id="img-4" />
				<li class="slide-container">
					<div class="slide">
						<a href="sub3_itemlist.jsp?frm1=상의"> <img src="images/pants1_2.png" />
						</a>
					</div>
					<div class="nav">
						<label for="img-3" class="prev">&#x2039;</label> <label for="img-5" class="next">&#x203a;</label>
					</div>
				</li>
				<input type="radio" name="radio-btn" id="img-5" />
				<li class="slide-container">
					<div class="slide">
						<a href="sub3_itemlist.jsp?frm1=상의"> <img src="images/hat1_1.png" />
						</a>
					</div>
					<div class="nav">
						<label for="img-4" class="prev">&#x2039;</label> <label for="img-6" class="next">&#x203a;</label>
					</div>
				</li>
				<input type="radio" name="radio-btn" id="img-6" />
				<li class="slide-container">
					<div class="slide">
						<a href="sub3_itemlist.jsp?frm1=모자"> <img src="images/hat2_1.png" />
						</a>
					</div>
					<div class="nav">
						<label for="img-5" class="prev">&#x2039;</label> <label for="img-1" class="next">&#x203a;</label>
					</div>
				</li>
				<li class="nav-dots"><label for="img-1" class="nav-dot" id="img-dot-1"></label> <label for="img-2" class="nav-dot" id="img-dot-2"></label> <label for="img-3" class="nav-dot" id="img-dot-3"></label> <label for="img-4" class="nav-dot" id="img-dot-4"></label> <label for="img-5" class="nav-dot" id="img-dot-5"></label> <label for="img-6" class="nav-dot" id="img-dot-6"></label></li>
			</ul>

		</div>

		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>

</body>

</html>