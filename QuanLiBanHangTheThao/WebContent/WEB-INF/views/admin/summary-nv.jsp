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
          ['Name', 'Tổng tiền'],
          <c:forEach items="${summary}" var="r">
			[ '${r.name}', ${r.totalMoney} ],
			</c:forEach>
        ]);

        var options = {
          chart: {
            title: 'Tổng tiền từng nhân viên',
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
					<h2 style="margin-bottom:50px">Thống kê tình hình làm ăn của Nhân viên trong 30 ngày gần nhất</h2>
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
			   
			     <div id="total_sell_product_by_date_chart" style="width: 90%; height: 300px; padding-left:50px"></div>
			
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Nhân viên</th>
								<th>Tên Nhân viên</th>
								<th>Tổng sản phẩm bán được</th>
								<th>Doanh số</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${summary}">
								<tr>
									<td>${u.id}</td>
									<td>${u.name}</td>
									<td>${u.totalProducts}</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.totalMoney}" /> đ</td>
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

