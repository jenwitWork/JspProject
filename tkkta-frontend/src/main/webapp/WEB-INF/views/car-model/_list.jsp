<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="table-responsive">
	<table id="table-pages" class="table table-hover">
		<thead>
			<tr>
				<th class="text-center">no.</th>
				<th class="text-left">รุ่นรถ</th>
				<th class="text-left">รายละเอียด</th>
				<th class="text-center">แบบรถ</th>				
				<th class="text-center">วันที่สร้าง</th>
				<th class="text-left">ผู้สร้าง</th>
				<th class="text-center">แก้ไขล่าสุด</th>
				<th class="text-left">ผู้แก้ไข</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" varStatus="count" items="${car_models}">
				<tr>
					<td class="text-center">${count.index+1}</td>
					<td class="text-left">${item.serieTitle}</td>
					<td class="text-left">${item.cmName}</td>
					<td class="text-center">${item.cmId}</td>					
					<td class="text-center">${item.createdDate}</td>
					<td class="text-left">${item.createdUser}</td>
					<td class="text-center">${item.updatedDate}</td>
					<td class="text-left">${item.updatedUser}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


<script type="text/javascript">
	 $('#table-pages').DataTable({
		ordering : false,
		searching : false,
		responsive : true
	}); 

	function edit(cm_id) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/car-model/edit',
			type : 'get',
			data : {
				cm_id : cm_id
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}

	function remove(cm_id) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/car-model/delete',
			type : 'get',
			data : {
				cm_id : cm_id
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}
</script>

