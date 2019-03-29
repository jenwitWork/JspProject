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
      <div class="card-header">ลงทะเบียน</div>
      <div class="card-body">
        <form id="regis-form" action="register" method="post">
          <div class="form-group">
                <input type="text" id="username" name="username"
										class="form-control" placeholder="Username"
										required="required" autofocus="autofocus">
          </div>
          <div class="form-group">
                <input type="password" id="password" name="password"
										class="form-control" placeholder="รหัสผ่าน">
          </div>
          <div class="form-group">
          <input type="password" id="c_password" name="c_password"
										class="form-control" placeholder="รหัสผ่านอีกครั้ง">
          </div>
           <button type="submit" class="btn btn-primary btn-block">ลงทะเบียน</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login">เข้าสู่ระบบ</a>
        </div>
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
			username : {
				required : true,
				maxlength : 10,
				remote : {
					url : 'register/check-dup',
					type : 'get',
					data : {
						username : function(){
							return $('#regis-form input[name=username]').val();
						},
						old_username: function(){
							return $('#regis-form input[name=old_username]').val();
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
			}
		},
		messages : {
			username : {
				required : 'ระบุชื่อผู้ใช้งาน',
				maxlength : 'ชื่อผู้ใช้งานต้องไม่เกิน 10 ตัวอักษร',
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
			}
		}
	})
</script>