<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-responsive table-striped table-hover"
	id="table-data">
	<thead>
		<tr>
			<th class="text-center">#</th>
			<th class="text-left">Asset No</th>
			<th class="text-left">Serial No</th>
			<th class="text-left">IP Address</th>
			<th class="text-center">Model</th>
			<th class="text-center">Status</th>
			<th class="text-center">Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${hendhelds}" var="handheld" varStatus="count">
			<tr>
				<td class="text-center">${count.index+1 }</td>
				<td class="text-left">${handheld.assetNo }</td>
				<td class="text-left">${handheld.serialNo }</td>
				<td class="text-left">${handheld.ipAddress }</td>
				<td class="text-center">${handheld.model }</td>
				<td class="text-center ${handheld.status}">${handheld.status }</td>
				<td class="text-center"><a style="cursor: pointer;" class="btn-view"
					onclick="view('${handheld.serialNo}')"><i class="fa fa-eye"></i></a>
					| <a style="cursor: pointer;" class="btn-edit" onclick="edit('${handheld.serialNo}')"><i
						class="fa fa-edit"></i></a> | <a style="cursor: pointer;" class="btn-delete"
					onclick="remove('${handheld.serialNo}')"><i class="fa fa-trash"></i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script type="text/javascript">
		$('#table-data').DataTable({
			ordering : false,
			searching : false,
			responsive : true,
		//"scrollY": "300px",
		});

	function view(serial_no) {
		$.ajax({
			url : 'handheld-lotus/view',
			type : 'get',
			data : {
				serial_no : serial_no
			}
		}).done(function(response) {
			$modal = $('.gobal-modal');
			$modal.find('.modal-content').html(response);
			$modal.modal('show');
		});
	}
	
	function edit(serial_no) {
		$.ajax({
			url : 'handheld-lotus/edit',
			type : 'get',
			data : {
				serial_no : serial_no
			}
		}).done(function(response) {
			$modal = $('.gobal-modal');
			$modal.find('.modal-content').html(response);
			$modal.modal('show');
		});
	}
	
	function remove(serial_no) {
		$.ajax({
			url : 'handheld-lotus/delete',
			type : 'get',
			data : {
				serial_no : serial_no
			}
		}).done(function(response) {
			$modal = $('.gobal-modal');
			$modal.find('.modal-content').html(response);
			$modal.modal('show');
		});
	}

</script>