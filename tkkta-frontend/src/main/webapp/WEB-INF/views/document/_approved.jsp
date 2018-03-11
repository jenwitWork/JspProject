<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title">อนุมัติ</h5>
</div>
<form action="${root_action}/document/approval" method="post"
	id="form-approval">
	<input type="hidden" name="docNo" value="${approve_form.docNo}" /> <input
		type="hidden" name="status" value="approved" /> <input type="hidden"
		name="comment" value="">
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h5>เมื่อดำเนินการอนุมัติแล้ว
					เอกสารจะมารถแสดงเพื่อเป็นข้อมูลให้กับสาขาอื่นสำหรับการนำไปใช้แก้ปัญหา</h5>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-success">Approve</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>
</form>

<script type="text/javascript">
	$('#form-approval').on('submit', function(event) {
		event.preventDefault();
		$.ajax({
			url : $(this).attr('action'),
			type : 'post',
			data : $(this).serialize()
		}).done(function(response) {
			$('button[class=close]').click();
			$('#form-search').submit();
			location.reload();
		}).error(function(response) {
			alert("ไม่สามารถลบสาขาข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
		})
	})
</script>