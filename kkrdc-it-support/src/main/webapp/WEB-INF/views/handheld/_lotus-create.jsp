<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="create_form"
	uri="http://www.springframework.org/tags/form"%>
<create_form:form id="form-create" action="handheld-lotus/create"
	modelAttribute="create_form" method="post">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h5 class="modal-title" id="exampleModalLabel">Create Handheld</h5>
	</div>
	<div class="modal-body">
		<div class="form-horizontal form-label-left">
			<input type="hidden" name="old_serialNo" id="old_serialNo" value="">
			<div class="form-group row">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">serial
					no.</label>
				<div class="col-md-7 col-sm-7 col-xs-12">
					<create_form:input path="serialNo" class="form-control"
						placeholder="serial no." value="" />
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">asset
					no.</label>
				<div class="col-md-7 col-sm-7 col-xs-12">
					<create_form:input path="assetNo" class="form-control"
						placeholder="asset no." />
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">asset
					type</label>
				<div class="col-md-7 col-sm-7 col-xs-12">
					<create_form:select path="assetType" class="form-control">
						<create_form:option value="">-- select asset type --</create_form:option>
						<create_form:option value="lotus">Lotus</create_form:option>
						<create_form:option value="spare">Spare</create_form:option>
					</create_form:select>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">model</label>
				<div class="col-md-7 col-sm-7 col-xs-12">
					<create_form:select path="model" class="form-control">
						<create_form:option value="">-- select model --</create_form:option>
						<create_form:option value="MC3190">MC3190</create_form:option>
						<create_form:option value="MC32N0">MC32N0</create_form:option>
						<create_form:option value="MC9190">MC9190</create_form:option>
					</create_form:select>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">IP
					address</label>
				<div class="col-md-7 col-sm-7 col-xs-12">
					<create_form:input path="ipAddress" class="form-control"
						placeholder="IP Address" />
				</div>
			</div>
			<div class="form-group row">
				<label
					class="control-label col-md-3 control-label col-md-3 col-sm-3 col-xs-12 col-xs-12">status</label>
				<div class="col-md-7 col-sm-7 col-xs-12">
					<create_form:select path="status" class="form-control">
						<create_form:option value="">-- select status --</create_form:option>
						<create_form:option value="Using" class="Using">Using</create_form:option>
						<create_form:option value="Repairing" class="Repairing">Repairing</create_form:option>
						<create_form:option value="RHS" class="RHS">RHS (Repair have spare)</create_form:option>
						<create_form:option value="WSR" class="WSR">WSR (Wait spare return)</create_form:option>
					</create_form:select>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">input
					date</label>
				<div class="col-md-7 col-sm-7 col-xs-12 datepicker">
					<div class='input-group date' id='datetimepicker1'>
						<input type="text" name="input_date" id="input_date" class="form-control" value="${edit_form.inputDate}">						
						<span class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">remark</label>
				<div class="col-md-7 col-sm-7 col-xs-12">
					<create_form:textarea path="remark" class="form-control"
						placeholder="remark" />
				</div>
			</div>
		</div>
	</div>
	<create_form:input path="createdUser" type="hidden"
		value="${gobalUser.username}" />
	<create_form:input path="updatedUser" type="hidden"
		value="${gobalUser.username}" />
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="submit" class="btn btn-primary">Save changes</button>
	</div>
</create_form:form>

<script type="text/javascript">
	$('#datetimepicker1').datetimepicker({
		format : 'DD/MM/YYYY HH:mm:ss',
		defaultDate : new Date(),
	});

	$('#input_date').datetimepicker({
		format : 'DD/MM/YYYY HH:mm:ss',
	});
	
	$('#form-create').on('submit', function(event) {
		alert($(this).find('input[name=serialNo]').val());
		event.preventDefault();
		if ($(this).valid()) {
			$.ajax({
				url : $(this).attr("action"),
				type : 'post',
				data : $(this).serialize()
			}).done(function(response) {
				$('button[class=close]').click();
				$('#form-search').submit();
			});
		}
	});

	$('#form-create').validate({
		rules : {
			serialNo : {
				required : true,
				maxlength : 20,
				remote : {
					type : 'get',
					url : 'handheld-lotus/check-dup',
					data : {
						serialNo : function() {
							return $('input[name=serialNo]').val();
						}
					}
				}
			},
			assetNo : {
				required : true,
				maxlength : 50
			},
			assetType : {
				required : true
			},
			model : {
				required : true
			},
			ipAddress : {
				maxlength : 15
			},
			status : {
				required : true
			},
			remark : {
				maxlength : 200
			}
		}
	});
</script>