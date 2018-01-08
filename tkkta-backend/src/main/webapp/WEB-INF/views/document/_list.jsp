<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="table-responsive">
	<table id="table-pages" class="table table-hover">
		<thead>
			<tr>
				<th class="text-left">เลขที่เอกสาร</th>
				<th class="text-center">สาขา</th>
				<th class="text-center">สถานะ</th>
				<th class="text-center">รุ่นรถ</th>
				<th class="text-center">แบบรถ</th>
				<th class="text-center">หมวดปัญหา</th>
				<th class="text-left">ชื่อปัญหา</th>
				<th class="text-center">จัดการ</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" varStatus="count" items="${docs}">
				<tr>
					<td class="text-left">${item.docNo}</td>
					<td class="text-center">${item.branchId}</td>
					<td class="text-center">${item.status}</td>
					<td class="text-center">${item.serieTitle}</td>
					<td class="text-center">${item.cmName}</td>
					<td class="text-center">${item.pbName}</td>
					<td class="text-left">${item.caseNameTh}</td>
					<td class="text-center"><a
						href="${root_action}/document/edit?doc_no=${item.docNo}"
						style="color: green;"><i class="fa fa-pencil fa-fw"></i></a> <a
						href="#" style="color: red;" onclick="remove('${item.docNo}')"><i
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

	function edit(doc_no) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/document/edit',
			type : 'get',
			data : {
				doc_no : doc_no
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}

	function remove(doc_no) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/document/delete',
			type : 'get',
			data : {
				doc_no : doc_no
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}
</script>

