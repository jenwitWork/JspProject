<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Toyota KK</title>

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
	href="resources/vendors/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="resources/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- Animate.css -->
<link
	href="resources/vendors/animate.css/animate.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/assets/css/custom.min.css"
	rel="stylesheet">
</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form:form action="login" method="post" modelAttribute="lofin_form">
						<h1>Login Form</h1>
						<div>
							<form:input path="username" class="form-control"
								placeholder="Username" />
						</div>
						<div>
							<form:input path="password" type="password" class="form-control"
								placeholder="Password" />
						</div>
						<div>
							<button type="submit" class="btn btn-default">Log in</button>
							<a class="reset_pass" href="#">Lost your password?</a>
						</div>

						<div class="clearfix"></div>

					</form:form>
				</section>
			</div>

			<div id="register" class="animate form registration_form">
				<section class="login_content">
					<form>
						<h1>Create Account</h1>
						<div>
							<input type="text" class="form-control" placeholder="Username"
								required="" />
						</div>
						<div>
							<input type="email" class="form-control" placeholder="Email"
								required="" />
						</div>
						<div>
							<input type="password" class="form-control"
								placeholder="Password" required="" />
						</div>
						<div>
							<a class="btn btn-default submit" href="index.html">Submit</a>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								Already a member ? <a href="#signin" class="to_register">
									Log in </a>
							</p>

							<div class="clearfix"></div>
							<br />

						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>
