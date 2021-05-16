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
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
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
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
										        <button type="button" class="btn btn-primary" onclick="editSize('${size.id}')">Understood</button>
										      </div>
										    </div>
										  </div>
										</div>
									</td>
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script type="text/javascript">
	//CKEDITOR.replace('notes-area');
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
</script>
</body>
</html>