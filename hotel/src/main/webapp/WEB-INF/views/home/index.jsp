<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clean UI Admin Template</title>

<link href="static/assets/common/img/favicon.144x144.png"
	rel="apple-touch-icon" type="image/png" sizes="144x144">
<link href="static/assets/common/img/favicon.114x114.png"
	rel="apple-touch-icon" type="image/png" sizes="114x114">
<link href="static/assets/common/img/favicon.72x72.png"
	rel="apple-touch-icon" type="image/png" sizes="72x72">
<link href="static/assets/common/img/favicon.57x57.png"
	rel="apple-touch-icon" type="image/png">
<link href="static/assets/common/img/favicon.png" rel="icon"
	type="image/png">
<link href="favicon.ico" rel="shortcut icon">

<!-- HTML5 shim and Respond.js for < IE9 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Vendors Styles -->
<!-- v1.0.0 -->
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/jscrollpane/style/jquery.jscrollpane.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/ladda/dist/ladda-themeless.min.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/cleanhtmlaudioplayer/src/player.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/cleanhtmlvideoplayer/src/player.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/bootstrap-sweetalert/dist/sweetalert.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/summernote/dist/summernote.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/owl.carousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/ionrangeslider/css/ion.rangeSlider.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/datatables/media/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/c3/c3.min.css">
<link rel="stylesheet" type="text/css"
	href="static/assets/vendors/chartist/dist/chartist.min.css">

<!-- Clean UI Styles -->
<link rel="stylesheet" type="text/css"
	href="static/assets/common/css/source/main.css">

<!-- Vendors Scripts -->
<!-- v1.0.0 -->
<script src="static/assets/vendors/jquery/jquery.min.js"></script>
<script src="static/assets/vendors/tether/dist/js/tether.min.js"></script>
<script src="static/assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script
	src="static/assets/vendors/jquery-mousewheel/jquery.mousewheel.min.js"></script>
<script
	src="static/assets/vendors/jscrollpane/script/jquery.jscrollpane.min.js"></script>
<script src="static/assets/vendors/spin.js/spin.js"></script>
<style type="text/css"></style>
<script src="static/assets/vendors/ladda/dist/ladda.min.js"></script>
<script src="static/assets/vendors/select2/dist/js/select2.full.min.js"></script>
<script
	src="static/assets/vendors/html5-form-validation/dist/jquery.validation.min.js"></script>
<script
	src="static/assets/vendors/jquery-typeahead/dist/jquery.typeahead.min.js"></script>
<script
	src="static/assets/vendors/jquery-mask-plugin/dist/jquery.mask.min.js"></script>
<script src="static/assets/vendors/autosize/dist/autosize.min.js"></script>
<script
	src="static/assets/vendors/bootstrap-show-password/bootstrap-show-password.min.js"></script>
<script src="static/assets/vendors/moment/min/moment.min.js"></script>
<script
	src="static/assets/vendors/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script
	src="static/assets/vendors/fullcalendar/dist/fullcalendar.min.js"></script>
<script
	src="static/assets/vendors/cleanhtmlaudioplayer/src/jquery.cleanaudioplayer.js"></script>
<script
	src="static/assets/vendors/cleanhtmlvideoplayer/src/jquery.cleanvideoplayer.js"></script>
<script
	src="static/assets/vendors/bootstrap-sweetalert/dist/sweetalert.min.js"></script>
<script
	src="static/assets/vendors/remarkable-bootstrap-notify/dist/bootstrap-notify.min.js"></script>
<script src="static/assets/vendors/summernote/dist/summernote.min.js"></script>
<script
	src="static/assets/vendors/owl.carousel/dist/owl.carousel.min.js"></script>
<script
	src="static/assets/vendors/ionrangeslider/js/ion.rangeSlider.min.js"></script>
<script src="static/assets/vendors/nestable/jquery.nestable.js"></script>
<script
	src="static/assets/vendors/datatables/media/js/jquery.dataTables.min.js"></script>
<script
	src="static/assets/vendors/datatables/media/js/dataTables.bootstrap4.min.js"></script>
<script
	src="static/assets/vendors/datatables-fixedcolumns/js/dataTables.fixedColumns.js"></script>
<script
	src="static/assets/vendors/datatables-responsive/js/dataTables.responsive.js"></script>
<script
	src="static/assets/vendors/editable-table/mindmup-editabletable.js"></script>
<script src="static/assets/vendors/d3/d3.min.js"></script>
<script src="static/assets/vendors/c3/c3.min.js"></script>
<script src="static/assets/vendors/chartist/dist/chartist.min.js"></script>
<script src="static/assets/vendors/peity/jquery.peity.min.js"></script>
<!-- v1.0.1 -->
<script
	src="static/assets/vendors/chartist-plugin-tooltip/dist/chartist-plugin-tooltip.min.js"></script>
<!-- v1.1.1 -->
<script src="static/assets/vendors/gsap/src/minified/TweenMax.min.js"></script>
<script src="static/assets/vendors/hackertyper/hackertyper.js"></script>
<script src="static/assets/vendors/jquery-countTo/jquery.countTo.js"></script>

