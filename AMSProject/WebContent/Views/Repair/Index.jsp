<%@ page language="java" contentType="text/html; charset=TIS-620"
	pageEncoding="TIS-620"%>
<%@include file="/jspFile/header.jsp"%>
<div id="page-wrapper">
	<div class="row" style="margin-top: 50px;">
		<div class="col-lg-12">
			<h1 class="page-header">
				<font color="#337ab7">รายงานการซ่อมบำรุง</font>
			</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">


			<div class="row">
				<div class="col-lg-5">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="ค้นหารายการส่งซ่อม ..."> <span
							class="input-group-btn">
							<button class="btn btn-warning" " type="button">ค้นหา</button>
						</span>
					</div>
				</div>
				<div class="col-lg-6">
					<a href="Repair/CreateRepair"><button type="button"
							class="btn btn-success" style="margin-left: -25px">
							<i class="fa fa-plus fa-fw"></i>เพิ่มการส่งซ่อม
						</button></a>
				</div>
			</div>
			<table class="table table-hover" style = "margin-top:20px">
				<thead>
					<tr>
						<th>ลำดับ</th>
						<th>หมายเลขเอกสาร</th>
						<th class="text-center">ชื่อร้าน</th>
						<th class="text-center">ชื่อครุภัณฑ์</th>
						<th class="text-center">วันที่</th>
						<th class="text-center">จัดการ</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>1150</td>
						<td class="text-center">JOJOESHOP</td>
						<td class="text-center">Printer</td>
						<td class="text-center">6/3/2559</td>
						<td class="text-center"><a href="#"> <i
								class="fa fa-search fa-fw"></i>รายละเอียด
						</a> | <a href="#"> <i class="fa fa-edit fa-fw"></i>แก้ไข
						</a> | <a href="#"> <i class="fa fa-trash fa-fw"></i>ลบ
						</a></td>
					</tr>
				<tbody>
					<tr>
						<td>xxx</td>
						<td>xxx</td>
						<td class="text-center">xxx</td>
						<td class="text-center">xxx</td>
						<td class="text-center">xxx</td>
						<td class="text-center"><a href="#"> <i
								class="fa fa-search fa-fw"></i>รายละเอียด
						</a> | <a href="#"> <i class="fa fa-edit fa-fw"></i>แก้ไข
						</a> | <a href="#"> <i class="fa fa-trash fa-fw"></i>ลบ
						</a></td>
					</tr>
			</table>











		</div>
		<!-- /.col-lg-8 -->
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->
<%@include file="/jspFile/footer.jsp"%>
