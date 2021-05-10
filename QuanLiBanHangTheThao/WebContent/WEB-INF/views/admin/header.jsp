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
</head>
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
		</a> <a href="admin/hanghoa/index.htm" id="sp" class="item">
			<div>
				<i class="boxes icon"></i> Sản Phẩm
			</div>
		</a> <a href="admin/hoadon/index.htm" id="dh" class="item">
			<div>
				<i class="cart arrow down icon"></i> Đơn Hàng
			</div>
		</a> <a href="admin/nhanvien/index.htm" id="nv" class="item">
			<div>
				<i class="user icon"></i> Nhân Viên
			</div>
		</a> <a href="admin/taikhoan/index.htm" id="tk" class="item">
			<div>
				<i class="address card outline icon"></i> Tài khoản
			</div>
		</a> <a href="admin/chinhanh/index.htm" id="cn" class="item">
			<div>
				<i class="icon building"></i> Chi Nhánh
			</div>
		</a> <a href="admin/nhap/index.htm" id="pn" class="item">
			<div>
				<i class="icon truck icon"></i> Phiếu Nhập
			</div>
		</a>  <a href="admin/doanhso.htm" id="ds" class="item">
			<div>
				<i class="icon chart line"></i> Doanh Số
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

		<div class="right menu">
			<a href="#" class="item"> <i class="bell icon"></i>
			</a>
			<div class="ui dropdown item">
				<i class="user cirlce icon"></i>
				<div class="menu">
					<a href="#" class="item"> <i class="info circle icon"></i>
						Profile
					</a> <a href="#" class="item"> <i class="wrench icon"></i> Settings
					</a> <a href="#" class="item"> <i class="sign-out icon"></i> Logout
					</a>
				</div>
			</div>
		</div>
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
				//document.getElementById('tq').style.display = "none";
				//document.getElementById('sp').style.display = "none";
				//document.getElementById('dh').style.display = "none";
				document.getElementById('nv').style.display = "none";
				document.getElementById('tk').style.display = "none";
				document.getElementById('cn').style.display = "none";
				//document.getElementById('pn').style.display = "none";
				document.getElementById('ds').style.display = "none";
			}
		}
	</script>
</body>
</html>