<%@ page language="java" contentType="text/html; charset=TIS-620"
	pageEncoding="TIS-620"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>AMS</title>
<%@include file="/jspFile/styleSheet.jsp"%>

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html"><font size="5" color="#337ab7">Asset Management System</font></a>
		</div>
		<!-- /.navbar-header -->



		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><a href="<%=request.getContextPath()%>/Permanent"><i class="fa fa-desktop"></i>
							วัสดุถาวร</a> <!-- /.nav-second-level --></li>
					<li><a href="<%=request.getContextPath()%>/Consumable"><i class="fa fa-pencil-square fa-fw"></i>
							วัสดุสิ้นเปลือง</a></li>
					<li><a href="<%=request.getContextPath()%>/LoanForm"><i class="fa fa-edit fa-fw"></i>
							ยืมครุภัณฑ์</a></li>
					<li><a href="<%=request.getContextPath()%>/Disbursement"><i class="fa fa-wrench fa-fw"></i> เบิกครุภัณฑ์</a> <!-- /.nav-second-level --></li>
					<li><a href="<%=request.getContextPath()%>/Repair"><i class="fa fa-wrench fa-fw"></i>ซ่อมบำรุง</a> <!-- /.nav-second-level --></li>
					<li><a href="#"><i class="fa fa-print fa-fw"></i> ปริ๊นรายงาน</a> <!-- /.nav-second-level --></li>
					<li><a href="<%=request.getContextPath()%>/Account"><i class="fa fa-user fa-fw"></i> ข้อมูลผู้ใช้</a> <!-- /.nav-second-level --></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		</nav>