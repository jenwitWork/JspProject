<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="true" rtexprvalue="true"%>
<%@ attribute name="content" fragment="true"%>
<%@ attribute name="scripts" fragment="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${current_title }</title>

<link
	href="<%=request.getContextPath()%>/resources/img/favicon.144x144.png"
	rel="apple-touch-icon" type="image/png" sizes="144x144">
<link
	href="<%=request.getContextPath()%>/resources/img/favicon.114x114.png"
	rel="apple-touch-icon" type="image/png" sizes="114x114">
<link
	href="<%=request.getContextPath()%>/resources/img/favicon.72x72.png"
	rel="apple-touch-icon" type="image/png" sizes="72x72">
<link
	href="<%=request.getContextPath()%>/resources/img/favicon.57x57.png"
	rel="apple-touch-icon" type="image/png">
<link href="<%=request.getContextPath()%>/resources/img/favicon.png"
	rel="icon" type="image/png">
<link href="favicon.ico" rel="shortcut icon">

<!-- Bootstrap -->
<link
	href="<%=request.getContextPath()%>/resources/vendors/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/vendors/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="<%=request.getContextPath()%>/resources/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link
	href="<%=request.getContextPath()%>/resources/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="<%=request.getContextPath()%>/resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="<%=request.getContextPath()%>/resources/vendors/jqvmap/jqvmap.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="<%=request.getContextPath()%>/resources/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Datatables -->
<link
	href="<%=request.getContextPath()%>/resources/vendors/datatables.net-bs/css/dataTables.bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.css"
	rel="stylesheet">
<!-- jQuery custom content scroller -->
<link
	href="<%=request.getContextPath()%>/resources/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css"
	rel="stylesheet" />


<link rel="stylesheet" type="text/css" id="u0"
	href="<%=request.getContextPath()%>/resources/tinymce/js/tinymce/skins/lightgray/skin.min.css">


<!-- Custom Theme Style -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/custom.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fancybox-master/assets/jquery.fancybox.min.css" />



</head>

