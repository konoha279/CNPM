<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thêm sản phẩm</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/hanghoa/insert.htm"
						method="post" enctype="multipart/form-data"
						modelAttribute="Product">
						<div class="ui two column centered grid">
						
							<div class="column">
								<label>Mã Hàng Hóa</label>
								<form:input type="text" path="ID" />
								<div style="color: red">
									<form:errors path="ID" />
								</div>
							</div>
							
							<div class="column">
								<label>Tên Hàng Hóa</label>
								<form:input path="name" />
								<div style="color: red">
									<form:errors path="name" />
								</div>
							</div>
							
							<div class="column">
								<label>Thương hiệu</label>
								<form:select path="brand.id" items="${Brands}"
									itemValue="id" itemLabel="name" />
							</div>
							
							<div class="column">
								<div class="ui two column centered grid">
									<div class="column">
										<label>Loại sản phẩm</label>
										<form:select path="productlist.id" items="${dsLoai}"
											itemValue="id" itemLabel="name" />
									</div>
									<div class="column">
										<label>Tình Trạng</label>
										<form:select path="status">
											<form:option value="1">Bán</form:option>
											<form:option value="0">Không Bán</form:option>
										</form:select>
									</div>
								</div>
							</div>
							
							<div class="column">
								<label>Hình ảnh</label> <input type="file" name="photo">
							</div>
							
							<div class="column">
								<div class="ui two column centered grid">
									<div class="column">
										<label>Đơn Giá</label>
										<form:input type="number" path="price" value="1000" min="1000" />
									</div>
									<div class="column">
										<label>Giảm Giá</label>
										<form:input type="number" path="discount" value="0" min="0" />
										<div style="color: red">
											<form:errors path="discount" />
										</div>
									</div>
								</div>
							</div>
							
						</div>
						<div class="field">
							<label>Mô tả</label>
							<form:textarea class="ckeditor" path="notes"></form:textarea>
						</div>
						<div>
							<button class="ui button" type="submit">Thêm</button>
							<a onclick="history.back()"><div class="ui button">Trở Lại</div></a> ${message}
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>