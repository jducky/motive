<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript">
	if(${returnVal} == 2) {
		self.close();
		opener.location.href = "main2.do";
	} else if(${returnVal} == 3) {
		alert("비밀번호가 일치하지 않습니다");
		window.location.href = "loginPop.do";
	} else if(${returnVal} == 1) {
		alert("아이디가 존재하지 않습니다");
		window.location.href = "loginPop.do";
	}
</script>
</head>
<body>
	
</body>
</html>