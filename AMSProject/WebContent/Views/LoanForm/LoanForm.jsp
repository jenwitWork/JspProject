<%@ page language="java" contentType="text/html; charset=TIS-620"
	pageEncoding="TIS-620"%>
<%@include file="/jspFile/header.jsp"%>
<div id="page-wrapper">
	<div class="row" style="margin-top: 50px;">
		<div class="col-lg-12">
			<h1 class="page-header"><font color="#337ab7">�������ѳ��</font></h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">

			<div class="row">
				<div class="col-sm-6">
					<div class="form-horizontal">
						<div class="form-group">
							<label for="Inputname" class="col-sm-4 control-label">�Ţ����͡���</label>
							<div class="col-sm-8">
								<input type="text" class="form-control">
							</div>
						</div>


						<div class="form-group">
							<label for="Inputname" class="col-sm-4 control-label">���ͼ�����</label>
							<div class="col-sm-8">
								<input type="text" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">�����˵ء�����</label>
							<div class="col-sm-8">
								<textarea class="form-control" rows="4"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">�ѹ���ӡ������</label>
							<div class="col-sm-7 input-group">
								<input type="text" class="form-control"
									aria-label="Amount (to the nearest dollar)" style = "margin-left:15px"> 
									<span class="input-group-addon">.00</span>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">ʶҹ�</label>
								<div class="col-sm-8"></div>
							</div>

							<div class="col-sm-4"></div>
							<div class="col-sm-4">
								<button type="button" class="btn btn-success">�ѹ�֡</button>
								<button type="button" class="btn btn-warning">¡��ԡ</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="col-sm-5" style="padding-right: 0px">
						<input type="Name" class="form-control"
							placeholder="�����Ţ����ѳ�����ͧ���">
					</div>
					<div class="col-sm-3" style="padding-left: 0px">
						<input type="Name" class="form-control" placeholder="�ӹǹ"
							style="">
					</div>

					<button type="button" class="btn btn-success">����</button>
					<button type="button" class="btn btn-primary">��Ǩ�ͺ</button>

					<div class="col-sm-12">
						<table class="table table-bordered" style = "margin-top:15px">
							<thead>
								<tr>
									<th class="text-center">�ӴѺ</th>
									<th class="text-center">���ͤ���ѳ��</th>
									<th class="text-center">�ӹǹ</th>
									<th class="text-center">�Ѵ���</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-center">xxx</td>
									<td class="text-center">xxx</td>
									<td class="text-center">xxx</td>
									<td class="text-center"><a href="@Url.Action("#"><i
											class="fa fa-edit fa-fw"></i>���</a> | <a href="@Url.Action("#"><i
											class="fa fa-trash fa-fw"></i>ź</a></td>
								</tr>
								<tr>
									<td class="text-center">xxx</td>
									<td class="text-center">xxx</td>
									<td class="text-center">xxx</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-edit fa-fw"></i>���</a> | <a href="#"><i
											class="fa fa-trash fa-fw"></i>ź</a></td>
								</tr>
								<tr>
									<td class="text-center">xxx</td>
									<td class="text-center">xxx</td>
									<td class="text-center">xxx</td>
									<td class="text-center"><a href="#"><i
											class="fa fa-edit fa-fw"></i>���</a> | <a href="#"><i
											class="fa fa-trash fa-fw"></i>ź</a></td>
								</tr>
							</tbody>
						</table>
						</table>
					</div>


				</div>
			</div>





		</div>
		<!-- /.col-lg-8 -->
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->
<%@include file="/jspFile/footer.jsp"%>
