<%@ page language="java" contentType="text/html; charset=TIS-620"
	pageEncoding="TIS-620"%>
<%@include file="/jspFile/header.jsp"%>
<div id="page-wrapper">
	<div class="row" style="margin-top: 50px;">
		<div class="col-lg-12">
			<h3 class="page-header">
				<font color="#337ab7"><i class="fa fa-plus fa-fw"></i>เพิ่มรายการส่งซ่อม</font>
			</h3>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">




			<div class="col-md-6 form-horizontal">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">หมายเลขครุภัณฑ์
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="กรอกหมายเลขครุภัณฑ์ที่ส่งซ่อม...">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">ชื่อครุภัณฑ์
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="กรอกชื่อครุภัณฑ์ที่ส่งซ่อม...">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">จำนวน
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="กรอกจำนวน...">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">วันที่
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="กรอกวันที่ส่งซ่อม...">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">อาการเสีย
						:</label>
					<div class="col-sm-8">
						<textarea class="form-control" rows="4"></textarea>
					</div>
				</div>





			</div>

			<div class="col-md-6 form-horizontal">

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">หมายเลขเอกสาร
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="กรอกหมายเลขหมายเลขเอกสารส่งซ่อม...">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">ชื่อร้าน
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="กรอกชื่อร้านที่ส่งซ่อม...">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">เบอร์โทรศัพท์
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="กรอกเบอร์โทรศัพท์ร้านที่ส่งซ่อม...">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">ที่อยู่
						:</label>
					<div class="col-sm-8">
						<textarea class="form-control" rows="5"></textarea>
					</div>
				</div>



			</div>


		</div>
	</div>
	<!-- /.col-lg-8 -->
	<div class="form-group">
		<div for="Inpassword" class="col-sm-5 control-label"></div>
		<div class="col-sm-5">
			<button type="submit" class="btn btn-success">บันทึก</button>
			<button type="reset" class="btn btn-warning">ยกเลิก</button>
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
	<%@include file="/jspFile/footer.jsp"%>