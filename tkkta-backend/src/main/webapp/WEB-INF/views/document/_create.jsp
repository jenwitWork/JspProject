<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="create_form"
	uri="http://www.springframework.org/tags/form"%>

<mt:_layout title="${current_title }">
	<jsp:attribute name="content">



<!-- page content -->
<div class="right_col" role="main" style="min-height: 1883px;">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h5>${current_title }</h5>
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
							<div class="margin-bottom-50">
								<create_form:form action="${root_action}/document/create" method="post"
									modelAttribute="create_form" class="ng-pristine ng-valid"
									id="form-add" enctype="multipart/form-data">
									<create_form:hidden path="createdUser"
										value="${gobalUser.username}" />
									<input type="hidden" name="detail" id="detail" value="">
									<div class="form-group row">
										<div class="col-md-12 text-right">
											<button type="submit" name="submit"
												class="btn width-150 btn-success">สร้างเอกสาร</button>
											<button type="button" class="btn btn-warning">ยกเลิก</button>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l0">สำหรับสาขา</label>
										</div>
										<div class="col-md-4">
											<create_form:select path="branchId"
												class="form-control input-sm">
												<create_form:option value="">-- สาขา --</create_form:option>
												<c:forEach var="item" items="${branchList}">
													<create_form:option value="${item.branchId}">${item.branchId}</create_form:option>
												</c:forEach>
											</create_form:select>
										</div>
										<div class="col-md-2">
											<label class="form-control-label" for="l0">วันที่สร้างเอกสาร</label>
										</div>
										<div class="col-md-4">
											<create_form:input path="createdDate" value="${now}"
												class="form-control input-sm" disabled="true" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l11">รุ่นรถ</label>
										</div>
										<div class="col-md-4">
											<create_form:select path="serieId"
												class="form-control input-sm">
												<create_form:option value="">-- รุ่นรถ --</create_form:option>
												<c:forEach var="item" items="${csList}">
													<create_form:option value="${item.serieId}">${item.serieTitle}</create_form:option>
												</c:forEach>
											</create_form:select>
										</div>
										<div class="col-md-2">
											<label class="form-control-label" for="l11">แบบรถ</label>
										</div>
										<div class="col-md-4" id="model-rendered">
											<create_form:select class="form-control input-sm" path="cmId">
												<create_form:option value="">-- แบบรถ --</create_form:option>
											</create_form:select>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l11">หมวดปัญหา</label>
										</div>
										<div class="col-md-4">
											<create_form:select class="form-control input-sm"
												path="pbType">
												<create_form:option value="">-- หมวดปัญหา --</create_form:option>
												<c:forEach var="item" items="${pbList}">
													<create_form:option value="${item.pbType}">${item.pbName}</create_form:option>
												</c:forEach>
											</create_form:select>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l11">ชื่อปัญหา
												(ภาษาไทย)</label>
										</div>
										<div class="col-md-10">
											<create_form:input path="caseNameTh"
												class="form-control input-sm" placeholder="" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l11">ชื่อปัญหา
												(ภาษาอังกฤษ)</label>
										</div>
										<div class="col-md-10">
											<create_form:input path="caseNameEn"
												class="form-control input-sm" placeholder="" />
										</div>
									</div>

									<div class="form-group row">
										<div class="col-md-12">
											<label class="form-control-label" for="l16">อธิบายรายละเอียดปัญหา
												,วิธีการ หรือ ขั้นตอนการแก้ปัญหา</label>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-md-12">
											<div id="form-editor"></div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-4">
											<input class="filestyle" data-buttonBefore="true"
												data-buttonName="btn-danger" data-size="sm"
												data-iconName="fa fa-file-pdf-o"
												data-buttonText="เลือกไฟล์ PDF" type="file" name="pdf"
												id="pdf" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-4">
											<input class="filestyle" data-buttonBefore="true"
												data-buttonName="btn-primary" data-size="sm"
												data-iconName="fa fa-picture-o"
												data-buttonText="เลือกไฟล์รูปภาพ" type="file" name="images"
												id="images" accept="image/*" multiple="multiple" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-4">
											<input class="filestyle" data-buttonBefore="true"
												data-buttonName="btn-success" data-size="sm"
												data-iconName="fa fa-video-camera"
												data-buttonText="เลือกไฟล์ VDO" type="file" name="videos"
												id="videos" accept="video/*" />
										</div>
									</div>
								</create_form:form>
							</div>
						</div>
					</div>
					<br>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- /page content -->




