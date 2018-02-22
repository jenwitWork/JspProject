<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
							<form:form id="form-search" action="${root_action}/management/users/list" method="get"
								modelAttribute="search_user" class="form-inline">
								<div class="form-group">
									<form:input path="username" class="form-control input-sm"
										placeholder="Username" />
								</div>
								<div class="form-group">
									<form:input path="name" class="form-control input-sm"
										placeholder="Name" />
								</div>
								<div class="form-group">
									<form:input path="branchId" class="form-control input-sm"
										placeholder="branchId" />
								</div>
								<div class="form-group">
									<form:select path="posId" class="form-control input-sm">
										<form:option value="">-- Position --</form:option>
										<c:forEach var="item" items="${posList}">
											<form:option value="${item.posId }">${item.posId }</form:option>
										</c:forEach>
									</form:select>
								</div>
								<div class="form-group">
									<form:select path="groupId" class="form-control input-sm">
										<form:option value="">-- User Group --</form:option>
										<form:option value="Administrator">Administrator</form:option>
										<form:option value="User">User</form:option>
									</form:select>
								</div>
								<div class="form-group">
									<form:select path="status" class="form-control input-sm">
										<form:option value="">-- Status --</form:option>
										<form:option value="active">active</form:option>
										<form:option value="deactive">deactive</form:option>
									</form:select>
								</div>
								<button type="submit" class="btn btn-success btn-sm"
									style="margin: 0px;">Search</button>
								<a href="${root_action}/management/users/add" class="btn btn-primary btn-sm" id="btn-create"
									style="margin: 0px;">Create</a>
							</form:form>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div id="table-data"></div>
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

	$('#form-search select').change(function(event) {
		$('#form-search').submit();
	})
	
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










