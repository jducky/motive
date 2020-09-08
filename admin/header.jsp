<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;subset=korean">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function loginPop(){
		var url = 'loginPop.do';
		var name = 'loginPopup';
		var option = 'width = 500, height = 350';
		
		window.open(url,name,option);
		
	}
	
	$(document).ready(function(){
		
		$('#menu4 li').click(function(){
			
			var li_index = $('#menu4 li').index(this);
			

			
			if(li_index == 1){
				
				window.location.href = "admin_management.ad";
			}	
		
		});
	
		
		
	});
</script>
<body>

<div class="header">
	  <div class="wrap">
		<div class="hd_top">
			<ul class="ul_rt">
				<li>사용자 메뉴얼</li>
				<li><a onclick="loginPop();">LOGIN</a></li>
			</ul>
		</div>
		<div class="hd_bt">
		<!-- <div style="width: 150px; height: 150px; border:1px solid black;">
			
		</div> -->
		<!-- <a href="main2.do"> -->
		<img style="position:absolute; margin-left: 200px; margin-top: 25px;" src="resources/img/Ecosystem.png">
			<p><img src="resources/img/logo3.png"><img src="resources/img/logo3_.png" class="t2">
				
			</p> 
			<ul>
				
				<li>
					<a href="#">소　개</a>
						<ul>
							<li>사업설명</li>
							<li>입력 자료란</li>
							<li>모형 결과 분석</li>
							<li>공지사항</li>
						</ul>
				</li>
				<li>
					<a href="#">입력자료 조회</a>
						<ul class="sub2">
							<li>생물종자료</li>
							<li>연계자료</li>
							<li>기후자료</li>
						</ul>
				</li>
				<li>
					<a href="#">생태영향 및 취약성평가</a>
						<ul class="sub3">
							<li>기후변화민감종</li>
							<li>외래종</li>
							<li>취약서식지</li>
						</ul>
				</li>
				<li>
					<a href="#">시스템 관리</a>
						<ul class="sub4" id="menu4">
							<li>공지사항 관리</li>
							<li>프로젝트 관리</li>
							<li>사용자 관리</li>
							<li>그룹관리</li>
							<li>관리자 계정관리</li>
						</ul>
				</li>
			</ul>
		</div>
	  </div>
	</div>
	
</body>
</html>