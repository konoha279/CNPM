<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Trang cá nhân</title>
	<base href="${pageContext.servletContext.contextPath}/">

	<link href="resources/profile/profile.css" rel="stylesheet" type="text/css" >
	<link href="resources/profile/background.css" rel="stylesheet" type="text/css" >
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC|Lobster" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css">
	
<style type="text/css">
	body {
		  padding: 0;
		  margin: 0;
		  font-family: sans-serif;
		  background-color: #63ec85;
		}
	div#tab-content
	{
		transition: height 1s, width 1s, padding 1s, opacity 0.5s ease-out;
	}	
	
	div.bill {
	  /* background-color: lightblue; */
	  width: auto;
	  height: 460px;
	  overflow: auto;
	}
	.modal-lg {
        max-width: 70% !important;
	}
</style>

</head>
<body>
 <!-- ============================================ background =========================================== -->
	<div class="outer_wrapper">
		<div class="wrapper">
		  <div class="cat_wrapper">
			<div class="cat first_pose">
			  <div class="cat_head">
				<svg x="0px" y="0px" width="100%" height="100%" viewBox="0 0 76.4 61.2" >
				  <polygon class="eyes" points="63.8,54.1 50.7,54.1 50.7,59.6 27.1,59.6 27.1,54.1 12.4,54.1 12.4,31.8 63.8,31.8 "/>
				  <path d="M15.3,45.9h5.1V35.7h-5.1C15.3,35.7,15.3,45.9,15.3,45.9z M45.8,56.1V51H30.6v5.1H45.8z M61.1,35.7H56v10.2h5.1
					V35.7z M10.2,61.2v-5.1H5.1V51H0V25.5h5.1V15.3h5.1V5.1h5.1V0h5.1v5.1h5.1v5.1h5.1v5.1c0,0,15.2,0,15.2,0v-5.1h5.1V5.1H56V0h5.1v5.1
					h5.1v10.2h5.1v10.2h5.1l0,25.5h-5.1v5.1h-5.1v5.1H10.2z"/>
				</svg>
	
			  </div>
			  <div class="body">
				<svg x="0px" y="0px" width="100%" height="100%" viewBox="0 0 91.7 40.8" >
				  <path class="st0" d="M91.7,40.8H0V10.2h5.1V5.1h5.1V0h66.2v5.1h10.2v5.1h5.1L91.7,40.8z"/>
				</svg>
	
				<div class="tail">
				  <svg x="0px" y="0px" width="100%" height="100%" viewBox="0 0 25.5 61.1" >
					<polygon class="st0" points="10.2,56 10.2,50.9 5.1,50.9 5.1,40.7 0,40.7 0,20.4 5.1,20.4 5.1,10.2 10.2,10.2 10.2,5.1 15.3,5.1 
					  15.3,0 25.5,0 25.5,10.2 20.4,10.2 20.4,15.3 15.3,15.3 15.3,20.4 10.2,20.4 10.2,40.7 15.3,40.7 15.3,45.8 20.4,45.8 20.4,50.9 
					  25.5,50.9 25.5,61.1 15.3,61.1 15.3,56 "/>
				  </svg>
				</div>
			  </div>
			  
			  <div class="front_legs">
				<div class="leg one">
				  <svg x="0px" y="0px" width="100%" height="100%" viewBox="0 0 14 30.5" >
					<polygon points="15.3,30.5 5.1,30.5 5.1,25.4 0,25.4 0,0 15.3,0 "/>
				  </svg>
				</div>
				<div class="leg two">
				  <svg x="0px" y="0px" width="100%" height="100%" viewBox="0 0 14 30.5" >
					<polygon points="15.3,30.5 5.1,30.5 5.1,25.4 0,25.4 0,0 15.3,0 "/>
				  </svg>
				</div>  
			  </div>
			  
			  <div class="back_legs">
				<div class="leg three">
				  <svg x="0px" y="0px" width="100%" height="100%" viewBox="0 0 14 30.5" >
					<polygon points="15.3,30.5 5.1,30.5 5.1,25.4 0,25.4 0,0 15.3,0 "/>
				  </svg>
				</div>
				<div class="leg four">
				  <svg x="0px" y="0px" width="100%" height="100%" viewBox="0 0 14 30.5" >
					<polygon points="15.3,30.5 5.1,30.5 5.1,25.4 0,25.4 0,0 15.3,0 "/>
				  </svg>
				</div>
			  </div>
			</div>
		  </div>
		</div>
		<div class="ground"></div>
	</div>
	<!-- ============================================================================================= -->
	
	<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-8 main"  >
    	<!-- ----------------------- Tab menu ----------------------- -->
    	<div style="display: inline;">
			<ul class="nav justify-content-end">
				<li class="nav-item">
					<button class="btn btn-outline-dark" onclick="showhide()" id="btnEvent" type="button">
						<i class="fa fa-compress" aria-hidden="true"></i>
					</button>
				</li>
				<li class="nav-item">
					<button onclick="history.back()" class="btn btn-outline-danger" type="button">
						<i class="fa fa-times" aria-hidden="true"></i>
					</button>
				</li>
			</ul>
			<ul class="nav nav-tabs" id="myTab" role="tablist" >
				<li class="nav-item">
					<a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">Hồ sơ</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="change-passwd-tab" data-toggle="tab" href="#change-passwd" role="tab" aria-controls="change-passwd" aria-selected="false">Đổi mật khẩu</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="bill-tab" data-toggle="tab" href="#bill" role="tab" aria-controls="change-passwd" aria-selected="false">Đơn hàng đã mua</a>
				</li>
			</ul>
		</div>
		<div class="tab-content" id="tab-content">			
			<!-- ----------------------- Tab content ----------------------- -->
			
			<!-- ----------------------- Profile ----------------------- -->
			<div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				<div id="content">
					
				</div>
			</div>
			<!-- ----------------------- Change password ----------------------- -->
			<div class="tab-pane fade" id="change-passwd" role="tabpanel" aria-labelledby="change-passwd-tab">
				<h1>Đổi mật khẩu</h1>
				<div id="content">
					<div>
						<div>Nhập mật khẩu cũ: </div>
						<input type="password" id = "oldPasswd" name ="oldPasswd" required="required" value="" >
					</div>
					<div id="tagetChange">

					</div>
					<div class="d-flex justify-content-center" id="changeButton">
						<button onclick="checkPasswd()" type="button" class="btn btn-outline-primary" id="button2">Xác nhận</button>
					</div>
					<div id="change-msg">

					</div>
				</div>				
			</div>
			<!-- ----------------------- BILL ----------------------- -->
			<div class="tab-pane fade bill" id="bill" role="tabpanel" aria-labelledby="bill-tab" style="width: 100%;">
				<h1>Danh sách đơn hàng đã mua</h1>
				<div id="content" style="padding-left: 30px;padding-right: 30px;">
					<table id="billTable" class="table table-striped dt-responsive nowrap" style="width: 100%;">
						<thead>
							<tr>
								<th>Ngày tạo đơn hàng</th>
								<th>Địa chỉ nhận hàng</th>		
								<th>Phí vận chuyện</th>
								<th>Tổng tiền</th>
								<th>Tương tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bills}" var="b">
								<tr>
									<td>${b.date }</td>
									<td>${b.address } </td>
									<td><f:formatNumber value="${b.transportationFee }" type="currency" /></td>
									<td><f:formatNumber value="${b.moneyProduct }" type="currency" /> </td>
									<td>
										 <button type="button" class="btn btn-outline-secondary"  data-bs-toggle="modal" data-bs-target="#detail${b.id}">
												<i class="edit icon"></i>Xem chi tiết
										</button>		
									</td>
								</tr>							
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<c:forEach items="${bills }" var = "b">
		  		<div class="modal fade" id="detail${b.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				 <div class="modal-dialog modal-lg">
				  <div class="modal-content" >
					<div class="modal-header" >
					  <h1 class="modal-title"id="staticBackdropLabel">Chi tiết đơn hàng</b></h1>
					  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body" >
						<table id="TableCTBill${b.id }" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%;" >													
							<thead>
								<tr>
									<th>Tên sản phẩm</th>
									<th>Kích thước</th>
									<th>Đơn giá</th>
									<th>Số lượng</th>
									<th>Khuyến mãi</th>
									<th>Tổng tiền </th>
								</tr>													
							</thead>
							<tbody>
								<c:forEach items="${b.ctBills }" var="ct">
									<tr>
										<td>${ct.cTHangHoa.maHangHoa.name }</td>
										<td><c:if test="${ct.cTHangHoa.size.id != '5' }">${ct.cTHangHoa.size.name }</c:if> </td>
										<td> <f:formatNumber value="${ct.unitPrice }" type="currency" /> </td>
										<td>${ct.count } </td>
										<td> <f:formatNumber value="${ct.promotion }" type="percent" /> </td>
										<td> <f:formatNumber value="${(ct.unitPrice - (ct.unitPrice * (ct.promotion/100))) * ct.count }" type="currency" />
									</tr>
								</c:forEach>															
							</tbody>
						</table>
					</div>
			      <div class="modal-footer">
			       	<button type="button"  class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
			      </div>
			    </div>
			  </div>
			</div>
		  </c:forEach>
		</div>
    </div>
  </div>
  
 
  
