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
<style>
</style>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">QUẢN LÝ HÀNG HÓA</h2>
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
								<th>Mã Hàng Hóa</th>
								<th>Ảnh</th>
								<th>Tên Hàng Hóa</th>
								<th>Đơn Giá</th>
								<th>Giảm Giá</th>
								<th>Thể Loại</th>
								<th>Tình Trạng</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dshangHoa}">
								<tr>
									<td>${u.ID}</td>
									<td><img src="images/${u.anh}"
										style="width: 100px; height: 100px" alt="" /></td>
									<td>${u.name}</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.price}" /> đ</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.discount}" />%</td>
									<td>${u.productlist.name}</td>
									<td>${u.status==false?'Không Bán':'Bán'}</td>
									<td><a href="admin/hanghoa/update/${u.ID}.htm"><button
												class="ui green basic button">
												<i class="edit icon"></i>Sửa
											</button></a> <a href="admin/hanghoa/delete/${u.ID}.htm"><button
												class="ui negative basic button">
												<i class="ban icon"></i>Xóa
											</button></a> <a href="admin/hanghoa/detail/${u.ID}.htm"><button
												class="ui pink basic button">
												<i class="file alternate outline icon"></i>Xem Chi Tiết
											</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="ui buttons">
						<c:if test="${page==1}">
							<button class="ui labeled icon button"
								style="pointer-events: none; opacity: 0.4;">
								<i class="left chevron icon"></i> Prev
							</button>
						</c:if>
						<c:if test="${page>1}">
							<a href="admin/hanghoa/index.htm?page=${page-1}">
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
							<a href="admin/hanghoa/index.htm?page=${page+1}">
								<button class="ui right labeled icon button">
									<i class="right chevron icon"></i> Next
								</button>
							</a>
						</c:if>
					</div>
					${message} <a href="admin/hanghoa/insert.htm"><button
							class="ui green button" style="float: right;">
							<i class="plus icon"></i>Thêm
						</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>