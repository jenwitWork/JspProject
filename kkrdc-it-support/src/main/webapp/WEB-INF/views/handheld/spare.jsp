<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:_layout title="${current_title }">
	<jsp:attribute name="content">

<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>${current_title }</h3>
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
						</ul>
						<form action="">
							<div class="form-inline">
								<div class="form-group">
									<input class="form-control" placeholder="Asset No.">
								</div>
								<div class="form-group">
									<input class="form-control" type="text"
												placeholder="Serial no.">
								</div>
								<button style="margin-bottom: 0px" type="submit"
											class="btn btn-primary">Filter</button>
								<button style="margin-bottom: 0px" type="reset"
											class="btn btn-success">Reset</button>
							</div>
						</form>

						<div class="clearfix"></div>
					</div>
					<div class="x_content" style="display: none;">
						<div class="form-inline">
							<div class="form-group">
								<input class="form-control" type="text"
											placeholder="IP Address.">
							</div>
							<div class="form-group">
								<select class="form-control">
									<option>Model</option>
									<option>MC3190</option>
									<option>MC32N0</option>
									<option>MC9190</option>
								</select>
							</div>
							<div class="form-group">
								<select class="form-control">
									<option>Status</option>
									<option>Using</option>
									<option>Repairing</option>
									<option>MC9190</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
				<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_content">
					Table
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /page content -->



</jsp:attribute>
</mt:_layout>













