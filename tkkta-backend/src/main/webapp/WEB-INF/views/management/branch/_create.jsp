<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form action="${root_action}/management/branch/create"
	method="post" modelAttribute="create_form" id="form-create">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h5 class="modal-title">สร้างสาขาใหม่</h5>
	</div>
	<input type="hidden" name="old_branch_id" id="old_branch_id" value="" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="form-group">
					<form:input path="branchId" class="form-control"
						placeholder="รหัสสาขา" />
				</div>
				<div class="form-group">
					<form:input path="branchName" class="form-control"
						placeholder="ชื่อสาขา" />
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
			branchId : {
				required : true,
				maxlength : 10,
				remote : {
					url : "${root_action}/management/branch/check-dup",
					type : "get",
					data : {
						branchId : function() {
							return $("#form-create #branchId").val();
						},
						old_branch_id : function() {
							return $("#form-create #old_branch_id").val();
						}
					}
				}
			},
			branchName : {
				required : true,
				maxlength : 100
			},

		},
		messages : {
			branchId : {
				required : 'ระบุรหัสสาขา',
				maxlength : 'ระบุรหัสสาขาไม่เกิน 10 ตัวอักษร',
				remote : 'รหัสสาขาถูกใช้งานไปแล้ว'
			},
			branchName : {
				required : 'ระบุชื่อสาขา',
				maxlength : 'ระบุชื่อสาขาไม่เกิน 100 ตัวอักษร'
			},
		}
	})
</script>