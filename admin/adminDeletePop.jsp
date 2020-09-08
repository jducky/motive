<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin : 0 auto;">
		<form action="adminDelete_Pro.ad" method="POST" >
			<input type="hidden" name="adminId" value="${adminId}"/>
			<p>관리자를 삭제하시겠습니까?</p>
			<input type="submit" value="예"/>
			<input type="button" id="delete-cancle" value="아니오"/>		
		</form>
	</div>
</body>
</html>