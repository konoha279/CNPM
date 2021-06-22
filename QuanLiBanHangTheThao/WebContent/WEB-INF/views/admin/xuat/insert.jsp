<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Nhập hàng</title>
<base href="${pageContext.servletContext.contextPath}/">

</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<h1 class="ui header" style="text-align:center ;margin-top: 80px">XUẤT HÀNG</h1>
			<div class="ui grid stackable padded">
				<div class="column">
				 </div>
			</div>
		</div>
	</div>
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
				<h3>Xuất hàng: 	</h3>
					<form class="ui form" method="post">
						<div class="field">
							<div class="fields">
								<div class="four wide field">
									<h3>Chọn ngày</h3> 
									<input type="date" name="date" id="date" value="${now }">
								</div>
							</div>
						</div>
						<div class="field">
							<div class="fields">
								<div class="four wide field">
									<label>Hàng Hóa</label> 
									<select id="productSelected">
										<option value="">Chọn sản phẩm </option>
										<c:forEach items="${dsSanPham}" var="l">
											<option value="${l.id }">${l.name }</option>
										</c:forEach>
										
									</select>
								</div>
								<div class="four wide field">
									<label>Size sản phẩm</label>
									<select id="changeSize" >
										<option value=""> </option>
									</select>
								</div>
								<div class="four wide field">
									<label>Số Lượng</label> 
									<input type="number" value="1" id="count" min="1"/>
								</div>
								<div class="field" style="margin-top: 24px">
									<button type="button" onclick="addProduct()" class="ui green button">
											<i class="plus icon"></i>Thêm
										</button>
										
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			
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
						<tbody>
							<c:forEach items="${ctPhieuXuats }" var="px">
								<tr>
									<td>${px.cTHangHoa.maHangHoa.id }</td>
									<td>${px.cTHangHoa.maHangHoa.name }</td>
									<td>${px.cTHangHoa.size.name }</td>
									<td>
										<input onchange="changeCount('${px.cTHangHoa.maHangHoa.id }','${px.cTHangHoa.size.id }','${px.cTHangHoa.maHangHoa.getMoney() }')" class="btn" id="count2" type="number" min="1" value="${px.soLuong }" />
									</td>
									<td id ="money-${px.cTHangHoa.maHangHoa.id }-${px.cTHangHoa.size.id }"> <f:formatNumber value="${px.cTHangHoa.maHangHoa.getMoney() * px.soLuong }"  type="currency" /> </td>
									<td>
										<button onclick="removeItem('${px.cTHangHoa.maHangHoa.id }','${px.cTHangHoa.size.id }')" class="btn btn-outline-danger">Xóa</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button onclick="submit()" class="btn btn-secondary btn-lg"> Xuất kho </button>
				</div>
			</div>

		</div>
	</div>
<script type="text/javascript">
	document.getElementById("productSelected").onchange = changeListener;
	 function changeListener()
	 {
	    var value = this.value
	      
	    <c:forEach items="${dsSanPham}" var="l">
	    	if (value == "${l.id}")
	    	{
	    		var $el = $("#changeSize");
	    		$el.empty(); // remove old options
	    		$.each(${l.id}, function(key,value) {
	    		  $el.append($("<option></option>")
	    		     .attr("value", key).text(value));
	    		});
	    	}
	    </c:forEach>	      
     }
	   	
	   	<c:forEach items="${dsSanPham}" var="l">
	   		var ${l.id} ={
	   				<c:forEach items="${l.getCT_HangHoa2()}" var="ct">
	   					"${ct.size.id}": "${ct.size.name}",
	   				</c:forEach>
	   		};
	   	</c:forEach>


	function addProduct()
	{
		var id = document.getElementById('productSelected').value;
		var size = document.getElementById('changeSize').value;
		var count = document.getElementById('count').value;
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/xuat/addToCTPX.htm",
			data: {
				id: id,
				size: size,
				count: count
			},
			type: "post",
			success: function (data)
				{
					if (data != "")
						{
							alert(data);
							return;
						}
					window.location.replace("${pageContext.servletContext.contextPath}/admin/xuat/insert.htm");
				},
				error: function(data)
				{
					alert(data);
				}
		})
		
	}
	function changeCount(id,size,money)
	{
		var count = document.getElementById('count2').value;
		
		var money = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(count * money);
		document.getElementById('money-'+id+'-'+size).innerHTML = money;
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/xuat/changeCTPX.htm",
			data: {
				id: id,
				size: size,
				count: count
			},
			type: "post",
			success: function (data)
			{
				if (data != "")
				{
					alert(data);
					window.location.replace("${pageContext.servletContext.contextPath}/admin/xuat/insert.htm");
				}
				
			},
			error: function(data)
			{
				alert(data);
			}
		})
	}
	
	function removeItem(id,size)
	{
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/xuat/removeCTPX.htm",
			data: {
				id: id,
				size: size,
			},
			type: "post",
			success: function (data)
				{
					window.location.replace("${pageContext.servletContext.contextPath}/admin/xuat/insert.htm");
				},
				error: function(data)
				{
					alert(data);
				}
		})
	}
	
	function submit()
	{
		var date = document.getElementById('date').value;
		$.ajax({
			url: "${pageContext.servletContext.contextPath}/admin/xuat/insert.htm",
			type: "post",
			data: {
				date: date
			},
			success: function (data)
				{
					alert(data);
					window.location.replace("${pageContext.servletContext.contextPath}/admin/xuat/insert.htm");
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