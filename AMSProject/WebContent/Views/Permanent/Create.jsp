<%@ page language="java" contentType="text/html; charset=TIS-620"
	pageEncoding="TIS-620"%>
<%@include file="/jspFile/header.jsp"%>
<div id="page-wrapper">
	<div class="row" style="margin-top: 50px;">
		<div class="col-lg-12">
			<h1 class="page-header">
				<font color="#337ab7">วัสดุถาวร</font>
			</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">

			<form class="form-horizontal">
				<div class="form-group">
					<label for="inputNumberAsset" class="col-sm-2 control-label">หมายเลขครุภัณฑ์</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputNumberAsset">
					</div>
				</div>
				

				
					<div class="form-group">
						<label for="inputNameAsset" class="col-sm-2 control-label">ชื่อครุภัณฑ์</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="inputNameAsset">
						</div>
					</div>

					
						<div class="form-group">
							<label for="inputAmount" class="col-sm-2 control-label">จำนวน</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="inputAmount">
							</div>
						</div>

						
							<div class="form-group">
								<label for="inputUnit" class="col-sm-2 control-label">หน่วยนับ</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="inputUnit">
								</div>
							</div>

							
								<div class="form-group">
									<label for="inputPrice" class="col-sm-2 control-label">ราคาต่อหน่วย</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="inputPrice">
									</div>
								</div>

								
									<div class="form-group">
										<label for="inputLifetime" class="col-sm-2 control-label">อายุการใช้งาน</label>
										<div class="col-sm-5">
											<input type="text" class="form-control" id="inputLifetime">
										</div>
									</div>
									</form>
									<div>
										<div class="col-sm-2"></div>
										<div class="col-sm-5">
											<button type="button" class="btn btn-success">บันทึก</button>
											<button type="button" class="btn btn-danger">ยกเลิก</button>
										</div>
									</div>
		</div>
		<!-- /.col-lg-8 -->
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->
<%@include file="/jspFile/footer.jsp"%>
