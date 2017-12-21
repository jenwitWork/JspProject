<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title">ลบข้อมูลแบบรถ</h5>
</div>
<form:form action="${root_action}/car-model/delete" method="post"
	modelAttribute="delete_form" id="form-delete">
	<form:hidden path="cmId" />
	<form:hidden path="cmName" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h4>คำเตือน !!</h4>
				<p>คูณกำลังดำเนินการลบข้อมูลแบบรถ  ${delete_form.cmId}   :    ${delete_form.cmName} ออกจากฐานข้อมูลของระบบ</p>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-danger">delete</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>
</form:form>

<script type="text/javascript">
	$('#form-delete').on('submit', function(event) {
		event.preventDefault();
		$.ajax({
			url : $(this).attr('action'),
			type : 'post',
			data : $(this).serialize()
		}).done(function(response) {
			$('button[class=close]').click();
			$('#form-search').submit();
		}).error(function(response) {
			alert("ไม่สามารถลบแบบรถข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
		})
	})
</script>