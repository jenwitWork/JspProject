<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="search_form"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Login</title>

<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath()%>/resources/admin-template/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link
	href="<%=request.getContextPath()%>/resources/admin-template/css/sb-admin.css"
	rel="stylesheet">

</head>

<body class="bg-dark">

	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">กรุณาเข้าสู่ระบบ</div>
			<div class="card-body">
				<form action="<%=request.getContextPath()%>/login" method="post">
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" id="username" name="username" class="form-control"
								placeholder="Username" required="required" autofocus="autofocus">
							<label for="username">Username</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="password" id="password" name="password" class="form-control"
								placeholder="Password" required="required"> <label
								for="password">Password</label>
						</div>
					</div>
					<button type="submit" class="btn btn-primary btn-block">เข้าสู่ระบบ</button>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="register.html">ลงทะเบียน</a> <a
						class="d-block small" href="forgot-password.html">ลืมรหัสผ่านติดต่อแอดมิน</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resources/admin-template/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin-template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resources/admin-template/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
