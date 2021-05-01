<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
				[ 'Month', 'Chi', 'Thu' ],
				[ '01/2020', 165, 938 ],
				[ '02/2020', 135, 1120 ],
				[ '03/2020', 157, 1167 ],
				[ '04/2020', 139, 1110 ],
				[ '05/2020', 136, 691 ],
				[ '06/2020', 200, 691 ],
				[ '07/2020', 300, 691 ],
				[ '08/2020', 272, 691 ],
				[ '09/2020', 500, 691 ],
				]);

		var options = {
			title : 'Doanh Số 9 Tháng Gần Nhất',
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
								<div class="ui red header">100</div>
							</div>
							<div class="meta">Đơn Hàng</div>
							<div class="description">Đơn Hàng Chưa Xác Nhận</div>
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
								<div class="ui header green">1.000.000.000</div>
							</div>
							<div class="meta">Doanh Thu</div>
							<div class="description">Doanh Thu của 1 tháng gần đây</div>
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
								<div class="ui teal header">100</div>
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