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
					<form:form class="ui form" action="admin/nhap/insert.htm"
						method="post" modelAttribute="Receipt">
						<div class="field">
							<label>Ngày</label>
							<form:input type="date" path="date" />
						</div>
						<div class="field">
							<label>Nhân Viên</label>
							<form:select path="staff.id" items="${dsNhanVien}"
								itemValue="id" itemLabel="FullName" />
						</div>
						<div>
							<button class="ui green button" type="submit">
								<i class="plus icon"></i>Thêm Chi Tiết Phiếu Nhập
							</button>
							${message}
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>