<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chi tiết ${hangHoa.name}</title>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
		<div class="ui grid stackable padded">
				<div class="column">
					<div class="column">
						<a onclick="history.back()"><button class="ui button">Trở Lại</button></a>
					</div>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<div class="ui items">
						<div class="item">
							<div class="ui big image">
								<img src="images/${hangHoa.image}" style="width: 500px; height: 500px" alt="">
							</div>
							<div class="content">
								<h2 class="headerD">${hangHoa.name}</h2>
								<div class="meta">
									<span class="abc">Loại: ${hangHoa.productlist.name}</span>
								</div>
								<div class="meta">
									<span class="abc">Tổng số lượng: ${hangHoa.getCount()}</span>
								</div>
								<div class="meta">
									<span class="abc">Tình Trạng:
										${u.status==false?'Không Bán':'Bán'}</span>
								</div>
								<div class="description">
									<button type="button" data-bs-toggle="modal" data-bs-target="#addSize" class="btn btn-outline-primary btn-lg"><i class="fa fa-plus" aria-hidden="true"></i> Thêm </button>
									
									<table class="ui blue table">
										<thead>
											<tr>
												<c:if test="${hangHoa.productlist.id != 'PK' }">
													<th>Size</th>
												</c:if>
												<th>Số Lượng</th>
												<th>Tương tác</th>
											</tr>
										</thead>
										<tbody>										
											<c:forEach var="u" items="${hangHoa.CT_HangHoa}">
												<tr>
													<c:if test="${hangHoa.productlist.id != 'PK' }">
														<td >${u.size.name}</td>
													</c:if>
													<td >${u.soLuong}</td>
													<td>
														<button data-bs-toggle="modal" data-bs-target="#delete${u.size.id}"  class="btn btn-outline-danger btn-lg"><i class="fa fa-ban" aria-hidden="true"></i> Xóa </button>
														<button data-bs-toggle="modal" data-bs-target="#edit${u.size.id}" class="btn btn-outline-secondary btn-lg"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sửa </button>
													</td>
												</tr>
												
											</c:forEach>
										</tbody>
									</table>
									<div class="detail"><h1 style="text-align: center;">Ghi chú</h1></div>
									<div ></div>
									<textarea class="form-control" rows="10" style="align-self: center; resize: none;" readonly="readonly">${hangHoa.notes}</textarea>
	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<c:forEach var="u" items="${hangHoa.CT_HangHoa}">
	<!-- -------------------------------------------------------------------------------------- Chỉnh sửa ${u.size.name} -------------------------------------------------------------------------------------- -->
	
		<div class="modal fade" id="edit${u.size.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
			  <div class="modal-content">
				<div class="modal-header">
				  <h3 class="modal-title" id="staticBackdropLabel">Sửa chi tiết (size: ${u.size.name})</h3>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div>
					<div class="container">
						<div class="form-group">
							<label  class="form-label">Size</label>
							<input class="form-control" type="text" value="${u.size.name}"  readonly="readonly"/>
						</div>
						<div class="form-group">
							<label  class="form-label">Số lượng</label>
							<input class="form-control" type="number" value="${u.soLuong}" id="editCount${u.size.id}" min="0"/>
						</div>
					</div>
				  
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				  <button type="button" class="btn btn-primary" onclick="editSize('${hangHoa.ID}','${u.size.id}')">Sửa</button>
				</div>
			  </div>
			</div>
		</div>
<!-- -------------------------------------------------------------------------------------- Xóa ${u.size.name} -------------------------------------------------------------------------------------- -->
		<div class="modal fade" id="delete${u.size.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
			  <div class="modal-content">
				<div class="modal-header">
				  <h3 class="modal-title" id="staticBackdropLabel">Xóa chi tiết (size: ${u.size.name})</h3>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div>
					<div style="margin: 10px">
						<h1 style="color: red;">Chắc chưa ?</h1>
					</div>
					
				  
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chưa chắc</button>
				  <button type="button" class="btn btn-primary" onclick="deleteSize('${hangHoa.ID}','${u.size.id}')">Chắc luôn</button>
				</div>
			  </div>
			</div>
		</div>
	</c:forEach>
<!-- -------------------------------------------------------------------------------------- Thêm -------------------------------------------------------------------------------------- -->

	<div class="modal fade" id="addSize" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
		  <div class="modal-content">
			<div class="modal-header">
			  <h3 class="modal-title" id="staticBackdropLabel">Thêm chi tiết</h3>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div>
				<div class="container">
					<c:if test="${hangHoa.productlist.id != 'PK' }">
						<div class="form-group">
							<label  class="form-label">Size</label>
							
							<select class="form-control" name="selectedSize" id="sizeAdd">
								<c:forEach items="${size}" var="size">
									<option value="${size.id}">${size.name}</option>
								</c:forEach>
							</select>
						</div>
					</c:if>
					
					<div class="form-group">
						<label  class="form-label">Số lượng</label>
						<input class="form-control" type="number" id="countAdd" min="0" value="0" required="required"/>
					</div>
				</div>
			  
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			  <button type="button" class="btn btn-primary" onclick="addSize('${hangHoa.ID}')">Thêm</button>
			</div>
		  </div>
		</div>
	</div>

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function editSize(id,m_size)
	{
		var m_count = document.getElementById('editCount'+m_size).value;
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/hanghoa/editDetail.htm",
			data: {
				size: m_size,
				count: m_count,
				ID: id
			},
			type: "post",
			success: function (data)
				{
					alert(data);
					if (data == "Sửa thành công.")
					{
						location.reload();
					}
				},
				error: function(data)
				{
					alert(data);
				}
			})
	}

	function deleteSize(id,m_size)
	{
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/hanghoa/deleteDetail.htm",
			data: {
				size: m_size,
				ID: id
			},
			type: "post",
			success: function (data)
				{
					alert(data);
					if (data == "Xóa thành công.")
					{
						location.reload();
					}
				},
				error: function(data)
				{
					alert(data);
				}
			})
	}
	
	function addSize(id)
	{
		var m_size = document.getElementById('sizeAdd');
		if (m_size != null) 
		{
			m_size = m_size.value;
		}
		else
		{
			m_size = "";
		}
		var m_count = document.getElementById('countAdd').value;
		
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/hanghoa/addDetail.htm",
			data: {
				size: m_size,
				count: m_count,
				ID: id
			},
			type: "post",
			success: function (data)
				{
					alert(data);
					if (data == "Thêm thành công.")
					{
						location.reload();
					}
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