<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Danh sách đơn đặt hàng</title>
<base href="${pageContext.servletContext.contextPath}/">

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css">

<style type="text/css">
.modal-lg {
        max-width: 70% !important;

}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
				<h1 class="ui header" style="text-align:center ;margin-top: 30px">DANH SÁCH ĐƠN ĐẶT HÀNG</h1>
					<table id="TableBill" class="table table-striped table-bordered dt-responsive nowrap">
						<thead>
							<tr>
								<th>Mã Số Đơn Đặt Hàng</th>
								<th>Ngày tạo đơn hàng</th>
								<th>Tài khoản mua</th>
								<th>Tình Trạng</th>
								<th>Nhân Viên tạo đơn (xác nhận)</th>
								<th>Địa chỉ nhận hàng</th>
								<th>Tổng tiền mua hàng</th>		
								<th>Phí vận chuyện</th>
								<th>Thành tiền</th>	
								<th>Tương tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listBill}" var="b">
								<tr>
									<td>${b.id }</td>
									<td>${b.date }</td>
									<td>${b.account.username }</td>
									<td>${b.status == true ? 'Đã xác nhận' : 'Chưa xác nhận' }</td>
									<td><c:if test="${empty b.staff == false }">${b.staff.getFullName() }</c:if> </td>
									<td>${b.address }</td>
									<td><f:formatNumber value="${b.moneyProduct }" type="currency" /> </td>
									<td><f:formatNumber value="${b.transportationFee }" type="currency" /></td>
									<td><f:formatNumber value="${b.moneyProduct + b.transportationFee }" type="currency" /></td>
									<td>
										<button type="button" class="ui blue basic button"  data-bs-toggle="modal" data-bs-target="#detail${b.id}">
												<i class="edit icon"></i>Xem chi tiết
										</button>		
										
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" class="ui green button" data-bs-toggle="modal" data-bs-target="#insert">
							<i class="plus icon"></i>Tạo đơn hàng
						</button>
					 ${message}
				</div>
			</div>
		</div>
	</div>
	<c:forEach items="${listBill}" var="b">
		<!-- Modal -->
		<div class="modal fade" id="detail${b.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
			  <div class="modal-content" >
				<div class="modal-header" >
				  <h1 class="modal-title"id="staticBackdropLabel">Chi tiết đơn hàng</b></h1>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" >
					<table id="TableCTBill${b.id }" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%;" >													
						<thead>
							<tr>
								<th>Tên sản phẩm</th>
								<th>Kích thước</th>
								<th>Đơn giá</th>
								<th>Số lượng</th>
								<th>Khuyến mãi</th>
								<th>Tổng tiền </th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${b.ctBills }" var="ct">
								<tr>
									<td>${ct.cTHangHoa.maHangHoa.name }</td>
									<td>${ct.cTHangHoa.size.name } </td>
									<td> <f:formatNumber value="${ct.unitPrice }" type="currency" /> </td>
									<td>${ct.count } </td>
									<td> <f:formatNumber value="${ct.promotion/100 }" type="percent" /> </td>
									<td> <f:formatNumber value="${(ct.unitPrice - (ct.unitPrice * (ct.promotion/100))) * ct.count }" type="currency" />
								</tr>
							</c:forEach>															
						</tbody>
					</table>
				</div>
		      <div class="modal-footer">
		       	<button type="button"  class="btn btn-danger" ${b.status == true ? 'disabled=\"disabled\"' : '' } data-bs-toggle="modal" data-bs-target="#del${b.id}">Xóa đơn hàng</button>
		        <button type="button" ${b.status == true ? 'disabled=\"disabled\"' : '' } onclick="confirm('${b.id}')" class="btn btn-primary">Xác nhận đơn hàng</button>
		       	<button type="button"  class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="del${b.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="staticBackdropLabel">Xóa đơn hàng</b></h5>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<h1 style="color: red">Chắc chưa?</h1>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chưa chắc</button>
		        <button type="submit" onclick="deleteBill('${b.id}')" class="btn btn-primary">Chắc luôn</button>
		      </div>
		    </div>
		  </div>
		</div>
	</c:forEach>
										
	<!-- Tạo đơn hàng -->
	<div class="modal fade" id="insert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title" id="staticBackdropLabel">Tạo đơn hàng</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      
				<form class="ui form" method="post">
						<div class="field">
							<div class="four wide field">
								<label>Tài khoản khách hàng: </label> 
								<input type="text" list="Guest" id="productSelected">
									<datalist id ="Guest">
										<c:forEach items="${listGuest}" var="l">
											<option value="${l.accountGuest.username }"/>
										</c:forEach>
									</datalist>
								
							</div>
							<div class="fields">
								<div class="four wide field">
									<label>Sản phẩm</label>
									<select id="changeProduct">
										<option value ="">Chọn sản phẩm</option>
										<c:forEach items="${listProduct}" var="l">
											<option value="${l.id }">${l.name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="four wide field">
									<label>Kích thước</label>
									<select id="selectSize">
										<option value=""> </option>
									</select>
								</div>
								<div class="four wide field">
									<label>Số Lượng</label> 
									<input type="number" value="1" id="count" min="1"/>
								</div>
								<div class="field" style="margin-top: 24px">
									<button type="button" onclick="addCart()" class="ui green button">
											<i class="plus icon"></i>Thêm
										</button>
								</div>
							</div>
						</div>
					</form>
					
			<div class="ui grid stackable padded">
				<div class="column">
				<h3>Chi tiết:</h3>
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Hàng Hóa</th>
								<th>Tên Hàng Hóa</th>
								<th>Kích Thước</th>
								<th>Số Lượng</th>
								<th>Thành tiền</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tableDetailAdd">
							<c:forEach items="${listCreateCart }" var="c">
								<tr>
									<td>${c.product.maHangHoa.id }</td>
									<td>${c.product.maHangHoa.name }</td>
									<td>${c.product.size.name }</td>
									<td>
										<input onchange="editcount('${c.product.maHangHoa.id }','${c.product.size.id }','${c.product.maHangHoa.getMoney() }')" class="btn" max="${c.product.soLuong }" id="quantity${c.product.maHangHoa.id }${c.product.size.id }" type="number" min="0" value="${c.count }" />
									</td>
									<td id ="money-${c.product.maHangHoa.id }-${c.product.size.id }"> <f:formatNumber value="${c.product.maHangHoa.getMoney() * c.count }"  type="currency" /> </td>
									<td>
										<button type="button" onclick="remove('${c.product.maHangHoa.id }','${c.product.size.id }')" class="btn btn-outline-danger">Xóa</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>						 
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		        <button type="button" onclick="pay()" class="btn btn-primary">Tạo</button>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- ---------------------------------------------------------- Export ---------------------------------------------------------- -->	
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript">
    
    // --------------------------------------- chỉnh sửa nội dung của option size -------------------------------------------
	    document.getElementById("changeProduct").onchange = changeListener;
	    
	    function changeListener(){
	    var value = this.value
	      
	    <c:forEach items="${listProduct}" var="l">
	    	if (value == "${l.id}")
	    	{
	    		var $el = $("#selectSize");
	    		$el.empty(); // remove old options
	    		$.each(${l.id}, function(key,value) {
	    		  $el.append($("<option></option>")
	    		     .attr("value", key).text(value));
	    		});
	    	}
	    </c:forEach>	      
	    }
    	
    	<c:forEach items="${listProduct}" var="l">
    		var ${l.id} ={
    				<c:forEach items="${l.getCT_HangHoa2()}" var="ct">
    					"${ct.size.id}": "${ct.size.name}",
    				</c:forEach>
    		};
    	</c:forEach>
        // -------------------------------------------------------------------------------------------------------------

	    function pay()
		{
        	var username = document.getElementById('productSelected').value;
        	if (username == "")
        	{
        		alert("Chưa chọn tài khoản khách hàng.");
        		return;
        	}
			$.ajax({
				url: "${pageContext.servletContext.contextPath}/admin/donDatHang/pay.htm",
				data: {
					username: username
				},
				type: "post",
				success: function (data)
					{
						alert(data);
						window.location.replace("${pageContext.servletContext.contextPath}/admin/donDatHang/index.htm");
					},
					error: function(data)
					{
						alert(data);
					}
				})
		}
	    
	    function deleteBill(id)
		{
			$.ajax({
				url: "${pageContext.servletContext.contextPath}/admin/donDatHang/deleteBill.htm",
				data: {
					ID: id
				},
				type: "post",
				success: function (data)
					{
						alert(data);
						location.reload();
					},
					error: function(data)
					{
						alert(data);
					}
				})
		}
	    function confirm(id)
		{
			$.ajax({
				url: "${pageContext.servletContext.contextPath}/admin/donDatHang/confirm.htm",
				data: {
					ID: id
				},
				type: "post",
				success: function (data)
					{
						alert(data);
						location.reload();
					},
					error: function(data)
					{
						alert(data);
					}
				})
		}
    
	    function addCart()
		{
	    	var m_id = document.getElementById("changeProduct");
	    	m_id = m_id.value;
	    	if (m_id == "")
    		{
    			alert("Bạn phải chọn sản phẩm!");
    			return;
    		}
			var sizeList = document.getElementById('selectSize');
			var m_size = sizeList.value;
			var m_count = document.getElementById('count').value;
			if (m_size == null)
				m_size = "5";
			$.ajax({
				url: "${pageContext.servletContext.contextPath}/admin/donDatHang/addCart.htm",
				data: {
					id: m_id,
					size: m_size,
					count: m_count				
				},
				type: "post",
				success: function (data)
					{
						document.getElementById('tableDetailAdd').innerHTML = data;
					},
					error: function(data)
					{
						alert(data);
					}
				})
		}
	    
	    function remove(id,size)
		{
			
			$.ajax
			({
				url: "${pageContext.servletContext.contextPath}/admin/donDatHang/removeItem.htm",
				data: {
					id_product: id,
					size_product: size
				},
				type: "post",
				success: function (data)
				{
					document.getElementById('tableDetailAdd').innerHTML = data;
				},
				error: function(data)
				{
					
				}
			})
		}
	   
		function editcount(size,id,money)
		{
			var count = document.getElementById('quantity'+size+id).value;
			if (count <= '1')
				count = '1';
			if ((count - '0') > document.getElementById('quantity'+size+id).max)
				count = document.getElementById('quantity'+size+id).max;
			document.getElementById('quantity'+size+id).value = count;
			var money = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(count * money);
			document.getElementById('money-'+size+'-'+id).innerHTML = money;
			
			$.ajax
			({
				url: "${pageContext.servletContext.contextPath}/admin/donDatHang/editCart.htm",
				data: {
					id_product: id,
					size_product: size,
					count_product: count
				},
				type: "post",
				success: function (data)
				{
					
					
				},
				error: function(data)
				{
					
				}
			})
		}
	
		
			
			
    </script>
    <script>
    $(document).ready(function() {
        $('#TableBill').DataTable( {
        	lengthChange: false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ],
                        columns: ':visible'
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ],
                        columns: ':visible'
                    }
                },
                {
                	extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ],
                		columns: ':visible'
                    }
                },
                'colvis'
            ]
        } );
        
    } );
     </script>	
     <c:forEach items="${listBill}" var="b">
     	<script>
		    $(document).ready(function() {
		        $('#TableCTBill${b.id }').DataTable( {
		        	lengthChange: false,
		            dom: 'Bfrtip',
		            buttons: [
		                {
		                    extend: 'copyHtml5',
		                    exportOptions: {
		                		columns: ':visible'
		                    }
		                    
		                },
		                {
		                    extend: 'excelHtml5',
		                    exportOptions: {
		                		columns: ':visible'
		                    }
		                   
		                },
		                {
		                    extend: 'pdfHtml5',
		                    exportOptions: {
		                		columns: ':visible'
		                    }
		                    
		                },
		                {
		                	extend: 'print',
		                	exportOptions: {
		                		columns: ':visible'
		                    }
		                  
		                },
		                'colvis'
		            ]
		        } );
		        
		        
		    } );
		     </script>	
     </c:forEach>
</body>
</html>