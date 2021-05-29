<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Chi tiết ${detailProduct.name}</title>
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
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Sportswear
										</a>
									</h4>
								</div>
								<div id="sportswear" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="">Nike </a></li>
											<li><a href="">Under Armour </a></li>
											<li><a href="">Adidas </a></li>
											<li><a href="">Puma</a></li>
											<li><a href="">ASICS </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#mens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Mens
										</a>
									</h4>
								</div>
								<div id="mens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="">Fendi</a></li>
											<li><a href="">Guess</a></li>
											<li><a href="">Valentino</a></li>
											<li><a href="">Dior</a></li>
											<li><a href="">Versace</a></li>
											<li><a href="">Armani</a></li>
											<li><a href="">Prada</a></li>
											<li><a href="">Dolce and Gabbana</a></li>
											<li><a href="">Chanel</a></li>
											<li><a href="">Gucci</a></li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#womens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Womens
										</a>
									</h4>
								</div>
								<div id="womens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="">Fendi</a></li>
											<li><a href="">Guess</a></li>
											<li><a href="">Valentino</a></li>
											<li><a href="">Dior</a></li>
											<li><a href="">Versace</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Kids</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Fashion</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Households</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Interiors</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Clothing</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Bags</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Shoes</a></h4>
								</div>
							</div>
						</div><!--/category-products-->
					
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
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="images/${detailProduct.image}" alt="" />
								<!-- <h3>ZOOM</h3> -->
							</div>
							<div id="similar-product" class="carousel slide" data-ride="carousel">
								
								  <!-- Wrapper for slides -->
								    <div class="carousel-inner">
										<div class="item active">
										  <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
										  <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
										  <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
										</div>
										<div class="item">
										  <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
										  <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
										  <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
										</div>
										<div class="item">
										  <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
										  <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
										  <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
										</div>
										
									</div>

								  <!-- Controls -->
								  <!-- <a class="left item-control" href="#similar-product" data-slide="prev">
									<i class="fa fa-angle-left"></i>
								  </a>
								  <a class="right item-control" href="#similar-product" data-slide="next">
									<i class="fa fa-angle-right"></i>
								  </a> -->
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<img src="images/product-details/new.jpg" class="newarrival" alt="" />
								<h2>${detailProduct.name}</h2>
								<p>Mã sản phẩm : ${detailProduct.id}</p>
								<img src="images/product-details/rating.png" alt="" />
								<span>
										
								</span>
								<div>
									<c:choose>
										<c:when test="${detailProduct.getCount() == 0 }">
											<span>
												<h3>Hết hàng</h3>
											</span>
										</c:when>
										<c:when test="${detailProduct.CT_HangHoa[0].getSize().getId() != '5'}">
											<c:forEach items="${detailProduct.CT_HangHoa}" var="s">
												<c:choose>
													<c:when test="${s.soLuong == 0 }">
														<label>
															<input onclick="changeCount('${s.soLuong}')" class="btn-check" disabled="disabled" type="radio" value="${s.size.id}" name="optionSize">
															<span class="btn btn-outline-success" for="success-outlined">${s.size.name}</span>
														</label>
													</c:when>
													<c:when test="${s.size.id == detailProduct.getFirstSize().id}">
														<label>
															<input onclick="changeCount('${s.soLuong}')" checked="checked" class="btn-check" id="success-outlined" type="radio" value="${s.size.id}" name="optionSize">
															<span class="btn btn-outline-success" for="success-outlined">${s.size.name}</span>
														</label>
													</c:when>
													<c:otherwise>
														<label>
															<input onclick="changeCount('${s.soLuong}')" class="btn-check" id="success-outlined" type="radio" value="${s.size.id}" name="optionSize">
															<span class="btn btn-outline-success" for="success-outlined">${s.size.name}</span>
														</label>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<input onclick="changeCount('${detailProduct.CT_HangHoa[0].soLuong}')" checked="checked" style="display: none;" type="radio" value="${s.size.id}" name="optionSize">
										</c:otherwise>
									</c:choose>
									
								</div>
								<span>
								<c:if test="${detailProduct.getCount() > 0  }">
									<c:choose>
										<c:when test="${detailProduct.discount != 0}">
											<span><del><f:formatNumber value="${detailProduct.price}" type="currency"/></del> <f:formatNumber value="${detailProduct.price - detailProduct.price*(detailProduct.discount/100)}" type="currency"/></span>	
										</c:when>
										<c:otherwise>
											<span><f:formatNumber value="${detailProduct.price}" type="currency"/></span>	
										</c:otherwise>
									</c:choose>
								</c:if>
								</span>
								<span>
									
									<label>Số lượng:</label>
									<input type="number" id="countSelect" name="countSelect" min="0" max="${detailProduct.getCount() }" value="1" />
									<c:if test="${detailProduct.getCount() > 0  }">
										<button onclick="addCart('${detailProduct.id}')" type="button" class="btn btn-fefault cart">
											<i class="fa fa-shopping-cart"></i>
											Thêm vào giỏ hàng
										</button>
									</c:if>
								</span>
								
								
								<p id="showCount"><b>Số lượng:</b> null</p>
								<p><b>Danh mục:</b> ${detailProduct.productlist.name }</p>
								<p><b>Thương hiệu:</b> ${detailProduct.brand.name }</p>
								<span>
									<c:if test="${detailProduct.getCount() > 0  }">
										<button onclick="paynow('${detailProduct.id}')" type="button" class="btn btn-fefault cart">
											<i class="fa fa-shopping-cart"></i>
											Mua ngay
										</button>
									</c:if>
								</span>
								<a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li><a href="#details" data-toggle="tab">MÔ TẢ</a></li>
								<li><a href="#companyprofile" data-toggle="tab">Sản phẩm cùng thương hiệu</a></li>
								<li><a href="#tag" data-toggle="tab">Tag</a></li>
								<li class="active"><a href="#reviews" data-toggle="tab">Bình luận (${detailProduct.getCountComment()})</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade" id="details" >
								<div style="padding: 10px">
										${detailProduct.notes }
								</div>
							</div>
							
							<!-- Recommended items -->
							<div class="tab-pane fade" id="companyprofile" >
								<c:forEach items="${detailProduct.brand.products}" var="p">
									<c:choose>
										<c:when test="${p.id != detailProduct.id}">
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img src="images/${p.image}" alt="" />
															<h2><f:formatNumber value="${p.price}" type="currency"/></h2>
															<p style="max-height: 20px; overflow: hidden; -webkit-line-clamp: 1;">${p.name}</p>
															<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
														</div>
													</div>
												</div>
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
								
							</div>
							
							<!-- Bình luận -->
							<div class="tab-pane fade active in" id="reviews" >
								<div class="col-sm-12">
									<c:if test="${empty detailProduct.comments}">
										<p>Sản phẩm này vẫn chưa có bình luận. Hãy là người đầu tiên bình luận sản phẩm này.</p>
									</c:if>
									<div id="listComment">
										<c:forEach items="${detailProduct.comments}" var="cmt">
										<div style="padding-top: 10px;border-bottom: 1px dotted black;">
											<ul>
												<li><a href=""><i class="fa fa-user"></i>${cmt.getName() }</a></li>
												<li><a href=""><i class="fa fa-calendar-o"></i>${cmt.time }</a></li>
											</ul>
											<p>${cmt.content }</p>
										</div>
										</c:forEach>
									</div>
									<h3><b>Viết bình luận của bạn</b></h3>
									
									<c:choose>
										<c:when test="${cookie.containsKey('username')}">
											<textarea class="ckeditor" name="comment" ></textarea>
											<button type="button" onclick="addComment('${detailProduct.id}')" class="btn btn-default pull-right">
												Bình luận
											</button>
										</c:when>
										<c:otherwise>
											<h4> Bạn cần phải <a href="login.htm">đăng nhập</a> để có thể bình luận sản phẩm. Nếu bạn chưa có tài khoản thì có thể đăng ký <a href="registry.htm">tại đây</a>.</h4>
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>
							
						</div>
					</div><!--/category-tab-->
					
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					
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
<script type="text/javascript">

	function addComment(id)
	{
		var content = CKEDITOR.instances['comment'].getData();
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/addComment.htm",
			data: {
				id: id,
				content: content			
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

	function changeCount(count)
	{
		document.getElementById('showCount').innerHTML = "<b>Số lượng: </b>" +count;
		var input = document.getElementById('countSelect');
		input.max = count;
		if (input.value > count) {
			input.value = count;
		}
	}

	window.onload = function()
	{
		var sizeList = document.getElementsByName('optionSize');
		for (var i=0; i < sizeList.length; i++)
		{
			if (sizeList[i].checked)
			{
				sizeList[i].click();
				break;
			}
		}
	}

	function addCart(m_id)
	{
		var sizeList = document.getElementsByName('optionSize');
		var m_size = null;
		for (var i=0; i < sizeList.length; i++)
		{
			if (sizeList[i].checked)
			{
				m_size = sizeList[i].value;
				break;
			}
		}
		var m_count = document.getElementById('countSelect').value;
		if (m_size == null)
			m_size = "5";
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/addCart.htm",
			data: {
				id: m_id,
				size: m_size,
				count: m_count				
			},
			type: "post",
			success: function (data)
				{
					document.getElementById('CartOnHeader').innerHTML= "<a href=\"cart.htm\"><i class=\"fa fa-shopping-cart\"></i> Giỏ hàng ("+data+")</a>";
				},
				error: function(data)
				{
					alert(data);
				}
			})
	}
	
	function paynow(m_id)
	{
		var sizeList = document.getElementsByName('optionSize');
		var m_size = null;
		for (var i=0; i < sizeList.length; i++)
		{
			if (sizeList[i].checked)
			{
				m_size = sizeList[i].value;
				break;
			}
		}
		var m_count = document.getElementById('countSelect').value;
		if (m_size == null)
			m_size = "5";
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/addCart.htm",
			data: {
				id: m_id,
				size: m_size,
				count: m_count				
			},
			type: "post",
			success: function (data)
				{
					window.location.replace("${pageContext.servletContext.contextPath}/cart.htm");
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