<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="view_form"
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
								<view_form:form action="${root_action}/document/edit"
											method="post" modelAttribute="view_form"
											class="ng-pristine ng-valid" id="form-edit"
											enctype="multipart/form-data">
									<view_form:hidden path="createdUser"
												value="${gobalUser.username}" />
									<input type="hidden" name="detail" id="detail" value="">
									<div class="form-group row">
										<div class="col-md-12 text-right">
											<button type="button" class="btn btn-warning">ยกเลิก</button>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l0">เลขที่เอกสาร :</label>
										</div>
										<div class="col-md-4">
											<view_form:label path="docNo">${view_form.docNo}</view_form:label>
										</div>
										<div class="col-md-2 text-right">
											<label class="form-control-label" for="l0">วันที่สร้างเอกสาร :</label>
										</div>
										<div class="col-md-4">
											<view_form:label path="createdDate">${view_form.createdDate}</view_form:label>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l11">รุ่นรถ :</label>
										</div>
										<div class="col-md-4">
											<view_form:label path="serieTitle">${view_form.serieTitle}</view_form:label>
										</div>
										<div class="col-md-2 text-right">
											<label class="form-control-label" for="l11">แบบรถ :</label>
										</div>
										<div class="col-md-4" id="model-rendered">
											<view_form:label path="cmName">${view_form.cmName}</view_form:label>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l11">หมวดปัญหา :</label>
										</div>
										<div class="col-md-4">
											<view_form:label path="pbName">${view_form.pbName}</view_form:label>
										</div>
										<div class="col-md-2 text-right">
											<label class="form-control-label" for="l0">สำหรับสาขา :</label>
										</div>
										<div class="col-md-4">
											<view_form:label path="pbName">${view_form.branchId}</view_form:label>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l11">สถานะ :</label>
										</div>
										<div class="col-md-4">
											<view_form:label class="${view_form.status}" path="status">${view_form.status}</view_form:label>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l11">ชื่อปัญหา (ภาษาไทย) :</label>
										</div>
										<div class="col-md-10">
											<view_form:label path="caseNameTh">${view_form.caseNameTh}</view_form:label>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2">
											<label class="form-control-label" for="l11">ชื่อปัญหา (ภาษาอังกฤษ) :</label>
										</div>
										<div class="col-md-10">
											<view_form:label path="caseNameEn">${view_form.caseNameEn}</view_form:label>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-md-12">
											<label class="form-control-label" for="l16">อธิบายรายละเอียดปัญหา ,วิธีการ หรือ ขั้นตอนการแก้ปัญหา</label>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-md-12">
											<div id="form-editor">${cpd.caseDesc }</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-1">
											<label class="form-control-label" for="l11">File :</label>
										</div>
										<div class="col-md-11">
											<c:if test="${not empty pdf}">
												<a target="_blank" href="${pdf.pdfPath}">${pdf.pdfName}</a>
											</c:if>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-12">
											<div class="app-gallery clearfix">
												<c:forEach var="item" items="${cppList}" varStatus="count">
													<a data-fancybox="gallery" href="${item.imagePath}">
														<img src="${item.imagePath}" class="col-sm-2"
																style="padding: 0px">
													</a>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<c:if test="${not empty vdo}">
											<div id="delete-vdo">
												<div class="col-sm-6 text-left">
													<video width="500" controls>
														<source src="${vdo.videoPath}" type="video/mp4">
													
															</video>
												</div>
											</div>
										</c:if>
									</div>								
								</view_form:form>
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
	function pageLoad() {
		//loadDetail();
		//loadTinyMce();
	}

	tinymce.init({
		selector : '#form-editor',
		height : 297,
		theme : 'modern',
		readonly : 1
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
