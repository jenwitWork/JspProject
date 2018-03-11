<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="table-responsive">
	<table id="table-pages" class="table table-hover">
		<thead>
			<tr>
				<th class="text-left">เลขที่เอกสาร</th>
				<th class="text-left">สาขา</th>
				<th class="text-left">สถานะ</th>
				<th class="text-left">รุ่นรถ</th>
				<th class="text-left">แบบรถ</th>
				<th class="text-left">หมวดปัญหา</th>
				<th class="text-left">ชื่อปัญหา</th>
				<th class="text-center">จัดการ</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" varStatus="count" items="${docs}">
				<tr>
					<td class="text-left">${item.docNo}</td>
					<td class="text-left">${item.branchId}</td>
					<td class="text-left ${item.status}">${item.status}</td>
					<td class="text-left">${item.serieTitle}</td>
					<td class="text-left">${item.cmName}</td>
					<td class="text-left">${item.pbName}</td>
					<td class="text-left">${item.caseNameTh}</td>
					<td class="text-center"><a
						href="${root_action}/document/view?doc_no=${item.docNo}"
						class="btn-view"><i class="fa fa-eye fa-fw"></i></a> <c:if
							test="${item.status != 'approved' and access_now.flagEdit == 'Y'}">
							<a href="${root_action}/document/edit?doc_no=${item.docNo}"
								class="btn-edit" data-branch="${item.branchId}"><i
								class="fa fa-pencil fa-fw"></i></a>
						</c:if> <c:if
							test="${item.status != 'approved' and access_now.flagDelete == 'Y'}">
							<a href="#" class="btn-delete"
								onclick="remove('${item.docNo}','${item.branchId}')"><i
								class="fa fa-minus-circle fa-fw"></i></a>
						</c:if></td>
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

	$('.btn-edit').on('click', function(event) {
		event.preventDefault();
		var url1 = $(this).attr("href");
		$.ajax({
			url : '${root_action}/utilities/user-access',
			type : 'get',
			data : {
				branch_id : '${current_branch}',
				username : '${gobalUser.username}',
				page_name : '${current_action}',
				flag_type : 'edit'
			}
		}).done(function(response) {
			if (response == 'true') {
				location.replace(url1);
			} else {
				alert('คุณไม่มีสิทธิ์ในการแแก้ไขข้อมูลของสาขานี้');
			}
		});
	})

	$('.btn-delete').on('click', function(event) {
		event.preventDefault();
		var url1 = $(this).attr("href");
		$.ajax({
			url : '${root_action}/utilities/user-access',
			type : 'get',
			data : {
				branch_id : $(this).data('branch'),
				username : '${gobalUser.username}',
				page_name : '${current_action}',
				flag_type : 'delete'
			}
		}).done(function(response) {
			if (response == 'true') {
				location.replace(url1);
			} else {
				alert('คุณไม่มีสิทธิ์ในการแแก้ไขข้อมูลของสาขานี้');
			}
		});
	})

	function remove(doc_no, branch) {
		event.preventDefault();
		$.ajax({
			url : '${root_action}/utilities/user-access',
			type : 'get',
			data : {
				branch_id : branch,
				username : '${gobalUser.username}',
				page_name : '${current_action}',
				flag_type : 'delete'
			}
		}).done(function(response) {
			if (response == 'true') {
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
			} else {
				alert('คุณไม่มีสิทธิ์ในการแแก้ไขข้อมูลของสาขานี้');
			}
		});

	}
</script>

