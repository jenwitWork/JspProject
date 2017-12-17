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
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							${form_branch.branchId } <small>${form_branch.branchName }</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br />
						<div class="col-sm-5">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="text-center">#</th>
										<th class="text-left">username</th>
										<th class="text-center">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${userBranchs}" varStatus="count">
										<tr>
											<td class="text-center">${count.index+1 }</td>
											<td class="text-left">${item.username }</td>
											<td class="text-center">Action</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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

	$('#form-edit-user').on('submit',function(event){
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
	
	$('#form-edit-user').validate({
		rules : {
			username : {
				required : true,
				maxlength : 50,
				remote : {
					url : '${root_action}/management/users/check-dup',
					type : 'get',
					data : {
						username : function(){
							return $('#form-edit-user input[name=username]').val();
						},
						old_username: function(){
							return $('#form-edit-user input[name=old_username]').val();
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