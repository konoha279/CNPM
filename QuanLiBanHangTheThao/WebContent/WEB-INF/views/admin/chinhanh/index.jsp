<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chi nhánh</title>
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
								<th>Mã Chi Nhánh</th>
								<th>Tên Chi Nhánh</th>
								<th>Địa Chỉ</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dsChiNhanh}">
								<tr>
									<td>${u.id}</td>
									<td>${u.name}</td>
									<td>${u.address}</td>
									<td><a href="admin/chinhanh/update/${u.id}.htm"><button
												class="ui blue basic button">
												<i class="edit icon"></i>Sửa
											</button></a> <a href="admin/chinhanh/delete/${u.id}.htm"><button
												class="ui negative basic button">
												<i class="ban icon"></i>Xóa
											</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="admin/chinhanh/insert.htm"><button class="ui green button">
							<i class="plus icon"></i>Thêm
						</button></a> ${message}
				</div>
			</div>
		</div>
	</div>
</body>
</html>