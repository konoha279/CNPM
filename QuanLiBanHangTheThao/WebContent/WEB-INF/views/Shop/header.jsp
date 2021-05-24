<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Trang chủ | E-Shopper</title>
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
    <style type="text/css">
    	img#features-items-image
		{
			width: 215px;
			height: 210px;
		}
    	div.content-none
    	{
    		height: 26px;
    		margin-top: 20px;
    		margin-bottom: 10px;
    	}
    </style>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
       
</head><!--/head-->
<body>
<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-md-4 clearfix">
						<div class="logo pull-left">
							<a href="index.htm"><img src="resources/Shop/images/logo.png" alt="" /></a>
						</div>
						
					</div>
					<div class="col-md-8 clearfix">
						<div class="shop-menu clearfix pull-right">
							<ul class="nav navbar-nav">
								<li><a href="profile/account.htm" ><i class="fa fa-user"></i> Tài khoản</a></li>
								<li><a href=""><i class="fa fa-star"></i> Danh sách yêu thích</a></li>
								<!-- <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li> -->
								<li id="CartOnHeader"><a href="cart.htm"><i class="fa fa-shopping-cart"></i> Giỏ hàng (${myCartItems.size()})</a></li>
								<c:choose>
									<c:when test="${cookie.containsKey('username')}">
										<li><a href="logout.htm"><i class="fa fa-lock"></i> Đăng xuất</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="login.htm"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.htm" class="active">Trang chủ</a></li>
								<li class="dropdown"><a href="#">Danh mục sản phẩm<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <c:forEach var="p" items="${productList}">
                                        	<li><a href="shop${p.id}.htm">${p.name}</a></li>
                                        </c:forEach>
                                    </ul>
                                </li> 
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
</body>
</html>