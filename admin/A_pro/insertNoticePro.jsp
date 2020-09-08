<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type = "text/javascript">
	var cnt = "${cnt}";
	
	if(cnt == 1){
		alert('등록되었습니다.');
		opener.location.reload();
		self.close();
	}else{
		alert('오류가 발생하여 다시시도해주세요.');
		self.close();
	}
</script>
</head>
<body>

</body>
</html>