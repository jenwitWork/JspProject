<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h5 class="modal-title">${sdfsaf }</h5>
</div>
<div class="modal-body">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th class="text-left">รหัสสาขา</th>
						<th class="text-center">ชื่อสาขา</th>
						<th class="text-center">select</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${branchs}" varStatus="count">
						<tr>
							<td class="text-center">${count.index+1}</td>
							<td class="text-left">${item.branchId}</td>
							<td class="text-left">${item.branchName}</td>
							<td class="text-center"><a
								href="${root_action}/management/users/add-branch?branch_id=${item.branchId}&username=${username}"
								class="btn-add"><i class="fa fa-plus-square"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>

<script type="text/javascript">
	$('.btn-add').on('click', function(event) {
		$.ajax({
			url : $(this).attr('href'),
			type : 'get'
		}).done(function(response) {
			alert('บักทึกสำเร็จ');
			location.reload();
		}).error(function(response) {
			alert('ไม่สามารถเพิ่มข้อมูลสาขาได้ กรุณาลองใหม่อีกครัง');
			$('button[class=close]').click();
		})
	})
</script>