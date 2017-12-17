<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="search_form"
	uri="http://www.springframework.org/tags/form"%>
<mt:_layout title="${current_title }">
	<jsp:attribute name="content">



<!-- page content -->
<div class="right_col" role="main" style="min-height: 1883px;">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h5>Management / ${current_title }</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>${current_title }</h2>
						<div class="clearfix"></div>
					</div>
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<search_form:form action="${root_action}/management/position/list" method="get" modelAttribute="search_form" id="form-search" class="form-inline">
							<div class="form-group">
								<search_form:input path="posId" class="form-control" placeholder="รหัสตำแหน่ง"/>
							</div>
							<div class="form-group">
								<search_form:input path="posDesc" class="form-control" placeholder="รายละเอียด"/>
							</div>
							<button class="btn btn-success" style="margin: 0px;">Search</button>
							<a href="${root_action}/management/position/create" id="btn-create" class="btn btn-primary" style="margin: 0px;">Create</a>
						</search_form:form>
					</div>
					</div>
					<br>
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div id="table-data">
						</div>
					</div>
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
			$('#table-data').html(response);
		});
	});
	
	$('#btn-create').on('click',function(event){
		event.preventDefault();
		$modal = $('.gobal-modal');
		$modal.modal('show');
		$.ajax({
			url : $(this).attr("href"),
			type : 'get'
		}).done(function(response) {
			$modal.find('.modal-content').html(response);
		});
	})
	
</script>





