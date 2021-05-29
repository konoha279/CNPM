<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>FrontendFunn - Semantic UI - Sample Admin Dashboard
	Template</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"
	integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q="
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"
	integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ="
	crossorigin="anonymous" />
<link href="resources/admin/header.css" rel="stylesheet" >

</head>

<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<style type="text/css">
@import
	url("https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap")
	;

:root { -
	-tablet: 768px; -
	-smallMonitor: 992px; -
	-largeMonitor: 1200px; -
	-font-family: 'Open Sans', sans-serif;
}

body {
	font-family: var(- -font-family) !important;
}

body ::-webkit-scrollbar {
	width: 6px;
}

.ui.vertical.menu.sidebar-menu {
	margin-top: 0px !important;
	max-height: calc(100% - 0px) !important;
	height: calc(100% - 0px) !important;
}

.ui.vertical.menu.sidebar-menu .item i.icon {
	float: left;
	margin: 0em 0.5em 0em 0em;
}

.main-content {
	margin-top: 40px;
}

@media ( min-width : 768px) {
	.ui.vertical.menu.sidebar-menu {
		visibility: visible;
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
		width: 15rem !important;
	}
	.main-content {
		margin-left: 15rem;
	}
	.sidebar-menu-toggler {
		display: none !important;
	}
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


<body>
	<!-- sidebar -->
	<div class="ui sidebar inverted vertical menu sidebar-menu"
		id="sidebar">
		<div class="item">
			<div class="header">General</div>
		</div>
		<a href="admin/admin.htm" id="tq" class="item">
			<div>
				<i class="icon home"></i> Tổng Quát
			</div>
		</a> 
		<div onmouseover="showitem()" onmouseout="hideitem()">
			<a  href="admin/hanghoa/index.htm" id="sp" class="item">
				<div>
					<i class="boxes icon"></i> Sản Phẩm
				</div>
			</a> 
			<div id="hide-content" style="display: none">
				<a href="admin/hanghoa/size.htm" id="ncc" class="item">
					<div>
						Size
					</div>
				</a>
			</div>
		</div>
		
		<a href="admin/donDatHang/index.htm" id="dh" class="item">
			<div>
				<i class="cart arrow down icon"></i> Đơn đặt hàng
			</div>
		</a> 
		<a href="admin/nhanvien/index.htm" id="nv" class="item">
			<div>
				<i class="user icon"></i> Nhân Viên
			</div>
		</a> 
		<a href="admin/taikhoan/index.htm" id="tk" class="item">
			<div>
				<i class="address card outline icon"></i> Tài khoản
			</div>
		</a> 
		<a href="admin/nhap/index.htm" id="pn" class="item">
			<div>
				<i class="icon truck icon"></i> Phiếu Nhập
			</div>
		</a>  
		<a href="admin/doanhso.htm" id="ds" class="item">
			<div>
				<i class="icon chart line"></i> Doanh Số
			</div>
		</a>  
		<a href="admin/thuonghieu/index.htm" id="ncc" class="item">
			<div>
				<i class="fa fa-font-awesome"></i> Thương hiệu
			</div>
		</a>
		<a href="admin/comment.htm" id="comment" class="item">
			<div>
				<i class="fa fa-commenting-o"></i> Bình luận sản phẩm
			</div>
		</a>
		<div class="item">
			<form action="#">
				<div class="ui mini action input">
					<input type="text" placeholder="Search..." />
					<button class="ui mini icon button">
						<i class=" search icon"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
	<!-- sidebar -->
	<!-- top nav -->

	<nav class="ui top fixed inverted menu">
		<div class="left menu">
			<a href="#" class="sidebar-menu-toggler item" data-target="#sidebar">
				<i class="sidebar icon"></i>
			</a> <a href="#" class="header item"> Semantic UI </a>
		</div>

		<ul class="right menu">
			<li><a href="#" style="text-decoration: none;"> <i class="bell icon"></i>Thông báo</a></li>
			<li class = "ui dropdownMenu">
				<a class = "dropBtn" style="color: white; white;margin-right: 30px;"><i class="user cirlce icon"></i> Mở rộng </a>
				<div class="dropdownMenu-content">
					<a href="${pageContext.servletContext.contextPath}" > <i class="fa fa-home"></i>Trang cửa hàng</a>
					<a href="${pageContext.servletContext.contextPath}/profile/account.htm" > <i class="info circle icon"></i>Hồ sơ</a>
					<a href="${pageContext.servletContext.contextPath}/logout.htm" > <i class="sign-out icon"></i> Đăng xuất</a>
				</div>
			</li>
		</ul>
	</nav>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"
		integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		window.onload = function()
		{
			if ("${admin}" != "admin")
			{
				document.getElementById('nv').style.display = "none";
				document.getElementById('tk').style.display = "none";
				document.getElementById('ds').style.display = "none";
				document.getElementById('comment').style.display = "none";
			}
		}
		function showitem() {
			document.getElementById('hide-content').style.display = "";
			
		}
		function hideitem()
		{
			document.getElementById('hide-content').style.display = "none";
		}
		function showOptios() {
			
		}
		
		function hideOption()
		{
			
		}
	</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
</body>
</html>