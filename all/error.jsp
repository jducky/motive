<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
html, body{ height: 100%; }
.error{ width: 100%; height: 100%; background: #e2e1df; overflow:hidden; }
.error .container{ position: absolute;left: 50%;top: 10%;width: 504px;height: 308px;margin-left: -250px;background: url(/_images/common/e_txtbox.png) no-repeat left top; }
</style>
<title>Insert title here</title>
<script type="text/javascript">

function goBack() {
	window.history.back();
}

</script>
</head>

<body class="error">
<div class="container">
    <input  type="image" src="http://192.168.0.57:8080/gis4/motive_image/error_message.png" onClick="goBack();" alt="되돌아가기" class="e_btn" />
</div>
    
</body>
</html>