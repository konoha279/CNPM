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
										<!-- ------------------------------------------- Nút chỉnh sửa ------------------------------- -->
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
										        	<form:form action="admin/taikhoan/update/${acc.username}.htm" modelAttribute="Account"  class="container">
										        	<div class="d-flex justify-content-evenly">
											        	<div style="width: 40%;">
											        		<h3>Thông tin tài khoản</h3>
											         		<div class="mb-3">
											         			<label class="form-label">Tài khoản</label>
											         			<form:input  class="form-control" path="username" value = "${acc.username}" disabled="true" />
											         		</div>
											         		<div class="mb-3">
											         			<label class="form-label">Email</label>
											         			<form:input class="form-control" path="email" value = "${acc.email}"  disabled="true"/>
											         		</div>
											         		<div class="mb-3">
											         			<label class="form-label">Vai trò</label>
											         			<form:select  disabled="true" path="active" class="form-select">
											         				<c:forEach items="${role}" var="role">
											         					<form:option selected = "${acc.role.id == role.id ? 'selected' : '' }" value="${role.id}">${role.name}</form:option>
											         				</c:forEach>
											         			</form:select>
											         		</div>
											         		<div class="mb-3">
											         			<label class="form-label">Trạng thái</label>
											         			<form:select  disabled="true" path="active" class="form-select">
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
																			<form:input  class="form-control" path="guest.firstName" value = "${acc.guest.getFirstName()}"  disabled="true" />
																		</div>		
																		<div class="mb-3">
																			<label class="form-label">Tên</label>
																			<form:input class="form-control" path="guest.name" value = "${acc.guest.getName()}"  disabled="true" />
																		</div>	
																		<div class="mb-3">
																			<label class="form-label">Giới tính</label>
																			<div>
																				<div class="form-check">
																					<form:radiobutton  disabled="true" class="form-check-input" checked = "${acc.guest.sex == true ? 'checked' : '' }" value="true" path="guest.sex" />
																					<label class="form-check-label">
																					    Nam
																					</label>
																				</div>
																				<div class="form-check">
																					<form:radiobutton  disabled="true" class="form-check-input" checked = "${acc.guest.sex == false ? 'checked' : '' }" value="false" path="guest.sex"/>
																					<label class="form-check-label">
																					    Nữ
																					</label>
																				</div>
																			</div>																			
																		</div>	
																		<div class="mb-3">
																			<label class="form-label">Sinh nhật</label>
																			<form:input class="form-control" type="date" path="guest.birthday" value="${acc.guest.getBirthday()}"  disabled="true"/>
																		</div>
																		 <div class="mb-3">
																			<label class="form-label">Số Điện thoại</label>
																			<form:input class="form-control" path="guest.phoneNumber" value = "${acc.guest.getPhoneNumber()}"  disabled="true" />
																		</div>									          	
																	</c:when>
																	 <c:otherwise>
																		<div class="mb-3">
																			<label class="form-label">Họ</label>
																			<form:input class="form-control" path="staff.firstName" value = "${acc.staff.getFirstName()}"  disabled="true" />
																		</div>		
																		<div class="mb-3">
																			<label class="form-label">Tên</label>
																			<form:input class="form-control" path="staff.name" value = "${acc.staff.getName()}"  disabled="true" />
																		</div>	
																		<div class="mb-3">
																			<label class="form-label">Giới tính</label>
																			<div>
																				<div class="form-check">
																					<form:radiobutton  disabled="true" class="form-check-input" checked = "${acc.staff.sex == true ? 'checked' : '' }" path="staff.sex" value="true" />
																					<label class="form-check-label">
																					    Nam
																					</label>
																				</div>
																				<div class="form-check">
																					<form:radiobutton  disabled="true" class="form-check-input" checked = "${acc.staff.sex == false ? 'checked' : '' }" path="staff.sex" value="false" />
																					<label class="form-check-label">
																					    Nữ
																					</label>
																				</div>
																			</div>																			
																		</div>	
																		<div class="mb-3">
																			<label class="form-label">Sinh nhật</label>
																			<form:input  disabled="true" class="form-control" type="date" path="staff.birthday" value="${acc.staff.getBirthday()}"/>
																		</div>
																		<div class="mb-3">
																			<label class="form-label">Số điện thoại</label>
																			<form:input  disabled="true" class="form-control" path="staff.phoneNumber" value = "${acc.staff.getPhoneNumber()}" />
																		</div>
																		<div class="mb-3">
																			<label class="form-label">Chi nhánh</label>
																			<form:input  disabled="true" class="form-control" path="staff.branch.name" value = "${acc.staff.getBranch().getName()}" />
																		</div>
																		<div class="mb-3">
																			<form:checkbox disabled="true" path="staff.status" checked="${acc.staff.getStatus() == true ? 'checked' : ''}"/>
																			<label class="form-label">Còn làm</label>
																		</div> 
																		
																	</c:otherwise>
																</c:choose>									          			
											         		</div>
											         	</div> 
										          	</div>										          	
										          </form:form>
												  <div class="d-flex justify-content-center col text-center">
													<button class="btn btn-primary btn-lg mt-auto" type="submit">
														<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Submit đi
													</button>
												</div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
										        <button type="button" class="btn btn-primary">Save changes</button>
										      </div>
										    </div>
										  </div>
										</div>
																
										<button type="button" class="ui negative basic button"  data-bs-toggle="modal" data-bs-target="#del${acc.username}">
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
									</td>		
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
					<a href="admin/taikhoan/insert.htm"><button
							class="ui green button">
							<i class="plus icon"></i>Thêm Tài Khoản Cho Nhân Viên
						</button></a> ${message}
				</div>
			</div>
		</div>	
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
</body>
</html>