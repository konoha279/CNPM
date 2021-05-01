<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">QUẢN LÝ NHÂN
					VIÊN</h2>
				<div class="ui action input" style="margin-top: 15px; width: 700px">
					<input type="text" placeholder="Tìm Kiếm...">
					<button class="ui button">Tìm</button>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Nhân Viên</th>
								<th>Họ</th>
								<th>Tên</th>
								<th>Giới Tính</th>
								<th>Ngày Sinh</th>
								<th>Địa Chỉ</th>
								<th>Chi Nhánh</th>
								<th>Tình Trạng</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${products}">
								<tr>
									<td>${u.maNV}</td>
									<td>${u.ho}</td>
									<td>${u.ten}</td>
									<td>${u.gioiTinh==false?'Nữ':'Nam'}</td>
									<td>${u.ngaySinh}</td>
									<td>${u.diaChi}</td>
									<td>${u.chiNhanh.chiNhanh}</td>
									<td>${u.tinhTrang==false?'Đã Nghỉ':'Còn Làm'}</td>
									<td><a href="admin/nhanvien/update/${u.maNV}.htm"><button
												class="ui blue basic button">
												<i class="edit icon"></i>Sửa
											</button></a>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<div class="ui buttons">
						<c:if test="${page==1}">
							<button class="ui labeled icon button"
								style="pointer-events: none; opacity: 0.4;">
								<i class="left chevron icon"></i> Prev
							</button>
						</c:if>
						<c:if test="${page>1}">
							<a href="admin/nhanvien/index.htm?page=${page-1}">
								<button class="ui labeled icon button">
									<i class="left chevron icon"> </i> Prev
								</button>
							</a>
						</c:if>
						<button class="ui button">${page}</button>
						<c:if test="${page==maxpage}">
							<button class="ui right labeled icon button"
								style="pointer-events: none; opacity: 0.4;">
								<i class="right chevron icon"></i>Next
							</button>
						</c:if>
						<c:if test="${page<maxpage}">
							<a href="admin/nhanvien/index.htm?page=${page+1}">
								<button class="ui right labeled icon button">
									<i class="right chevron icon"></i> Next
								</button>
							</a>
						</c:if>
					</div>
					${message} <a href="admin/nhanvien/insert.htm"><button
							class="ui green button" style="float: right;">
							<i class="plus icon"></i>Thêm
						</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>