<body class="${menu_toggle}" onload="loader()">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col menu_fixed">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="dashboard" class="site_title"><i class="fa fa-paw"></i>
							<span>TKK Frontend</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img
								src="<%=request.getContextPath()%>/resources/images/logo.jpg"
								alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2>${gobalUser.username }</h2>
						</div>
						<div class="clearfix"></div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>General</h3>
							<ul class="nav side-menu">
								<li><a href="<%=request.getContextPath()%>/dashboard"><i
										class="fa fa-dashboard"></i> Dashboard</a></li>
								<li
									class="${current_action == 'document' ? 'current-page' : '' }"><a
									href="<%=request.getContextPath()%>/document"><i
										class="fa fa-edit"></i> ปัญหาเทคนิค </a></li>
							</ul>
						</div>
						<div class="menu_section">
							<h3>Cars</h3>
							<ul class="nav side-menu">
								<li
									class="${current_action == 'car-serie' ? 'current-page' : '' }"><a
									href="<%=request.getContextPath()%>/car-serie"><i
										class="fa fa-truck"></i> รุ่นรถ</a></li>
								<li
									class="${current_action == 'car-model' ? 'current-page' : '' }"><a
									href="<%=request.getContextPath()%>/car-model?serie_id="><i
										class="fa fa-car"></i> แบบรถ</a></li>
							</ul>
						</div>
						<div class="menu_section">
							<h3>Management</h3>
							<ul class="nav side-menu">
								<li class="${current_action == 'users' ? 'current-page' : '' }"><a
									href="<%=request.getContextPath()%>/management/users"><i
										class="fa fa-users"></i> ผู้ใช้งานทั้งหมด </a></li>
								<li><a
									href="<%=request.getContextPath()%>/management/branch"><i
										class="fa fa-bank"></i> สาขา </a></li>
							</ul>
						</div>


					</div>
					<!-- /sidebar menu -->
				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img src="images/img.jpg" alt="">${gobalUser.username }
									<span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"><i
											class="fa fa-user pull-right"></i> Profile</a></li>
									<li><a href="javascript:;"> <span
											class="badge bg-red pull-right">50%</span> <span>Settings</span>
									</a></li>
									<li><a href="javascript:;"><i
											class="fa fa-gear pull-right"></i> Administrator</a></li>
									<li><a href="<%=request.getContextPath()%>/logout"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul></li>
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img src="images/img.jpg" alt="">${current_branch }
									<span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<c:forEach var="item" items="${allow_branch}">
										<li><a
											href="${root_action}/utilities/change-branch?branch_id=${item.branchId}"
											class="btn-change-branch"><i
												class="${item.branchId == gobalUser.branchId ? 'fa fa-user pull-right' : '' }"></i>
												${item.branchId}</a></li>
									</c:forEach>
								</ul></li>

							<li role="presentation" class="dropdown"><a
								href="javascript:;" class="dropdown-toggle info-number"
								data-toggle="dropdown" aria-expanded="false"> <i
									class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
							</a>
								<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
									role="menu">
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li>
										<div class="text-center">
											<a> <strong>See All Alerts</strong> <i
												class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<jsp:invoke fragment="content"></jsp:invoke>

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/jquery/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/jquery-validation/jquery.validate.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/bootstrap/js/bootstrap.js"></script>
	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath()%>/resources/mustache-master/mustache.min.js"></script>
	<!-- FastClick -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/jquery-mousewheel/jquery.mousewheel.min.js"></script>

	<script
		src="<%=request.getContextPath()%>/resources/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/Chart.js/Chart.js"></script>
	<!-- gauge.js -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/gauge.js/gauge.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/bootstrap-progressbar/bootstrap-progressbar.js"></script>
	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/iCheck/icheck.js"></script>
	<!-- Skycons -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/Flot/jquery.flot.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/Flot/jquery.flot.pie.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/Flot/jquery.flot.time.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/Flot/jquery.flot.stack.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/flot-spline/js/jquery.flot.spline.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/DateJS/assets/date.js"></script>
	<!-- JQVMap -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/jqvmap/jquery.vmap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/jqvmap/maps/jquery.vmap.world.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/moment/min/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Datatables -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net/js/jquery.dataTables.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-bs/js/dataTables.bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-buttons/js/dataTables.buttons.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-buttons/js/buttons.flash.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-buttons/js/buttons.html5.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-buttons/js/buttons.print.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-keytable/js/dataTables.keyTable.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-responsive/js/dataTables.responsive.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/datatables.net-scroller/js/dataTables.scroller.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/jszip/jszip.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/pdfmake/assets/pdfmake.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendors/pdfmake/assets/vfs_fonts.js"></script>
	<!-- jQuery custom content scroller -->
	<script
		src="<%=request.getContextPath()%>/resources/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

	<script
		src="<%=request.getContextPath()%>/resources/tinymce/js/tinymce/tinymce.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/custom.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap-filestyle/src/bootstrap-filestyle.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/fancybox-master/assets/jquery.fancybox.min.js"></script>






	<script type="text/javascript">
		function loader() {
			pageLoad();
		}
		$('#menu_toggle').on('click', function(event) {
			var toggle = $('body').attr('class');
			$.ajax({
				method : 'get',
				url : '${root_action}/utilities/menu-toggle',
				data : {
					menu_toggle : toggle
				}
			}).done(function(response) {
			});
		})

		$('.btn-change-branch').on('click', function(event) {
			event.preventDefault();
			$.ajax({
				url : $(this).attr('href'),
				type : 'get'
			}).done(function(response) {
				location.replace("${root_action}/document");
			})
		})
	</script>

	<!-- Modal -->
	<div class="modal fade gobal-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="row text-center">
					<img alt=""
						src="<%=request.getContextPath()%>/resources/img/loading/loading_md.gif">
				</div>
			</div>
		</div>
	</div>

	<!-- Large modal -->
	<div class="modal fade gobal-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="row text-center">
					<img alt=""
						src="<%=request.getContextPath()%>/resources/img/loading/loading_lg.gif">
				</div>
			</div>
		</div>
	</div>

	<!-- Small modal -->
	<div class="modal fade gobal-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="row text-center">
					<img alt=""
						src="<%=request.getContextPath()%>/resources/img/loading/loading_sm.gif">
				</div>
			</div>
		</div>
	</div>


</body>
</html>
