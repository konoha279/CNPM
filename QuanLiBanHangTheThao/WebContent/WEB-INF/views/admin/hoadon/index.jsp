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
								<th>Mã Số Đơn Đặt Hàng</th>
								<th>Ngày</th>
								<th>Nhân Viên</th>
								<th>Kho</th>
								<th>Hình Thức Thanh Toán</th>
								<th>Tổng Tiền</th>
								<th>Tình Trạng</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>00001</td>
								<td>01/04/2021</td>
								<td>An</td>
								<td>SG01</td>
								<td>Tiền Mặt</td>
								<td>1.000.000</td>
								<td>Đã Thanh Toán</td>
								<td><a href="admin/hanghoa/update/${u.maHangHoa}.htm"><button
											class="ui pink basic button">
											<i class="file alternate outline icon"></i>Xem Chi Tiết
										</button></a></td>
							</tr>
						</tbody>
					</table>
					<a href="admin/hoadon/insert.htm"><button
							class="ui green button">
							<i class="plus icon"></i>Thêm
						</button></a> ${message}
				</div>
			</div>
		</div>
	</div>
</body>
</html>