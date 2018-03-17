<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form_user"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form_page_module"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form_user_branch"
	uri="http://www.springframework.org/tags/form"%>
<mt:_layout title="${current_title }">
	<jsp:attribute name="content">


<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h5>Management / ${current_title }</h5>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">

			<div class="col-md-7 col-sm-7 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							General <small>ข้อมูลทั่วไป</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br />
						<form_user:form action="${root_action}/management/users/edit"
									method="post" modelAttribute="edit_form"
									class="form-horizontal form-label-left" id="form-edit-user">
							<input type="hidden" name="old_username" id="old_username"
										value="${edit_form.username }">
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="first-name">Username <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="username" id="username"
												value="${edit_form.username }"
												class="form-control col-md-7 col-xs-12" readonly />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="last-name">Name <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<form_user:input path="name"
												class="form-control col-md-7 col-xs-12" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="last-name">Branch <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<form_user:select path="branchId"
												class="form-control col-md-7 col-xs-12">
										<form_user:option value="">--- Branch ---</form_user:option>
										<c:forEach items="${branchList}" var="item">
											<form_user:option value="${item.branchId}">${item.branchId}</form_user:option>
										</c:forEach>
									</form_user:select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="last-name">Position <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<form_user:select path="posId"
												class="form-control col-md-7 col-xs-12">
										<form_user:option value="">--- Position ---</form_user:option>
										<c:forEach items="${posList}" var="item">
											<form_user:option value="${item.posId}">${item.posId} , ${item.posDesc}</form_user:option>
										</c:forEach>
									</form_user:select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="last-name">User Group <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<form_user:select path="groupId"
												class="form-control col-md-7 col-xs-12">
										<form_user:option value="">--- Select ---</form_user:option>
										<form_user:option value="Administrator">Administrator</form_user:option>
										<form_user:option value="User">User</form_user:option>
									</form_user:select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="last-name">Status <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<form_user:select path="status"
												class="form-control col-md-7 col-xs-12">
										<form_user:option value="">--- Status ---</form_user:option>
										<form_user:option value="active">active</form_user:option>
										<form_user:option value="deactive">deactive</form_user:option>
									</form_user:select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="last-name"> <span class="required"></span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<a href="${root_action}/management/users/change-pass?username=${edit_form.username}" class="btn-chg-pass">change password</a>
								</div>
							</div>
							<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<button type="submit" class="btn btn-success">Save
										change</button>
									<button class="btn btn-primary" type="button">Cancel</button>
								</div>
							</div>

						</form_user:form>
					</div>
				</div>
			</div>

			<div class="col-md-5  col-sm-5 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							Branch <small>สาขาที่เข้าถึง</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br />
						<form_page_module:form action="" method="post"
									modelAttribute="user_branchs" id="form_page_module"
									class="form-horizontal form-label-left input_mask">
							<input type="hidden" name="username" id="username"
										value="${edit_form.username}">
							<input type="hidden" name="branchId" id="branchId">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="text-center">#</th>
										<th class="text-left">รหัสสาขา</th>
										<th class="text-center">action</th>
									</tr>
								</thead>
								<tbody>									
									<c:forEach items="${user_branchs}" var="item" varStatus="count">
										<tr>
											<td class="text-center">${count.index+1}</td>
											<td class="text-left"><input type="hidden"
														name="branchId" id="branchId" value="${item.branchId }">${item.branchId }</td>
											<td class="text-center"><a
														href="${root_action}/management/users/get-pages?branch_id=${item.branchId }&username=${edit_form.username}"
														class="btn-edit"><i class="fa fa-pencil fa-fw"></i></a> <a
														href="${root_action}/management/users/delete-branch?branchId=${item.branchId }&username=${edit_form.username}"
														class="btn-delete"><i class="fa fa-minus-circle fa-fw"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form_page_module:form>
						<div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
								<button type="submit" class="btn btn-success">Save
									change</button>
								<a href="${root_action}/management/users/get-branch"
											class="btn btn-primary btn-add-branch" type="button">Add</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- /page content -->


</jsp:attribute>
</mt:_layout>



<script type="text/javascript">
	$('#form-edit-user').on('submit', function(event) {
		event.preventDefault();
		if ($(this).valid()) {
			$.ajax({
				url : $(this).attr("action"),
				type : 'post',
				data : $(this).serialize()
			}).done(function(response) {
				alert("บันทึกข้อมูลสำเร็จ");
				location.reload();
			}).error(function(response) {
				alert("ไม่สามารเพิ่มข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
			})
		}
	})

	$('.btn-edit').on('click', function(event) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : $(this).attr("href"),
			type : 'get'
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	})

	$('.btn-delete').on('click', function(event) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : $(this).attr("href"),
			type : 'get'
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	})

	$('.btn-add-branch').on('click', function(event) {
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : $(this).attr('href'),
			type : 'get',
			data : $('#form_page_module').serialize()
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		}).error(function(response) {
			alert('Error!!, please try again.');
		})
	})
	
	
	

	$('#form-edit-user')
			.validate(
					{
						rules : {
							username : {
								required : true,
								maxlength : 50,
								remote : {
									url : '${root_action}/management/users/check-dup',
									type : 'get',
									data : {
										username : function() {
											return $(
													'#form-edit-user input[name=username]')
													.val();
										},
										old_username : function() {
											return $(
													'#form-edit-user input[name=old_username]')
													.val();
										}
									}
								}
							},
							password : {
								required : true,
								maxlength : 50
							},
							c_password : {
								required : true,
								maxlength : 50,
								equalTo : "#password"
							},
							name : {
								required : true,
								maxlength : 200
							},
							posId : {
								required : true
							},
							branchId : {
								required : true
							},
							groupId : {
								required : true
							}
						},
						messages : {
							username : {
								required : 'ระบุชื่อผู้ใช้งาน',
								maxlength : 'ชื่อผู้ใช้งานต้องไม่เกิน 50 ตัวอักษร',
								remote : 'ชื่อผู้ใช้งานถูกใช้ไปแล้ว'
							},
							password : {
								required : 'ระบุรหัสผ่าน',
								maxlength : 'รหัสผ่านต้องไม่เกิน 50 ตัวอักษร'
							},
							c_password : {
								required : 'ระบุรหัสผ่าน',
								maxlength : 'รหัสผ่านต้องไม่เกิน 50 ตัวอักษร',
								equalTo : "รหัสผ่านไม่ตรงกัน"
							},
							name : {
								required : 'ระบุชื่อ - สกุล',
								maxlength : 'ความยาวต้องไม่เกิน 200 ตัวอักษร'
							},
							posId : {
								required : 'ระบุุตำแหน่ง'
							},
							branchId : {
								required : 'ระบุสาขา'
							},
							groupId : {
								required : 'ระบุกลุ่มผู้ใช้งาน'
							}
						}
					})
</script>