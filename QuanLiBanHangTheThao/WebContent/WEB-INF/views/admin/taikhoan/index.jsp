<%@ page pageEncoding="utf-8"%>
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
								<th>Tài Khoản</th>
								<th>Họ</th>
								<th>Tên</th>
								<th>Email</th>
								<th>Chức vụ</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><a href="admin/hanghoa/update/${u.maHangHoa}.htm"><button
											class="ui blue basic button">
											<i class="edit icon"></i>Sửa
										</button></a> <a href="admin/hanghoa/delete/${u.maHangHoa}.htm"><button
											class="ui negative basic button">
											<i class="ban icon"></i>Xóa
										</button></a></td>
							</tr>
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
</body>
</html>