<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="search_form"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<mt:_layout title="${current_title }">
	<jsp:attribute name="content">
		  <form:form>
		  	<h1>กรุณาเข้าสู่ระบบ</h1>
						<div class="col-sm-12">
							<input class="form-control" placeholder="Username" />
						</div>
						<div class="col-sm-12">
							<input type="password" class="form-control"
					placeholder="Password" />
						</div>
						<div class="col-sm-12">
							<button type="submit" class="btn btn-primary">เข้าสู่ระบบ</button>
						</div>

						<div class="clearfix"></div>

						<div class="separator">

							<div class="clearfix"></div>
							<br />
						</div>
		  </form:form>
	</jsp:attribute>
</mt:_layout>
