<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
				
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 pd5" style="margin-right: 80px;"> 
						<div class="box-footerservice">
							<div class="" >
								<div class="pull-left icon-service"></div>
								<h3 class="footerservice-title" style="width: 262px;">Giao hàng nhanh chóng</h3>
								<div class="footerservice-content"> Giao hàng ngay trong nội thành TP.HCM</div>
							</div>
						</div>
					</div>
					
					
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 pd5">
						<div class="box-footerservice">
							<div class="">
								<div class="pull-left icon-service"></div>
								<h3 class="footerservice-title">Giao hàng tận nơi</h3>
								<div class="footerservice-content">Thanh toán tại nhà</div>
							</div>
						</div>
					</div>
					
					
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 pd5">
						<div class="box-footerservice">
							<div class="">
								<div class="pull-left icon-service"></div>
								<h3 class="footerservice-title">Đặt hàng trực tuyến</h3>
								<div class="footerservice-content">Số điện thoại: 0342437678</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2" style="width: 200px; margin-right: 60px;">
						<div class="single-widget" >
							<h2>Giờ mở cửa</h2>
							<ul class="nav nav-pills nav-stacked">
								<li>7:30 - 22:00 các ngày trong tuần. Bao gồm cả ngày lễ và chủ nhật</li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2" style="width: 230px; margin-right: 30px;">
						<div class="single-widget">
							<h2>Chính sách</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="chinhsach.htm">Chính sách bảo mật</a></li>
								<li><a href="chinhsach.htm">Chính sách giao hàng</a></li>
								<li><a href="chinhsach.htm">Chính sách đổi trả sản phẩm</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2" style="width: 200px; margin-right: 60px;">
						<div class="single-widget">
							<h2>Về Chúng Tôi</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="gioithieu.htm">Giới thiệu</a></li>
								<li><a href="contact.htm">Liên lạc</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1" >
						<div class="single-widget">
							<h2>Đăng ký nhận tin tức</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Email của bạn" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	
<script type="text/javascript">
	function addWishList(id)
	{
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/addWishList.htm",
			data: {
				id: id			
			},
			type: "post",
			success: function (data)
				{
					location.reload();
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