<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<form:form action="${root_action}/management/users/add" method="post"
	modelAttribute="add_form" id="form-create">
	<input type="hidden" name="old_username" id="old_username" value="" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h5 class="modal-title">Create User</h5>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-sm-8 col-xs-8 forn-inline">
				<div class="form-group">
					<form:input path="username" class="form-control"
						placeholder="Username" />
				</div>
				<div class="form-group">
					<form:password path="password" class="form-control"
						placeholder="Password" />
				</div>
				<div class="form-group">
					<input type="password" name="c_password" id="c_password"
						class="form-control" placeholder="Confirm password">
				</div>
				<div class="form-group">
					<form:input path="name" class="form-control" placeholder="Name" />
				</div>
				<div class="form-group">
					<form:select path="branchId" class="form-control">
						<form:option value="">--- Branch ---</form:option>
						<c:forEach items="${branchList}" var="item">
							<form:option value="${item.branchId}">${item.branchId}</form:option>
						</c:forEach>
					</form:select>
				</div>
				<div class="form-group">
					<form:select path="posId" class="form-control">
						<form:option value="">--- Position ---</form:option>
						<c:forEach items="${posList}" var="item">
							<form:option value="${item.posId}">${item.posId} , ${item.posDesc}</form:option>
						</c:forEach>
					</form:select>
				</div>
				<div class="form-group">
					<form:select path="groupId" class="form-control">
						<form:option value="">--- User Group ---</form:option>
						<form:option value="Administrator">Administrator</form:option>
						<form:option value="User">User</form:option>
					</form:select>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">Create</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>
</form:form>


<script type="text/javascript">
	function pageLoad() {
		$('#form-create').submit();
	}

	$('#form-create').on('submit', function(event) {
		event.preventDefault();
		if ($(this).valid()) {
			$.ajax({
				url : $(this).attr("action"),
				type : 'post',
				data : $(this).serialize()
			}).done(function(response) {
				$('button[class=close]').click();
				$('#form-search').submit();
			}).error(function(response) {
				alert("ไม่สามารเพิ่มข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
			})
		}
	});

	$('#form-create').validate({
		rules : {
			username : {
				required : true,
				maxlength : 50,
				remote : {
					url : '${root_action}/management/users/check-dup',
					type : 'get',
					data : {
						username : function(){
							return $('#form-create input[name=username]').val();
						},
						old_username: function(){
							return $('#form-create input[name=old_username]').val();
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