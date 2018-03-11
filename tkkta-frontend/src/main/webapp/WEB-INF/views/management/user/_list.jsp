<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="table-users" class="table table-respondsive table-hover">
	<thead>
		<tr>
			<th class="text-center">no.</th>
			<th class="text-left">username</th>
			<th class="text-left">name</th>
			<th class="text-center">branch</th>
			<th class="text-center">position</th>
			<th class="text-center">role type</th>
			<th class="text-center">status</th>
			<th class="text-center">action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="user" varStatus="count" items="${users}">
			<tr>
				<td class="text-center">${count.index+1}</td>
				<td class="text-left">${user.username}</td>
				<td class="text-left">${user.name}</td>
				<td class="text-center">${user.branchId}</td>
				<td class="text-center">${user.posId}</td>
				<td class="text-center">${user.groupId}</td>
				<td class="text-center">${user.status}</td>
				<td class="text-center"><c:if
						test="${access_now.flagEdit == 'Y'}">
						<a
							href="<%=request.getContextPath() %>/management/users/edit?username=${user.username}"
							class="btn-edit"><i class="fa fa-pencil fa-fw"></i></a>
					</c:if> <c:if test="${access_now.flagDelete == 'Y'}">
						<a href="#" onclick="remove('${user.username}')"
							class="btn-delete"><i class="fa fa-minus-circle fa-fw"></i></a>
					</c:if></td>
			</tr>
		</c:forEach>
	</tbody>
</table>



<script type="text/javascript">
	/* 	$('#table-users').DataTable({
	 ordering : false,
	 searching : false,
	 responsive : true
	 }); */

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

	function remove(username) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : '${root_action}/management/users/delete',
			type : 'get',
			data : {
				username : username
			}
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	}
</script>

