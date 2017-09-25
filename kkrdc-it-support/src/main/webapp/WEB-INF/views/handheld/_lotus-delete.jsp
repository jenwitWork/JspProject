<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<h5 class="modal-title" id="exampleModalLabel">Confirm delete</h5>
	</div>
	<div class="modal-body">
		<div class="row">
			<delete_form:hidden path="serialNo" />
			<table class="table table-striped">
				<tr>
					<th class="text-left">Serial No :</th>
					<td>${delete_form.serialNo}</td>
				</tr>
				<tr>
					<th class="text-left">Asset No :</th>
					<td>${delete_form.assetNo}</td>
				</tr>
				<tr>
					<th class="text-left">Asset type :</th>
					<td>${delete_form.assetType}</td>
				</tr>
				<tr>
					<th class="text-left">Model :</th>
					<td>${delete_form.model}</td>
				</tr>
				<tr>
					<th class="text-left">IP Address :</th>
					<td>${delete_form.ipAddress}</td>
				</tr>
				<tr>
					<th class="text-left">Status :</th>
					<td>${delete_form.status}</td>
				</tr>
				<tr>
					<th class="text-left">Input date :</th>
					<td><fmt:formatDate value="${delete_form.inputDate}"
							pattern="dd/MM/yyyy HH:mm:ss" /></td>
				</tr>
				<tr>
					<th class="text-left">Created date :</th>
					<td><fmt:formatDate value="${delete_form.createdDate}"
							pattern="dd/MM/yyyy HH:mm:ss" /></td>
				</tr>
				<tr>
					<th class="text-left">Created user :</th>
					<td>${delete_form.createdUser}</td>
				</tr>
				<tr>
					<th class="text-left">Updated date :</th>
					<td><fmt:formatDate value="${delete_form.updatedDate}"
							pattern="dd/MM/yyyy HH:mm:ss" /></td>
				</tr>
				<tr>
					<th class="text-left">Updated user :</th>
					<td>${delete_form.updatedUser}</td>
				</tr>
			</table>
			<div class="col-md-12 col-sm-12 col-xl-12">
				<p style="font-weight: bold;">Remark</p>
			</div>
			<div class="col-md-12 col-sm-12 col-xl-12">
				<p>${delete_form.remark == '' ? 'NA': delete_form.remark}</p>
			</div>
			<div class="col-md-12 col-sm-12 col-xl-12">
				<p style="font-weight: bold;">Repair history</p>
			</div>
			<div class="col-md-12 col-sm-12 col-xl-12">
				<p>Detail repair</p>
			</div>
		</div>

	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-danger">Delete</button>
	</div>
</delete_form:form>

<script type="text/javascript">

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