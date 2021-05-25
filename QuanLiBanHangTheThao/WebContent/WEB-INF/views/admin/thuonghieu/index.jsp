<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Danh sách thương hiệu</title>
	<link rel="stylesheet" href="resources/admin/main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style type="text/css">
.modal-lg {
    max-width: 60%;
}

</style>
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
				<h1 class="ui header" style="text-align:center ;margin-top: 30px">DANH SÁCH THƯƠNG HIỆU</h1>
					<table  id="TableBrand" class="table table-striped table-bordered dt-responsive nowrap">
						<thead>
							<tr>
								<th>Mã thương hiệu</th>
								<th>Tên thương hiệu</th>
								<th>Tương tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${Brand}" var="b">
								<tr>
									<td>${b.id}</td>
									<td>${b.name}</td>
									
									<td>
										<!-- ------------------------------------------- Nút chỉnh sửa ------------------------------- -->
										<button type="button" class="ui blue basic button"  data-bs-toggle="modal" data-bs-target="#edit${b.id}">
												<i class="edit icon"></i>Chỉnh sửa
										</button>						
										  
										<!-- Modal -->
										<div class="modal fade" id="edit${b.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
											  <div class="modal-content" >
												<div class="modal-header" >
												  <h1 class="modal-title"id="staticBackdropLabel">Chỉnh sửa thương hiệu "<b>${b.name}</b>"</h1>
												  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
										        	<div class="mb-3">
														<label class="form-label">Mã thương hiệu</label>
														<input class="form-control" required="required" value="${b.id}" id="editIDBrand" readonly="readonly" />
													</div>
													<div class="mb-3">
														<label class="form-label">Tên thương hiệu</label>
														<input class="form-control" required="required" value="${b.name}" id="editName${b.id}" />
													</div>			
												 
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
										        <button type="button" class="btn btn-primary" onclick="edit('${b.id}')">Save changes</button>
										      </div>
										    </div>
										  </div>
										</div>

										<!-- ----------------------------------------------- Nút xóa ----------------------------------------------- -->

										<button type="button" class="ui negative basic button" name="disabled${b.id}"  data-bs-toggle="modal" data-bs-target="#del${b.id}">
												<i class="ban icon"></i>Xóa
										</button>
										
										<!-- Modal -->
										<div class="modal fade" id="del${b.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
											<div class="modal-dialog">
											  <div class="modal-content">
												<div class="modal-header">
												  <h5 class="modal-title" id="staticBackdropLabel">Xóa tài khoản <b>${b.id}</b></h5>
												  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
												<h1 style="color: red">Chắc chưa?</h1>
												</div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chưa chắc</button>
										        <button type="submit" class="btn btn-primary" onclick="deleteBrand('${b.id}')">Chắc luôn</button>
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
							<i class="plus icon"></i>Tạo Thương hiệu
						</button>
						
						<!-- ----------------------------------------------------- Thêm -----------------------------------------------------------  -->				

						
					<div class="modal fade" id="insert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title" id="staticBackdropLabel">Tạo Thương hiệu</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
									<div class="mb-3">
										<label class="form-label">Mã thương hiệu</label>
										<input class="form-control" required="required" id="idBrand" />
									</div>
									<div class="mb-3">
										<label class="form-label">Tên thương hiệu</label>
										<input class="form-control" required="required" id="nameBrand" />
									</div>																
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button type="button" onclick="add()" class="btn btn-primary">Tạo</button>
					      </div>
					    </div>
					  </div>
					</div>
							
				</div>
			</div>
		</div>	
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function add() {
	var idBrand = document.getElementById('idBrand').value;
	var nameBrand =document.getElementById('nameBrand').value;
	$.ajax({
	url: "${pageContext.servletContext.contextPath}/admin/thuonghieu/insert.htm",
	data: {
		id: idBrand,
		name: nameBrand
	},
	type: "post",
	success: function (data)
		{
			alert(data);
			if (data == "Thêm thành công")
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

function edit(idBrand) {
	var nameBrand =document.getElementById('editName'+idBrand).value;
	$.ajax({
	url: "${pageContext.servletContext.contextPath}/admin/thuonghieu/edit.htm",
	data: {
		id: idBrand,
		name: nameBrand
	},
	type: "post",
	success: function (data)
		{
			alert(data);
			if (data == "Chỉnh sửa thành công")
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

function deleteBrand(idBrand) {
	$.ajax({
		url: "${pageContext.servletContext.contextPath}/admin/thuonghieu/delete.htm",
		data: {
			id: idBrand
		},
		type: "post",
		success: function (data)
			{
				alert(data);
				if (data == "Xóa thành công")
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

<!-- ---------------------------------------------------------- Export ---------------------------------------------------------- -->
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
        $('#TableBrand').DataTable( {
        	lengthChange: false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [ 0, 1 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 0, 1 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1 ],
                        columns: ':visible'
                    }
                },
                {
                	extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1 ],
                        columns: ':visible'
                
                    }
                },
                'colvis'
            ]
        } );
    } );
     </script>
</body>
</html>