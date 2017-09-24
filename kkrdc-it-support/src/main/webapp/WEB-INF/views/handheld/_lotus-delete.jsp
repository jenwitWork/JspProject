<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="delete_form"
	uri="http://www.springframework.org/tags/form"%>
<delete_form:form id="form-delete" action="handheld-lotus/delete"
	modelAttribute="delete_form" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h5 class="modal-title" id="exampleModalLabel">delete Handheld</h5>
	</div>
	<div class="modal-body">
		<delete_form:input path="serialNo" type="hidden" />
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary">Save changes</button>
	</div>
</delete_form:form>

<script type="text/javascript">
	$('input[name=inputDate]').daterangepicker({
		locale : {
			format : 'YYYY-MM-DD'
		},
		"singleDatePicker" : true,
	});

	$('#form-delete').on('submit', function(event) {
		event.preventDefault();
		$.ajax({
			url : $(this).attr("action"),
			type : 'post',
			data : $(this).serialize()
		}).done(function(response) {
			$('button[class=close]').click();
			$('#form-search').submit();
		});
	});
</script>