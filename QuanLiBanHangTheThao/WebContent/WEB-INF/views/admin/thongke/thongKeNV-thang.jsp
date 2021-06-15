<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thống kê nhân viên</title>
<style type="text/css">
.modal-lg {
        max-width: 60% !important;

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
					<h2 style="margin-bottom:10px">Thống kê tình nhân viên theo tháng</h2>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form class="ui form" action="admin/thongke/thongKeNV-thang.htm" method="post">
						<div class="field">
							<div class="fields">
								<div class="eight  wide field">
									<label>Từ Ngày</label> <input name="tuNgay" class="form-control" type="month" value="${tuNgay}" />
								</div>
								<div class="eight  wide field">
									<label>Tới Ngày</label> <input name="toiNgay" class="form-control" type="month" value="${toiNgay}"  />
								</div>
								<div class="four wide field" style="margin-top: 25px">
									<button class="ui button">Xem Doanh Thu</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			   
			     <div id="productChart" style="width: 90%; height: 300px; padding-left:50px; margin-bottom: 10px;"></div>
			     <div id="moneyChart" style="width: 90%; height: 300px; padding-left:50px; margin-bottom: 10px;"></div>
			     <div id="billChart" style="width: 90%; height: 300px; padding-left:50px; margin-bottom: 10px;"></div>
			
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Nhân viên</th>
								<th>Tên Nhân viên</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="s" items="${staffs}">
								<tr>
									<td>${s.id}</td>
									<td>${s.getFullName()}</td>
									<td> 
										<button type="button" class="ui blue basic button"  data-bs-toggle="modal" data-bs-target="#id${s.id}">
												<i class="edit icon"></i>Xem chi tiết
										</button>	
									</td>	
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<c:forEach var="s" items="${staffs}">	
	 <!-- Modal -->
	 <div class="modal fade" id="id${s.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
		  <div class="modal-content" >
			<div class="modal-header" >
			  <h1 class="modal-title"id="staticBackdropLabel">Chi tiết</b></h1>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" >
				<table id="Table${s.id }" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%;" >													
					<thead>
						<tr>
							<th>Ngày</th>
							<th>Mã số hóa đơn</th>
							<th>Số sản phẩm</th>
							<th>Số tiền</th>
						</tr>													
					</thead>
					<tbody>
						<c:forEach items="${staffReports }" var="rp">
							<c:forEach items="${rp.mainList }" var="ml">
							<c:if test="${ml.staff.id == s.id }">
								<c:forEach items="${ml.bills }" var="b">
									<tr>
										<td>${rp.date }</td>
										<td>${b.id }</td>
										<td>${ml.value[0] }</td>
										<td> <f:formatNumber value="${ml.value[1] }" type="currency" /></td>
									</tr>
								</c:forEach>
							</c:if>
							</c:forEach>								
						</c:forEach>															
					</tbody>
				</table>
			</div>
	      <div class="modal-footer">
	       	 <button type="button"  class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
	      </div>
	    </div>
	  </div>
	</div>
	</c:forEach>
	
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
	<c:forEach var="s" items="${staffs}">
		<script>
		    $(document).ready(function() {
		        $('#Table${s.id }').DataTable( {
		        	lengthChange: false,
		            dom: 'Bfrtip',
		            buttons: [
		                {
		                    extend: 'copyHtml5',
		                    exportOptions: {
		                        columns: [ 0, 1, 2, 3 ]
		                    }
		                },
		                {
		                    extend: 'excelHtml5',
		                    exportOptions: {
		                    	columns: [ 0, 1, 2, 3 ]
		                    }
		                },
		                {
		                    extend: 'pdfHtml5',
		                    exportOptions: {
		                    	columns: [ 0, 1, 2, 3 ]
		                    }
		                },
		                {
		                	extend: 'print',
		                    exportOptions: {
		                    	columns: [ 0, 1, 2, 3 ]
		                    }
		                },
		                'colvis'
		            ]
		        } );
		    } );
     </script>
	</c:forEach>
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
   google.charts.load('current', {'packages':['bar']});
   google.charts.setOnLoadCallback(drawChart);

   function drawChart() {
     var data = google.visualization.arrayToDataTable([
       ['Họ tên nhân viên', <c:forEach items="${staffs}" var="s"> '${s.getFullName()}', </c:forEach> ],
       <c:forEach items="${staffReports}" var="r">
       [ '${r.date}',
		<c:forEach items="${r.mainList}" var= "m">
			${m.value[0]}, 			
		</c:forEach>
		],
</c:forEach>
     ]);

     var options = {
       chart: {
         title: 'Thống kê theo số sản phẩm',
         //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
       }
     };

     var chart = new google.charts.Bar(document.getElementById("productChart"));

     chart.draw(data, google.charts.Bar.convertOptions(options));
     
     
   }

 </script>
 
 <script type="text/javascript">
   google.charts.load('current', {'packages':['bar']});
   google.charts.setOnLoadCallback(drawChart);

   function drawChart() {
     var data = google.visualization.arrayToDataTable([
       ['Họ tên nhân viên', <c:forEach items="${staffs}" var="s"> '${s.getFullName()}', </c:forEach> ],
       <c:forEach items="${staffReports}" var="r">
[ '${r.date}',
	<c:forEach items="${r.mainList}" var= "m">
		${m.value[1]}, 			
	</c:forEach>
],
</c:forEach>
     ]);

     var options = {
       chart: {
         title: 'Thống kê theo tổng tiền',
         //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
       }
     };

     var chart = new google.charts.Bar(document.getElementById("moneyChart"));

     chart.draw(data, google.charts.Bar.convertOptions(options));
     
     
   }

 </script>
 
 <script type="text/javascript">
	   google.charts.load('current', {'packages':['bar']});
	   google.charts.setOnLoadCallback(drawChart);
	
	   function drawChart() {
	     var data = google.visualization.arrayToDataTable([
	       ['Họ tên nhân viên', <c:forEach items="${staffs}" var="s"> '${s.getFullName()}', </c:forEach> ],
	       <c:forEach items="${staffReports}" var="r">
	[ '${r.date}',
		<c:forEach items="${r.mainList}" var= "m">
			${m.bills.size()}, 			
		</c:forEach>
	],
	</c:forEach>
	     ]);
	
	     var options = {
	       chart: {
	         title: 'Thống kê theo tổng số hóa đơn',
	         //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
	       }
	     };
	
	     var chart = new google.charts.Bar(document.getElementById("billChart"));
	
	     chart.draw(data, google.charts.Bar.convertOptions(options));
	     
	     
	   }

 </script>
</body>
</html>

