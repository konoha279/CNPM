<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
					<form class="ui form" action="admin/xem.htm" method="post">
						<div class="field">
							<div class="fields">
								<div class="eight  wide field">
									<label>Từ Ngày</label> <input name="tuNgay" type="date" />
								</div>
								<div class="eight  wide field">
									<label>Tới Ngày</label> <input name="toiNgay" type="date" />
								</div>
								<div class="four wide field" style="margin-top: 25px">
									<button class="ui button">Xem Doanh Thu</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
<%-- 			<div class="ui grid stackable padded">
				<div class="column">
					<c:if test="${tongTien > 0}">
						<div class="ui massive label">
							<div style="color: red">
								<f:formatNumber type="currency" maxFractionDigits="0"
									currencySymbol="" value="${tongTien}" />
								đ
							</div>
						</div>
					</c:if>
				</div>
			</div> --%>
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Hóa Đơn</th>
								<th>Ngày Bán</th>
								<th>Tổng Tiền</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dsHoaDon}">
								<tr>
									<td>${u.maHoaDon}</td>
									<td>${u.ngayBan}</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.tongTien}" /> đ</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

