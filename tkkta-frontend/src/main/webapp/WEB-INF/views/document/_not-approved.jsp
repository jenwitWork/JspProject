<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title">ไม่อนุมติ</h5>
</div>
<form action="${root_action}/document/approval" method="post"
	id="form-approval">
	<input type="hidden" name="docNo" value="${approve_form.docNo}" /> <input
		type="hidden" name="status" value="not-approved" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h5>กรุณากรอกเหตุผล หรือ ข้อเสนอแนะ ที่ไม่อนุมัติ</h5>
				<textarea name="comment" class="form-control"></textarea>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-danger">Not approve</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>
</form>

<script type="text/javascript">
	$('#form-approval').on('submit', function(event) {
		event.preventDefault();
		if ($('#form-approval').valid()) {
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
		}
	})

	$('#form-approval').validate({
		rules : {
			comment : {
				required : true,
			},

		},
		messages : {
			comment : {
				required : 'กรุณาระบุ',
			},
		}
	})
</script>