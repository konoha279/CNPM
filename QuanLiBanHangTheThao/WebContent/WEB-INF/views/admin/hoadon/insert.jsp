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
					<form class="ui form" action="admin/hanghoa/update.htm"
						method="post" enctype="multipart/form-data">
						<div class="field">
							<label>Ngày</label> <input type="date" path="hangHoa.tenHangHoa" />
						</div>
						<div class="field">
							<label>Kho</label> <select path="hangHoa.tinhTrang">
								<option value="1">SG01</option>
								<option value="0">SG02</option>
							</select>
						</div>
						<div class="field">
							<label>Tên Khách Hàng</label> <input type="text"
								path="hangHoa.tenHangHoa" /> </select>
						</div>
						<div class="field">
							<label>Số điện thoại</label> <input type="number"
								path="hangHoa.tenHangHoa" />
						</div>
						<div>
							<button class="ui green button" type="submit">
								<i class="plus icon"></i>Thêm Chi Tiết Hóa Đơn
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>