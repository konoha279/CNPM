<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/nhanvien/insert.htm"
						modelAttribute="Staff" method="post">
						<div class="two fields">
							<div class="field">
								<label>Họ</label>
								<div class="field">
									<form:input path="FirstName" />
									<div style="color: red">
										<form:errors path="FirstName" />
									</div>
								</div>
							</div>
							<div class="field">
								<label>Tên</label>
								<div class="field">
									<form:input path="Name" />
									<div style="color: red">
										<form:errors path="Name" />
									</div>
								</div>
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>Địa chỉ </label>
								<form:input path="address" />
								<div style="color: red">
									<form:errors path="address" />
								</div>
							</div>
							<div class="field">
								<label>Ngày Sinh </label>
								<form:input path="birthday" type="date" />
								<div style="color: red">
									<form:errors path="birthday" />
								</div>
							</div>
						</div>
						<div class="field">
							<div class="three fields">
								<div class="field">
									<label>Giới Tính</label>
									<form:select path="sex">
										<form:option value="1">Nam</form:option>
										<form:option value="0">Nữ</form:option>
									</form:select>

								</div>
								<div class="field">
									<label>Chi Nhánh</label>
									<form:select path="branch.id" items="${dsChiNhanh}"
										itemValue="id" itemLabel="name" />
								</div>
								<div class="field">
									<label>Tình Trạng</label>
									<form:select path="status">
										<form:option value="1">Còn Làm</form:option>
										<form:option value="0">Nghỉ Việc</form:option>
									</form:select>
								</div>
							</div>
						</div>
						<div>
							<button class="ui green button" type="submit">
								<i class="plus icon"></i>Thêm
							</button>
							<a href="admin/nhanvien/index.htm"><div class="ui button">Trở
									Lại</div></a> ${message}
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>