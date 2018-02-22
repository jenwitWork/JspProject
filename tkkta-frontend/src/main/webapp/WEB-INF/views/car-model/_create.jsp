<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form action="${root_action}/car-model/create" method="post"
	modelAttribute="create_form" id="form-create">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h5 class="modal-title">สร้างแบบรถใหม่</h5>
	</div>
	<input type="hidden" name="old_cm_id" id="old_cm_id" value="" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="form-group">
					<form:select path="serieId" class="form-control">
						<form:option value="">--- รุ่นรถ ---</form:option>
						<c:forEach var="item" items="${car_series}">
							<form:option value="${item.serieId}">${item.serieTitle}</form:option>
						</c:forEach>						
					</form:select>
				</div>
				<div class="form-group">
					<form:input path="cmId" class="form-control"
						placeholder="รหัสแบบรถ" />
				</div>
				<div class="form-group">
					<form:input path="cmName" class="form-control"
						placeholder="รายละเอียดแบบรถ" />
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
			serieId :{
				required : true
			},
			cmId : {
				required : true,
				maxlength : 100,
				remote : {
					url : "${root_action}/car-model/check-dup",
					type : "get",
					data : {
						cm_id : function() {
							return $("#form-create #cmId").val();
						},
						old_cm_id : function() {
							return $("#form-create #old_cm_id").val();
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
			serieId : {
				required : 'ระบุรุ่นรถ'
			},
			cmId : {
				required : 'ระบุรหัสแบบรถ',
				maxlength : 'ระบุรหัสแบบรถไม่เกิน 100 ตัวอักษร',
				remote : 'รหัสแบบรถถูกใช้งานไปแล้ว'
			},
			cmName : {
				required : 'รายละเอียดแบบรถ',
				maxlength : 'รายละเอียดแบบรถไม่เกิน 100 ตัวอักษร'
			},
		}
	})
</script>