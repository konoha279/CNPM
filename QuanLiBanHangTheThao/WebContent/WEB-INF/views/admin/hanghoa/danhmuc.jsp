<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Danh mục sản phẩm</title>
<base href="${pageContext.servletContext.contextPath}/">

<style type="text/css">
.modal-lg {
    max-width: 60%;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
				<h1 class="ui header" style="text-align:center ;margin-top: 30px">DANH MỤC SẢN PHẨM</h1>
					<table id="TableSize" class="table table-striped table-bordered dt-responsive nowrap">
						<colgroup>
							<col span="1" style="width: 5%">
							<col span="1" style="width: 10%">
							<col span="1" style="width: 50%">
							<col span="1" style="width: 40%">
						</colgroup>
						<thead>
							<tr>
								<th style="text-align: center;">Mã danh mục</th>
								<th style="text-align: center;">Tên Danh mục</th>
								<th style="text-align: center;">Tương tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dsLoai}" var="l">
								<tr>
									<td>${l.id}</td>
									<td>${l.name}</td>	
									<td>
										<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#edit${l.id}">
												<i class="edit icon"></i>Chỉnh sửa
										</button>	
										<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteDanhMuc${l.id}" >
												<i class="fa fa-ban"></i> Xóa
										</button>	
										<!-- ----------------------------------------------- Chỉnh sửa ----------------------------------------------- -->
										<div class="modal fade" id="edit${l.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered modal-lg">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="staticBackdropLabel">Chỉnh sửa danh mục <strong>${l.name}</strong> </h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										       	<div class="container">
													<div class="form-group">
														<label  class="form-label">Mã size</label>
														<input class="form-control" type="text" value="${l.id}" readonly="readonly"/>
													</div>
													<div class="form-group">
														<label  class="form-label">Tên size</label>
														<input class="form-control" type="text" value="${l.name}" id="editName${l.id}" min="0"/>
													</div>
												</div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
										        <button type="button" class="btn btn-primary" onclick="editDM('${l.id}')">Lưu</button>
										      </div>
										    </div>
										  </div>
										</div>
										<!-- ----------------------------------------------- Xóa ----------------------------------------------- -->
										<div class="modal fade" id="deleteDanhMuc${l.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered modal-lg">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="staticBackdropLabel">Xóa size "${l.name}</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										       	<div class="container">
													<h1 style="color: red">Chắc chưa?</h1>
												</div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chưa chắc</button>
										        <button type="button" class="btn btn-primary" onclick="deleteDM('${l.id}')">Chắc luôn</button>
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
									<label  class="form-label">Mã danh mục</label>
									<input class="form-control" type="text" value="" id="addID" min="0"/>
								</div>
								<div class="form-group">
									<label  class="form-label">Tên danh mục</label>
									<input class="form-control" type="text" value="" id="addName" min="0"/>
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
		var id = document.getElementById('addID').value;
		var name = document.getElementById('addName').value;
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/hanghoa/addDM.htm",
			data: {
				id: id,
				name: name
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
	function editDM(id)
	{
		var name = document.getElementById('editName'+id).value;
		
		
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/hanghoa/editDM.htm",
			data: {
				name: name,
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
	
	
	function deleteDM(id)
	{
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/hanghoa/delDM.htm",
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
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#TableSize').DataTable( {
        	lengthChange: false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2 ]
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2 ]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2 ]
                    }
                },
                {
                	extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2 ]
                    }
                },
                'colvis'
            ]
        } );
    } );
     </script>
</body>
</html>