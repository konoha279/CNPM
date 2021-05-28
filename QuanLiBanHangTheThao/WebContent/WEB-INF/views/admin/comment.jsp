<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">QUẢN LÝ BÌNH LUẬN</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table  id="TableComment" class="table table-striped table-bordered dt-responsive nowrap">
						<colgroup>
							<col span="1" style="width: 10%">
							<col span="1" style="width: 10%">
							<col span="1" style="width: 10%">
							<col span="1" style="width: 40%">
							<col span="1" style="width: 10%">
							<col span="1" style="width: 20%">
						</colgroup>
						<thead>
							<tr>
								<th>Mã bình luận</th>
								<th>Username</th>
								<th>Sản phẩm</th>
								<th>Nội dung</th>
								<th>Thời gian</th>
								<th>Tương tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${ListComment}">
								<tr>
									<td>${c.id}</td>
									<td>${c.accountCmt.username}</td>
									<td>${c.productCmt.name}</td>
									<td>${c.content}</td>
									<td>${c.time}</td>
									<td>
										<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#edit${c.id}">
												<i class="edit icon"></i>Chỉnh sửa nội dung
										</button>	
										<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete${c.id}" >
												<i class="fa fa-ban"></i> Xóa
										</button>
										<!-- ----------------------------------------------- Chỉnh sửa ----------------------------------------------- -->
										<div class="modal fade" id="edit${c.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered modal-lg">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="staticBackdropLabel">Chỉnh sửa nội dung bình luận</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										       	<div class="container">
													<div class="form-group">
														<label  class="form-label">Nội dung</label>
														<textarea class="form-control ckeditor" name="editcontent${c.id }" id="editcontent${c.id}" rows="10" style="align-self: center; resize: none;" >${c.content}</textarea>													
													</div>
												</div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
										        <button type="button" class="btn btn-primary" onclick="edit('${c.id}')">Lưu</button>
										      </div>
										    </div>
										  </div>
										</div>
										<!-- ----------------------------------------------- Xóa ----------------------------------------------- -->
										<div class="modal fade" id="delete${c.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered modal-lg">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="staticBackdropLabel">Xóa binh luận</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										       	<div class="container">
													<h1 style="color: red">Chắc chưa?</h1>
												</div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chưa chắc</button>
										        <button type="button" class="btn btn-primary" onclick="deleteCmt('${c.id}')">Chắc luôn</button>
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
<script type="text/javascript">

	function edit(m_id)
	{
		var m_content = CKEDITOR.instances['editcontent'+m_id].getData();
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/comment/edit.htm",
			data: {
				id: m_id,
				content: m_content
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
	
	function deleteCmt(m_id)
	{
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/comment/delete.htm",
			data: {
				id: m_id
			},
			type: "post",
			success: function (data)
				{
					alert(data);
					if (data == "Xóa thành công.")
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
        $('#TableComment').DataTable( {
        	lengthChange: false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [ 0, 2, 3, 4 ]
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 0, 2, 3, 4 ]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 2, 3, 4 ]
                    }
                },
                {
                	extend: 'print',
                    exportOptions: {
                    	columns: [ 0, 2, 3, 4 ]
                    }
                },
                'colvis'
            ]
        } );
    } );
     </script>
</body>
</html>