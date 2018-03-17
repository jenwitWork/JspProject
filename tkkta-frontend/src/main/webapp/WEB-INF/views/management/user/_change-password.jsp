<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title">เปลี่ยนรหัสผ่าน</h5>
</div>
<form action="${root_action}/management/users/change-pass" method="post"
	id="form-cng-pass">
	<input type="hidden" name=username id="username"
		value="${user.username }" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="form-group">
					<input type="password" class="form-control" name="password"
						id="password" placeholder="Enter password">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="c_password"
						id="c_password" placeholder="Enter password">
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">Save change</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>
</form>

<script type="text/javascript">
	$('#form-cng-pass').on('submit', function(event) {
		event.preventDefault();
		if ($(this).valid()) {
			$.ajax({
				url : $(this).attr('action'),
				type : 'post',
				data : $(this).serialize()
			}).done(function(response) {
				$('button[class=close]').click();
				$('#form-search').submit();
			}).error(function(response) {
				alert("ไม่สามารเพิ่มข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
			})
		}
	})

	$('#form-cng-pass').validate({
		rules : {
			password : {
				required : true,
				maxlength : 50
			},
			c_password : {
				required : true,
				maxlength : 50,
				equalTo : "#password"
			},
		},
		messages : {
			password : {
				required : 'ระบุรหัสผ่าน',
				maxlength : 'รหัสผ่านต้องไม่เกิน 50 ตัวอักษร'
			},
			c_password : {
				required : 'ระบุรหัสผ่าน',
				maxlength : 'รหัสผ่านต้องไม่เกิน 50 ตัวอักษร',
				equalTo : "รหัสผ่านไม่ตรงกัน"
			},
		}
	})
</script>