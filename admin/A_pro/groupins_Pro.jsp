<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	var cnt = '${cnt}';
	
	if(cnt == 1){
		alert('등록되었습니다.');
		opener.location.reload();
		self.close();
	}else{
		alert("등록에 실패했습니다.");
	}
</script>
</body>
</html>