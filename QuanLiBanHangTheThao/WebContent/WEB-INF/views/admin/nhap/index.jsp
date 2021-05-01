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
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Phiếu Nhập</th>
								<th>Ngày</th>
								<th>Nhân Viên</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach var="u" items="${dsPhieuNhap}">
									<tr>
										<td>${u.maPN}</td>
										<td>${u.ngay}</td>
										<td>${u.nhanVien.fullName}</td>
										<td><a href="admin/nhap/detail/${u.maPN}.htm"><button
													class="ui pink basic button">
													<i class="file alternate outline icon"></i>Xem Chi Tiết
												</button></a></td>
									</tr>
								</c:forEach>
							</tr>
						</tbody>
					</table>
					<a href="admin/nhap/insert.htm"><button class="ui green button">
							<i class="plus icon"></i>Thêm
						</button></a> ${message}
				</div>
			</div>
		</div>
	</div>
</body>
</html>