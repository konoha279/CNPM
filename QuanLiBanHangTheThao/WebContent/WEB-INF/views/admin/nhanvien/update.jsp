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
					<form:form class="ui form" action="admin/nhanvien/update.htm" modelAttribute="staff" method="post">
						<form:input path="id" value="${id}" type="hidden" />					
						<div class="two fields">
							<div class="field">
								<label>Họ</label>
								<div class="field">
									<form:input path="firstName" />
									<div style="color: red">
										<form:errors path="firstName" />
									</div>
								</div>
							</div>
							<div class="field">
								<label>Tên</label>
								<div class="field">
									<form:input path="name" />
									<div style="color: red">
										<form:errors path="name" />
									</div>
								</div>
							</div>
						</div>
						<div class="field">
							<label>Chứng minh nhân dân </label>
							<form:input path="cmnd" />
							<div style="color: red">
								<form:errors path="cmnd" />
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>Ngày vào làm </label>
								<form:input path="workday" type="date"/>
								<div style="color: red">
									<form:errors path="workday" />
								</div>
							</div>
							<div class="field">
								<label>Ngày Sinh </label>
								<form:input path="birthday" type="date"/>
								<div style="color: red">
									<form:errors path="birthday" />
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
							<label>Số điện thoại </label>
								<form:input path="phoneNumber" type="text"/>
								<div style="color: red">
									<form:errors path="phoneNumber" />
								</div>								
							</div>
						</div>
						<div class="field">
							<div class="two fields">
								<div class="field">
									<label>Giới Tính</label>
									<form:select path="sex">
										<form:option value="1">Nam</form:option>
										<form:option value="0">Nữ</form:option>
									</form:select>

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
							<button class="ui button" type="submit">Cập Nhật</button>
							${message}
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>