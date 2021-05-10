<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Lú mật khẩu</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('resources/login/bg.jpg');">
			<div class="wrap-login100 p-t-190 p-b-30" style="padding-top: 0px;">
				<form id ="form" class="login100-form validate-form" action="forgot.htm" method="post">
					<div class="login100-form-avatar">
						<img src="resources/login/cat.jpg" alt="AVATAR">
					</div>
					
						<span class="login100-form-title p-t-20 p-b-45">
							<div id = "content">Quên mật khẩu à?<br> Nhập email lúc đăng ký để lấy lại tài khoản và reset lại mật khẩu nào!</div>	
						</span>
						
						<div id = "rmv" class="wrap-input100 validate-input m-b-10" data-validate = "Không được bỏ trống">
							<input path="Password" class="input100" type="email" name="email-forgot" placeholder="example@gmail.com" />
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fa fa-lock"></i>
							</span>
						</div>
	
						<div id = "rmv2" class="container-login100-form-btn p-t-10">
							<button onclick="clickButton()" class="login100-form-btn">
								OK
							</button>
						</div>		
						<div id = "Msg" class="container-login100-form-btn p-t-10">
							<p  class="text-warning"><strong>${Msg}</strong></p>
						</div>					
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->	
	<script src="resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/login/js/main.js"></script>
	<script>
		function clickButton() {
			document.getElementById("content").innerHTML = "Đợi chút";
			document.getElementById('form').submit();
			document.getElementById("rmv").remove();
			document.getElementById("rmv2").remove();
			document.getElementById("Msg").remove();
		}
	</script>

</body>
</html>