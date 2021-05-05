<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<base href="${pageContext.servletContext.contextPath}/">

	<!-- <link href="resources/profile/profile.css" rel="stylesheet" type="text/css" > -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC|Lobster" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	<style type="text/css">
	body {
	  background-color: pink;
	  
	}
	
	.main {
	  background-color: white;
	  margin-top: 50px;
	  border-radius: 20px;	
	  padding: 10px;
	}
	.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	  background-color: crimson;
	}
	
	a {
	  color: crimson;
	}
	
	a:hover {
	  color: pink;
	}
	.nav-link {
	  font-family: 'Lobster';
	}
	
	h1 {
	  font-family: 'Lobster';
	  color: pink;
	}
	</style>

</head>
<body>
	<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-5 main">
    	<!-- ----------------------- Tab menu ----------------------- -->
     	<ul class="nav nav-pills" id="myTab" role="tablist">
	        <li class="nav-item">
	          <a class="nav-link active" id="intro-tab" data-toggle="tab" href="#intro" role="tab" aria-controls="intro" aria-selected="true">intro</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Hồ sơ</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" id="change-passwd-tab" data-toggle="tab" href="#change-passwd" role="tab" aria-controls="change-passwd" aria-selected="false">Đổi mật khẩu</a>
	        </li>
      	</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="intro" role="tabpanel" aria-labelledby="intro-tab">
			    <h1>hello.</h1>
			    <p>Đây là môn củ chuối by cô Nguyên 🙂</p>
			  </div>
			
			<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
			  	<h1>Hồ sơ của ${guest.firstName} ${guest.name}</h1>
			  	<div>
			  		<div>Username:</div>
			  		<input name = "username" value="${account.username}" disabled> 
			  		<div>
			  			<div>Họ:</div> <input type="text" value="${guest.firstName}">
			  			<div>Tên:</div> <input type="text" value="${guest.name}">
			  		</div>
			  		<div>
			  			<div>Giới tính:</div> 
			  			<input type="radio" value="Nữ" ${guest.sex==false?'checked':""}> Nữ
			  			<input type="radio" value="Nam" ${guest.sex==true?'checked':""}> Nam
			  		</div>
			  		<div>
			  			<div>Sinh nhật:</div> <input type="date" value="${guest.birthday}">
			  		</div>
			  		<div>
			  			<div>Số điện thoại:</div> <input type="text" value="${guest.phoneNumber}">
			  		</div>
			  	</div>
			</div>
			<div class="tab-pane fade" id="change-passwd" role="tabpanel" aria-labelledby="change-passwd-tab">
				<h1>Đổi mật khẩu (Comming soon)</h1>
				<form action="">
				<div>
					<div>Nhập mật khẩu cũ: </div>
					<input type="text" name ="oldPasswd" >
				</div>
				<div>
					<div>Nhập mật khẩu mới: </div>
					<input type="text" name ="newPasswd" >
				</div>	
				<div>
					<div>Nhập lại mật khẩu: </div>
					<input type="text" name ="re-newPasswd" >
				</div>
				<button>Đổi gấp</button>
				</form>
			</div>
		</div>
    </div>
  </div>
</div>
</body>
</html>