</div>
<script src="resources/profile/background.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" charset="UTF-8">
var btn = document.getElementById("btnEvent");
var content = document.getElementById('tab-content');
var height = content.clientHeight;
var	width = content.clientWidth;

function show()
{
	document.getElementById('btnEvent').onclick = hide;
	console.log("show");
	content.style.transition = "visibility 1s";
	content.style.visibility = 'visible';
	content.style.height = height + 'px';
	content.style.width = width + 'px';
	content.style.padding = '.5em';
}

function hide()
{
	content.style.transition = "visibility 0s";
	document.getElementById('btnEvent').onclick = show;
	console.log("hide");
	content.style.visibility = 'hidden';
	content.style.height = '0';
	content.style.width = '0';
	content.style.padding = '0';
}


	window.onload = function() {
		var div = document.createElement('div');
		div.setAttribute("id","content");
		if ("${guest}" != "")
		{
			document.getElementById("profile").innerHTML = "<h1>Hồ sơ của <b>${guest.getFullname()}</b></h1>";
			document.getElementById("profile").appendChild(div);
			document.getElementById("content").innerHTML = document.getElementById("guest").innerHTML;
		}
		else
		{
			document.getElementById("profile").innerHTML = "<h1>Hồ sơ của <b>${staff.getFullName()}</b></h1>";
			document.getElementById("profile").appendChild(div);
			document.getElementById("content").innerHTML = document.getElementById("staff").innerHTML;
		}
		height = content.clientHeight;
		width = content.clientWidth;
		document.getElementById('btnEvent').onclick = hide;
		content.style.visibility = 'visible';
		content.style.height = height + 'px';
		content.style.width = width + 'px';
		content.style.padding = '.5em';
	}
	
	

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
				$('#form-profile').html(data);
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
		document.getElementById('button1').disabled = true;

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
				$('#form-profile').html(data);
			},
			error: function(data)
			{
				
			}
		})
	}

	function checkPasswd()
	{

		var user = document.getElementById("username").value;
		var oldPass = document.getElementById("oldPasswd").value;
		var p =document.createElement('p');
		

		if (oldPass == "")
		{
			document.getElementById("change-msg").innerHTML = "";
			p.setAttribute('class','error');
			p.innerHTML = "Phải nhập mật khẩu để đổi mật khẩu mới."
			console.log(p);
			document.getElementById("change-msg").appendChild(p);
			console.log(document.getElementById("change-msg").innerHTML);
		}
		else
		{
			document.getElementById("change-msg").innerHTML = "";
			$.ajax
			({
				url: "${pageContext.servletContext.contextPath}/profile/checkPasswd.htm",
				data: {
					username: user,
					oldPasswd: oldPass
				},
				type: "post",
				success: function (data)
				{
					console.log(data);
					if (data == "OK")
					{
						var div = document.createElement('div');
						div.innerHTML = document.getElementById('change-password').innerHTML;
						document.getElementById('tagetChange').appendChild(div);

						document.getElementById('oldPasswd').disabled = true;
						document.getElementById('changeButton').innerHTML = "<button onclick=\"changePassword()\" type=\"button\" class=\"btn btn-outline-success\" id=\"button2\">Đổi gấp</button>";
					}
					else
					{
						document.getElementById("change-msg").innerHTML = "";
						p.setAttribute('class','error');
						p.innerHTML = "Sai mật khẩu rồi.";
						document.getElementById("change-msg").appendChild(p);
					}
				},
				error: function(data)
				{
					document.getElementById("change-msg").innerHTML = "";
					p.setAttribute('class','error');
					p.innerHTML = data;
					document.getElementById("change-msg").appendChild(p);
				}
			})
		}
	}

	function changePassword()
	{
		var p =document.createElement('p');

		var user = document.getElementById("username").value;
		var newPass = document.getElementById("newPasswd").value;
		var reNewPass = document.getElementById("re-newPasswd").value;

		if (newPass == reNewPass)
		{
			if (newPass == "")
			{
				document.getElementById("change-msg").innerHTML = "";
				p.setAttribute('class','error');
				p.innerHTML = "Phải nhập mật khẩu mới để đổi mật khẩu.";
				document.getElementById("change-msg").appendChild(p);
			}
			else
			{
				document.getElementById("change-msg").innerHTML = "";
				p.setAttribute('class','msg');
				p.innerHTML = "Đợi một chút, mật khẫu đang được thay đổi."
				document.getElementById("change-msg").appendChild(p);

				document.getElementById("newPasswd").disabled = true;
				document.getElementById("re-newPasswd").disabled = true;
				document.getElementById("button2").disabled = true;
				$.ajax
				({
					url: "${pageContext.servletContext.contextPath}/profile/changePasswd.htm",
					data: {
						username: user,
						newPasswd: newPass
					},
					type: "post",
					success: function (data)
					{
						console.log(data);
						document.getElementById('oldPasswd').disabled = false;
						document.getElementById('oldPasswd').value = "";
						document.getElementById('tagetChange').innerHTML="";
						document.getElementById('changeButton').innerHTML = "<button onclick=\"checkPasswd()\" type=\"button\" class=\"btn btn-outline-primary\" id=\"button2\">Xác nhận</button>";
						
						document.getElementById("change-msg").innerHTML = "";
						p.setAttribute('class','congrat');
						p.innerHTML =  "Mật khẩu đã thay đổi, thông báo thay đổi mật khẩu đã được gửi về mail.";
						document.getElementById("change-msg").appendChild(p);
					},
					error: function(data)
					{
						document.getElementById("change-msg").innerHTML = "";
						p.setAttribute('class','error');
						p.innerHTML = data;
						document.getElementById("change-msg").appendChild(p);
					}
				})
			}	
		}
		else
		{
			document.getElementById("change-msg").innerHTML = "";
			p.setAttribute('class','error');
			p.innerHTML =  "Mật khẩu không giống nhau.";
			document.getElementById("change-msg").appendChild(p);
		}
	}
