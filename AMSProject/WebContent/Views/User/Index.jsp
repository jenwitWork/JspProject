<%@ page language="java" contentType="text/html; charset=TIS-620"
	pageEncoding="TIS-620"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/jspFile/header.jsp"%>
<div id="page-wrapper">
	<div class="row" style="margin-top: 50px;">
		<div class="col-lg-12">
			<h1 class="page-header">�����ż����ҹ</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">

			<table class="table table-striped">
				<c:set var="count" value="0" scope="page" />
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th>���ʻ�Шӵ��</th>
						<th>���ͼ����</th>
						<th>���� - ʡ��</th>
						<th class="text-center">���</th>
						<th class="text-center">�Ң��Ԫ�</th>
						<th class="text-center">�Է���</th>
						<th class="text-center">�Ѵ���</th>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="user">
						<c:set var="count" value="${count + 1}" scope="page" />
						<tr>
							<td class="text-center">${count}</td>
							<td>${user.user_code}</td>
							<td>${user.username}</td>
							<td>${user.first_name}${user.last_name}</td>
							<td class="text-center">${user.faculty_id}</td>
							<td class="text-center">${user.department_id}</td>
							<td class="text-center">${user.role}</td>
							<td class="text-center"><a href="#">edit </a>| <a href="#">remove</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>



		</div>
		<!-- /.col-lg-8 -->
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->
<%@include file="/jspFile/footer.jsp"%>