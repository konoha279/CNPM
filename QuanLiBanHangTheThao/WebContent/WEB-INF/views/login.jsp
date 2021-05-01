<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Đăng nhập</title>
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
			<div class="wrap-login100 p-t-190 p-b-30">
				<form:form class="login100-form validate-form" modelAttribute = "Account" action="login.htm" method="post">
					<div class="login100-form-avatar">
						<img src="resources/login/cat.jpg" alt="AVATAR">
					</div>

					<span class="login100-form-title p-t-20 p-b-45">
						Xin chào
					</span>

					<div class="wrap-input100 validate-input m-b-10" data-validate = "Username is required">
						<form:input path="Username" class="input100" type="text" name="username" placeholder="Tài khoản" />
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-10" data-validate = "Password is required">
						<form:input path="Password" class="input100" type="password" name="pass" placeholder="Mật khẩu" />
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock"></i>
						</span>
					</div>

					<div class="container-login100-form-btn p-t-10">
						<button class="login100-form-btn">
							Đăng nhập
						</button>
					</div>
					
					<div class="container-login100-form-btn p-t-10">
						<p  class="text-warning"><strong>${Msg}</strong></p>
					</div>
					<div class="text-center w-full p-t-25 p-b-230">
						<a href="#" class="txt1">
							Quên tài khoản / mật khẩu?
						</a>
					</div>


					<div class="text-center w-full">
						<a class="txt1" href="registry.htm">
							Tạo tài khoản.
							<i class="fa fa-long-arrow-right"></i>						
						</a>
					</div>
				</form:form>
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

</body>
</html>