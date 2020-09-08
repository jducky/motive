<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #17366E">

<br><br>
<div style="width: 200px; height: 80px; margin:0 auto;">
	<img src="resources/img/logo3.png">
	<img src="resources/img/logo3_.png">
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type = "text/javascript">
	function login() {
		const id = $("#input_id");
		const pw = $("#input_pw");
		
		if(id.val() == "") {
			alert("아이디를 입력해주세요.");
			id.focus();
		} else if(pw.val() == "") {
			alert("비밀번호를 입력해주세요.");
			pw.focus();
		} else {
			const formData = $("form").serialize();
			$.ajax({
				url : "loginPro.do" ,
				data : formData ,
				dataType : 'json' , 
				type : 'POST' ,			
			})
			.done(function(data) {
				if(data == 2) {
					self.close();
					opener.location.href = "main2.do";
				} else if(data == 3) {
					alert("비밀번호가 일치하지 않습니다");
					$("#input_pw").val("");
					$("#input_pw").focus();
				} else if(data == 1) {
					alert("아이디가 존재하지 않습니다");
					$("#input_id").val("");
					$("#input_pw").val("");
					$("#input_id").focus();
				}
			});
		}
			 
	}
	$(document).ready(function() {
		$("#input_pw").keyup(function(e) {
			if(e.keyCode === 13) {
				$("#login-btn").click();
			}
		});
	});
</script>

<form action="loginPro.do" method = "POST" onsubmit = "return login();">

	<br>
	<div style="width: 75%; height: 200px; margin:0 auto;">
		<div style="width: 75%; height: 40px; margin:0 auto;">
			<div style="width: 100%; height: 35px; background-color: white;">
				<img style="margin-left: 10px; float:left; height : 25px; margin-top : 5px;" src="resources/img/id_icon.PNG">
				<input style="width: 75%; height: 30px; border:0px; margin-left: 10px;" name = "input_id" id = "input_id" type="text" placeholder="아이디를 입력해주세요">
			</div>
		</div>
		
		<div style="width: 75%; height: 50px; margin:0 auto;">
			<div style="width: 100%; height: 35px; background-color: white;">
				<img style="margin-left: 10px; float:left; height : 25px; margin-top : 5px;" src="resources/img/pwd_icon.PNG">
				<input style="width: 75%; height: 30px; border:0px; margin-left: 10px;" name = "input_pw" id = "input_pw" type="password" placeholder="비밀번호를 입력해주세요">
			</div>
		</div>
		
		<button type = "button" id = "login-btn" style="width: 75%; height: 50px; background-color:#229AF6; border-radius: 5px; color:white; cursor: pointer; margin-left: 45px;" onclick = "login();">로그인</button>
		
	</div>

</form>
</body>
</html>