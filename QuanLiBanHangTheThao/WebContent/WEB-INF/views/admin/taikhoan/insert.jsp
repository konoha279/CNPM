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
							<label>Tài Khoản</label> <input type="text"
								path="hangHoa.maHangHoa" />
						</div>
						<div class="field">
							<label>Mật Khẩu</label> <input type="text"
								path="hangHoa.tenHangHoa" />
						</div>
						<div class="field">
							<label>Chức vụ</label> <select path="hangHoa.tinhTrang">
								<option value="2">Quản Lý</option>
								<option value="1">Nhân Viên</option>
							</select>
						</div>
						<div class="field">
							<label>Nhân Viên</label> <select path="hangHoa.tinhTrang">
								<option value="2">SG</option>
								<option value="1">HN</option>
								<option value="0">ĐN</option>
							</select>
						</div>
						<div>
							<button class="ui green button" type="submit">
								<i class="plus icon"></i>Thêm
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>