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
<style>
h1.headerD {
	font-size: 50px;
}

span.abc {
	font-size: 20px;
}

div.detail {
	font-size: 16px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
					<div class="ui items">
						<div class="item">
							<div class="ui big image">
								<img src="images/1.jpg" style="width: 500px; height: 500px"
									alt="">
							</div>
							<div class="content">
								<h1 class="headerD">[ ${hangHoa.ID}]
									${hangHoa.name}</h1>
								<div class="meta">
									<span class="abc">Loại: ${hangHoa.productlist.name}</span>
								</div>
								<div class="meta">
									<span class="abc">Tình Trạng:
										${u.status==false?'Không Bán':'Bán'}</span>
								</div>
								<div class="description">
									<table class="ui blue table">
										<thead>
											<tr>
												<th>Size</th>
												<th>Số Lượng</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="u" items="${hangHoa.CT_HangHoa}">
												<tr>
													<td>${u.MaSize}</td>
													<td>${u.SoLuong}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="detail">${hangHoa.notes}</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<div class="column">
						<a href="admin/hanghoa/index.htm"><button class="ui button">Trở Lại</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>