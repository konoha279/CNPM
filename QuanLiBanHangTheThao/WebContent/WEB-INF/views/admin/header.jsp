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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
 
<style type="text/css">
.modal-lg-Menu {
        max-width: 40% !important;

}
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
		<div onmouseover="showitem('P')" onmouseout="hideitem('P')">
			<a  href="admin/hanghoa/index.htm" id="sp" class="item">
				<div>
					<i class="boxes icon"></i> Sản Phẩm
				</div>
			</a> 
			<div id="hide-contentP" style="display: none">
				<a href="admin/hanghoa/size.htm" id="ncc" class="item">
					<div>
						<i class="fa fa-plus"></i> Size
					</div>
				</a>
				<a href="admin/hanghoa/DMSP.htm" id="dmsp" class="item">
					<div>
						<i class="fa fa-plus"></i> Danh mục sản phẩm
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
		
		<div onmouseover="showitem('TK')" onmouseout="hideitem('TK')" id="thongke">
			<a class="item">
				<div>
					<i class="icon chart bar"></i> Thống kê
				</div>
			</a>
			<div id="hide-contentTK" style="display: none">
				<a data-toggle="modal" data-target="#TKDT" class="item">
					<div>
						<i class="fa fa-plus"></i> Thống kê doanh thu
					</div>
				</a>
				<a data-toggle="modal" data-target="#TKNV" class="item">
					<div>
						<i class="fa fa-plus"></i> Thống kê nhân viên
					</div>
				</a>
				<a data-toggle="modal" data-target="#TKNH" class="item">
					<div>
						<i class="fa fa-plus"></i> Thống kê Nhập hàng
					</div>
				</a>
			</div>
		</div>
		
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
		
		<div onmouseover="showitem('PAGE')" onmouseout="hideitem('PAGE')" id="page">
			<a href="" class="item">
				<div>
					<i class="fa fa-file-o"></i> Trang
				</div>
			</a>
			<div id="hide-contentPAGE" style="display: none">
				<a href="admin/page/gioithieu.htm" class="item">
					<div>
						<i class="fa fa-plus"></i> Trang giới thiệu
					</div>
				</a>
				<a href="admin/page/chinhsach.htm" class="item">
					<div>
						<i class="fa fa-plus"></i> Trang chính sách
					</div>
				</a>
			</div>
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
	
	<!-- Doanh thu -->
	<div class="modal fade" id="TKDT" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg-Menu">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Vui lòng chọn hình thức thống kê</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
      		<div class="d-flex justify-content-around">
      			<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/thongke/doanhthu.htm'" class="btn btn-outline-primary">Thống kê theo ngày</button>
      			<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/thongke/doanhthu-thang.htm'" class="btn btn-outline-secondary">Thống kê theo tháng</button>
      			<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/thongke/doanhthu-nam.htm'" class="btn btn-outline-success">Thống kê theo năm</button>
      		</div>     		
	      </div>
	      <div class="modal-footer">
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Nhân viên -->
	<div class="modal fade" id="TKNV" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg-Menu">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Vui lòng chọn hình thức thống kê</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
      		<div class="d-flex justify-content-around">
      			<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/thongke/thongKeNV.htm'" class="btn btn-outline-primary">Thống kê theo ngày</button>
      			<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/thongke/thongKeNV-thang.htm'" class="btn btn-outline-secondary">Thống kê theo tháng</button>
      			<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/thongke/thongKeNV-nam.htm'" class="btn btn-outline-success">Thống kê theo năm</button>
      		</div>     		
	      </div>
	      <div class="modal-footer">
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- Nhập hàng -->
	<div class="modal fade" id="TKNH" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg-Menu">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Vui lòng chọn hình thức thống kê</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
      		<div class="d-flex justify-content-around">
      			<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/thongke/thongKeNhapHang.htm'" class="btn btn-outline-primary">Thống kê theo ngày</button>
      			<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/thongke/thongKeNhapHang-thang.htm'" class="btn btn-outline-secondary">Thống kê theo tháng</button>
      			<button type="button" onclick="location.href='${pageContext.servletContext.contextPath}/admin/thongke/thongKeNhapHang-nam.htm'" class="btn btn-outline-success">Thống kê theo năm</button>
      		</div>     		
	      </div>
	      <div class="modal-footer">
	      </div>
	    </div>
	  </div>
	</div>
	
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
			document.getElementById('thongke').style.display = "none";
			document.getElementById('comment').style.display = "none";
			document.getElementById('page').style.display = "none";
		}
	}
	function showitem(id) {
		document.getElementById('hide-content'+id).style.display = "";
		
	}
	function hideitem(id)
	{
		document.getElementById('hide-content'+id).style.display = "none";
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