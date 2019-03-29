<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="search_form"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<mt:_layout title="${current_title }">
	<jsp:attribute name="content">

<body class="bg-dark">

	

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">ติดต่อแอดมิน</div>
      <div class="card-body">
        <div class="form-group">
        	<table class="table">
        		<thead>
        			<tr>
        				<th class="text-center">ชื่อ</th>
        				<th class="text-center">เวลาทำการ</th>
        				<th class="text-center">Line id</th>
        				<th class="text-center">เบอร์โทรศัพท์</th>
        			</tr>
        		</thead>
        		<tbody>
        		<c:forEach var="admin_l" varStatus="count" items="${admin_list}">
        			<tr>
        				<td class="text-center">${admin_l.name}</td>
        				<td class="text-center">${admin_l.workTime}</td>
        				<td class="text-center">${admin_l.lineId}</td>
        				<td class="text-center">${admin_l.phone}</td>
        			</tr>
        		</c:forEach>
        		</tbody>
        	</table>
        </div>
      </div>
    </div>
  </div>
  </body>


	</jsp:attribute>
</mt:_layout>