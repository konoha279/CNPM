<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Tổng tiền'],
          <c:forEach items="${dsHoaDon}" var="r">
			[ '${r.date}', ${r.moneyProduct} ],
			</c:forEach>
        ]);

        var options = {
          chart: {
            title: 'Tổng tiền theo ngày',
            //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById("money_by_date_chart"));

        chart.draw(data, google.charts.Bar.convertOptions(options));
        
        
      }

    </script>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Tổng Sản phẩm' , { role: 'style' }],
          <c:forEach items="${summaryBillCountByDate}" var="r">
			[ '${r.date}', ${r.totalProducts}, 'color: red' ],
			</c:forEach>
        ]);

        var options = {
          chart: {
            title: 'Tổng Sản phẩm bán được ngày',
            colors: ['red'],
            //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById("total_sell_product_by_date_chart"));

        chart.draw(data, google.charts.Bar.convertOptions(options));
        
        
      }

    </script>
    
  </head>

</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
					<form class="ui form" action="admin/doanhso.htm" method="post">
						<div class="field">
							<div class="fields">
								<div class="eight  wide field">
									<label>Từ Ngày</label> <input name="tuNgay" type="date" value="${tuNgay}" />
								</div>
								<div class="eight  wide field">
									<label>Tới Ngày</label> <input name="toiNgay" type="date" value="${toiNgay}"  />
								</div>
								<div class="four wide field" style="margin-top: 25px">
									<button class="ui button">Xem Doanh Thu</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
<%-- 			<div class="ui grid stackable padded">
				<div class="column">
					<c:if test="${tongTien > 0}">
						<div class="ui massive label">
							<div style="color: red">
								<f:formatNumber type="currency" maxFractionDigits="0"
									currencySymbol="" value="${tongTien}" />
								đ
							</div>
						</div>
					</c:if>
				</div>
			</div> --%>
			    <div id="money_by_date_chart" style="width: 90%; height: 300px; padding-left:50px"></div>
			     <div id="total_sell_product_by_date_chart" style="width: 90%; height: 300px; padding-left:50px"></div>
			
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Hóa Đơn</th>
								<th>Ngày Bán</th>
								<th>Tổng Tiền</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dsHoaDon}">
								<tr>
									<td>${u.id}</td>
									<td>${u.date}</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.moneyProduct}" /> đ</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

