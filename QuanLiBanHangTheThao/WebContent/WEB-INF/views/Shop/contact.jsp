<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${pageContext.servletContext.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Liên hệ</title>
    <link href="resources/Shop/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/Shop/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/Shop/css/prettyPhoto.css" rel="stylesheet">
    <link href="resources/Shop/css/price-range.css" rel="stylesheet">
    <link href="resources/Shop/css/animate.css" rel="stylesheet">
	<link href="resources/Shop/css/main.css" rel="stylesheet">
	<link href="resources/Shop/css/responsive.css" rel="stylesheet">
   
    <link rel="shortcut icon" href="resources/Shop/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/Shop/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/Shop/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/Shop/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="resources/Shop/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>
	 
	 <div id="contact-page" class="container">
    	<div class="bg">
	    	<div class="row">    		
	    		<div class="col-sm-12">    			   			
					<h2 class="title text-center">Liên hệ <strong>Chúng tôi</strong></h2>    			    				    				
					<div id="gmap" class="contact-map">
					</div>
				</div>			 		
			</div>    	
    		<div class="row">  	
	    		<div class="col-sm-8">
	    			<div class="contact-form">
	    				<h2 class="title text-center">Liên lạc</h2>
	    				<div class="status alert alert-success" style="display: none"></div>
				    	<div id="main-contact-form" class="contact-form row">
				            <div class="form-group col-md-6">
				                <input type="text" id="nameGuest" class="form-control" required="required" placeholder="Họ và tên">
				            </div>
				            <div class="form-group col-md-6">
				                <input type="email" id="email" class="form-control" required="required" placeholder="Email">
				            </div>
				            <div class="form-group col-md-12">
				                <input type="text" id="subject" class="form-control" required="required" placeholder="Tiêu đề">
				            </div>
				            <div class="form-group col-md-12">
				                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Nội dung"></textarea>
				            </div>                        
				            <div class="form-group col-md-12">
				            	<button class="btn btn-primary pull-right" type="button" onclick="send()"> Gửi</button>
				            </div>
				        </div>
	    			</div>
	    		</div>
	    		<div class="col-sm-4">
	    			<div class="contact-info">
	    				<h2 class="title text-center">Thông tin liên hệ</h2>
	    				<address>
							<p>97 đường Man Thiện, phường Hiệp Phú, thành phố Thủ Đức</p>
							<p>Thành phố Hồ Chí Minh</p>
							<p>Số điện thoại: 0342437678</p>
							<p>Email: n18dcat092@student.ptithcm.edu.vn</p>
	    				</address>
	    				<div class="social-networks">
	    					<h2 class="title text-center">Mạng Xã Hội</h2>
							<ul>
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-google-plus"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-youtube"></i></a>
								</li>
							</ul>
	    				</div>
	    			</div>
    			</div>    			
	    	</div>  
    	</div>	
    </div><!--/#contact-page-->
	
	<jsp:include page="footer.jsp"></jsp:include>
	

  
    <script src="resources/Shop/js/jquery.js"></script>
	<script src="resources/Shop/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="resources/Shop/js/gmaps.js"></script>
	<script src="resources/Shop/js/contact.js"></script>
	<script src="resources/Shop/js/price-range.js"></script>
    <script src="resources/Shop/js/jquery.scrollUp.min.js"></script>
    <script src="resources/Shop/js/jquery.prettyPhoto.js"></script>
    <script src="resources/Shop/js/main.js"></script>
    <script type="text/javascript">
    function send() {
		var name = document.getElementById('nameGuest').value;
		var email = document.getElementById('email').value;
		var subject = document.getElementById('subject').value;
		var message = document.getElementById('message').value;
		
		
		$.ajax
	  	({
	  		url: "${pageContext.servletContext.contextPath}/contact.htm",
			data: {
				name: name,
				email: email,
				subject: subject,
				message: message
			},
			type: "post",
			success: function (data)
			{
				
			},
			error: function(data)
			{
				
			}
	  	})	  	
	  	document.getElementById('contact-page').innerHTML =  document.getElementById('thankyou').innerHTML ;
		
	 	
	}
    </script>
    <script id="thankyou" type="text/html">
<div style="text-align: center;">
	<h2> Cảm ơn bạn đã liên hệ với chúng tôi.<br>Chúng tôi sẽ phản hồi cho bạn nhanh nhất có thể.</h2>
	<image style="width: 700px; height: 500px;" src = "resources/sendMail.jpg" />
</div>
	</script>
</body>
</html>