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
					<h1> Bạn cần phải <a href="login.htm">đăng nhập</a> để tiếp tục</h1>
				</div>
			</section> <!--/#cart_items-->
		</c:when>
		<c:when test="${empty myCartItems}">
			<section id="cart_items">
				<div class="container">
					<h1> Bạn chưa mua hàng</h1>
					
				</div>
			</section> <!--/#cart_items-->
		</c:when>
		<c:otherwise>
			<section id="cart_items">
				<div class="container" id ="container">
					<div class="table-responsive cart_info">
						<table class="table table-condensed">
							<thead>
								<tr class="cart_menu">
									<td class="image">Hình sản phẩm</td>
									<td class="description">Tên sản phẩm</td>
									<td class="price">Giá</td>
									<td class="quantity">Số lượng</td>
									<td class="total">Tổng tiền</td>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${myCartItems}" var="c">
								<tr>
									<td class="cart_product">
										<a href=""><img style="width: 120px; height: 90px;" src="images/${c.product.getMaHangHoa().image }" alt=""></a>
									</td>
									<td class="cart_description">
										<h4><a href="">${c.product.maHangHoa.name }</a></h4>
										<p>Size: ${c.product.size.name }</p>
									</td>
									<td class="cart_price">
										<p> <f:formatNumber value="${c.product.getMaHangHoa().price - c.product.getMaHangHoa().price*(c.product.getMaHangHoa().discount/100)}" type="currency"/> </p>
									</td>
									<td class="cart_quantity">
										<div class="cart_quantity_button">
											<a style="text-decoration: none;" class="cart_quantity_down" href="javascript:decrease('${c.product.size.id }','${c.product.maHangHoa.id}','${c.product.maHangHoa.price - c.product.maHangHoa.price*(c.product.maHangHoa.discount/100)}')"> - </a>
											<input class="cart_quantity_input" type="text" id="quantity-${c.product.size.id }-${c.product.maHangHoa.id}" name="quantity" value="${ c.count }" max="${c.product.soLuong }" autocomplete="off" size="2">
											<a style="text-decoration: none;" class="cart_quantity_up" href="javascript:increase('${c.product.size.id }','${c.product.maHangHoa.id}','${c.product.maHangHoa.price - c.product.maHangHoa.price*(c.product.maHangHoa.discount/100)}')"> + </a>
										</div>
									</td>
									<td class="cart_total">
										<p  class="cart_total_price" name="moneyProduct" id="money-${c.product.size.id }-${c.product.maHangHoa.id}"><f:formatNumber value="${(c.product.maHangHoa.price - c.product.maHangHoa.price*(c.product.maHangHoa.discount/100))* c.count }" type="currency"/></p>
									</td>
									<td class="cart_delete">
										<a class="cart_quantity_delete" onclick="remove('${c.product.size.id }','${c.product.maHangHoa.id}')"><i class="fa fa-times"></i></a>
									</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
			</section> <!--/#cart_items-->
		
			<section id="do_action">
				<div class="container" id="container2">
					<div class="heading">
						<h3>Tiếp tục hoàn thành đơn đặt hàng của bạn</h3>
						<p>Vui lòng nhập thông tin nhận hàng và kiểm tra lại đơn hàng của bạn trước khi hoàn thành đơn hàng.</p>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div style="padding-bottom: 42px;" class="chose_area">
								<h4 style="padding-left: 30px;">Thông tin nhận hàng</h4>
								<ul class="user_info">	
									<li class="single_field">
										<label>Tỉnh / Thành phố:</label>
										<select name="calc_shipping_provinces" id="calc_shipping_provinces" required="">
										  <option value="">Tỉnh/Thành phố</option>
										</select>
										
									</li>
									<li class="single_field">
										<label>Quận / Huyện:</label>
										<select name="calc_shipping_district" id="calc_shipping_district" required="">
										  <option value="">Quận/Huyện</option>
										</select>
									
									</li>
									
								</ul>
								<ul class="user_info">
									<li>
										<label>Địa chỉ</label>
										<input id="calc_shipping_address" style="width: 310px;" required="required" type="text" />
									</li>
								</ul>
								<!-- <a class="btn btn-default check_out" href="">Thanh toán</a> -->
							</div>
						</div>
						<div class="col-sm-6">
							<div class="total_area" style="height: 269px;">
							<h4 style="padding-left: 30px;">Chi tiết số tiền thanh toán đơn hàng.</h4>
								<ul>				
									<li>Tạm tính <span id="TamTinh"><f:formatNumber value="${Money}" type="currency"/> </span></li>
								<%-- 	<li>Phí dịch vụ <span id="KhuyenMai"><f:formatNumber value="0" type="currency"/></span></li> --%>
									<li>Phí vận chuyển <span id="PhiVanChuyen"><f:formatNumber value="0" type="currency"/></span></span></li>
									<li>Thành tiền <span id="ThanhTien"><f:formatNumber value="${Money}" type="currency"/></span></li>
								</ul>
									
							</div>
						</div>
						<a style="display: flex;align-items: center;justify-content: center;height: 40px;" class="btn btn-default check_out" onclick="send()">Xác nhận</a>
					</div>
				</div>
			</section><!--/#do_action-->
		</c:otherwise>
	</c:choose>

	
	

	<jsp:include page="footer.jsp"></jsp:include>

	


    <script src="resources/Shop/js/jquery.js"></script>
	<script src="resources/Shop/js/jquery.scrollUp.min.js"></script>
    <script src="resources/Shop/js/jquery.prettyPhoto.js"></script>
    <script src="resources/Shop/js/main.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'/></script>
	<script src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
	<script>//<![CDATA[
	if (address_2 = localStorage.getItem('address_2_saved')) {
	  $('select[name="calc_shipping_district"] option').each(function() {
	    if ($(this).text() == address_2) {
	      $(this).attr('selected', '')
	    }
	  })
	  $('input.billing_address_2').attr('value', address_2)
	}
	if (district = localStorage.getItem('district')) {
	  $('select[name="calc_shipping_district"]').html(district)
	  $('select[name="calc_shipping_district"]').on('change', function() {
	    var target = $(this).children('option:selected')
	    target.attr('selected', '')
	    $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')
	    address_2 = target.text()
	    $('input.billing_address_2').attr('value', address_2)
	    district = $('select[name="calc_shipping_district"]').html()
	    localStorage.setItem('district', district)
	    localStorage.setItem('address_2_saved', address_2)
	  })
	}
	$('select[name="calc_shipping_provinces"]').each(function() {
	  var $this = $(this),
	    stc = ''
	  c.forEach(function(i, e) {
	    e += +1
	    stc += '<option value=' + e + '>' + i + '</option>'
	    $this.html('<option value="">Tỉnh / Thành phố</option>' + stc)
	    if (address_1 = localStorage.getItem('address_1_saved')) {
	      $('select[name="calc_shipping_provinces"] option').each(function() {
	        if ($(this).text() == address_1) {
	          $(this).attr('selected', '')
	        }
	      })
	      $('input.billing_address_1').attr('value', address_1)
	    }
	    $this.on('change', function(i) {
	      i = $this.children('option:selected').index() - 1
	      var str = '',
	        r = $this.val()
	      if (r != '') {
	        arr[i].forEach(function(el) {
	          str += '<option value="' + el + '">' + el + '</option>'
	          $('select[name="calc_shipping_district"]').html('<option value="">Quận / Huyện</option>' + str)
	        })
	        var address_1 = $this.children('option:selected').text()
	        var district = $('select[name="calc_shipping_district"]').html()
	        localStorage.setItem('address_1_saved', address_1)
	        localStorage.setItem('district', district)
	        $('select[name="calc_shipping_district"]').on('change', function() {
	          var target = $(this).children('option:selected')
	          target.attr('selected', '')
	          $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')
	          var address_2 = target.text()
	          $('input.billing_address_2').attr('value', address_2)
	          district = $('select[name="calc_shipping_district"]').html()
	          localStorage.setItem('district', district)
	          localStorage.setItem('address_2_saved', address_2)
	        })
	      } else {
	        $('select[name="calc_shipping_district"]').html('<option value="">Quận / Huyện</option>')
	        district = $('select[name="calc_shipping_district"]').html()
	        localStorage.setItem('district', district)
	        localStorage.removeItem('address_1_saved', address_1)
	      }
	    })
	  })
	})
	//]]></script>
	
	<script type="text/javascript">
	function remove(size,id)
	{
		
		$.ajax
		({
			url: "${pageContext.servletContext.contextPath}/removeItem.htm",
			data: {
				id_product: id,
				size_product: size
			},
			type: "post",
			success: function (data)
			{
				window.location.replace("${pageContext.servletContext.contextPath}/cart.htm");
			},
			error: function(data)
			{
				
			}
		})
	}

		function increase(size,id,money)
		{
			var count = document.getElementById('quantity-'+size+'-'+id).value;
			if (count < document.getElementById('quantity-'+size+'-'+id).max)
				count = count - '0' + 1;
			document.getElementById('quantity-'+size+'-'+id).value = count;
			var money = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(count * money);
			document.getElementById('money-'+size+'-'+id).innerHTML = money;
			
			$.ajax
			({
				url: "${pageContext.servletContext.contextPath}/editCart.htm",
				data: {
					id_product: id,
					size_product: size,
					count_product: count
				},
				type: "post",
				success: function (data)
				{
					document.getElementById('TamTinh').innerHTML = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(data);
					document.getElementById('ThanhTien').innerHTML = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(data);
					
				},
				error: function(data)
				{
					
				}
			})
		}

		function decrease(size,id,money)
		{
			var count = document.getElementById('quantity-'+size+'-'+id).value;
			if (count > 1)
				count = count - '0' - 1;			
			document.getElementById('quantity-'+size+'-'+id).value = count;
			var money = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(count * money);
			document.getElementById('money-'+size+'-'+id).innerHTML = money;
			
			$.ajax
			({
				url: "${pageContext.servletContext.contextPath}/editCart.htm",
				data: {
					id_product: id,
					size_product: size,
					count_product: count
				},
				type: "post",
				success: function (data)
				{
					document.getElementById('TamTinh').innerHTML = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(data);
					document.getElementById('ThanhTien').innerHTML = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(data);
				},
				error: function(data)
				{
					
				}
			})
		}
		
		function send() {
			var provinces = document.getElementById('calc_shipping_provinces');
			provinces = provinces.options[provinces.selectedIndex].text;
			var district = document.getElementById('calc_shipping_district').value;
			var address = document.getElementById('calc_shipping_address').value;
			
			if (district == "" || address == "")
				alert("Vui lòng nhập đầy đủ thông tin nhận hàng.");
			else
			{
			  	$.ajax
			  	({
			  		url: "${pageContext.servletContext.contextPath}/pay.htm",
					data: {
						province: provinces,
						district: district,
						address: address
					},
					type: "post",
					success: function (data)
					{
						
					},
					error: function(data)
					{
						
					}
			  	})
			  	document.getElementById('container').innerHTML =  document.getElementById('thankyou').innerHTML ;
			 	document.getElementById('container2').innerHTML =  "";
			}
		 	
		}
	</script>
	<script id="thankyou" type="text/html">
<div style="text-align: center;">
	<h2> Cảm ơn bạn đã mua hàng, nhân viên sẽ xác nhận đơn hàng của bạn sau vài giờ.</h2>
	<image style="width: 700px; height: 500px;" src = "resources/Thanks.jpg" />
</div>
	</script>
</body>
</html>