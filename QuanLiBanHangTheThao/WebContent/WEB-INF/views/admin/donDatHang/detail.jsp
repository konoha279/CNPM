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
								<th>Mã Hàng Hóa</th>
								<th>Ảnh</th>
								<th>Tên Hàng Hóa</th>
								<th>Đơn Giá</th>
								<th>Giảm Giá</th>
								<th>Số Lượng</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>00001</td>
								<td></td>
								<td>Quần Hồng</td>
								<td>1.000.000</td>
								<td>30%</td>
								<td>1</td>
							</tr>
						</tbody>
					</table>
					<a href="admin/hanghoa/index.htm"><div class="ui button">Trở Lại</div></a>
					${message}
				</div>
			</div>
		</div>
	</div>
</body>
</html>