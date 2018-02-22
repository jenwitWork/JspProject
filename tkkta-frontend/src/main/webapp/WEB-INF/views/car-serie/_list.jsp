<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="table-responsive">
	<table id="table-pages" class="table table-hover">
		<thead>
			<tr>
				<th class="text-center">no.</th>
				<th class="text-left">รุ่นรถ</th>
				<th class="text-center">วันที่สร้าง</th>
				<th class="text-left">ผู้สร้าง</th>
				<th class="text-center">แก้ไขล่าสุด</th>
				<th class="text-left">ผู้แก้ไข</th>
				<th class="text-center">action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" varStatus="count" items="${car_series}">
				<tr>
					<td class="text-center">${count.index+1}</td>
					<td class="text-left">${item.serieTitle}</td>
					<td class="text-center">${item.createdDate}</td>
					<td class="text-left">${item.createdUser}</td>
					<td class="text-center">${item.updatedDate}</td>
					<td class="text-left">${item.updatedUser}</td>
					<td class="text-center"><a
						href="${root_action}/car-model?serie_id=${item.serieId}"><i
							class="fa fa-arrows"></i></a>
					</td>
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

	function edit(serie_id) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/car-serie/edit',
			type : 'get',
			data : {
				serie_id : serie_id
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}

	function remove(serie_id) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/car-serie/delete',
			type : 'get',
			data : {
				serie_id : serie_id
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}
</script>

