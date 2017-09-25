<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title" id="exampleModalLabel">View Handheld</h5>
</div>
<div class="modal-body">
	<div class="row">
		<table class="table table-striped">
			<tr>
				<th class="text-left">Serial No :</th>
				<td>${view.serialNo}</td>
			</tr>
			<tr>
				<th class="text-left">Asset No :</th>
				<td>${view.assetNo}</td>
			</tr>
			<tr>
				<th class="text-left">Asset type :</th>
				<td>${view.assetType}</td>
			</tr>
			<tr>
				<th class="text-left">Model :</th>
				<td>${view.model}</td>
			</tr>
			<tr>
				<th class="text-left">IP Address :</th>
				<td>${view.ipAddress}</td>
			</tr>
			<tr>
				<th class="text-left">Status :</th>
				<td>${view.status}</td>
			</tr>
			<tr>
				<th class="text-left">Input date :</th>
				<td><fmt:formatDate value="${view.inputDate}"
						pattern="dd/MM/yyyy HH:mm:ss" /></td>
			</tr>
			<tr>
				<th class="text-left">Created date :</th>
				<td><fmt:formatDate value="${view.createdDate}"
						pattern="dd/MM/yyyy HH:mm:ss" /></td>
			</tr>
			<tr>
				<th class="text-left">Created user :</th>
				<td>${view.createdUser}</td>
			</tr>
			<tr>
				<th class="text-left">Updated date :</th>
				<td><fmt:formatDate value="${view.updatedDate}"
						pattern="dd/MM/yyyy HH:mm:ss" /></td>
			</tr>
			<tr>
				<th class="text-left">Updated user :</th>
				<td>${view.updatedUser}</td>
			</tr>
		</table>
		<div class="col-md-12 col-sm-12 col-xl-12">
			<p style="font-weight: bold;">Remark</p>
		</div>
		<div class="col-md-12 col-sm-12 col-xl-12">
			<p>${view.remark == '' ? 'NA': view.remark}</p>
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
	<a href="handheld-lotus/edit?serial_no=${view.serialNo}" class="btn btn-primary btn-edit">Edit</a>
</div>

<script type="text/javascript">
	$('.btn-edit').on('click', function(event) {
		event.preventDefault();
		$.ajax({
			url : $(this).attr("href"),
			type : 'get'
		}).done(function(response) {
			$modal = $('.gobal-modal');
			$modal.find('.modal-content').html(response);
			$modal.modal('show');
		});
	})
</script>
