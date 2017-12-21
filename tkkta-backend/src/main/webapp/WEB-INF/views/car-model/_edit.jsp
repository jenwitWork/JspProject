<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title">แก้ไขข้อมูลแบบรถ</h5>
</div>
<form:form action="${root_action}/car-model/edit" method="post"
	modelAttribute="edit_form" id="form-edit">
	<input type="hidden" name="old_cm_id" id="old_cm_id"
		value="${edit_form.cmId }" class="form-control"
		placeholder="ชื่อแบบรถ" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="form-group">
					<form:input path="cmId" class="form-control"
						placeholder="รหัสแบบรถ" />
				</div>
				<div class="form-group">
					<form:input path="cmName" class="form-control"
						placeholder="ชื่อแบบรถ" />
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
			cmId : {
				required : true,
				maxlength : 10,
				remote : {
					url : "${root_action}/car-model/check-dup",
					type : "get",
					data : {
						cmId : function() {
							return $("#form-edit #cmId").val();
						},
						old_cm_id : function() {
							return $("#form-edit #old_cm_id").val();
						}
					}
				}
			},
			cmName : {
				required : true,
				maxlength : 100
			},

		},
		messages : {
			cmId : {
				required : 'ระบุรหัสแบบรถ',
				maxlength : 'ระบุรหัสแบบรถไม่เกิน 10 ตัวอักษร',
				remote : 'รหัสแบบรถถูกใช้งานไปแล้ว'
			},
			cmName : {
				required : 'ระบุชื่อแบบรถ',
				maxlength : 'ระบุชื่อแบบรถไม่เกิน 100 ตัวอักษร'
			},
		}
	})
</script>