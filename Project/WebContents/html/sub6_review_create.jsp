<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>리뷰</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/review.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />
		<div class="rightcon">
			<div class="tablestyle">
				<form action="sub6_review.jsp" method="post" enctype="multipart/form-data" name="form1">
					<table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
						<tr>
							<th><label for="titlefield">* 제 목</label></th>
							<td><input name="title" type="text" id="titlefield" size="70"></td>
						</tr>
						<tr>
							<th><label for="namefield">* 제 품 명</label></th>
							<td><input name="item_name" type="text" id="namefield"> <input id="newwin" type="button" name="" value="상품 이름 모아보기"> <input id="newwin2" type="button" name="" value="최근 구매 상품 보기"></td>
						</tr>
						<tr>
							<th><label for="contentfield">* 본 문</label></th>
							<td><textarea name="content" cols="70" rows="10" id="contentfield"></textarea></td>
						</tr>
						<tr>
							<th><label for="scorefield">* 점 수</label></th>
							<td><input name="score" type="text" id="namefield" placeholder="0~5입력"></td>
						</tr>
						<tr>
							<th><label for="filefield">* 파일첨부</label></th>
							<td><input accept="image/*" type='file' id="imgInp" name="image" /></td>
						</tr>
						<tr>
							<th><label for="filefield">미리보기</label></th>
							<td><img id="blah" src="#" alt="your image" width="360px" height="360px"/> </td>
							
						</tr>
						
						<tr>
							<td height="30" colspan="2" align="center" class="btnstyle"><input type="submit" name="ok" id="ok" value="확인"> <input type="submit" name="cancel" id="cancel" value="취소"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>
	<script>
		window.onload = function() {
			document.getElementById("newwin").onclick = function() {
				window.open("itemlist.jsp", "",
						"width=300px,height=400px,top=200px;");
			}
			document.getElementById("newwin2").onclick = function() {
				window.open("itemlist_recentpurchase.jsp", "",
						"width=300px,height=400px,top=200px;");
			}

		};
	</script>
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
