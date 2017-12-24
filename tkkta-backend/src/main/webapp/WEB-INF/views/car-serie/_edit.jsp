<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title">แก้ไขข้อมูลรุ่นรถ</h5>
</div>
<form:form action="${root_action}/car-serie/edit" method="post"
	modelAttribute="edit_form" id="form-edit">
	<form:hidden path="serieId" value="${edit_form.serieId }" />
	<input type="hidden" name="old_serie_title" id="old_serie_title"
		value="${edit_form.serieTitle }" class="form-control"
		placeholder="รุ่นรถ" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="form-group">
					<form:input path="serieTitle" class="form-control"
						placeholder="รุ่นรถ" />
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
			serieTitle : {
				required : true,
				maxlength : 100,
				remote : {
					url : "${root_action}/car-serie/check-dup",
					type : "get",
					data : {
						serie_title : function() {
							return $("#form-edit #serieTitle").val();
						},
						old_serie_title : function() {
							return $("#form-edit #old_serie_title").val();
						}
					}
				}

			}
		},
		messages : {
			serieTitle : {
				required : 'ระบุรหัสรุ่นรถ',
				maxlength : 'ระบุรหัสรุ่นรถไม่เกิน 100 ตัวอักษร',
				remote : 'รหัสรุ่นรถถูกใช้งานไปแล้ว'
			}
		}
	})
</script>