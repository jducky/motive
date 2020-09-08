<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	var cnt = '${cnt}';
	
	if(cnt == 1){
		alert('수정되었습니다.');
		self.close();
		opener.location.href = "noticeManagement.ad";
	}else{
		alert('오류가 발생하여 다시시도해주세요.');
		self.close();
	}
</script>
</body>
</html>