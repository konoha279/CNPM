<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Tùy chỉnh trang chính sách</title>
	<link rel="stylesheet" href="resources/admin/main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style type="text/css">
.modal-lg {
    max-width: 40% !important;
}

</style>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
				<h1 class="ui header" style="text-align:center ;margin-top: 30px">CHỈNH SỬA TRANG CHÍNH SÁCH</h1>
					<form action="admin/page/chinhsach.htm" method="post">
						<textarea class="form-control ckeditor" id="ckeditor" style="height: 400px;" name ="content">${content }</textarea>
						<div style="text-align: center; margin-top: 16px;">
							<button type="submit" class="btn btn-secondary">Lưu thay đổi</button>
							
						</div>
					</form>
					
						
				</div>
			</div>
		</div>	
	</div>
<script>
    CKEDITOR.replace('ckeditor', {
      height: 620
    });
  </script>	
</body>
</html>