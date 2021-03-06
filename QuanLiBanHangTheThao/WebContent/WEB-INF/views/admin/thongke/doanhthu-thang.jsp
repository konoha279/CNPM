<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thống kê doanh thu - tháng</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css">

<style type="text/css">
.modal-lg {
        max-width: 90% !important;

}
</style>   

</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
					<h2 style="margin-bottom:10px">Thống kê doanh thu theo tháng</h2>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form class="ui form" action="admin/thongke/doanhthu-thang.htm" method="post">
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
			
		    <div>
			    <h3 style="text-align: center;">Thống kê thu nhập</h3>
			    <div id="money_by_date_chart" style="width: 90%; height: 300px; padding-left:50px; margin-top: 20px"></div>
		    </div>
		    <div style="margin-top: 20px">
		    	<h3 style="text-align: center;">Thống kê sản phẩm và đơn hàng</h3>
			    <div id="total_sell_product_by_date_chart" style="width: 90%; height: 300px; padding-left:50px"></div>
		    </div>
			
			<h2>Chi Tiết</h2>
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Thời gian</th>
								<th>Tổng tiền</th>
								<th style="text-align: center;">Số lượng đơn đặt hàng</th>
								<th style="text-align: center;">Số lượng sản phẩm bán được</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="r" items="${objectReports}">
								<c:if test="${r.bills.size() != 0 }">
									<tr>
										<td>${r.date}</td>
										
										<td><f:formatNumber type="currency" maxFractionDigits="0" currencySymbol="" value="${r.value[1]}" /> đ</td>
										<td style="text-align: center;">${r.bills.size()} đơn</td>
										<td style="text-align: center;">${r.value[0]} sản phẩm</td>										
										<td> <button type="button" class="ui blue basic button"  data-bs-toggle="modal" data-bs-target="#detail${r.id}">
													<i class="edit icon"></i>Xem chi tiết
											</button>	
										 </td>					
									</tr>
								</c:if>
							</c:forEach>
							<tr style="background-color: #bfbfbf">
								<th>TỔNG</th>
								<th><f:formatNumber type="currency" maxFractionDigits="0" currencySymbol="" value="${allMoney}" /> đ</th>
								<th style="text-align: center;">${allBill} đơn</th>
								<th style="text-align: center;">${allProduct} sản phẩm</th>
								<th></th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<c:forEach var="r" items="${objectReports}">	
	<c:if test="${r.bills.size() != 0 }">
	 <!-- Modal -->
	 <div class="modal fade" id="detail${r.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
		  <div class="modal-content" >
			<div class="modal-header" >
			  <h1 class="modal-title"id="staticBackdropLabel">Chi tiết đơn hàng</b></h1>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" >
				<table id="Table${r.id }" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%;" >													
					<thead>
						<tr>
							<th>Mã Đơn Đặt Hàng</th>
							<th>Ngày tạo đơn hàng</th>
							<th>Tài khoản mua</th>
							<th>Tình Trạng</th>
							<th>Nhân Viên tạo đơn (xác nhận)</th>
							<th>Địa chỉ nhận hàng</th>
							<th>Tổng tiền mua hàng</th>		
							<th>Phí vận chuyện</th>
							<th>Thành tiền</th>
						</tr>													
					</thead>
					<tbody>
						<c:forEach items="${r.bills }" var="b">
							
								<tr>
									<td>${b.id }</td>
									<td>${b.date }</td>
									<td>${b.account.username }</td>
									<td>${b.status == true ? 'Đã xác nhận' : 'Chưa xác nhận' }</td>
									<td><c:if test="${empty b.staff == false }">${b.staff.getFullName() }</c:if> </td>
									<td>${b.address }</td>
									<td><f:formatNumber value="${b.moneyProduct }" type="currency" /> </td>
									<td><f:formatNumber value="${b.transportationFee }" type="currency" /></td>
									<td><f:formatNumber value="${b.moneyProduct + b.transportationFee }" type="currency" /></td>
								</tr>
						
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
	</c:if>
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
    <c:forEach var="r" items="${objectReports}">	
		<c:if test="${r.bills.size() != 0 }">
			<script>
			    $(document).ready(function() {
			        $('#Table${r.id }').DataTable( {
			        	lengthChange: false,
			            dom: 'Bfrtip',
			            buttons: [
			                {
			                    extend: 'copyHtml5',
			                    exportOptions: {
			                    }
			                },
			                {
			                    extend: 'excelHtml5',
			                    exportOptions: {
			                    }
			                },
			                {
			                    extend: 'pdfHtml5',
			                    exportOptions: {
			                    }
			                },
			                {
			                	extend: 'print',
			                    exportOptions: {
			                    }
			                },
			                'colvis'
			            ]
			        } );
			    } );
	     </script>
		
		</c:if>
	</c:forEach>
    	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Tháng', 'Tổng tiền'],
          <c:forEach items="${objectReports}" var="r">
			[ '${r.date}', ${r.value[1]} ],
			</c:forEach>
        ]);

        var options = {
       		bar: {
                groupWidth: '20%'
            },
   			vAxis : {
   				title : 'Đồng'
   			},
   			hAxis : {
   				title : 'Ngày'
   			},
   			seriesType : 'bars',
   			series : {
   				5 : {
   					type : 'line'
   				}
   			}
   			
        };

        var chart = new google.charts.Bar(document.getElementById("money_by_date_chart"));

        chart.draw(data, options); 
      }

    </script>
    
   
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Tháng', 'Tổng Sản phẩm', 'Số đơn hàng' , { role: 'style' }],
          <c:forEach items="${objectReports}" var="r">
			[ '${r.date}', ${r.value[0]}, ${r.bills.size()}, 'color: red' ],
			</c:forEach>
        ]);

        var options = {
          chart: {
            colors: ['red'],
            bar: {
                groupWidth: "60%"
            }
            //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById("total_sell_product_by_date_chart"));

        chart.draw(data, google.charts.Bar.convertOptions(options));
        
        
      }

    </script>
</body>
</html>

