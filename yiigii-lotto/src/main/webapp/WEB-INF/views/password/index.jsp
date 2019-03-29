<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="search_form"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<mt:_layout title="${current_title }">
	<jsp:attribute name="content">

<body class="bg-dark">

	

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">เปลี่ยนรหัสผ่าน</div>
      <div class="card-body">
        <form id="regis-form" action="change-pass" method="post">
          <div class="form-group">
          	<input type="hidden" name="username" id="username"
									value="${active_user.username}">
                <input type="password" id="password" name="password"
									class="form-control" placeholder="กรอกรหัสผ่านปัจจุบัน"
									required="required" autofocus="autofocus">
          </div>
          <div class="form-group">
                <input type="password" id="new_password"
									name="new_password" class="form-control"
									placeholder="กรอกรหัสผ่านใหม่" required="required">
          </div>
          <div class="form-group">
                <input type="password" id="c_password" name="c_password"
									class="form-control" placeholder="กรอกรหัสผ่านใหม่อีกครั้ง"
									required="required">
          </div>
           <button type="submit" class="btn btn-primary btn-block">บันทึก</button>
        </form>
      </div>
    </div>
  </div>
  </body>


	</jsp:attribute>
</mt:_layout>


<script type="text/javascript">
	/* $('#regis-form').on('submit', function(event) {
		event.preventDefault();
		if ($(this).valid()) {
			$.ajax({
				url : $(this).attr("action"),
				type : 'post',
				data : $(this).serialize()
			}).done(function(response) {
			}).error(function(response) {
				alert("ไม่สามารเพิ่มข้อมูลได้  กรุณาลองใหม่อีกครั้ง");
			})
		}
	});  */

	$('#regis-form').validate({
		rules : {
			password : {
				required : true,
				maxlength : 10,
				remote : {
					url : 'change-pass/check-dup',
					type : 'get',
					data : {
						username : function() {
							return $('#regis-form input[name=username]').val();
						},
						old_username : function() {
							return $('#regis-form input[name=password]').val();
						}
					}
				}
			},
			new_password : {
				required : true,
				maxlength : 50
			},
			c_password : {
				required : true,
				maxlength : 50,
				equalTo : "#new_password"
			}
		},
		messages : {
			password : {
				required : 'กรุณาระบุรหัสผ่านเดิม',
				maxlength : 'รหัสผ่านต้องไม่เกิน 50 ตัวอักษร',
				remote : 'กรุณากรอกรหัสผ่านเดิม'
			},
			new_password : {
				required : 'ระบุรหัสผ่าน',
				maxlength : 'รหัสผ่านต้องไม่เกิน 50 ตัวอักษร'
			},
			c_password : {
				required : 'ระบุรหัสผ่าน',
				maxlength : 'รหัสผ่านต้องไม่เกิน 50 ตัวอักษร',
				equalTo : "รหัสผ่านไม่ตรงกัน"
			}
		}
	})
</script>