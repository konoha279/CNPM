<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Danh sách sản phẩm</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css">

</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<h1 class="ui header" style="text-align:center ;margin-top: 80px">QUẢN LÝ HÀNG HÓA</h1>
			<div class="ui grid stackable padded">
				<div class="column">
					<table id="TableProduct" class="table table-striped table-bordered dt-responsive nowrap" >
						<thead>
							<tr>
								<th>Mã Hàng Hóa</th>
								<th>Ảnh</th>
								<th>Tên Hàng Hóa</th>
								<th>Đơn Giá</th>
								<th>Giảm Giá</th>
								<th>Giá tiền sau khi giảm</th>
								<th>Thể Loại</th>
								<th>Thương hiệu </th>
								<th>Tình Trạng</th>
								<th>Tương tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dshangHoa}">
								<tr>
									<td>${u.ID}</td>
									<td><img src="images/${u.image}"
										style="width: 100px; height: 100px" alt="${u.id }" /></td>
									<td>${u.name}</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.price}" /> đ</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.discount}" />%</td>
											<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.price - u.price * (u.discount / 100)}" /> đ</td>
									<td>${u.productlist.name}</td>
									<td>${u.brand.name}</td>
									<td>${u.status==false?'Không Bán':'Bán'}</td>
									<td><a href="admin/hanghoa/update/${u.ID}.htm"><button
												class="ui green basic button">
												<i class="edit icon"></i>Sửa
											</button></a> <a href="admin/hanghoa/delete/${u.ID}.htm"><button
												class="ui negative basic button">
												<i class="ban icon"></i>Xóa
											</button></a> <a href="admin/hanghoa/detail/${u.ID}.htm"><button
												class="ui pink basic button">
												<i class="file alternate outline icon"></i>Xem Chi Tiết
											</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					${message} <a href="admin/hanghoa/insert.htm"><button
							class="ui green button" style="float: left;">
							<i class="plus icon"></i>Thêm sản phẩm
						</button></a>
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
    <script>
    $(document).ready(function() {
        $('#TableProduct').DataTable( {
        	lengthChange: false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [ 0, 2, 3, 4, 5, 6, 7, 8 ]
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 0, 2, 3, 4, 5, 6, 7, 8 ]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 2, 3, 4, 5, 6, 7, 8 ]
                    }
                },
                {
                	extend: 'print',
                    exportOptions: {
                    	columns: [ 0, 2, 3, 4, 5, 6, 7, 8 ]
                    }
                },
                'colvis'
            ]
        } );
    } );
     </script>
</body>
</html>