<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="true" rtexprvalue="true"%>
<%@ attribute name="content" fragment="true"%>
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


<!-- Bootstrap -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jqvmap/dist/jqvmap.css"
	rel="stylesheet" />
<!-- bootstrap-datepicker -->
<link
	href="<%=request.getContextPath()%>/resources/bootstrap-datetimepicker-master/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">

<!-- Datatables -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-bs/css/dataTables.bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="<%=request.getContextPath()%>/resources/gentelella-master/build/css/custom.css"
	rel="stylesheet">
</head>

<body class="${menu_toggle}" onload="loader()">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="dashboard" class="site_title"><i class="fa fa-paw"></i>
							<span>KKRDC IT Support</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img
								src="<%=request.getContextPath()%>/resources/gentelella-master/images/logo.jpg"
								alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2>${gobalUser.username}</h2>
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
								<li><a href="dashboard"><i class="fa fa-dashboard"></i>
										Dashboard</a>
								<li><a><i class="fa fa-edit"></i> Forms <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="form.html">Handheld Repairing</a></li>
										<li><a href="form_advanced.html">Computer Repairing</a></li>
										<li><a href="form_validation.html">Printer Repairing</a></li>
									</ul></li>
								<li><a><i class="fa fa-desktop"></i> Computer <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="general_elements.html">Lotus</a></li>
										<li><a href="media_gallery.html">Spare</a></li>
									</ul></li>
								<li><a><i class="fa fa-calculator"></i> Handheld <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="handheld-lotus">Lotus</a></li>
										<li><a href="handheld-spare">Spare</a></li>
									</ul></li>
								<li><a><i class="fa fa-print"></i> Printer <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="chartjs.html">Chart JS</a></li>
										<li><a href="chartjs2.html">Chart JS2</a></li>
										<li><a href="morisjs.html">Moris JS</a></li>
										<li><a href="echarts.html">ECharts</a></li>
										<li><a href="other_charts.html">Other Charts</a></li>
									</ul></li>
								<li><a><i class="fa fa-clone"></i>Others <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="fixed_sidebar.html">Fixed Sidebar</a></li>
										<li><a href="fixed_footer.html">Fixed Footer</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Adminstrator">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="logout"> <span class="glyphicon glyphicon-off"
							aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
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
								aria-expanded="false"> <img src="images/img.jpg" alt="">John
									Doe <span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;"> <span
											class="badge bg-red pull-right">50%</span> <span>Settings</span>
									</a></li>
									<li><a href="javascript:;">Help</a></li>
									<li><a href="logout"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a></li>
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


	<!-- Modal -->
	<div class="modal fade gobal-modal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="text-center">
					<img alt="" src="resources/images/loading/Ellipsis.gif">
				</div>
			</div>
		</div>
	</div>

	<!-- Large modal -->
	<div class="modal fade gobal-modal-lg" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="text-center">
					<img alt="" src="resources/images/loading/Ellipsis.gif">
				</div>
			</div>
		</div>
	</div>

	<!-- Small modal -->
	<div class="modal fade gobal-modal-sm" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="text-center">
					<img alt="" src="resources/images/loading/Ellipsis.gif">
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jquery/dist/jquery.min.js"></script>
	<!-- jQuery Validate -->
	<script
		src="<%=request.getContextPath()%>/resources/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.pie.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.time.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.stack.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- moment Js -->
	<script
		src="<%=request.getContextPath()%>/resources/moment-develop/moment.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap-datetimepicker-master/src/js/bootstrap-datetimepicker.js"></script>
	<!-- DateJS -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>


	<!-- Datatables -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/jszip/dist/jszip.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/vendors/pdfmake/build/vfs_fonts.js"></script>
	<!-- Custom Theme Scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/gentelella-master/build/js/custom.min.js"></script>

	<script type="text/javascript">
		function loader() {
			pageLoad();
		}

		$('#menu_toggle').on('click', function(event) {
			var toggle = $('body').attr('class');
			$.ajax({
				method : 'get',
				url : 'utilities/menu-toggle?menu_toggle=' + toggle
			}).done(function(response) {
				//alert(response);
			});
		})
	</script>


</body>
</html>
