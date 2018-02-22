<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title">แก้ไขข้อมูลสาขา</h5>
</div>
<form:form action="${root_action}/management/pages/edit" method="post"
	modelAttribute="edit_form" id="form-edit">
	<input type="hidden" name="old_page_name" id="old_page_name"
		value="${edit_form.pageName }" class="form-control"
		placeholder="รายละเอียด" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="form-group">
					<form:input path="pageName" class="form-control"
						placeholder="รหัสโมดูล" />
				</div>
				<div class="form-group">
					<form:input path="pageDetail" class="form-control"
						placeholder="รายละเอียด" />
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">Save change</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>
</form:form>

<script type="text/javascript">
	$('#form-edit').on('submit', function(event) {
		event.preventDefault();
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
	})

	$('#form-edit').validate({
		rules : {
			pageName : {
				required : true,
				maxlength : 10,
				remote : {
					url : "${root_action}/management/pages/check-dup",
					type : "get",
					data : {
						pageName : function() {
							return $("#form-edit #pageName").val();
						},
						old_page_name : function() {
							return $("#form-edit #old_page_name").val();
						}
					}
				}
			},
			pageDetail : {
				required : true,
				maxlength : 100
			},

		},
		messages : {
			pageName : {
				required : 'ระบุรหัสโมดูล',
				maxlength : 'ระบุรหัสโมดูลไม่เกิน 10 ตัวอักษร',
				remote : 'รหัสโมดูลถูกใช้งานไปแล้ว'
			},
			pageDetail : {
				required : 'ระบุรายละเอียด',
				maxlength : 'ระบุรายละเอียดไม่เกิน 100 ตัวอักษร'
			},
		}
	})
</script>