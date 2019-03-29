<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="search_form"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<mt:_layout title="${current_title }">
	<jsp:attribute name="content">

<body class="bg-dark">

	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">กรุณาเข้าสู่ระบบ</div>
			<div class="card-body">
				<form id="regis-form" action="login" method="post">
					<div class="form-group">
						<input type="text" id="username" name="username"
									class="form-control" placeholder="Username" required="required"
									autofocus="autofocus">
					</div>
					<div class="form-group">
						<input type="password" id="password" name="password"
									class="form-control" placeholder="Password" required="required">
					
							</div>
					<button type="submit" class="btn btn-primary btn-block">เข้าสู่ระบบ</button>
					<a href="register" class="btn btn-success btn-block">ลงทะเบียน</a>
				</form>
				<br>
				<div class="text-center"> <a class="d-block small"
								href="forgot-password.html">หากลืมรหัสผ่าน คลิ๊กที่นี่  เพื่อติดต่อแอดมิน</a>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	</jsp:attribute>
</mt:_layout>
<script type="text/javascript">
	/* $('#regis-form').on('submit', function(event) {
		event.preventDefault();
		if ($(this).valid()) {
			$.ajax({
				url : $(this).attr("action"),
				type : 'post',
				data : $(this).serialize()
			}).done(function(response) {
			}).error(function(response) {
				alert("ไม่สามารเพิ่มข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
			})
		}
	});  */

	$('#regis-form').validate({
		rules : {
			username : {
				required : true
			},
			password : {
				required : true
			}
		},
		messages : {
			username : {
				required : 'ระบุชื่อผู้ใช้งาน'
			},
			password : {
				required : 'ระบุรหัสผ่าน'
			}
		}
	})
</script>