<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Shop </title>
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
    <link rel="shortcut icon" href="resources/Shop/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/Shop/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/Shop/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/Shop/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="resources/Shop/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section id="advertisement">
		<div class="container">
			<img src="images/shop/advertisement.jpg" alt="" />
		</div>
	</section>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Danh mục sản phẩm</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->							
							<c:forEach var="p" items="${productList}">
                            	<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="shop${p.id}.htm">${p.name}</a></h4>
								</div>
							</div>
                            </c:forEach>							
						</div><!--/category-productsr-->
					
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
						<img alt=""  class="banner" src="resources/Shop/images/banner.png">
						
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Danh sách sản phẩm</h2>
						<c:forEach items="${listProducts}" var="lp">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img class="image-content-product" src="images/${lp.image}" alt="" />
										<c:choose>
											<c:when test="${lp.discount != 0 }">
												<h2><del><f:formatNumber value="${lp.price}" type="currency"/></del></h2>
											</c:when>
											<c:otherwise><div class="content-none"></div></c:otherwise>
										</c:choose>
										<h2><f:formatNumber value="${lp.price - lp.price*(lp.discount/100)}" type="currency"/></h2>
										<p style="max-height: 20px; overflow: hidden; -webkit-line-clamp: 1;">${lp.name}</p>
										<a href="SanPham-${lp.id}.htm" class="btn btn-default add-to-cart"><i class="fa fa-info"></i>Chi tiết</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<c:choose>
												<c:when test="${lp.discount != 0 }">
													<h2><del><f:formatNumber value="${lp.price}" type="currency"/></del></h2>
												</c:when>
												<c:otherwise><div class="content-none"></div></c:otherwise>
											</c:choose>
											<h2><f:formatNumber value="${lp.price - lp.price*(lp.discount/100)}" type="currency"/></h2>
											<p>${lp.name}</p>
											<a href="SanPham-${lp.id}.htm" class="btn btn-default add-to-cart"><i class="fa fa-info"></i>Chi tiết</a>
										</div>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="javascript:addWishList('${lp.id }')"><i class="fa fa-plus-square"></i>Thêm vào danh sách yêu thích</a></li>
									</ul>
								</div>
							</div>
						</div>
						</c:forEach>
					</div><!--features_items-->
					<ul class="pagination">
						<li class="active"><a href="">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>

  
    <script src="resources/Shop/js/jquery.js"></script>
	<script src="resources/Shop/js/price-range.js"></script>
    <script src="resources/Shop/js/jquery.scrollUp.min.js"></script>
	<script src="resources/Shop/js/bootstrap.min.js"></script>
    <script src="resources/Shop/js/jquery.prettyPhoto.js"></script>
    <script src="resources/Shop/js/main.js"></script>
</body>
</html>