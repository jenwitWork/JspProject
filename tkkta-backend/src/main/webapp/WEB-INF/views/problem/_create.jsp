<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form action="${root_action}/problem/create" method="post"
	modelAttribute="create_form" id="form-create">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h5 class="modal-title">สร้างหมวดปัญหาใหม่</h5>
	</div>
	<input type="hidden" name="old_pb_name" id="old_pb_name"
		value="" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="form-group">
					<form:input path="pbName" class="form-control"
						placeholder="หมวดปัญหา" />
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">Create</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>
</form:form>

<script type="text/javascript">
	$('#form-create').on('submit', function(event) {
		event.preventDefault();
		if ($(this).valid()) {
			$.ajax({
				url : $(this).attr('action'),
				type : 'post',
				data : $(this).serialize(),
			}).done(function(response) {
				$('button[class=close]').click();
				$('#form-search').submit();
			}).error(function(response) {
				alert("ไม่สามารเพิ่มข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
			})
		}
	})

	$('#form-create').validate({
		rules : {
			pbName : {
				required : true,
				maxlength : 100,
				remote : {
					url : "${root_action}/problem/check-dup",
					type : "get",
					data : {
						pb_name : function() {
							return $("#form-create #pbName").val();
						},
						old_pb_name : function() {
							return $("#form-create #old_pb_name").val();
						}
					}
				}

			}
		},
		messages : {
			pbName : {
				required : 'ระบุรหัสหมวดปัญหา',
				maxlength : 'ระบุรหัสหมวดปัญหาไม่เกิน 100 ตัวอักษร',
				remote : 'รหัสหมวดปัญหาถูกใช้งานไปแล้ว'
			}
		}

	})
</script>