<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="../css/login.css" rel="stylesheet" type="text/css" />

<script src="jquery-3.4.1.js"></script>
</head>
<body>
	<div id="wrap">


		<section class="login-form">
			<h1>LOGIN</h1>
			<form method="post" action="sub1_login.jsp" id="login-form">
				<div class="int-area">
					<input type="text" name="username" id="user" autocomplete="on" required> <label for="id">USER NAME</label>
				</div>
				<div class="int-area">
					<input type="password" name="password" id="password" autocomplete="off" required> <label for="pw">PASSWORD</label>
				</div>
				<div class="btn-area">
					<button type="submit">LOGIN</button>
				</div>
				<div class="caption">
					<a href="sub2_joinform.jsp">계정이 없으신가요?</a>
				</div>
			</form>
		</section>

		<script>
      let id = $('#id');
      let pw = $('#pw');
      let btn = $('#btn');
      
      $(btn).on('click', function(){
         if($(id).val() == "") {
            $(id).next('label').addClass('warning');
            setTimeout(function(){
               $('label').removeClass('warning');
            },1500);
         }
         else if ($(pw).val() == "") {
            $(pw).next('label').addClass('warning');
            
         }
      });
   </script>


	</div>

</body>
</html>