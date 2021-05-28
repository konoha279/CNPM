<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Danh sách phiếu nhập</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css">

<style type="text/css">
.modal-lg {
        max-width: 70% !important;

}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
				<h1 class="ui header" style="text-align:center ;margin-top: 30px">DANH SÁCH PHIẾU NHẬP</h1>
					<table id="TableReceipt" class="table table-striped table-bordered dt-responsive nowrap">
						<thead>
							<tr>
								<th>Mã Phiếu Nhập</th>
								<th>Ngày</th>
								<th>Nhân Viên</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dsPhieuNhap}">
								<tr>
									<td>${u.id}</td>
									<td>${u.date}</td>
									<td>(${u.staff.id}) ${u.staff.fullName}</td>
									<td>
										<button type="button" class="ui blue basic button"  data-bs-toggle="modal" data-bs-target="#detail${u.id}">
												<i class="edit icon"></i>Xem chi tiết
										</button>	
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="admin/nhap/insert.htm"><button class="ui green button">
							<i class="plus icon"></i>Thêm
						</button></a> ${message}
				</div>
			</div>
		</div>
	</div>

	<c:forEach items="${dsPhieuNhap }" var="p">
		<div class="modal fade" id="detail${p.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
			  <div class="modal-content" >
				<div class="modal-header" >
				  <h1 class="modal-title"id="staticBackdropLabel">Chi tiết phiếu nhập</b></h1>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" >
					<table id="TableCTReceipt${p.id }" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%;" >													
						<thead>
							<tr>
								<th>Mã số phiếu nhập</th>
								<th>Sản phẩm</th>
								<th>Kích thước</th>
								<th>Số lượng</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${p.ctPhieuNhaps  }" var="ct">
								<tr>
									<td>${ct.phieuNhap.id }</td>
									<td>${ct.cTHangHoa.maHangHoa.name }</td>
									<td>${ct.cTHangHoa.size.name }</td>
									<td>${ct.soLuong }</td>
								</tr>
							</c:forEach>															
						</tbody>
					</table>
				</div>
		      <div class="modal-footer">
		       	<button type="button"  class="btn btn-danger" ${empty admin ? "disabled = 'disabled' style='display: none;'" : "" } id="delButton${p.id }" data-bs-toggle="modal" data-bs-target="#del${p.id}">Xóa đơn hàng</button>
		       	<button type="button"  class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="del${p.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="staticBackdropLabel">Xóa đơn hàng</b></h5>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<h1 style="color: red">Chắc chưa?</h1>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chưa chắc</button>
		        <button type="button" onclick="deleteReceipt('${p.id}')" class="btn btn-primary">Chắc luôn</button>
		      </div>
		    </div>
		  </div>
		</div>
	</c:forEach>
	
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
        $('#TableReceipt').DataTable( {
        	lengthChange: false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2 ],
                        columns: ':visible'
                    }
                },
                {
                	extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2 ],
                		columns: ':visible'
                    }
                },
                'colvis'
            ]
        } );
        
    } );
     </script>	
     <c:forEach items="${dsPhieuNhap}" var="b">
     	<script>
		    $(document).ready(function() {
		        $('#TableCTReceipt${b.id }').DataTable( {
		        	lengthChange: false,
		            dom: 'Bfrtip',
		            buttons: [
		                {
		                    extend: 'copyHtml5',
		                    exportOptions: {
		                		columns: ':visible'
		                    }
		                    
		                },
		                {
		                    extend: 'excelHtml5',
		                    exportOptions: {
		                		columns: ':visible'
		                    }
		                   
		                },
		                {
		                    extend: 'pdfHtml5',
		                    exportOptions: {
		                		columns: ':visible'
		                    }
		                    
		                },
		                {
		                	extend: 'print',
		                	exportOptions: {
		                		columns: ':visible'
		                    }
		                  
		                },
		                'colvis'
		            ]
		        } );
		        
		        
		    } );
		     </script>	
     </c:forEach>
     <script type="text/javascript">
     	
     	function deleteReceipt(id)
     	{
     		$.ajax({
    			url: "${pageContext.servletContext.contextPath}/admin/nhap/delete.htm",
    			data:{
    				id: id
    			},
    			type: "post",
    			success: function (data)
    				{
    					alert(data);
    					window.location.replace("${pageContext.servletContext.contextPath}/admin/nhap/index.htm");
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