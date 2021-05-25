<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Danh sách đơn đặt hàng</title>
<base href="${pageContext.servletContext.contextPath}/">

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
				<h1 class="ui header" style="text-align:center ;margin-top: 30px">DANH SÁCH ĐƠN ĐẶT HÀNG</h1>
					<table id="TableBill" class="table table-striped table-bordered dt-responsive nowrap">
						<thead>
							<tr>
								<th>Mã Số Đơn Đặt Hàng</th>
								<th>Ngày tạo đơn hàng</th>
								<th>Tài khoản mua</th>
								<th>Tổng tiền thanh toán</th>		
								<th>Phí vận chuyện</th>
								<th>Tình Trạng</th>
								<th>Nhân Viên tạo đơn (xác nhận)</th>
								<th>Địa chỉ nhận hàng</th>
								<th>Tương tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listBill}" var="b">
								<tr>
									<td>${b.id }</td>
									<td>${b.date }</td>
									<td>${b.account.username }</td>
									<td><f:formatNumber value="${b.moneyProduct }" type="currency" /> </td>
									<td><f:formatNumber value="${b.transportationFee }" type="currency" /></td>
									<td>${b.status == true ? 'Đã xác nhận' : 'Chưa xác nhận' }</td>
									<td><c:if test="${empty b.staff == false }">${b.staff.getFullName() }</c:if> </td>
									<td>${b.address }</td>
									<td>
										<button type="button" class="ui blue basic button"  data-bs-toggle="modal" data-bs-target="#detail${b.id}">
												<i class="edit icon"></i>Xem chi tiết
										</button>		
										
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" class="ui green button" data-bs-toggle="modal" data-bs-target="#insert">
							<i class="plus icon"></i>Tạo đơn hàng
						</button>
					 ${message}
				</div>
			</div>
		</div>
	</div>
	<c:forEach items="${listBill}" var="b">
		<!-- Modal -->
		<div class="modal fade" id="detail${b.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
			  <div class="modal-content" >
				<div class="modal-header" >
				  <h1 class="modal-title"id="staticBackdropLabel">Chi tiết hóa đơn</b></h1>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" >
					<table id="TableCTBill${b.id }" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%;" >													
						<thead>
							<tr>
								<th>Tên sản phẩm</th>
								<th>Kích thước</th>
								<th>Đơn giá</th>
								<th>Số lượng</th>
								<th>Khuyến mãi</th>
								<th>Tổng tiền </th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${b.ctBills }" var="ct">
								<tr>
									<td>${ct.cTHangHoa.maHangHoa.name }</td>
									<td>${ct.cTHangHoa.size.name } </td>
									<td> <f:formatNumber value="${ct.unitPrice }" type="currency" /> </td>
									<td>${ct.count } </td>
									<td> <f:formatNumber value="${ct.promotion }" type="percent" /> </td>
									<td> <f:formatNumber value="${(ct.unitPrice - (ct.unitPrice * (ct.promotion/100))) * ct.count }" type="currency" />
								</tr>
							</c:forEach>															
						</tbody>
					</table>
				</div>
		      <div class="modal-footer">
		       	<button type="button"  class="btn btn-danger" ${b.status == true ? 'disabled=\"disabled\"' : '' } data-bs-toggle="modal" data-bs-target="#del${b.id}">Xóa đơn hàng</button>
		        <button type="button" ${b.status == true ? 'disabled=\"disabled\"' : '' } onclick="confirm('${b.id}')" class="btn btn-primary">Xác nhận đơn hàng</button>
		       	<button type="button"  class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="del${b.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
		        <button type="submit" onclick="deleteBill('${b.id}')" class="btn btn-primary">Chắc luôn</button>
		      </div>
		    </div>
		  </div>
		</div>
	</c:forEach>
										
	
	<div class="modal fade" id="insert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title" id="staticBackdropLabel">Tạo đơn hàng</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">

													 
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		        <button type="button" onclick="add()" class="btn btn-primary">Tạo</button>
		      </div>
		    </div>
		  </div>
		</div>
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
    <script type="text/javascript">
	    function confirm(id)
		{
			$.ajax({
				url: "${pageContext.servletContext.contextPath}/admin/donDatHang/confirm.htm",
				data: {
					ID: id
				},
				type: "post",
				success: function (data)
					{
						alert(data);
						location.reload();
					},
					error: function(data)
					{
						alert(data);
					}
				})
		}
	    
	    function deleteBill(id)
		{
			$.ajax({
				url: "${pageContext.servletContext.contextPath}/admin/donDatHang/deleteBill.htm",
				data: {
					ID: id
				},
				type: "post",
				success: function (data)
					{
						alert(data);
						location.reload();
					},
					error: function(data)
					{
						alert(data);
					}
				})
		}
    
    </script>
    <script>
    $(document).ready(function() {
        $('#TableBill').DataTable( {
        	lengthChange: false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ],
                        columns: ':visible'
                    }
                },
                {
                	extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ],
                		columns: ':visible'
                    }
                },
                'colvis'
            ]
        } );
        
    } );
     </script>	
     <c:forEach items="${listBill}" var="b">
     	<script>
		    $(document).ready(function() {
		        $('#TableCTBill${b.id }').DataTable( {
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
</body>
</html>