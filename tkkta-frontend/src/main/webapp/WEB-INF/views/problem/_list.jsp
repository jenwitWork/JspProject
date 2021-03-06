<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="table-responsive">
	<table id="table-pages" class="table table-hover">
		<thead>
			<tr>
				<th class="text-center">no.</th>
				<th class="text-left">หมวดปัญหา</th>
				<th class="text-center">วันที่สร้าง</th>
				<th class="text-left">ผู้สร้าง</th>
				<th class="text-center">แก้ไขล่าสุด</th>
				<th class="text-left">ผู้แก้ไข</th>
				<th class="text-center">action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" varStatus="count" items="${problems}">
				<tr>
					<td class="text-center">${count.index+1}</td>
					<td class="text-left">${item.pbName}</td>
					<td class="text-center">${item.createdDate}</td>
					<td class="text-left">${item.createdUser}</td>
					<td class="text-center">${item.updatedDate}</td>
					<td class="text-left">${item.updatedUser}</td>
					<td class="text-center"><a href="#" style="color: green;"
						onclick="edit('${item.pbType}')"><i class="fa fa-pencil fa-fw"></i></a>
						<a href="#" style="color: red;" onclick="remove('${item.pbType}')"><i
							class="fa fa-minus-circle fa-fw"></i></a></td>
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

	function edit(pb_type) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/problem/edit',
			type : 'get',
			data : {
				pb_type : pb_type
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}

	function remove(pb_type) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/problem/delete',
			type : 'get',
			data : {
				pb_type : pb_type
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}
</script>

