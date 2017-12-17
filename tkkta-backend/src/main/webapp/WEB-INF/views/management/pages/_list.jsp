<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="table-pages" class="table table-respondsive table-hover">
	<thead>
		<tr>
			<th class="text-center">no.</th>
			<th class="text-left">รหัสโมดูล</th>
			<th class="text-left">รายละเอียด</th>
			<th class="text-center">วันที่สร้าง</th>
			<th class="text-left">ผู้สร้าง</th>
			<th class="text-center">แก้ไขล่าสุด</th>
			<th class="text-left">ผู้แก้ไข</th>
			<th class="text-center">action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" varStatus="count" items="${pages}">
			<tr>
				<td class="text-center">${count.index+1}</td>
				<td class="text-left">${item.pageName}</td>
				<td class="text-left">${item.pageDetail}</td>
				<td class="text-center">${item.createdDate}</td>
				<td class="text-left">${item.createdUser}</td>
				<td class="text-center">${item.updatedDate}</td>
				<td class="text-left">${item.updatedUser}</td>
				<td class="text-center"> <a href="#" style="color: blue;"><i
						class="fa fa-gear fa-fw"></i></a>  <a href="#" style="color: green;" onclick="edit('${item.pageName}')"><i
						class="fa fa-pencil fa-fw"></i></a>  <a href="#" style="color: red;" onclick="remove('${item.pageName}')"><i
						class="fa fa-minus-circle fa-fw"></i></a> 
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>



<script type="text/javascript">
/* 	$('#table-pages').DataTable({
		ordering : false,
		searching : false,
		responsive : true
	}); */

	function edit(pageName) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/management/pages/edit',
			type : 'get',
			data : {
				pageName : pageName
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}
	
	function remove(pageName) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/management/pages/delete',
			type : 'get',
			data : {
				pageName : pageName
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}
</script>

