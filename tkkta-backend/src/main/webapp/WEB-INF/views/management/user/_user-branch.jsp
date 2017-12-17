<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="user_page"
	action="${root_action}/management/users/add-pages" method="post"
	id="form-add-page">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h5 class="modal-title">${branch_id }</h5>
		<input type="hidden" name="username" value="${username}"> <input
			type="hidden" name="branchId" value="${branch_id}">
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<table class="table table-hover tabel-xxx">
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-left">เว็บโมดูล</th>
							<th class="text-center">add</th>
							<th class="text-center">edit</th>
							<th class="text-center">delete</th>
							<th class="text-center">approve</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${user_pages}" varStatus="count">
							<tr>
								<td class="text-center">${count.index+1}</td>
								<td class="text-left"><input type="hidden" name="pageName"
									value="${item.pageName}"> ${item.pageName}</td>
								<td class="text-center"><input type="hidden" name="flagAdd"
									value="${item.flagAdd == 'Y' ?  'Y':'N'}"><input
									type="checkbox" ${item.flagAdd == 'Y' ?  'checked':''}></td>
								<td class="text-center"><input type="hidden"
									name="flagEdit" value="${item.flagEdit == 'Y' ?  'Y':'N'}"><input
									type="checkbox" ${item.flagEdit == 'Y' ?  'checked':''}></td>
								<td class="text-center"><input type="hidden"
									name="flagDelete" value="${item.flagDelete == 'Y' ?  'Y':'N'}"><input
									type="checkbox" ${item.flagDelete == 'Y' ?  'checked':''}></td>
								<td class="text-center"><input type="hidden"
									name="flagApprove" value="${item.flagApprove == 'Y' ?  'Y':'N'}"><input
									type="checkbox" ${item.flagApprove == 'Y' ?  'checked':''}></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">Save change</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>
</form:form>
<script type="text/javascript">
	$('#form-add-page').on('submit', function(event) {
		event.preventDefault();
		console.log($(this).serialize());
		$.ajax({
			url : $(this).attr('action'),
			type : 'post',
			data : $(this).serialize()
		}).done(function(response) {
			$('button[class=close]').click();
			$('#form-search').submit();
		}).error(function(response) {
			alert("ไม่สามารถลบสาขาข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
		})
	})

	$('#form-add-page').on('click', 'input[type="checkbox"]', function() {
		if ($(this).is(":checked")) {
			$(this).closest('tr td').find('input').val('Y');
		} else {
			$(this).closest('tr td').find('input').val('N');
		}
	});
</script>

