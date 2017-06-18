<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Upload file</h1>
	<form enctype="multipart/form-data" id="form-upload">
		<input type="text" name="name" id="name" /> <br> <input
			type="file" name="files" id="files[]" multiple /><br>
		<button type="button" id="upload">upload</button>
	</form>
</body>

<script type="text/javascript">
	$('#upload').on('click', function() {
		var data = new FormData($('form')[0]);
		console.log(data);
		$.ajax({
			url : 'multi-upload',
			type : 'post',
			data : data,
			cache : false,
			contentType : false,
			processData : false,
		}).done(function(response) {
			location.replace("home");
		})
	})
</script>

</html>