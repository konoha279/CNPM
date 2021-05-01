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
					<form:form class="ui form" action="admin/chinhanh/insert.htm"
						modelAttribute="Branch">
						<div class="field">
							<label>Mã Chi Nhánh</label>
							<form:input path="id" />
							<div style="color: red">
								<form:errors path="id" />
							</div>
						</div>
						<div class="field">
							<label>Tên Chi Nhánh</label>
							<form:input path="name" />
							<div style="color: red">
								<form:errors path="name" />
							</div>
						</div>
						<div class="field">
							<label>Địa chỉ </label>
							<form:input path="address" />
							<div style="color: red">
								<form:errors path="address" />
							</div>
						</div>
						<div>
							<button class="ui button">Thêm</button>
							<a href="admin/chinhanh/index.htm"><div class="ui button">Trở
									Lại</div></a> ${message}
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>