</script>
<script id="change-password" type="text/html">
	<div>
		<div>Nhập mật khẩu mới: </div>
		<input type="password" id ="newPasswd" name ="newPasswd" required="required" >
	</div>	
	<div>
		<div>Nhập lại mật khẩu: </div>
		<input type="password" id ="re-newPasswd" name ="re-newPasswd" required="required" >
	</div>
</script>

<script id="guest" type="text/html">
	<form id="form-profile">
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
			<button onclick="get()" class="btn btn-outline-primary" type="button" id = "button1">Chỉnh sửa</button>
		</div>
	</form>	
	<div id="error-msg"></div>
</script>
<script id="staff" type="text/html">
	<form id="form-profile">
		<div>
			<div>Username:</div>
			<input id = "username" name = "username" value="${account.username}" disabled> 
		</div>
		
		<div style="display: flex">
			<div style="width: 40%;">
				<div>Họ:</div> <input type="text" id ="firstname_input" value="${staff.firstName}" disabled>
			</div>
			<div style="width: 20%;">

			</div>
			<div style="width: 40%;">
				<div>Tên:</div> <input type="text" id ="name_input" value="${staff.name}" disabled>
			</div>
		</div>
		<div style="display: flex :;">
			<div>Giới tính:</div> 
			<input type="radio" name="sex" id ="sex1_input" value="Nữ" ${staff.sex==false?'checked':""} disabled> Nữ
			<input type="radio" name="sex" id ="sex2_input" value="Nam" ${staff.sex==true?'checked':""} disabled> Nam
		</div>
		<div>
			<div>Địa chỉ:</div> <input type="text" id ="address" value="${staff.address}" disabled>
		</div>
		<div>
			<div>Sinh nhật:</div> <input id ="date_input" type="date" value="${staff.birthday}" disabled>
		</div>
		<div>
			<div>Số điện thoại:</div> <input type="text" id ="phone_input" value="${staff.phoneNumber}" disabled>
		</div>
		<div>
			<input type="checkbox" value = "Còn làm việc" ${staff.status==true?'checked':''} disabled> còn làm việc
		</div>
	</form>	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<!-- ---------------------------------------------------------- Export ---------------------------------------------------------- -->	
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
   <script>
    $(document).ready(function() {
        $('#billTable').DataTable( {
        	lengthChange: false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3 ],
                        columns: ':visible'
                    }
                },
                {
                	extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3 ],
                		columns: ':visible'
                    }
                },
                'colvis'
            ]
        } );
        
    } );
     </script>	
</body>
</html>