<!-- Clean UI Scripts -->
<script src="static/assets/common/js/common.js"></script>
<script src="static/assets/common/js/demo.temp.js"></script>
</head>
<body class="theme-default">
	<nav class="left-menu" left-menu>
	<div class="logo-container">
		<a href="index.html" class="logo"> <img
			src="static/assets/common/img/logo.png" alt="Clean UI Admin Template" />
			<img class="logo-inverse"
			src="static/assets/common/img/logo-inverse.png"
			alt="Clean UI Admin Template" />
		</a>
	</div>
	<div class="left-menu-inner scroll-pane">
		<ul class="left-menu-list left-menu-list-root list-unstyled">
			<li class="left-menu-list-submenu"><a class="left-menu-link"
				href="javascript: void(0);"> <i
					class="left-menu-link-icon icmn-cog util-spin-delayed-pseudo">
						<!-- -->
				</i> <span class="menu-top-hidden">Theme</span> Settings
			</a>
				<ul class="left-menu-list list-unstyled">
					<li>
						<div class="left-menu-item">
							<div class="left-menu-block">
								<div class="left-menu-block-item">
									<small>This menu gives possibility to construct custom
										blocks with any widgets, components and elements inside, like
										this theme settings</small>
								</div>
								<div class="left-menu-block-item">
									<span class="font-weight-600">Theme Style:</span>
								</div>
								<div class="left-menu-block-item" id="options-theme">
									<div class="btn-group btn-group-justified"
										data-toggle="buttons">
										<div class="btn-group">
											<label class="btn btn-default active"> <input
												type="radio" name="options-theme" value="theme-default"
												autocomplete="off" checked=""> Light
											</label>
										</div>
										<div class="btn-group">
											<label class="btn btn-default"> <input type="radio"
												name="options-theme" value="theme-dark" autocomplete="off">
												Dark
											</label>
										</div>
									</div>
									<div class="btn-group btn-group-justified"
										data-toggle="buttons">
										<div class="btn-group">
											<label class="btn btn-default"> <input type="radio"
												name="options-theme" value="theme-green" autocomplete="off">
												Green
											</label>
										</div>
										<div class="btn-group">
											<label class="btn btn-default"> <input type="radio"
												name="options-theme" value="theme-blue" autocomplete="off">
												Blue
											</label>
										</div>
									</div>
									<div class="btn-group btn-group-justified"
										data-toggle="buttons">
										<div class="btn-group">
											<label class="btn btn-default"> <input type="radio"
												name="options-theme" value="theme-red" autocomplete="off">
												Red
											</label>
										</div>
										<div class="btn-group">
											<label class="btn btn-default"> <input type="radio"
												name="options-theme" value="theme-orange" autocomplete="off">
												Orange
											</label>
										</div>
									</div>
								</div>
								<div class="left-menu-block-item">
									<span class="font-weight-600">Fixed Top Menu</sup>:
									</span>
								</div>
								<div class="left-menu-block-item" id="options-menu">
									<div class="btn-group btn-group-justified"
										data-toggle="buttons">
										<div class="btn-group">
											<label class="btn btn-default active"> <input
												type="radio" name="options-menu" value="menu-fixed"
												checked=""> On
											</label>
										</div>
										<div class="btn-group">
											<label class="btn btn-default"> <input type="radio"
												name="options-menu" value="menu-static"> Off
											</label>
										</div>
									</div>
								</div>
								<div class="left-menu-block-item">
									<span class="font-weight-600">Super Clean Mode:</span>
								</div>
								<div class="left-menu-block-item" id="options-mode">
									<div class="btn-group btn-group-justified"
										data-toggle="buttons">
										<div class="btn-group">
											<label class="btn btn-default active"> <input
												type="radio" name="options-mode" value="mode-superclean"
												checked=""> On
											</label>
										</div>
										<div class="btn-group">
											<label class="btn btn-default"> <input type="radio"
												name="options-mode" value="mode-default"> Off
											</label>
										</div>
									</div>
								</div>
								<div class="left-menu-block-item">
									<span class="font-weight-600">Colorful Menu:</span>
								</div>
								<div class="left-menu-block-item" id="options-colorful">
									<div class="btn-group btn-group-justified"
										data-toggle="buttons">
										<div class="btn-group">
											<label class="btn btn-default active"> <input
												type="radio" name="options-colorful"
												value="colorful-enabled" checked=""> On
											</label>
										</div>
										<div class="btn-group">
											<label class="btn btn-default"> <input type="radio"
												name="options-colorful" value="colorful-disabled">
												Off
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul></li>
			<li><a class="left-menu-link" href="documentation.html"> <i
					class="left-menu-link-icon icmn-books"> <!-- -->
				</i> Documentation
			</a></li>
			<li class="left-menu-list-separator ">
				<!-- -->
			</li>
			<li class="left-menu-list-active"><a class="left-menu-link"
				href="index.html"> <i class="left-menu-link-icon icmn-home2">
						<!-- -->
				</i> <span class="menu-top-hidden">Dashboard</span> Alpha
			</a></li>
			<li><a class="left-menu-link" href="dashboards-beta.html"> <i
					class="left-menu-link-icon icmn-home2"> <!-- -->
				</i> <span class="menu-top-hidden">Dashboard</span> Beta
			</a></li>
			<li class="left-menu-list-separator">
				<!-- -->
			</li>
			<li class="left-menu-list-submenu"><a class="left-menu-link"
				href="javascript: void(0);"> <i
					class="left-menu-link-icon icmn-files-empty2"> <!-- -->
				</i> Pages
			</a>
				<ul class="left-menu-list list-unstyled">
					<li><a class="left-menu-link" href="pages-login.html">
							Login </a></li>
					<li><a class="left-menu-link" href="pages-register.html">
							Register </a></li>
					<li><a class="left-menu-link" href="pages-lockscreen.html">
							Lockscreen </a></li>
					<li><a class="left-menu-link" href="pages-pricing-tables.html">
							Pricing Tables </a></li>
					<li><a class="left-menu-link" href="pages-invoice.html">
							Invoice </a></li>
					<li><a class="left-menu-link" href="pages-page-404.html">
							Page 404 </a></li>
					<li><a class="left-menu-link" href="pages-page-500.html">
							Page 500 </a></li>
				</ul></li>
			<li class="left-menu-list-separator">
				<!-- -->
			</li>
			<li class="left-menu-list-submenu"><a class="left-menu-link"
				href="javascript: void(0);"> Forms </a>
				<ul class="left-menu-list list-unstyled">
					<li><a class="left-menu-link"
						href="forms-basic-form-elements.html"> Basic Form Elements </a></li>
					<li><a class="left-menu-link" href="forms-buttons.html">
							Buttons </a></li>
					<li><a class="left-menu-link" href="forms-dropdowns.html">
							Dropdowns </a></li>
					<li><a class="left-menu-link" href="forms-selectboxes.html">
							Selectboxes </a></li>
					<li><a class="left-menu-link"
						href="forms-checkboxes-radio.html"> Checkboxes / Radio </a></li>
					<li><a class="left-menu-link"
						href="forms-form-validation.html"> Form Validation </a></li>
					<li><a class="left-menu-link" href="forms-autocomplete.html">
							Autocomplete </a></li>
					<li><a class="left-menu-link" href="forms-input-mask.html">
							Input Mask </a></li>
					<li><a class="left-menu-link" href="forms-extras.html">
							Extras </a></li>
				</ul></li>
			<li class="left-menu-list-submenu"><a class="left-menu-link"
				href="javascript: void(0);"> Components </a>
				<ul class="left-menu-list list-unstyled">
					<li><a class="left-menu-link"
						href="components-date-picker.html"> Date Picker </a></li>
					<li><a class="left-menu-link" href="components-calendar.html">
							Calendar </a></li>
					<li><a class="left-menu-link" href="components-carousel.html">
							Carousel </a></li>
					<li><a class="left-menu-link"
						href="components-media-players.html"> Media Players <span
							class="label left-menu-label label-default">22$ FREE</span>
					</a></li>
					<li><a class="left-menu-link" href="components-slider.html">
							Slider </a></li>
					<li><a class="left-menu-link" href="components-modal.html">
							Modal </a></li>
					<li><a class="left-menu-link"
						href="components-tooltips-popovers.html"> Tooltips & Popovers
					</a></li>
					<li><a class="left-menu-link"
						href="components-notifications-alerts.html"> Notifications &
							Alerts </a></li>
					<li><a class="left-menu-link"
						href="components-progress-bars.html"> Progress Bars </a></li>
					<li><a class="left-menu-link"
						href="components-badges-labels.html"> Badges & Labels </a></li>
					<li><a class="left-menu-link" href="components-steps.html">
							Steps </a></li>
					<li><a class="left-menu-link"
						href="components-pagination.html"> Pagination </a></li>
					<li><a class="left-menu-link" href="components-collapse.html">
							Collapse </a></li>
					<li><a class="left-menu-link" href="components-tabs.html">
							Tabs </a></li>
					<li><a class="left-menu-link"
						href="components-text-editor.html"> Text Editor </a></li>
					<li><a class="left-menu-link" href="components-nestable.html">
							Nestable </a></li>
				</ul></li>
			<li class="left-menu-list-submenu"><a class="left-menu-link"
				href="javascript: void(0);"> Tables </a>
				<ul class="left-menu-list list-unstyled">
					<li><a class="left-menu-link" href="tables-basic-tables.html">
							Basic Tables </a></li>
					<li><a class="left-menu-link" href="tables-datatables.html">
							DataTables </a></li>
					<li><a class="left-menu-link"
						href="tables-editable-tables.html"> Editable Tables </a></li>
				</ul></li>
			<li class="left-menu-list-submenu"><a class="left-menu-link"
				href="javascript: void(0);"> Charts </a>
				<ul class="left-menu-list list-unstyled">
					<li><a class="left-menu-link" href="charts-chartistjs.html">
							Chartist.js </a></li>
					<li><a class="left-menu-link" href="charts-c3.html"> C3 </a></li>
					<li><a class="left-menu-link" href="charts-peity.html">
							Peity </a></li>
				</ul></li>
			<li class="left-menu-list-separator">
				<!-- -->
			</li>
			<li><a class="left-menu-link" href="apps-profile.html"> <i
					class="left-menu-link-icon icmn-profile"> <!-- -->
				</i> Profile
			</a></li>
			<li><a class="left-menu-link" href="apps-messaging.html"> <i
					class="left-menu-link-icon icmn-bubbles5"> <!-- -->
				</i> Messaging
			</a></li>
			<li><a class="left-menu-link" href="apps-mail.html"> <i
					class="left-menu-link-icon icmn-mail2"> <!-- -->
				</i> Mail
			</a></li>
			<li><a class="left-menu-link" href="apps-calendar.html"> <i
					class="left-menu-link-icon icmn-calendar"> <!-- -->
				</i> Calendar
			</a></li>
			<li><a class="left-menu-link" href="apps-gallery.html"> <i
					class="left-menu-link-icon icmn-images"> <!-- -->
				</i> Gallery
			</a></li>
			<li class="left-menu-list-separator">
				<!-- -->
			</li>
			<li class="left-menu-list-submenu"><a class="left-menu-link"
				href="javascript: void(0);"> <i
					class="left-menu-link-icon icmn-stack3"> <!-- -->
				</i> Layout
			</a>
				<ul class="left-menu-list list-unstyled">
					<li><a class="left-menu-link" href="layout-grid.html">
							Grid </a></li>
					<li><a class="left-menu-link" href="layout-panels.html">
							Panels / Cards </a></li>
					<li><a class="left-menu-link" href="layout-sidebars.html">
							Sidebars </a></li>
					<li><a class="left-menu-link" href="layout-utilities.html">
							Utilities </a></li>
				</ul></li>
			<li class="left-menu-list-submenu"><a class="left-menu-link"
				href="javascript: void(0);"> <i
					class="left-menu-link-icon icmn-star-full"> <!-- -->
				</i> Icons
			</a>
				<ul class="left-menu-list list-unstyled">
					<li><a class="left-menu-link"
						href="icons-icomoon-ultimate.html"> IcoMoon Ultimate <span
							class="label left-menu-label label-default">59$ FREE</span>
					</a></li>
					<li><a class="left-menu-link" href="icons-fontawesome.html">
							FontAwesome </a></li>
				</ul></li>
			<li><a class="left-menu-link" href="layout-typography.html">
					<i class="left-menu-link-icon icmn-font-size"> <!-- -->
				</i> Typography
			</a></li>
			<li class="left-menu-list-separator">
				<!-- -->
			</li>
			<li class="left-menu-list-disabled"><a class="left-menu-link"
				href="javascript: void(0);"> Disabled Item </a></li>
			<li class="menu-top-hidden left-menu-list-submenu"><a
				class="left-menu-link" href="javascript: void(0);"> Infinity
					Nested </a> <!-- level 1 -->
				<ul class="left-menu-list list-unstyled">
					<li class="left-menu-list-submenu"><a class="left-menu-link"
						href="javascript: void(0);"> Level 1 </a> <!-- level 2 -->
						<ul class="left-menu-list list-unstyled">
							<li class="left-menu-list-submenu"><a class="left-menu-link"
								href="javascript: void(0);"> Level 1.2 </a> <!-- level 3 -->
								<ul class="left-menu-list list-unstyled">
									<li><a class="left-menu-link" href="javascript: void(0);">
											Level 1.2.3 </a></li>
									<li class="left-menu-list-submenu"><a
										class="left-menu-link" href="javascript: void(0);"> Level
											1.2.3 </a> <!-- level 4 -->
										<ul class="left-menu-list list-unstyled">
											<li><a class="left-menu-link"
												href="javascript: void(0);"> Level 1.2.3.4 </a></li>
										</ul></li>
								</ul></li>
							<li><a class="left-menu-link" href="javascript: void(0);">
									Level 1.2 </a></li>
						</ul></li>
					<li><a class="left-menu-link" href="javascript: void(0);">
							Level 1 </a></li>
				</ul></li>
			<li class="left-menu-list-separator">
				<!-- -->
			</li>
			<li class="menu-top-hidden no-colorful-menu">
				<div class="left-menu-item">Last Week Sales</div>
			</li>
			<li class="menu-top-hidden no-colorful-menu">
				<div
					class="example-left-menu-chart chartist-animated chartist-theme-dark"></div>
				<script>
					$(function() {
						// CSS STYLING & ANIMATIONS
						var cssAnimationData = {
							labels : [ "S", "M", "T", "W", "T", "F", "S" ],
							series : [ [ 11, 14, 24, 16, 20, 16, 24 ] ]
						}, cssAnimationOptions = {
							fullWidth : !0,
							chartPadding : {
								right : 2,
								left : 30
							},
							axisY : {
								position : 'end'
							}
						}, cssAnimationResponsiveOptions = [ [ {
							axisX : {
								labelInterpolationFnc : function(value, index) {
									return index % 2 !== 0 ? !1 : value
								}
							}
						} ] ];

						new Chartist.Line(".example-left-menu-chart",
								cssAnimationData, cssAnimationOptions,
								cssAnimationResponsiveOptions);

					});
				</script>
			</li>
			<li class="menu-top-hidden no-colorful-menu">
				<div class="left-menu-item">Solar System</div>
			</li>
			<li class="menu-top-hidden">
				<div class="left-menu-item">
					<span class="donut donut-success"></span> Jupiter
				</div>
			</li>
			<li class="menu-top-hidden">
				<div class="left-menu-item">
					<span class="donut donut-primary"></span> Earth
				</div>
			</li>
			<li class="menu-top-hidden">
				<div class="left-menu-item">
					<span class="donut donut-danger"></span> Mercury
				</div>
			</li>
		</ul>
	</div>
	</nav>
	<nav class="top-menu">
	<div class="menu-icon-container hidden-md-up">
		<div class="animate-menu-button left-menu-toggle">
			<div>
				<!-- -->
			</div>
		</div>
	</div>
	<div class="menu">
		<div class="menu-user-block">
			<div class="dropdown dropdown-avatar">
				<a href="javascript: void(0);" class="dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false"> <span
					class="avatar" href="javascript:void(0);"> <img
						src="static/assets/common/img/temp/avatars/1.jpg"
						alt="Alternative text to the image">
				</span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right" aria-labelledby=""
					role="menu">
					<a class="dropdown-item" href="javascript:void(0)"><i
						class="dropdown-icon icmn-user"></i> Profile</a>
					<div class="dropdown-divider"></div>
					<div class="dropdown-header">Home</div>
					<a class="dropdown-item" href="javascript:void(0)"><i
						class="dropdown-icon icmn-circle-right"></i> System Dashboard</a>
					<a class="dropdown-item" href="javascript:void(0)"><i
						class="dropdown-icon icmn-circle-right"></i> User Boards</a>
					<a class="dropdown-item" href="javascript:void(0)"><i
						class="dropdown-icon icmn-circle-right"></i> Issue Navigator (35
						New)</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="javascript:void(0)"><i
						class="dropdown-icon icmn-exit"></i> Logout</a>
				</ul>
			</div>
		</div>
		<div class="menu-info-block">
			<div class="left">
				<div class="header-buttons">
					<div class="dropdown">
						<a href="javascript: void(0);"
							class="dropdown-toggle dropdown-inline-button"
							data-toggle="dropdown" aria-expanded="false"> <i
							class="dropdown-inline-button-icon icmn-folder-open"></i> <span
							class="hidden-lg-down">Issues History</span> <span class="caret"></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="" role="menu">
							<a class="dropdown-item" href="javascript:void(0)">Current
								search</a>
							<a class="dropdown-item" href="javascript:void(0)">Search for
								issues</a>
							<div class="dropdown-divider"></div>
							<div class="dropdown-header">Opened</div>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="dropdown-icon icmn-checkmark"></i> CLNUI-253 Project
								implemen...</a>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="dropdown-icon icmn-checkmark"></i> CLNUI-234 Active
								history iss...</a>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="dropdown-icon icmn-clock"></i> CLNUI-424 Ionicons
								intergrat...</a>
							<a class="dropdown-item" href="javascript:void(0)">More...</a>
							<div class="dropdown-divider"></div>
							<div class="dropdown-header">Filters</div>
							<a class="dropdown-item" href="javascript:void(0)">My open
								issues</a>
							<a class="dropdown-item" href="javascript:void(0)">Reported
								by me</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="javascript:void(0)">Import
								issues from CSV</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="dropdown-icon icmn-cog"></i> Settings</a>
						</ul>
					</div>
					<div class="dropdown">
						<a href="javascript: void(0);"
							class="dropdown-toggle dropdown-inline-button"
							data-toggle="dropdown" aria-expanded="false"> <i
							class="dropdown-inline-button-icon icmn-database"></i> <span
							class="hidden-lg-down">Dashboards</span> <span class="caret"></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="" role="menu">
							<div class="dropdown-header">Active</div>
							<a class="dropdown-item" href="javascript:void(0)">Project
								Management</a>
							<a class="dropdown-item" href="javascript:void(0)">User
								Inetrface Development</a>
							<a class="dropdown-item" href="javascript:void(0)">Documentation</a>
							<div class="dropdown-header">Inactive</div>
							<a class="dropdown-item" href="javascript:void(0)">Marketing</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="dropdown-icon icmn-cog"></i> Settings</a>
						</ul>
					</div>
					<div class="dropdown">
						<a href="javascript: void(0);"
							class="dropdown-toggle dropdown-inline-button"
							data-toggle="dropdown" aria-expanded="false"> <i
							class="dropdown-inline-button-icon icmn-price-tags"></i> <span
							class="hidden-lg-down">Projects</span> <span class="caret"></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="" role="menu">
							<div class="dropdown-header">Current projects</div>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="dropdown-icon icmn-checkmark"></i> Clean UI Theme</a>
							<div class="dropdown-header">Other projects</div>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="dropdown-icon icmn-clock"></i> Clean HTML Player</a>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="dropdown-icon icmn-clock"></i> KidsLocation</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="dropdown-icon icmn-list"></i> Project Management</a>
						</ul>
					</div>
				</div>
			</div>
			<div class="left hidden-md-down">
				<div class="example-top-menu-chart">
					<span class="title">Income:</span> <span class="chart"
						id="topMenuChart">1,3,2,0,3,1,2,3,5,2</span> <span class="count">425.00
						USD</span>

					<!-- Top Menu Chart Script -->
					<script>
						$(function() {

							var topMenuChart = $("#topMenuChart").peity("bar",
									{
										fill : [ '#01a8fe' ],
										height : 22,
										width : 44
									});

							setInterval(function() {
								var random = Math.round(Math.random() * 10);
								var values = topMenuChart.text().split(",");
								values.shift();
								values.push(random);
								topMenuChart.text(values.join(",")).change()
							}, 1000);

						});
					</script>
					<!-- Top Menu Chart Script -->
				</div>
			</div>
			<div class="right hidden-md-down margin-left-20">
				<div class="search-block">
					<div class="form-input-icon form-input-icon-right">
						<i class="icmn-search"></i> <input type="text"
							class="form-control form-control-sm form-control-rounded"
							placeholder="Search...">
						<button type="submit" class="search-block-submit "></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</nav>

	<section class="page-content">
	<div class="page-content-inner">

		<div class="row">
			<div class="col-xl-12">
				<div class="panel panel-with-borders">
					<div class="panel-body">
						<div class="nav-tabs-horizontal margin-bottom-20">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									href="javascript: void(0);" data-toggle="tab" data-target="#h1"
									role="tab">Registered Users</a></li>
								<li class="nav-item"><a class="nav-link"
									href="javascript: void(0);" data-toggle="tab" data-target="#h2"
									role="tab">Total Users</a></li>
								<li class="nav-item"><a class="nav-link"
									href="javascript: void(0);" data-toggle="tab" data-target="#h3"
									role="tab">Administrators</a></li>
								<li class="nav-item"><a class="nav-link"
									href="javascript: void(0);" data-toggle="tab" data-target="#h4"
									role="tab">Waiting for Registration</a></li>
							</ul>
						</div>
						<table class="table table-hover nowrap margin-bottom-0"
							id="example1" width="100%">
							<thead>
								<tr>
									<th>Name</th>
									<th>Position</th>
									<th>Office</th>
									<th>Age</th>
									<th>Date</th>
									<th>Salary</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Name</th>
									<th>Position</th>
									<th>Office</th>
									<th>Age</th>
									<th>Date</th>
									<th>Salary</th>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td>Damon</td>
									<td>5516 Adolfo Green</td>
									<td>Littelhaven</td>
									<td>85</td>
									<td>2014/06/13</td>
									<td>$553,536</td>
								</tr>
								<tr>
									<td>Torrey</td>
									<td>1995 Richie Neck</td>
									<td>West Sedrickstad</td>
									<td>77</td>
									<td>2014/09/12</td>
									<td>$243,577</td>
								</tr>
								<tr>
									<td>Miracle</td>
									<td>176 Hirthe Squares</td>
									<td>Ryleetown</td>
									<td>82</td>
									<td>2013/09/27</td>
									<td>$784,802</td>
								</tr>
								<tr>
									<td>Wilhelmine</td>
									<td>44727 O&#x27;Hara Union</td>
									<td>Dibbertfurt</td>
									<td>68</td>
									<td>2013/06/28</td>
									<td>$207,291</td>
								</tr>
								<tr>
									<td>Hubert</td>
									<td>8884 Jamel Pines</td>
									<td>Howemouth</td>
									<td>63</td>
									<td>2013/05/28</td>
									<td>$584,032</td>
								</tr>
								<tr>
									<td>Myrtie.Gerhold</td>
									<td>098 Noel Way</td>
									<td>Santinoland</td>
									<td>13</td>
									<td>2014/12/12</td>
									<td>$550,087</td>
								</tr>
								<tr>
									<td>Chester</td>
									<td>14095 Kling Gateway</td>
									<td>Andresmouth</td>
									<td>26</td>
									<td>2014/09/27</td>
									<td>$177,404</td>
								</tr>
								<tr>
									<td>Melany_Gerhold</td>
									<td>1100 Steve Pines</td>
									<td>Immanuelfort</td>
									<td>12</td>
									<td>2014/06/28</td>
									<td>$162,453</td>
								</tr>
								<tr>
									<td>Thea</td>
									<td>26114 Narciso Lodge</td>
									<td>East Opal</td>
									<td>64</td>
									<td>2014/11/12</td>
									<td>$581,736</td>
								</tr>
								<tr>
									<td>Albin.Kreiger</td>
									<td>111 Hershel Stream</td>
									<td>Hermannborough</td>
									<td>90</td>
									<td>2013/11/27</td>
									<td>$921,021</td>
								</tr>
								<tr>
									<td>Shanel</td>
									<td>7579 Santa Forest</td>
									<td>Jordaneville</td>
									<td>14</td>
									<td>2016/04/28</td>
									<td>$818,20</td>
								</tr>
								<tr>
									<td>Bell.Mueller</td>
									<td>083 Kshlerin Forest</td>
									<td>Clintmouth</td>
									<td>98</td>
									<td>2013/10/12</td>
									<td>$571,46</td>
								</tr>
								<tr>
									<td>Clementina</td>
									<td>5957 Hagenes Falls</td>
									<td>Anaishaven</td>
									<td>45</td>
									<td>2013/11/12</td>
									<td>$684,588</td>
								</tr>
								<tr>
									<td>Johanna.Thiel</td>
									<td>4301 Trever Radial</td>
									<td>Lake Augustineton</td>
									<td>67</td>
									<td>2013/12/27</td>
									<td>$608,507</td>
								</tr>
								<tr>
									<td>Elliott_Becker</td>
									<td>8417 Orion Parkway</td>
									<td>Streichside</td>
									<td>83</td>
									<td>2014/08/28</td>
									<td>$447,592</td>
								</tr>
								<tr>
									<td>Yasmine</td>
									<td>67284 Kreiger Freeway</td>
									<td>Stoltenbergside</td>
									<td>8</td>
									<td>2014/12/12</td>
									<td>$358,369</td>
								</tr>
								<tr>
									<td>Ada.Hoppe</td>
									<td>69842 Peyton Viaduct</td>
									<td>South Geovannyburgh</td>
									<td>89</td>
									<td>2013/05/13</td>
									<td>$211,76</td>
								</tr>
								<tr>
									<td>Sammie</td>
									<td>46406 Powlowski Common</td>
									<td>Cristmouth</td>
									<td>51</td>
									<td>2014/03/29</td>
									<td>$345,739</td>
								</tr>
								<tr>
									<td>Terrance.Borer</td>
									<td>1568 Richmond Bypass</td>
									<td>Schillerfort</td>
									<td>46</td>
									<td>2014/10/27</td>
									<td>$634,073</td>
								</tr>
								<tr>
									<td>August</td>
									<td>731 Stiedemann Crossing</td>
									<td>Rolfsonborough</td>
									<td>98</td>
									<td>2013/11/12</td>
									<td>$203,952</td>
								</tr>
								<tr>
									<td>Mckenna.Herman</td>
									<td>63204 Hegmann Keys</td>
									<td>New Isobelview</td>
									<td>2</td>
									<td>2013/08/12</td>
									<td>$702,091</td>
								</tr>
								<tr>
									<td>Adrianna_Durgan</td>
									<td>75151 Kshlerin Square</td>
									<td>North Elwynfurt</td>
									<td>25</td>
									<td>2014/02/26</td>
									<td>$481,980</td>
								</tr>
								<tr>
									<td>Heath.Ryan</td>
									<td>6778 Howe Route</td>
									<td>Antwanbury</td>
									<td>90</td>
									<td>2013/08/12</td>
									<td>$569,723</td>
								</tr>
								<tr>
									<td>Alisa</td>
									<td>64838 D&#x27;Amore Cove</td>
									<td>Port Lempi</td>
									<td>25</td>
									<td>2016/04/28</td>
									<td>$226,459</td>
								</tr>
								<tr>
									<td>Treva</td>
									<td>308 Octavia Roads</td>
									<td>East Eunaton</td>
									<td>37</td>
									<td>2014/12/12</td>
									<td>$746,921</td>
								</tr>
								<tr>
									<td>Myriam_Nicolas</td>
									<td>760 Hickle Causeway</td>
									<td>Lake Nickolasshire</td>
									<td>69</td>
									<td>2014/05/13</td>
									<td>$293,786</td>
								</tr>
								<tr>
									<td>Gerhard</td>
									<td>893 Mara Parkway</td>
									<td>Elmermouth</td>
									<td>32</td>
									<td>2014/11/27</td>
									<td>$856,275</td>
								</tr>
								<tr>
									<td>Monica</td>
									<td>0039 Heath Plain</td>
									<td>West Bentonhaven</td>
									<td>80</td>
									<td>2016/05/13</td>
									<td>$821,600</td>
								</tr>
								<tr>
									<td>Lacey</td>
									<td>995 Lang Springs</td>
									<td>Cordellburgh</td>
									<td>94</td>
									<td>2014/11/27</td>
									<td>$990,291</td>
								</tr>
								<tr>
									<td>Bret</td>
									<td>282 Susana Heights</td>
									<td>Kaneport</td>
									<td>47</td>
									<td>2013/05/28</td>
									<td>$445,494</td>
								</tr>
								<tr>
									<td>Jennie</td>
									<td>755 Greyson Key</td>
									<td>East Jazmyne</td>
									<td>94</td>
									<td>2016/03/29</td>
									<td>$530,408</td>
								</tr>
								<tr>
									<td>Emerson</td>
									<td>784 Adriel Radial</td>
									<td>New Jerroldland</td>
									<td>4</td>
									<td>2014/02/26</td>
									<td>$805,823</td>
								</tr>
								<tr>
									<td>Herta</td>
									<td>7491 Bednar Gardens</td>
									<td>Port Lucianoton</td>
									<td>23</td>
									<td>2013/10/12</td>
									<td>$352,269</td>
								</tr>
								<tr>
									<td>Stone_Deckow</td>
									<td>6440 Moen Loop</td>
									<td>Jenningsbury</td>
									<td>23</td>
									<td>2014/07/28</td>
									<td>$219,573</td>
								</tr>
								<tr>
									<td>Davin</td>
									<td>50922 Kiara Square</td>
									<td>Port Edmund</td>
									<td>37</td>
									<td>2014/11/27</td>
									<td>$241,432</td>
								</tr>
								<tr>
									<td>Johnathan_Mraz</td>
									<td>1998 Webster Fords</td>
									<td>East Vern</td>
									<td>50</td>
									<td>2014/09/12</td>
									<td>$290,875</td>
								</tr>
								<tr>
									<td>Gunnar</td>
									<td>92873 Barney Club</td>
									<td>Beierview</td>
									<td>82</td>
									<td>2014/03/29</td>
									<td>$569,778</td>
								</tr>
								<tr>
									<td>Raina</td>
									<td>828 Cathy Streets</td>
									<td>West Uriahville</td>
									<td>26</td>
									<td>2013/09/27</td>
									<td>$186,229</td>
								</tr>
								<tr>
									<td>Marjorie.Orn</td>
									<td>314 Aurore Canyon</td>
									<td>Port Jaquelineburgh</td>
									<td>3</td>
									<td>2014/06/28</td>
									<td>$547,752</td>
								</tr>
								<tr>
									<td>Citlalli_Wehner</td>
									<td>139 Ebert Freeway</td>
									<td>Lake Esperanzamouth</td>
									<td>78</td>
									<td>2016/01/27</td>
									<td>$892,012</td>
								</tr>
								<tr>
									<td>Ruben.Reilly</td>
									<td>02868 Cronin Tunnel</td>
									<td>Rossieville</td>
									<td>87</td>
									<td>2013/09/12</td>
									<td>$520,483</td>
								</tr>
								<tr>
									<td>Gunner_Jakubowski</td>
									<td>80391 Maxwell Parks</td>
									<td>South Travon</td>
									<td>26</td>
									<td>2014/03/29</td>
									<td>$272,005</td>
								</tr>
								<tr>
									<td>Josephine</td>
									<td>36238 Satterfield Avenue</td>
									<td>New Alexanderhaven</td>
									<td>51</td>
									<td>2016/01/27</td>
									<td>$189,18</td>
								</tr>
								<tr>
									<td>Ceasar_Orn</td>
									<td>2795 Clement Ridges</td>
									<td>Beckerhaven</td>
									<td>78</td>
									<td>2013/11/27</td>
									<td>$958,117</td>
								</tr>
								<tr>
									<td>Coby</td>
									<td>53700 Pagac Lodge</td>
									<td>South Hershel</td>
									<td>86</td>
									<td>2013/08/28</td>
									<td>$481,619</td>
								</tr>
								<tr>
									<td>Colin</td>
									<td>637 Paucek Mountain</td>
									<td>West Luraberg</td>
									<td>77</td>
									<td>2016/02/26</td>
									<td>$298,110</td>
								</tr>
								<tr>
									<td>Monique_White</td>
									<td>415 Corkery Walks</td>
									<td>West Lauryn</td>
									<td>97</td>
									<td>2014/02/11</td>
									<td>$222,343</td>
								</tr>
								<tr>
									<td>Jarvis.Simonis</td>
									<td>0778 Elvis Spurs</td>
									<td>Harrisfurt</td>
									<td>62</td>
									<td>2013/05/28</td>
									<td>$336,046</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- End Dashboard -->

	</div>


	<!-- Page Scripts --> <script>
		$(function() {

			///////////////////////////////////////////////////////////
			// COUNTERS
			$('.counter-init').countTo({
				speed : 1500
			});

			///////////////////////////////////////////////////////////
			// ADJUSTABLE TEXTAREA
			autosize($('#textarea'));

			///////////////////////////////////////////////////////////
			// CUSTOM SCROLL
			if (!cleanUI.hasTouch) {
				$('.custom-scroll').each(function() {
					$(this).jScrollPane({
						autoReinitialise : true,
						autoReinitialiseDelay : 100
					});
					var api = $(this).data('jsp'), throttleTimeout;
					$(window).bind('resize', function() {
						if (!throttleTimeout) {
							throttleTimeout = setTimeout(function() {
								api.reinitialise();
								throttleTimeout = null;
							}, 50);
						}
					});
				});
			}

			///////////////////////////////////////////////////////////
			// CALENDAR
			$('.example-calendar-block').fullCalendar({
				//aspectRatio: 2,
				height : 450,
				header : {
					left : 'prev, next',
					center : 'title',
					right : 'month, agendaWeek, agendaDay'
				},
				buttonIcons : {
					prev : 'none fa fa-arrow-left',
					next : 'none fa fa-arrow-right',
					prevYear : 'none fa fa-arrow-left',
					nextYear : 'none fa fa-arrow-right'
				},
				editable : true,
				eventLimit : true, // allow "more" link when too many events
				viewRender : function(view, element) {
					if (!cleanUI.hasTouch) {
						$('.fc-scroller').jScrollPane({
							autoReinitialise : true,
							autoReinitialiseDelay : 100
						});
					}
				},
				defaultDate : '2016-05-12',
				events : [ {
					title : 'All Day Event',
					start : '2016-05-01',
					className : 'fc-event-success'
				}, {
					id : 999,
					title : 'Repeating Event',
					start : '2016-05-09T16:00:00',
					className : 'fc-event-default'
				}, {
					id : 999,
					title : 'Repeating Event',
					start : '2016-05-16T16:00:00',
					className : 'fc-event-success'
				}, {
					title : 'Conference',
					start : '2016-05-11',
					end : '2016-05-14',
					className : 'fc-event-danger'
				} ],
				eventClick : function(calEvent, jsEvent, view) {
					if (!$(this).hasClass('event-clicked')) {
						$('.fc-event').removeClass('event-clicked');
						$(this).addClass('event-clicked');
					}
				}
			});

			///////////////////////////////////////////////////////////
			// CAROUSEL WIDGET
			$('.carousel-widget').carousel({
				interval : 4000
			});

			$('.carousel-widget-2').carousel({
				interval : 6000
			});

			///////////////////////////////////////////////////////////
			// DATATABLES
			$('#example1').DataTable({
				responsive : true,
				"lengthMenu" : [ [ 5, 25, 50, -1 ], [ 5, 25, 50, "All" ] ]
			});

			///////////////////////////////////////////////////////////
			// CHART 1
			new Chartist.Line(".chart-line", {
				labels : [ "Monday", "Tuesday", "Wednesday", "Thursday",
						"Friday" ],
				series : [ [ 12, 9, 7, 8, 5 ], [ 2, 1, 3.5, 7, 3 ],
						[ 1, 3, 4, 5, 6 ] ]
			}, {
				fullWidth : !0,
				chartPadding : {
					right : 40
				},
				plugins : [ Chartist.plugins.tooltip() ]
			});

			///////////////////////////////////////////////////////////
			// CHART 2
			var overlappingData = {
				labels : [ "Jan", "Feb", "Mar", "Apr", "Mai", "Jun", "Jul",
						"Aug", "Sep", "Oct", "Nov", "Dec" ],
				series : [ [ 5, 4, 3, 7, 5, 10, 3, 4, 8, 10, 6, 8 ],
						[ 3, 2, 9, 5, 4, 6, 4, 6, 7, 8, 7, 4 ] ]
			}, overlappingOptions = {
				seriesBarDistance : 10,
				plugins : [ Chartist.plugins.tooltip() ]
			}, overlappingResponsiveOptions = [ [ "", {
				seriesBarDistance : 5,
				axisX : {
					labelInterpolationFnc : function(value) {
						return value[0]
					}
				}
			} ] ];

			new Chartist.Bar(".chart-overlapping-bar", overlappingData,
					overlappingOptions, overlappingResponsiveOptions);

		});
	</script> <!-- End Page Scripts --> </section>

	<div class="main-backdrop">
		<!-- -->
	</div>

</body>
</html>