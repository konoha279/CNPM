<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Trang chủ </title>
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
	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="">
									<img style="height: 440px;width: 950px;" src="resources/Shop/images/home/thethao.jpg" class="" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="">
									<img style="height: 440px;width: 950px;" src="resources/Shop/images/home/thethao2.jpg" class="" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="">
									<img style="height: 440px;width: 950px;" src="resources/Shop/images/home/thethao3.jpg" class="" alt="" />
								</div>
							</div>
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">						
						<h2>Danh mục sản phẩm</h2>
						<div class="brands-name panel-group category-products">
							<ul class="nav nav-pills nav-stacked">
								<c:forEach items="${productList}" var="p">
									<li><a href="shop${p.id}.htm"> <span class="pull-right"></span>${p.name }</a></li>								
								</c:forEach>
							</ul>
						</div>
					
						<div class="brands_products"><!--brands_products-->
							<h2>Thương hiệu</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<c:forEach items="${listBrand}" var="b">
										<li><a href="brand${b.id}.htm"> <span class="pull-right">(${b.getSizeProduct()})</span>${b.name }</a></li>								
									</c:forEach>
								</ul>
							</div>
						</div><!--/brands_products-->
						
						<img class="banner" alt="" src="resources/Shop/images/banner.png">
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">TẤT CẢ SẢN PHẨM</h2>
						<c:forEach items="${Products}" var="p">
							<div class="col-sm-4">
								<div class="product-image-wrapper">
									<div class="single-products">
											<div class="productinfo text-center">
												<img class="image-content-product" src="images/${p.image}" alt="" />
												<c:choose>
													<c:when test="${p.discount != 0 }">
														<h2><del><f:formatNumber value="${p.price}" type="currency"/></del></h2>
													</c:when>
													<c:otherwise><div class="content-none"></div></c:otherwise>
												</c:choose>
												<h2> <f:formatNumber value="${p.price - p.price*(p.discount/100)}" type="currency"/></h2>
												<p style="max-height: 20px; overflow: hidden; -webkit-line-clamp: 1;">${p.name}</p>
												<a href="SanPham-${p.id}.htm" class="btn btn-default add-to-cart"><i class="fa fa-info"></i>Chi tiết</a>
											</div>
											<div class="product-overlay">
												<div class="overlay-content">
													<c:choose>
														<c:when test="${p.discount != 0 }">
															<h2><del><f:formatNumber value="${p.price}" type="currency"/></del></h2>
														</c:when>
														<c:otherwise><div class="content-none"></div></c:otherwise>
													</c:choose>
													<h2><f:formatNumber value="${p.price - p.price*(p.discount/100)}" type="currency"/></h2>
													<p>${p.name}</p>
													<a href="SanPham-${p.id}.htm" class="btn btn-default add-to-cart"><i class="fa fa-info"></i>Chi tiết</a>
												</div>
											</div>
									</div>
									<div class="choose">
										<ul class="nav nav-pills nav-justified">
											<li><a href="javascript:addWishList('${p.id }')"><i class="fa fa-plus-square"></i>Thêm vào danh sách yêu thích</a></li>
										</ul>
									</div>
								</div>
							</div>
						</c:forEach>
			
						
					</div><!--features_items-->
					
					<div class="category-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
							<c:forEach items="${productList}" var="p">
								<c:choose>
									<c:when test="${p.id == productList[0].id }">
										<li class="active"><a href="#${p.id}" data-toggle="tab">${p.name}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#${p.id}" data-toggle="tab">${p.name}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							</ul>
						</div>
						<div class="tab-content">
						<c:forEach items="${productList}" var="list">
							<c:choose>
								<c:when test="${list.id == productList[0].id }">
									<div class="tab-pane fade active in" id="${list.id}" >
										<c:forEach items="${list.products}" var="product">
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img style="width: 146px; height: 145px;" src="images/${product.image }" alt="" />
															<h2><f:formatNumber value="${product.price - product.price*(product.discount/100)}" type="currency"/></h2>
															<p style="max-height: 20px; overflow: hidden; -webkit-line-clamp: 1;">${product.name }</p>
															<a href="SanPham-${product.id}.htm" class="btn btn-default add-to-cart"><i class="fa fa-info"></i>Chi tiết</a>
														</div>
														
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade" id="${list.id}" >
									<c:forEach items="${list.products}" var="product">
									<div class="col-sm-3">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img style="width: 146px; height: 145px;" src="images/${product.image }" alt="" />
													<h2><f:formatNumber value="${product.price - product.price*(product.discount/100)}" type="currency"/></h2>
													<p style="max-height: 20px; overflow: hidden; -webkit-line-clamp: 1;">${product.name }</p>
													<a href="SanPham-${product.id}.htm" class="btn btn-default add-to-cart"><i class="fa fa-info"></i>Chi tiết</a>
												</div>
												
											</div>
										</div>
									</div>
									</c:forEach>
									</div>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							</div>
						</div>
					</div><!--/category-tab-->					
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
	

  
    <script src="resources/Shop/js/jquery.js"></script>
	<script src="resources/Shop/js/bootstrap.min.js"></script>
	<script src="resources/Shop/js/jquery.scrollUp.min.js"></script>
	<script src="resources/Shop/js/price-range.js"></script>
    <script src="resources/Shop/js/jquery.prettyPhoto.js"></script>
    <script src="resources/Shop/js/main.js"></script>
</body>
</html>