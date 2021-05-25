<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Danh sách nhân viên</title>
<base href="${pageContext.servletContext.contextPath}/">
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
				<h1 class="ui header" style="text-align:center ;margin-top: 30px">DANH SÁCH NHÂN VIÊN</h1>
					<table id="TableStaff" class="table table-striped table-bordered dt-responsive nowrap">
						<thead>
							<tr>
								<th>Mã Nhân Viên</th>
								<th>Họ</th>
								<th>Tên</th>
								<th>Chứng minh nhân dân</th>
								<th>Giới tính</th>
								<th>Ngày sinh</th>
								<th>Ngày vào làm</th>
								<th>Chức vụ</th>
								<th>Địa Chỉ</th>
								<th>Tình Trạng</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${Staff}">
								<tr>
									<td>${u.id}</td>
									<td>${u.firstName}</td>
									<td>${u.name}</td>
									<td>${u.cmnd}</td>
									<td>${u.sex==false?'Nữ':'Nam'}</td>
									<td>${u.birthday}</td>
									<td>${u.workday}</td>
									<td>${u.accountStaff.role.name}</td>
									<td>${u.address}</td>
									<td>${u.status==false?'Đã Nghỉ':'Còn Làm'}</td>
									<td><a href="admin/nhanvien/update/${u.id}.htm"><button
												class="ui blue basic button">
												<i class="edit icon"></i>Sửa
											</button></a>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<div class="ui buttons">
						<c:if test="${page==1}">
							<button class="ui labeled icon button"
								style="pointer-events: none; opacity: 0.4;">
								<i class="left chevron icon"></i> Prev
							</button>
						</c:if>
						<c:if test="${page>1}">
							<a href="admin/nhanvien/index.htm?page=${page-1}">
								<button class="ui labeled icon button">
									<i class="left chevron icon"> </i> Prev
								</button>
							</a>
						</c:if>
						<button class="ui button">${page}</button>
						<c:if test="${page==maxpage}">
							<button class="ui right labeled icon button"
								style="pointer-events: none; opacity: 0.4;">
								<i class="right chevron icon"></i>Next
							</button>
						</c:if>
						<c:if test="${page<maxpage}">
							<a href="admin/nhanvien/index.htm?page=${page+1}">
								<button class="ui right labeled icon button">
									<i class="right chevron icon"></i> Next
								</button>
							</a>
						</c:if>
					</div>
					${message} <a href="admin/nhanvien/insert.htm"><button
							class="ui green button" style="float: right;">
							<i class="plus icon"></i>Thêm
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
        $('#TableStaff').DataTable( {
        	lengthChange: false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
                        columns: ':visible'
                    }
                },
                {
                	extend: 'print',
                    exportOptions: {
                    	columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
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