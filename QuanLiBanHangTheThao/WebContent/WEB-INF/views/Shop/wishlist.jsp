<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Giỏ hàng</title>
    <link href="resources/Shop/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/Shop/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/Shop/css/prettyPhoto.css" rel="stylesheet">
    <link href="resources/Shop/css/price-range.css" rel="stylesheet">
    <link href="resources/Shop/css/animate.css" rel="stylesheet">
	<link href="resources/Shop/css/main.css" rel="stylesheet">
	<link href="resources/Shop/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/Shop/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/Shop/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/Shop/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="resources/Shop/images/ico/apple-touch-icon-57-precomposed.png">

</head><!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<c:choose>
		<c:when test="${!cookie.containsKey('username')}">
			<section id="cart_items">
				<div class="container">
					<h1> Bạn cần phải <a href="login.htm">đăng nhập</a> để tiếp tục. Nếu bạn chưa có tài khoản thì có thể đăng ký <a href="registry.htm">tại đây</a>.</h1>
				</div>
			</section> <!--/#cart_items-->
		</c:when>
		<c:when test="${empty myWishList}">
			<section id="cart_items">
				<div class="container">
					<h1> Danh sách yêu thích của bạn trống.</h1>
					
				</div>
			</section> <!--/#cart_items-->
		</c:when>
		<c:otherwise>
			<section id="cart_items">
				<div class="container" id ="container">
				<h2>Danh sách yêu thích</h2>
					<div class="table-responsive cart_info">
						<table class="table table-condensed">
						<colgroup>
							<col span="1" style="width: 15%">
							<col span="1" style="width: 40%">
							<col span="1" style="width: 10%">
							<col span="1" style="width: 15%">
							<col span="1" style="width: 10%">
						</colgroup>	
							<thead>
								<tr class="cart_menu">
									<td class="image">Hình sản phẩm</td>
									<td class="description" style="text-align: center;" >Tên sản phẩm</td>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${myWishList}" var="w">
								<tr>
									<td class="cart_product">
										<a href=""><img style="width: 120px; height: 90px;" src="images/${w.sanPham.image }" alt=""></a>
									</td>
									<td class="cart_description">
										<h4><a href="">${w.sanPham.name }</a></h4>										
									</td>
									<td class="cart_delete">
										<a class="cart_quantity_delete" href="SanPham-${w.sanPham.id}.htm"><i class="fa fa-info"></i></a>
										<a class="cart_quantity_delete" onclick="remove('${w.sanPham.id}')"><i class="fa fa-times"></i></a>
									</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
			</section> <!--/#cart_items-->
		</c:otherwise>
	</c:choose>

	
	

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	
	</script>
	<script id="thankyou" type="text/html">
<div style="text-align: center;">
	<h2> Cảm ơn bạn đã mua hàng, nhân viên sẽ xác nhận đơn hàng của bạn sau vài giờ.</h2>
	<image style="width: 700px; height: 500px;" src = "resources/Thanks.jpg" />
</div>
	</script>
</body>
</html>