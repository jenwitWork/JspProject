<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="table-branchs" class="table table-respondsive table-hover">
	<thead>
		<tr>
			<th class="text-center">no.</th>
			<th class="text-left">รหัสสาขา</th>
			<th class="text-left">ชื่อสาขา</th>
			<th class="text-center">วันที่สร้าง</th>
			<th class="text-left">ผู้สร้าง</th>
			<th class="text-center">แก้ไขล่าสุด</th>
			<th class="text-left">ผู้แก้ไข</th>
			<th class="text-center">action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="branch" varStatus="count" items="${branchs}">
			<tr>
				<td class="text-center">${count.index+1}</td>
				<td class="text-left">${branch.branchId}</td>
				<td class="text-left">${branch.branchName}</td>
				<td class="text-center">${branch.createdDate}</td>
				<td class="text-left">${branch.createdUser}</td>
				<td class="text-center">${branch.updatedDate}</td>
				<td class="text-left">${branch.updatedUser}</td>
				<td class="text-center"> <a href="${root_action}/management/branch/manage?branch_id=${branch.branchId}" style="color: blue;"><i
						class="fa fa-gear fa-fw"></i></a>  <a href="#" class="btn-edit" onclick="edit('${branch.branchId}')"><i
						class="fa fa-pencil fa-fw"></i></a>  <a href="#" class="btn-delete" onclick="remove('${branch.branchId}')"><i
						class="fa fa-minus-circle fa-fw"></i></a> 
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>



<script type="text/javascript">
/* 	$('#table-branchs').DataTable({
		ordering : false,
		searching : false,
		responsive : true
	}); */

	function edit(branch_id) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/management/branch/edit',
			type : 'get',
			data : {
				branch_id : branch_id
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}
	
	function remove(branch_id) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/management/branch/delete',
			type : 'get',
			data : {
				branch_id : branch_id
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}
</script>