</jsp:attribute>
</mt:_layout>









<script type="text/javascript">
	var remoteText = 'ไม่สามารถใช้งานเลขที่เอกสารนี้ได้กรุณากดปุ่ม Gen code';

	$('#new-doc').on('click', function(event) {
		$.ajax({
			type : 'get',
			url : 'utilities/gen-new-doc',
		}).done(function(respond) {
			$('#docNo').val(respond);
			$('#doc_no-error').hide();
		}).error(function(respond) {
			alert(respond);
		})
	})

	$('#serieId').change(function(event) {
		var serie_id = $(this).val();
		$.ajax({
			url : '${root_action}/utilities/model-list',
			type : 'get',
			data : {
				serie_id : serie_id
			}
		}).done(function(data) {
			console.log(data);
			var template = $('#model-template').html();
			Mustache.parse(template); // optional, speeds up future uses
			var rendered = Mustache.render(template, data);
			$('#model-rendered').html(rendered);
		})
	})
	

	$('#form-add').submit(function(event) {
		event.preventDefault();
		if ($('#form-add').valid()) {
			var detail = tinyMCE.activeEditor.getContent();
			$('#detail').val(detail);
			var data = new FormData($('#form-add')[0]);
			$modal = $('#gobal-modal-md');
			$load = $('#saving-md');
			$modal.find('.modal-content').html($load.html());
			$modal.modal({
				backdrop : 'static',
				keyboard : false
			})
			$.ajax({
				type : 'post',
				url : $(this).attr('action'),
				data : data,
				cache : false,
				contentType : false,
				processData : false,
			}).done(function(respons) {
				location.replace("${root_action}/document");
			}).error(function(respons) {

			})
		}
	})

	$('#form-add').validate({ // initialize the plugin
		rules : {
			docNo : {
				required : true,
				remote : {
					type : 'get',
					url : 'utilities/check-dup-doc_no',
					data : {
						doc_no : function() {
							return $('#form-add input[id=docNo]').val();
						}
					}
				}
			},
			serieId : {
				required : true
			},
			cmId : {
				required : true
			},
			pbType : {
				required : true
			},
			caseNameTh : {
				required : true,
				maxlength : 255
			}
		},
		messages : {
			docNo : {
				required : 'กรุณาระบุ แลขที่เอกสาร',
				remote : remoteText
			},
			serieId : {
				required : 'กรุณาระบุ รุ่นรถ'
			},
			cmId : {
				required : 'กรุณาระบุ แบบรถ'
			},
			pbType : {
				required : 'กรุณาระบุ หมวดปัญหา'
			},
			caseNameTh : {
				required : 'กรุณาระบุ  ชื่อปัญหา (ภาษาไทย)',
				maxlength : 'ความยาวต้องไม่เกิน 255 ตัวอักษร'
			}

		}
	})

	tinymce
			.init({
				selector : '#form-editor',
				height : 297,
				theme : 'modern',
				plugins : [
						'advlist autolink lists  charmap print preview hr anchor pagebreak',
						'searchreplace wordcount visualblocks visualchars code fullscreen',
						'insertdatetime  nonbreaking save table contextmenu directionality',
						'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc' ],
				toolbar1 : 'undo redo | insert | styleselect | bold italic underline | table | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | ',
				toolbar2 : 'print preview  | forecolor backcolor | codesample | code',
				image_advtab : true,
				templates : [ {
					title : 'Test template 1',
					content : 'Test 1'
				}, {
					title : 'Test template 2',
					content : 'Test 2'
				} ],
				content_css : [
						'<%=request.getContextPath()%>/resources/tinymce/font-for-tinymce.css',
						'<%=request.getContextPath()%>/resources/tinymce/codepen.min.css' ]
			});
</script>

<script type="text/html" id="model-template">
			<select class="form-control input-sm" id="cmId" name="cmId">
				<option value="">-- รุ่น (Model) --</option>
				{{#.}}
					<option value="{{cmId}}">{{cmId}}</option>
				{{/.}}
			</select>
		</script>
