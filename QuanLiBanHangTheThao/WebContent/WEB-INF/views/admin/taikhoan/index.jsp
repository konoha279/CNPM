<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Danh sách tài khoản</title>
	<link rel="stylesheet" href="resources/admin/main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style type="text/css">
.modal-lg {
    max-width: 60%;
}

</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Tài Khoản</th>
								<th>Họ và Tên</th>
								<th>Email</th>
								<th>Chức vụ</th>
								<th>Trạng thái</th>
								<th>Tương tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listAccount}" var="acc">
								<tr>
									<td>${acc.username}</td>
									<td>${acc.getRole().getId() == 0 ? acc.guest.getFullname() : acc.staff.getFullName()}</td>
									<td>${acc.email}</td>
									<td>${acc.getRole().getName()}</td>
									<td>
										${acc.active == true ? "Hoạt động" : "Khóa" }
									</td>
									<td>
										<!-- ------------------------------------------- Nút chỉ tiết ------------------------------- -->
										<button type="button" class="ui blue basic button"  data-bs-toggle="modal" data-bs-target="#id${acc.username}">
												<i class="edit icon"></i>Chi tiết
										</button>						
										  
										<!-- Modal -->
										<div class="modal fade" id="id${acc.username}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg">
											  <div class="modal-content" >
												<div class="modal-header" >
												  <h1 class="modal-title"id="staticBackdropLabel">Chi tiết tài khoản <b>${acc.username}</b></h1>
												  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
										        	<form:form action="admin/taikhoan/update/${acc.username}.htm" modelAttribute="Account" method="post"  class="container">
										        	<div class="d-flex justify-content-evenly">
											        	<div style="width: 40%;">
											        		<h3>Thông tin tài khoản</h3>
											         		<div class="mb-3">
											         			<label class="form-label">Tài khoản</label>
											         			<form:input  class="form-control" path="username" value = "${acc.username}" readonly="true"   />
											         		</div>
											         		<div class="mb-3">
											         			<label class="form-label">Email</label>
											         			<form:input class="form-control" path="email" value = "${acc.email}" readonly="true"  />
											         		</div>
											         		<div class="mb-3">
											         			<label class="form-label">Vai trò</label>
											         			<form:select disabled="true"  readonly="true"  path="role" class="form-select">
											         				<c:forEach items="${role}" var="role">
											         					<form:option selected = "${acc.role.id == role.id ? 'selected' : '' }" value="${role}">${role.name}</form:option>
											         				</c:forEach>
											         			</form:select>
											         		</div>
											         		<div class="mb-3">
											         			<label class="form-label">Trạng thái</label>
											         			<form:select  disabled="true" readonly="true"  path="active" class="form-select">
											         				<form:option selected = "${acc.active == true ? 'selected' : '' }" value="true">Kích hoạt</form:option>
											         				<form:option selected = "${acc.active == false ? 'selected' : '' }"  value="false">Khóa</form:option>
											         			</form:select>
											         		</div>
											         		
											         	</div>
											         	<!-- ---------------------------------------------------------- Space ---------------------------------------------------------- -->
											         	<div style="width: 20%">
											         	
											         	</div>
											         	<!-- ----------------------------------------------------------------------------------------------------------------------------------  -->
											         	 <div style="width: 40%;">
											         		<h3>Thông tin người sở hữu</h3>
											         		<div>
																<c:choose>
																	<c:when test="${acc.getRole().getId() == 0}">
																		<div class="mb-3">
																			<label class="form-label">Họ</label>
																			<form:input  class="form-control" path="guest.firstName" value = "${acc.guest.getFirstName()}"  readonly="true" />
																		</div>		
																		<div class="mb-3">
																			<label class="form-label">Tên</label>
																			<form:input class="form-control" path="guest.name" value = "${acc.guest.getName()}"  readonly="true" />
																		</div>	
																		<div class="mb-3">
																			<label class="form-label">Giới tính</label>
																			<div>
																				<div class="form-check">
																					<form:radiobutton  disabled="true" readonly="true" class="form-check-input" checked = "${acc.guest.sex == true ? 'checked' : '' }" value="true" path="guest.sex" />
																					<label class="form-check-label">
																					    Nam
																					</label>
																				</div>
																				<div class="form-check">
																					<form:radiobutton  disabled="true" readonly="true" class="form-check-input" checked = "${acc.guest.sex == false ? 'checked' : '' }" value="false" path="guest.sex"/>
																					<label class="form-check-label">
																					    Nữ
																					</label>
																				</div>
																			</div>																			
																		</div>	
																		<div class="mb-3">
																			<label class="form-label">Sinh nhật</label>
																			<form:input class="form-control" type="date" path="guest.birthday" value="${acc.guest.getBirthday()}"  readonly="true"/>
																		</div>
																		 <div class="mb-3">
																			<label class="form-label">Số Điện thoại</label>
																			<form:input class="form-control" path="guest.phoneNumber" value = "${acc.guest.getPhoneNumber()}"  readonly="true" />
																		</div>			          	
																	</c:when>
																	 <c:otherwise>
																		<div class="mb-3">
																			<label class="form-label">Họ</label>
																			<form:input class="form-control" path="staff.firstName" value = "${acc.staff.getFirstName()}"  readonly="true" />
																		</div>		
																		<div class="mb-3">
																			<label class="form-label">Tên</label>
																			<form:input class="form-control" path="staff.name" value = "${acc.staff.getName()}"  readonly="true" />
																		</div>	
																		<div class="mb-3">
																			<label class="form-label">Giới tính</label>
																			<div>
																				<div class="form-check">
																					<form:radiobutton  disabled="true" readonly="true" class="form-check-input" checked = "${acc.staff.sex == true ? 'checked' : '' }" path="staff.sex" value="true" />
																					<label class="form-check-label">
																					    Nam
																					</label>
																				</div>
																				<div class="form-check">
																					<form:radiobutton  disabled="true" readonly="true" class="form-check-input" checked = "${acc.staff.sex == false ? 'checked' : '' }" path="staff.sex" value="false" />
																					<label class="form-check-label">
																					    Nữ
																					</label>
																				</div>
																			</div>																			
																		</div>	
																		 <div class="mb-3">
																			<label class="form-label">Chứng minh nhân dân</label>
																			<form:input  readonly="true" class="form-control" path="staff.cmnd" value = "${acc.staff.getCmnd()}" />
																		</div> 
																		<div class="mb-3">
																			<label class="form-label">Địa chỉ</label>
																			<form:input  readonly="true" class="form-control" path="staff.address" value = "${acc.staff.getAddress()}" />
																		</div> 
																		<div class="mb-3">
																			<label class="form-label">Sinh nhật</label>
																			<form:input  readonly="true" class="form-control" type="date" path="staff.birthday" value="${acc.staff.getBirthday()}"/>
																		</div>
																		<div class="mb-3">
																			<label class="form-label">Ngày vào làm</label>
																			<form:input  readonly="true" class="form-control" type="date" path="staff.workday" value="${acc.staff.getWorkday()}"/>
																		</div>
																		<div class="mb-3">
																			<label class="form-label">Số điện thoại</label>
																			<form:input  readonly="true" class="form-control" path="staff.phoneNumber" value = "${acc.staff.getPhoneNumber()}" />
																		</div>
																		<div class="mb-3">
																			<label class="form-label">Chi nhánh</label>
																			<form:input  readonly="true" class="form-control" path="staff.branch.name" value = "${acc.staff.getBranch().getName()}" />
																		</div>
																		<div class="mb-3">
																			<form:checkbox readonly="true"  disabled="true"  path="staff.status" checked="${acc.staff.getStatus() == true ? 'checked' : ''}"/>
																			<label class="form-label">Còn làm</label>
																		</div>																		
																	</c:otherwise>
																</c:choose>									          			
											         		</div>
											         	</div> 
										          	</div>						          	
										          </form:form>
												 
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
										        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
										      </div>
										    </div>
										  </div>
										</div>

										<!-- ----------------------------------------------- Nút xóa ----------------------------------------------- -->

										<button type="button" class="ui negative basic button" name="disabled${acc.username}"  data-bs-toggle="modal" data-bs-target="#del${acc.username}">
												<i class="ban icon"></i>Xóa
										</button>
										
										<!-- Modal -->
										<div class="modal fade" id="del${acc.username}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
											<div class="modal-dialog">
											  <div class="modal-content">
												<div class="modal-header">
												  <h5 class="modal-title" id="staticBackdropLabel">Xóa tài khoản <b>${acc.username}</b></h5>
												  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
												<h1 style="color: red">Chắc chưa?</h1>
												</div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chưa chắc</button>
										        <a href="admin/taikhoan/delete/${acc.username}.htm"><button type="submit" class="btn btn-primary">Chắc luôn</button></a>
										      </div>
										    </div>
										  </div>
										</div>

										<!-- ----------------------------------------------- Nút bỏ khóa / khóa ----------------------------------------------- -->
										<c:if test="${acc.active == true}">										
											<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/taikhoan/lock/${acc.username}.htm';" class="btn btn-outline-success" name="disabled${acc.username}">
												<i class="fa fa-lock" aria-hidden="true"></i> Khóa tài khoản
											</button>
										</c:if>
										<c:if test="${acc.active == false}">
											<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/taikhoan/unlock/${acc.username}.htm';" class="btn btn-outline-success" name="disabled${acc.username}">
												<i class="fa fa-unlock" aria-hidden="true"></i> Bỏ khóa tài khoản
											</button>
										</c:if>

									</td>		
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
						<button type="button" class="ui green button" data-bs-toggle="modal" data-bs-target="#insert">
							<i class="plus icon"></i>Thêm Tài Khoản
						</button>
						
						<!-- ----------------------------------------------------- Thêm -----------------------------------------------------------  -->				

						
					<div class="modal fade" id="insert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title" id="staticBackdropLabel">Tạo tài khoản</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">

								<div style="display: flex;">					   
						        	<div id= "adding-account" style="width: 40%">
							        	<h3 style="text-align: center;">Thông tin tài khoản</h3>
						         		<div class="mb-3">
						         			<label class="form-label">Tài khoản</label>
						         			<input type="text" class="form-control" name="username" id="addUsername" required="required"/>						         			
						         		</div>
						         		<div class="mb-3">
						         			<label class="form-label">Mật khẩu</label>
						         			<input type="password" class="form-control" name="password" id="addPassword" required="required" />
						         		</div>
						         		<div class="mb-3">
						         			<label class="form-label">email</label>
						         			<input class="form-control" type="email" name="email" id="addEmail" required="required" />
						         		</div>
						         		<div class="mb-3">
						         			<label class="form-label">Vai trò</label>
						         			<select onchange="changeAdding()" class="form-control" id ="addRoleSelected" name="roleId">
						         				<c:forEach items="${role}" var="role">
						         					<option value="${role.id}">${role.name}</option>
						         				</c:forEach>						         				
						         			</select>
						         		</div>
					         		</div>
					         		<div style="width: 20%">
					         		</div>
					         		<!-- Khách hàng -->
					         		<div id= "adding-guest" style="width: 40%">
										<h3 style="text-align: center;">Thông tin khách hàng</h3>
											<div class="mb-3">
												<label class="form-label">Họ</label>
												<input   class="form-control" id="guestFirstName"/>
											</div>		
											<div class="mb-3">
												<label class="form-label">Tên</label>
												<input class="form-control" required="required" id="guestName" />
											</div>	
											<div class="mb-3">
												<label class="form-label">Giới tính</label>
												<div>
													<div class="form-check">
														<input type="radio" checked required="required" class="form-check-input" value="true" id="guestSex" name="guestSex" />
														<label class="form-check-label">
															Nam
														</label>
													</div>
													<div class="form-check">
														<input type="radio" class="form-check-input" value="false" id="guestSex" name="guestSex"/>
														<label class="form-check-label">
															Nữ
														</label>
													</div>
												</div>																			
											</div>	
											<div class="mb-3">
												<label class="form-label">Sinh nhật</label>
												<input class="form-control" type="date" id="guestBirthday" />
											</div>
											<div class="mb-3">
												<label class="form-label">Số Điện thoại</label>
												<input type="text" class="form-control" id="guestPhoneNumber" />
											</div>	
					         		</div>
					         		<!-- Nhân viên -->
					         		<div id= "adding-staff" style="width: 40%">
										<h3 style="text-align: center;">Thông tin nhân viên</h3>
											<div class="mb-3">
												<label class="form-label">Họ</label>
												<input type="text" class="form-control" id="staffFirstName"/>
											</div>		
											<div class="mb-3">
												<label class="form-label">Tên</label>
												<input type="text" class="form-control" required="required" id="staffName"/>
											</div>	
											<div class="mb-3">
												<label class="form-label">Giới tính</label>
												<div>
													<div class="form-check">
														<input type="radio" checked required="required" class="form-check-input" name="staffSex" id="staffSex" value="true" />
														<label class="form-check-label">
															Nam
														</label>
													</div>
													<div class="form-check">
														<input type="radio" required="required" class="form-check-input" name="staffSex" id="staffSex" value="false" />
														<label class="form-check-label">
															Nữ
														</label>
													</div>
												</div>																			
											</div>	
											<div class="mb-3">
												<label class="form-label">Chứng minh nhân dân</label>
												<input type="text" class="form-control" id="staffCMND"/>
											</div>
											<div class="mb-3">
												<label class="form-label">Địa chỉ</label>
												<input type="text" class="form-control" id="staffAddress"/>
											</div>
											<div class="mb-3">
												<label class="form-label">Sinh nhật</label>
												<input  class="form-control" type="date" id="staffBirthday"/>
											</div>
											<div class="mb-3">
												<label class="form-label">Ngày vào làm</label>
												<input  class="form-control" type="date" id="staffWorkday"/>
											</div>
											<div class="mb-3">
												<label class="form-label">Số điện thoại</label>
												<input type="text" class="form-control" id="staffPhoneNumber"/>
											</div>
											<div class="mb-3">
												<label class="form-label">Chi nhánh</label>
												<select class="form-control" id ="branchSelected" name="staff-branch-id">
													<c:forEach items="${branch}" var="branch">
							         					<option value="${branch.id}">${branch.name}</option>
							         				</c:forEach>
												</select>
											</div>
											<div class="mb-3">
												<input type="checkbox" name="staff-status" id="staffStatus" value="true" />
												<label class="form-label">Còn làm</label>
											</div>															
					         		</div>
					         	</div>								 
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button type="button" onclick="add()" class="btn btn-primary">Tạo</button>
					      </div>
					    </div>
					  </div>
					</div>
							
				</div>
			</div>
		</div>	
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script src="resources/admin/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function add() {
	var user = document.getElementById("addUsername").value;
	var password = document.getElementById("addPassword").value;
	var m_email = document.getElementById("addEmail").value;
	var m_role = document.getElementById("addRoleSelected").value;
	if (m_role == "0")
	{
		var m_firstName = document.getElementById("guestFirstName").value;
		var m_name = document.getElementById("guestName").value;
		var m_sexs = document.getElementsByName("guestSex");
		var m_sex;
		for (var i = 0, length = m_sexs.length;i<length;i++)
			if (m_sexs[i].checked)
			{
				m_sex = m_sexs[i].value;
				break;
			}
		var m_phone = document.getElementById("guestPhoneNumber").value;
		var m_birthday = document.getElementById("guestBirthday").value;

		$.ajax({
		url: "${pageContext.servletContext.contextPath}/admin/taikhoan/insert/kh.htm",
		data: {
			username: user,
			passwd: password,
			email: m_email,
			role: m_role,
			firstName: m_firstName,
			name: m_name,
			sex: m_sex,
			phone: m_phone,
			birthday: m_birthday
		},
		type: "post",
		success: function (data)
			{
				alert(data);
				if (data == "Thêm thành công")
				{
					location.reload();
				}
			},
			error: function(data)
			{
				alert(data);
			}
		})
	}
	else
	{
		var m_firstName = document.getElementById("staffFirstName").value;
		var m_name = document.getElementById("staffName").value;
		var m_sexs = document.getElementsByName("staffSex");
		var m_workday = document.getElementById("staffWorkday").value;
		var m_sex;
		for (var i = 0, length = m_sexs.length;i<length;i++)
			if (m_sexs[i].checked)
			{
				m_sex = m_sexs[i].value;
				break;
			}
		var m_phone = document.getElementById("staffPhoneNumber").value;
		var m_birthday = document.getElementById("staffBirthday").value;
		var m_branch = document.getElementById("branchSelected").value;
		var m_status = (document.getElementById("staffStatus") != null ? "true" : "false");
		var m_cmnd = document.getElementById("staffCMND").value;
		var m_address = document.getElementById("staffAddress").value;
		$.ajax({
		url: "${pageContext.servletContext.contextPath}/admin/taikhoan/insert/nv.htm",
		data: {
			username: user,
			passwd: password,
			email: m_email,
			role: m_role,
			firstName: m_firstName,
			name: m_name,
			sex: m_sex,
			phone: m_phone,
			birthday: m_birthday,
			branch: m_branch,
			status: m_status,
			cmnd: m_cmnd,
			address: m_address,
			workday: m_workday
		},
		type: "post",
		success: function (data)
			{
				alert(data);
				if (data == "Thêm thành công")
				{
					location.reload();
				}
			},
			error: function(data)
			{
				alert(data);
			}
		})
	}

	
	
}
</script>
</body>
</html>