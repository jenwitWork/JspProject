<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="search_form"
	uri="http://www.springframework.org/tags/form"%>
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
				<search_form:form id="form-search" action="handheld-lotus/list"
								modelAttribute="search_form" method="get">
					<div class="x_title">
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
						</ul>
							<div class="form-inline">
								<div class="form-group">
									<search_form:input path="assetNo" class="form-control"
												placeholder="Asset No." />
								</div>
								<div class="form-group">
									<search_form:input path="serialNo" class="form-control"
												placeholder="Serial no." />
								</div>
								<button style="margin-bottom: 0px" type="submit"
											class="btn btn-primary">Filter</button>
								<button style="margin-bottom: 0px" type="reset"
											class="btn btn-success">Reset</button>
								<a href="handheld-lotus/create" id="btn-create"
											class="btn btn-default" style="margin-bottom: 0px">Create</a>
							</div>
						<div class="clearfix"></div>
					</div>
					<div class="x_content" style="display: none;">
						<div class="form-inline">
							<div class="form-group">
								<search_form:input path="ipAddress" class="form-control"
												placeholder="IP Address." />
							</div>
							<div class="form-group">
								<search_form:select path="model" class="form-control">
									<search_form:option value="">-- select model --</search_form:option>
									<search_form:option value="MC3190">MC3190</search_form:option>
									<search_form:option value="MC32N0">MC32N0</search_form:option>
									<search_form:option value="MC9190">MC9190</search_form:option>
								</search_form:select>
							</div>
							<div class="form-group">
								<search_form:select path="status" class="form-control">
									<search_form:option value="">-- select status --</search_form:option>
									<search_form:option value="Using" class="Using">Using</search_form:option>
									<search_form:option value="Repairing" class="Repairing">Repairing</search_form:option>									
									<search_form:option value="RHS" class="RHS">RHS (Repair have spare)</search_form:option>
									<search_form:option value="WSR" class="WSR">WSR (Wait spare return)</search_form:option>
								</search_form:select>
							</div>
						</div>
					</div>
					</search_form:form>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_content">
						<div id="table-search"></div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /page content -->

</jsp:attribute>
</mt:_layout>



<script type="text/javascript">
	function pageLoad() {
		$('#form-search').submit();
	}

	$('#form-search').on('submit', function(event) {
		event.preventDefault();
		$.ajax({
			url : $(this).attr("action"),
			type : 'get',
			data : $(this).serialize()
		}).done(function(response) {
			$('#table-search').html(response);
		});
	});
	
	$('select').on('change', function() {
		$('#form-search').submit();
	})

	$('#btn-create').on('click', function(event) {
		event.preventDefault();
		$.ajax({
			url : $(this).attr("href"),
			type : 'get'
		}).done(function(response) {
			$modal = $('.gobal-modal');
			$modal.find('.modal-content').html(response);
			$modal.modal('show');
		});
	});
</script>














