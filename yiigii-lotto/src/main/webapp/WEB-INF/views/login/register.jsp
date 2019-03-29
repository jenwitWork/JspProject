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
        <form action="register" method="post">
          <div class="form-group">
                <div class="form-label-group">
							<input type="text" id="username" name="username"
										class="form-control" placeholder="Username"
										required="required" autofocus="autofocus">
							<label for="username">Username</label>
						</div>
          </div>
          <div class="form-group">
                <div class="form-label-group">
							<input type="password" id="password" name="password"
										class="form-control" placeholder="รหัสผ่าน"
										required="required" autofocus="autofocus">
							<label for="password">รหัสผ่าน</label>
						</div>
          </div>
          <div class="form-group">
                <div class="form-label-group">
                   <input type="password" id="confirmPassword"
										class="form-control" placeholder="รหัสผ่านอีกครั้ง"
										required="required">
                  <label for="confirmPassword">รหัสผ่านอีกครั้ง</label>
                </div>
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