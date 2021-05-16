<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Danh sách size trong cửa hàng</title>
<base href="${pageContext.servletContext.contextPath}/">

<style type="text/css">
.modal-lg {
    max-width: 60%;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
				<h1>Danh sách size</h1>
					<table class="ui blue table table-bordered">
						<colgroup>
							<col span="1" style="width: 5%">
							<col span="1" style="width: 5%">
							<col span="1" style="width: 50%">
							<col span="1" style="width: 40%">
						</colgroup>
						<thead>
							<tr>
								<th style="text-align: center;">ID</th>
								<th style="text-align: center;">Tên size</th>
								<th style="text-align: center;"> Ghi chú </th>
								<th style="text-align: center;">Tương tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${size}" var="size">
								<tr>
									<td>${size.id}</td>
									<td>${size.name}</td>	
									<td>${size.notes}</td>
									<td>
										<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#edit${size.id}">
												<i class="edit icon"></i>Chỉnh sửa
										</button>	
										<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteSize${size.id}" >
												<i class="fa fa-ban"></i> Xóa
										</button>	
										<!-- ----------------------------------------------- Chỉnh sửa ----------------------------------------------- -->
										<div class="modal fade" id="edit${size.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered modal-lg">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="staticBackdropLabel">Chỉnh sửa size "${size.name}</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										       	<div class="container">
													<div class="form-group">
														<label  class="form-label">Mã size</label>
														<input class="form-control" type="text" value="${size.id}" readonly="readonly"/>
													</div>
													<div class="form-group">
														<label  class="form-label">Tên size</label>
														<input class="form-control" type="text" value="${size.name}" id="editName${size.id}" min="0"/>
													</div>
													<div class="form-group">
														<label  class="form-label">Tên size</label>
														<textarea class="form-control ckeditor" name="editNotes${size.id}" id="editNotes${size.id}" rows="10" style="align-self: center; resize: none;" >${size.notes}</textarea>													
													</div>
												</div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
										        <button type="button" class="btn btn-primary" onclick="editSize('${size.id}')">Lưu</button>
										      </div>
										    </div>
										  </div>
										</div>
										<!-- ----------------------------------------------- Xóa ----------------------------------------------- -->
										<div class="modal fade" id="deleteSize${size.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered modal-lg">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="staticBackdropLabel">Chỉnh sửa size "${size.name}</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										       	<div class="container">
													<h1 style="color: red">Chắc chưa?</h1>
												</div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chưa chắc</button>
										        <button type="button" class="btn btn-primary" onclick="deleteSize('${size.id}')">Chắc luôn</button>
										      </div>
										    </div>
										  </div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" class="ui green button" data-bs-toggle="modal" data-bs-target="#insert">
						<i class="plus icon"></i>Thêm Size
					</button>
					
					<div class="modal fade" id="insert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-lg">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">Thêm size</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					       	<div class="container">
								<div class="form-group">
									<label  class="form-label">Tên size</label>
									<input class="form-control" type="text" value="" id="addName" min="0"/>
								</div>
								<div class="form-group">
									<label  class="form-label">Tên size</label>
									<textarea class="form-control ckeditor" name="addNotes" id="addNotes" rows="10" style="align-self: center; resize: none;" ></textarea>													
								</div>
							</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
					        <button type="button" class="btn btn-primary" onclick="addSize()">Lưu</button>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script type="text/javascript">	
	function addSize()
	{
		var nameSize = document.getElementById('addName').value;
		var content = CKEDITOR.instances['addNotes'].getData();
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/hanghoa/addSize.htm",
			data: {
				name: nameSize,
				notes: content,
			},
			type: "post",
			success: function (data)
				{
					alert(data);
					if (data == "Thêm thành công.")
					{
						location.reload();
					}
				},
				error: function(data)
				{
					alert(data);
				}
			})
	}
	function editSize(id)
	{
		var nameSize = document.getElementById('editName'+id).value;
		var content = CKEDITOR.instances['editNotes'+id].getData();
		
		
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/hanghoa/editSize.htm",
			data: {
				name: nameSize,
				notes: content,
				ID: id
			},
			type: "post",
			success: function (data)
				{
					alert(data);
					if (data == "Sửa thành công.")
					{
						location.reload();
					}
				},
				error: function(data)
				{
					alert(data);
				}
			})
		
	}
	
	
	function deleteSize(id)
	{
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/hanghoa/delSize.htm",
			data: {
				ID: id
			},
			type: "post",
			success: function (data)
				{
					alert(data);
					if (data == "Xóa thành công."  | data == "Không thể xóa size đã có sản phẩm sử dụng.")
					{
						location.reload();
					}
				},
				error: function(data)
				{
					alert(data);
				}
			})
	}
	
	
</script>
</body>
</html>