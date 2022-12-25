<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>상품관리</title>
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
				<form action="sub8_additems.jsp" method="post" enctype="multipart/form-data" name="frm">
					<table width="680" border="0" cellpadding="0" cellspacing="0" id="registerform">
						<tr>
							<th><label for="name">* 상 품 명</label></th>
							<td><input name="name" type="text" id="name"></td>
						</tr>
						<tr>
							<th><label for="name">* 종 류</label></th>
							<td><input name="memo" type="text" id="memo"></td>
						</tr>
						<tr>
							<th><label for="price">* 가 격</label></th>
							<td><input name="price" type="text" id="price"></td>
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
							<td height="30" colspan="2" align="center" class="btnstyle"><input type="submit" name="ok" id="ok" value="확인"> <input type="button" name="cancel" id="cancel" value="취소" onclick="cancel()"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<!-- page_footer 삽입 위치 -->
		<jsp:include page="../global/page_footer.jsp" flush="false" />

	</div>

	<script>
		function cancel() {

			location.href = "/Project/html/sub8_additems_list.jsp";
		}
		imgInp.onchange = evt => {
			  const [file] = imgInp.files
			  if (file) {
			    blah.src = URL.createObjectURL(file)
			  }
			}
	</script>
</body>
</html>
