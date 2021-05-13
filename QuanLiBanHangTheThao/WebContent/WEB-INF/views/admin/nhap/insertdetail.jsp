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
					<form class="ui form" method="post">
						<div class="field">
							<div class="fields">
								<div class="four wide field">
									<label>Hàng Hóa</label> <select path="hangHoa.tinhTrang">
										<option value="1">Quần</option>
										<option value="0">Áo</option>
									</select>
								</div>
								<div class="four wide field">
									<label>Size</label> <input type="number"
										path="hangHoa.name" />
								</div>
								<div class="four wide field">
									<label>Số Lượng</label> <input type="number"
										path="hangHoa.name" />
								</div>
								<div class="field" style="margin-top: 24px">
									<a href="#"><button class="ui green button">
											<i class="plus icon"></i>Thêm
										</button></a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Hàng Hóa</th>
								<th>Tên Hàng Hóa</th>
								<th>Kích Thước</th>
								<th>Số Lượng</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>0001</td>
								<td>Quần Hồng</td>
								<td>XL</td>
								<td><div class="large ui buttons">
										<a href="#"><button class="ui button">-</button></a>
										<button class="ui button">1</button>
										<a href="#"><button class="ui button">+</button></a>
									</div></td>
								<td><a
									href="admin/hoadon/chitiethoadon/${maHoaDon}/delete/${u.maCTHoaDon}.htm"><button
											class="ui red basic button">Xóa</button></a></td>
							</tr>
						</tbody>
					</table>
					<div class="ui right floated button">
						<div class="ui animated fade button" tabindex="0">
							<div class="visible content">Lưu</div>
							<div class="hidden content">
								<a href="main/thanhtoan.htm"><f:formatNumber type="currency"
										maxFractionDigits="0" currencySymbol="" value="1000" />đ</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>