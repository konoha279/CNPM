<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tổng quát</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		// Some raw data (not necessarily accurate)
		var data = google.visualization.arrayToDataTable([
				[ 'Month',  'Tiền thu được' ],
				<c:forEach items="${billReport}" var="r">
				[ '${r.date}', ${r.value} ],
				</c:forEach>
				]);

		var options = {
			title : 'Thống kê thu nhập trong năm nay',
			vAxis : {
				title : 'Đồng'
			},
			hAxis : {
				title : 'Month'
			},
			seriesType : 'bars',
			series : {
				5 : {
					type : 'line'
				}
			}
		};

		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div
					class="four wide computer eight wide tablet sixteen wide mobile column">
					<div class="ui fluid card">
						<div class="content">
							<div class="ui right floated header red">
								<i class="icon shopping cart"></i>
							</div>
							<div class="header">
								<div class="ui red header">${countBill }</div>
							</div>
							<div class="meta">Đơn Hàng</div>
							<div class="description">Hiện có <span class="ui red header">${countBillUnconf }</span> đơn hàng chưa xác nhận</div>
						</div>
						<div class="extra content">
							<div class="ui two buttons">
								<div class="ui red button">Thêm Thông Tin</div>
							</div>
						</div>
					</div>
				</div>
				<div
					class="four wide computer eight wide tablet sixteen wide mobile column">
					<div class="ui fluid card">
						<div class="content">
							<div class="ui right floated header green">
								<i class="icon clock"></i>
							</div>
							<div class="header">
								<div class="ui header green"><f:formatNumber value="${revenue}" type="currency"></f:formatNumber> </div>
							</div>
							<div class="meta">Doanh Thu</div>
							<div class="description" style="display: inline;">Doanh Thu trong tháng này: <span class="ui header green"><f:formatNumber value="${revenue}" type="currency" /> </span></div> 
						</div>
						<div class="extra content">
							<div class="ui two buttons">
								<div class="ui green button">Thêm Thông Tin</div>
							</div>
						</div>
						
					</div>
				</div>
				<div
					class="four wide computer eight wide tablet sixteen wide mobile column">
					<div class="ui fluid card">
						<div class="content">
							<div class="ui right floated header teal">
								<i class="icon briefcase"></i>
							</div>
							<div class="header">
								<div class="ui teal header">${countProduct }</div>
							</div>
							<div class="meta">Sản Phẩm</div>
							<div class="description">Quần Hồng đã được mua nhiều nhất</div>
						</div>
						<div class="extra content">
							<div class="ui two buttons">
								<div class="ui teal button">More Info</div>
							</div>
						</div>
					</div>
				</div>
				<div
					class="four wide computer eight wide tablet sixteen wide mobile column">
					<div class="ui fluid card">
						<div class="content">
							<div class="ui right floated header purple">
								<i class="icon trophy"></i>
							</div>
							<div class="header">
								<div class="ui purple header">5.300.000</div>
							</div>
							<div class="meta">đồng</div>
							<div class="description">Nhân Viên Doanh Số Cao Nhất</div>
						</div>
						<div class="extra content">
							<div class="ui two buttons">
								<div class="ui purple button">More Info</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div id="chart_div" style="width: 1400px; height: 500px;"></div>
			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"
		integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI="
		crossorigin="anonymous"></script>
	<script src="./js/script.js"></script>
</body>
</html>