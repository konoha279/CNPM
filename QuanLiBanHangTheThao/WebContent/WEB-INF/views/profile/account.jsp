<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Trang cá nhân</title>
	<base href="${pageContext.servletContext.contextPath}/">

	<link href="resources/profile/profile.css" rel="stylesheet" type="text/css" >
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC|Lobster" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	

	
	<style type="text/css">
	body {
	  background-color: rgb(49, 90, 151);
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
			  	<h1 style="text-align: center;">Hồ sơ của ${guest.firstName} ${guest.name}</h1>
			  	
				<div id="content-profile">
					<form id="form" action="#">
						<div>
							<div>Username:</div>
							<input id = "username" name = "username" value="${account.username}" disabled> 
						</div>
						
						<div style="display: flex">
							<div>
								<div>Họ:</div> <input type="text" id ="firstname_input" value="${guest.firstName}" disabled>
							</div>
							<div style="padding-left: 100px">
								<div>Tên:</div> <input type="text" id ="name_input" value="${guest.name}" disabled>
							</div>
						</div>
						<div style="display: flex: ;">
							<div>Giới tính:</div> 
							<input type="radio" name="sex" id ="sex1_input" value="Nữ" ${guest.sex==false?'checked':""} disabled> Nữ
							<input type="radio" name="sex" id ="sex2_input" value="Nam" ${guest.sex==true?'checked':""} disabled> Nam
						</div>
						<div>
							<div>Sinh nhật:</div> <input id ="date_input" type="date" value="${guest.birthday}" disabled>
						</div>
						<div>
							<div>Số điện thoại:</div> <input type="text" id ="phone_input" value="${guest.phoneNumber}" disabled>
						</div>
						<div class="d-flex justify-content-center">
							<button onclick="get()" class="btn btn-outline-primary" type="button" id = "editButton">Chỉnh sửa</button>
						</div>
					</form>	
					<div id="error-msg"></div>				
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" charset="UTF-8">
	
	function get() {
		var user = document.getElementById("username").value;
		var firstName = document.getElementById("firstname_input").value;
		var name = document.getElementById("name_input").value;
		var sexs = document.getElementsByName('sex');
		var sex;
		for (var i = 0, length = sexs.length;i<length;i++)
			if (sexs[i].checked)
			{
				sex = sexs[i].value;
				break;
			}
		var phone = document.getElementById("phone_input").value;
		var birthday = document.getElementById("date_input").value;
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/profile/profile.htm",
			data: {
				username: user,
				firstName : firstName,
				name : name,
				sex : sex,
				phone : phone,
				birthday : birthday
			},
			type: "get",
			success: function (data)
			{
				$('#form').html(data);
			},
			error: function(data)
			{
				
			}
		})
	}
	
	function post() {
		document.getElementById("username").disabled = true;
		document.getElementById("firstname_input").disabled = true;
		document.getElementById("name_input").disabled = true;
		document.getElementById('sex1_input').disabled = true;
		document.getElementById('sex2_input').disabled = true;
		document.getElementById('date_input').disabled = true;
		document.getElementById('phone_input').disabled = true;
		document.getElementById('editButton').disabled = true;

		var msg = document.getElementById("error-msg");
		msg.innerHTML = "Đợi một chút, đang cập nhật database......";
		
		var user = document.getElementById("username").value;
		var firstName = document.getElementById("firstname_input").value;
		var name = document.getElementById("name_input").value;
		var sexs = document.getElementsByName('sex');
		var sex;
		for (var i = 0, length = sexs.length;i<length;i++)
			if (sexs[i].checked)
			{
				sex = sexs[i].value;
				break;
			}
		var phone = document.getElementById("phone_input").value;
		var birthday = document.getElementById("date_input").value;

		
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/profile/profile.htm",
			data: {
				username: user,
				firstName : firstName,
				name : name,
				sex : sex,
				phone : phone,
				birthday : birthday
			},
			type: "post",
			success: function (data)
			{
				msg.remove();
				$('#form').html(data);
			},
			error: function(data)
			{
				
			}
		})
	}
</script>
</body>
</html>