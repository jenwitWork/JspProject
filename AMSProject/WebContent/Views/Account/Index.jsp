<%@ page language="java" contentType="text/html; charset=TIS-620"
	pageEncoding="TIS-620"%>
<%@include file="/jspFile/header.jsp"%>
<div id="page-wrapper">
	<div class="row" style="margin-top: 50px;">
		<div class="col-lg-12">
			<h1 class="page-header">
				<font color="#337ab7">เพิ่มผู้ใช้</font>
			</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">


			<div class="col-md-6 form-horizontal">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">ชื่อ
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="ชื่อ">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">นามสกุล
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="นามสกุล">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">รหัสประจำตัว
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="รหัสประจำตัวนักศึกษา/อาจารย์">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">แผนก
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="แผนก">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">คณะ
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="คณะ">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">เบอร์โทรศัพท์
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="เบอร์โทรศัพท์">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">Email
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="Email">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">ชนิดผู้ใช้
						:</label>
					<div class="col-sm-8">
						<select class="form-control">
							<option>เลือกชนิดผู้ใช้</option>
							<option>Web Master</option>
							<option>admin</option>
							<option>User</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">ที่อยู่
						:</label>
					<div class="col-sm-8">
						<textarea class="form-control" rows="3"></textarea>
					</div>
				</div>


			</div>

			<div class="col-md-6 form-horizontal">

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">ชื่อผู้ใช้:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputUserName"
							placeholder="ชื่อผู้ใช้">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">รหัสผ่าน:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputPassword"
							placeholder="รหัสผ่าน">
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">ยืนยันรหัสผ่าน:</label>
					<div class="col-sm-8">
						<input type="password" class="form-control"
							id="inputConfirmPassword" placeholder="ยืนยันรหัสผ่าน">
					</div>
				</div>
				<div class="form-group">
					<div for="Inpassword" class="col-sm-3 control-label"></div>
					<div class="col-sm-8">
						<button type="submit" class="btn btn-success">บันทึก</button>
						<button type="reset" class="btn btn-warning">ยกเลิก</button>
					</div>
				</div>




			</div>
			<!-- /.col-lg-8 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
	<%@include file="/jspFile/footer.jsp"%>