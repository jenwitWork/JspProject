<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title">ลบข้อมูลรุ่นรถ</h5>
</div>
<form:form action="${root_action}/document/delete" method="post"
	modelAttribute="delete_form" id="form-delete">
	<form:hidden path="docNo" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h4>คำเตือน !!</h4>
				<p>คูณกำลังดำเนินการลบข้อมูลรุ่นรถ ${delete_form.docNo}
					ออกจากฐานข้อมูลของระบบ</p>
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
		alert($(this).attr('action'));
		$.ajax({
			url : $(this).attr('action'),
			type : 'post',
			data : $(this).serialize()
		}).done(function(response) {
			if (response == 'success') {
				$('button[class=close]').click();
				$('#form-search').submit();
			} else {
				alert("ไม่สามารถลบรุ่นรถข้อมูลได้  เนื่องจากมีการใช้งานอยู่ ");
				$('button[class=close]').click();
			}
		}).error(function(response) {
			alert("ไม่สามารถลบรุ่นรถข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
		})
	})
</script>