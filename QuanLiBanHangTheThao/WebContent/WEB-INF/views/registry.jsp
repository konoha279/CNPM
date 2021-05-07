<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<base href="${pageContext.servletContext.contextPath}/">
<title>Đăng ký</title>
<link href="resources/registry.css" rel="stylesheet" >
<script src="resources/registry.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
	a:link, a:visited {
  background-color:  #33bbff;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: #006699;
}
.form-horizontal{
	margin-top: 50px;
}
</style>
</head>
<body background="resources/login/bg.jpg">
	<div class="container register">
                <div class="container">
            <form class="form-horizontal" role="form" action="registry.htm" method="post">
	             <div class="text-left w-full">
					<a class="txt1" href="login.htm" >
						← Đăng nhập.				
					</a>
				</div>
                <h2>Đăng ký</h2>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Họ</label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" required="required" name="firstName" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastName" class="col-sm-3 control-label">Tên*</label>
                    <div class="col-sm-9">
                        <input type="text" id="lastName" name="lastname" required="required" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="user" class="col-sm-3 control-label">Tên tài khoản* </label>
                    <div class="col-sm-9">
                        <input type="text" name="username" required="required" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email* </label>
                    <div class="col-sm-9">
                        <input type="email" id="email" required="required" placeholder="example@gmail.com" class="form-control" name= "email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Mật khẩu*</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" required="required" class="form-control" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Nhập lại mật khẩu*</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" required="required" class="form-control" name="confirmpassword">
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">Sinh nhật*</label>
                    <div class="col-sm-9">
                        <input type="date" id="birthDate" required="required" class="form-control" name="birthday">
                    </div>
                </div>
                <div class="form-group">
                    <label for="phoneNumber" class="col-sm-3 control-label">Số điện thoại </label>
                    <div class="col-sm-9">
                        <input type="phoneNumber" id="phoneNumber" class="form-control" name="phoneNumber">
                        <span class="help-block">Your phone number won't be disclosed anywhere </span>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-3">Giới tính</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" required="required" id="femaleRadio" value="Female">Nữ
                                </label>
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" required="required" id="maleRadio" value="Male">Nam
                                </label>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block">${Msg}</span>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Đăng ký</button>
            </form> <!-- /form -->
        </div> <!-- ./container -->
       
     </div>
</body>
</html>