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
								<th>Mã Hàng Hóa</th>
								<th>Ảnh</th>
								<th>Tên Hàng Hóa</th>
								<th>Kích Thước</th>
								<th>Số Lượng</th>
								<th>Đơn Giá</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${phieuNhap.dsCTPN}">
								<tr>

									<td>${u.soLuong}</td>
									<td>${u.donGia}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="admin/nhap/index.htm"><button class="ui button">Trở
							Lại</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>